Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0917089F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:47:59 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so4093399iga.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P8m4HGVCzDJHjXTXRgmk1y+bqsHXx9jpqZ84MIUCpFU=;
	b=HBp/9FwLMtyWN8kCls1BSZwkcjngo+lAfcqayqSPPh8vFX6xmVivoJv8vc9Q4R9Fio
	Glj9gNWmX2sowes84rO8uWrVpQaaiiZqd3GXH5Ayq9oG9+I0g9crh0uYNPYUt+nSMp2Z
	0PbeMnonKcmq19HfAetJn+wTRj1vg33/COS23cGisAgedTgWexURLmWoJA3rZiZO3TI0
	IXauNDqvTO0K7IEkm/epGzjCGRnjJjWtgFKbNNQBzSb+nkgd2kmUFD4pGKiwTRGoAq1L
	HXIZCdJZdSO83AeisjysR2GZkeDIOuG5qMT+IK/VXL2RvaQyZ8nprEw1YljG0701gFff
	/Yaw==
X-Received: by 10.42.168.199 with SMTP id x7mr38888061icy.70.1406573280756;
	Mon, 28 Jul 2014 11:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 11:47:30 -0700 (PDT)
In-Reply-To: <c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
References: <cover.1406572002.git.peter.seebach@windriver.com>
	<c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 11:47:30 -0700
Message-ID: <CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Add support for ld.so.conf.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 18:48:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 11:39 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> The default behavior for USE_LDCONFIG is to use an empty ld.so.conf.
> In some cases, it might be desireable to have an ld.so.conf.d directory,
> and inherit files from there. This is a common enough use case to
> justify support in the recipe, but not common enough to make it the
> default. So, eglibc gets a new USE_LDCONFIG_CONF_D value, default 0.
> If it's set to 1, we create the directory and add an "include" line
> for it to ld.so.conf.

the patch is good but introducing another variable is not needed you
can cover it under US_LDCONFIG itself, ldconfig with empty ld.so.conf
will still parse standard lib search paths anyway

Secondly when we use ldconfig it generates ld.so.cache under /etc
so I hope we take care of this when we have ro-rootfs

