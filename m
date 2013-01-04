Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tr9Jx-0006LQ-Ec
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 16:36:34 +0100
Received: from mail-gg0-f198.google.com ([209.85.161.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Jan 2013 07:21:26 -0800
Received: by mail-gg0-f198.google.com with SMTP id f4so25084041ggn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 07:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mVkcLIKIkjn6lwxoY/sdSc9TSpM4xpAT/CPwPWMY6S8=;
	b=FQtERB2AIE1T3gwZ8eEg0ktrn3pwwa4nhY0KxPuBVIisc7Na3cXoz9qsHjFWZRhy2e
	WHUE4AvMBMbKxx5QtsWtvbrVBAfBUbU+bLPN+Qev5GeOB4A5A+4/pC8DoKKQ6SzNZQMR
	/6AeLRvnz9T3bvAXAL67Ggd3zrsRqLgjcVYhTSNODe7Rt+166ksZH4NaLAfuQLwxnUZt
	llblonrEM2+cM04SSo5Gp8t/JwD8LoE/qoI8kq+xmuIqdO5Uh8atS6/chtArssHuRMCP
	vLqKlItEDlRR5YVRHWjwTQmaHDe2lOZ4yjNcRtaSzpDdcAsQRkDvZNWSW66lvG0mJBDi
	WSJw==
X-Received: by 10.52.31.197 with SMTP id c5mr67019912vdi.65.1357312885285;
	Fri, 04 Jan 2013 07:21:25 -0800 (PST)
Received: by 10.52.31.197 with SMTP id c5mr67019908vdi.65.1357312885199; Fri,
	04 Jan 2013 07:21:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Fri, 4 Jan 2013 07:21:05 -0800 (PST)
In-Reply-To: <CAJTo0LYHjwXvQLXvbVkO4Bc5gkr58DCrcbRndairRoLCNNZ-MQ@mail.gmail.com>
References: <cover.1356342794.git.alexandru.damian@intel.com>
	<b81c825c2737a2042ed7a99796752d12b1576725.1356342794.git.alexandru.damian@intel.com>
	<CAJTo0LYHjwXvQLXvbVkO4Bc5gkr58DCrcbRndairRoLCNNZ-MQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2013 15:21:05 +0000
Message-ID: <CAJTo0LYN=_Ya+kwCPfNuAcRWPSyyKvony-6kK8ZOZmYdASuS3g@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkjCbhB8VJmG4e5rs7ir3zrFPunW86a8Dm3ypLFdmQ6VykJCM9oj8M1k7dYG+iMlqrQ1BvMq01cwJyGt6sgbG1wG7acvntjtSJtHFiLGmlzN5zwT7JoWbeWclA2QNlYZd/b3UHzYU9RPSkejzSmHB6n+i+LQoNRf9V08e5QiTFFXOwgZOolmchnViCH6eY0Li8xmVJs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 15:36:34 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2013 11:04, Burton, Ross <ross.burton@intel.com> wrote:
> On 24 December 2012 09:57, Alex DAMIAN <alexandru.damian@intel.com> wrote:
>> +PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm libgbm libglapi udev wayland-egl libpam"
>
> "libgbm libglapi wayland-egl" aren't valid source recipes, just use "mesa-dri".

Ignore that.  They're still not valid source recipes, but I've dug
into how Wayland on the PandaBoard works and we should enable that to
work in meta-ti without much effort.

Their binary blob has it's own wayland-egl- and libgbm-compatible
libraries.  Let's create a new virtual provider virtual/wayland-egl
which mesa-dri (and the TI drivers) can PROVIDE and weston can DEPEND
on.

Ross


