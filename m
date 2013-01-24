Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyLkv-0000oG-Km
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:18:11 +0100
Received: from mail-pb0-f71.google.com ([209.85.160.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 04:02:35 -0800
Received: by mail-pb0-f71.google.com with SMTP id wz17so10718422pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=CMAF9/Yfv3JNnnnkSf3kxCP6CSWJnXQAnDulUz1/K5I=;
	b=LOvhPsc2HNFjRP8eJTVzpAIWHJNgT4ugd43JBq0RcO+z+W+71Zg965qOy4Edpa79B9
	tvKylkyIFL4LvZfLZYYKRZqIQ3vAsWsbT1HqMuKRsEx+lrmfupqaxzclUiQkouW6x5DI
	AgFeridIbF8BNY4vAIH/n8jfbhbiO3Vdb/KkpMtaM+YfgD6o1NYnp0LheuBMyBIHWP94
	OhMWlY3n+bB7Ntc3tikRP7hcvfHw7cxOVucxDrlbu45F6gKPP7aw2N0ySJeA+7WRS7Jz
	Xbpr5/C1avwScfIO5u77fbU5jC/2htChSK/xO5+wDdsPKokO8s2CIUpAGLdJdEV8BnzY
	/Bxg==
X-Received: by 10.69.0.199 with SMTP id ba7mr3966258pbd.165.1359028954487;
	Thu, 24 Jan 2013 04:02:34 -0800 (PST)
X-Received: by 10.69.0.199 with SMTP id ba7mr3966232pbd.165.1359028954348;
	Thu, 24 Jan 2013 04:02:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 04:02:13 -0800 (PST)
In-Reply-To: <1359024278-24627-1-git-send-email-ml@communistcode.co.uk>
References: <1359024278-24627-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 12:02:13 +0000
Message-ID: <CAJTo0LbPwXtL2pTXcs39T5hsBxx6=9XsiF-iFvPDW9bgpUFwxQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQksa7QWl7gZAnqS2irsZC60J7kgMo1KAmUaPyII3ctjsFnTaFJ36xlfF9Bx9aS4GYN7tharID6w407HFFprfhXrU/6a0A/1P8P8amtluZf+cMDG4QOdk65+S7IXS+VvwpbZ1kb+BTR9QEpfzm0F3wEuNeLMUl8EkgVG1bbot3Zs1vBV3VkGjxzA+DA3enTW+rm1rEAR
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: remove usbutils dependancy
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
X-List-Received-Date: Thu, 24 Jan 2013 12:18:11 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 10:44,  <ml@communistcode.co.uk> wrote:
> No where in the systemd readme does it specify that usbutils
> is a dependancy of systemd. I can only guess that it was added
> due to an issue elsewhere in the chain or it was brought in
> when udev was merged and the dependancies never checked.
>
> I have build tested this with no issues.

Build-tested from a clean sysroot?

Ross


