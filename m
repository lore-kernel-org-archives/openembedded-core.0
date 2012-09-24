Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG4M7-0005oM-JC
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 10:49:31 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 01:36:42 -0700
Received: by obblz20 with SMTP id lz20so5148844obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 01:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=YxI0vTlYVKM/QeFvmTCP8t0V9BxK3ZshLTeU4sXW+U8=;
	b=D/hTS9/b+blVcFzwX76c5+n/tOUMhnCDUxROpjz3sS5CQ3TDa9umFCbHTmCeuSd+eF
	4K6zqjECpSjraTW2KXZU/PmXcUSEuj09DPQBw1gnDVVHTXG507SB/td8+Iy96QIDGx3w
	dTJ19iHYN1J+OxL6CqiDxnjyd6gP7M82aLaca2ly+T7pFeHdk5JFNslJ0ap+Bf2jEPU3
	ijtoETI11pVaZdAyixPewMKsYoc1QZKmWNYukxotGe9myxsSbaArHvi6kdMYDxgckWs/
	IqmOeUsRW9itMOwfXmLvTqJX+zUUM49Z7zldyrKaQn/zaWuVK/4Qkf6nnqlCj3brneGE
	1/KQ==
Received: by 10.60.29.72 with SMTP id i8mr9096961oeh.26.1348475801694; Mon, 24
	Sep 2012 01:36:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 24 Sep 2012 01:36:21 -0700 (PDT)
In-Reply-To: <505F99C3.1030409@balister.org>
References: <1348436710.4444.247.camel@x121e.pbcl.net>
	<1540243.ihgQ8YivHP@helios> <505F99C3.1030409@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2012 09:36:21 +0100
Message-ID: <CAJTo0Lbi+KEu1=857m0v5xX0geWHA4pDuQqHgALyMt2rPLD8XQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQmAodPJLy06Z7apJNViv8WL5ooiKdmDcMx+VeeF60ad4NpmVTlEMXEbLDSV4VL9dAp+mMUL
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Allow modules.tar.gz generation to be inhibited
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
X-List-Received-Date: Mon, 24 Sep 2012 08:49:31 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2012 00:22, Philip Balister <philip@balister.org> wrote:
>>> Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.
>>
>> I'm wondering, does anyone still find this file useful?
>
> I've used it to put modules in rootfs when there is a new kernel version and
> I do not have easy access to packages feeds. This speeds testing.

Sounds like a less than common use-case.  How about setting it to 0 by default?

Ross


