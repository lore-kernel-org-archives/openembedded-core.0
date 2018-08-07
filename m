Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1AA6754D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 10:38:27 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id j205-v6so27594727oib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HWAxn6qNLaVcEywtq5Lc+6RN38I+jkp+WzsOPnE0K7U=;
	b=DRfAJ24TvWB0aPvYYEjfQtWNkW0miLzbQ6Klrd1peFinw0uXbmbR5RsMCC3gq0uACf
	XLER0BuzGjMWQ7S/wvirdPU3lnHdW2m1ZeT+S54eOypVL8tmulWsOEMpFkRzL3EzTO//
	BEmcYTVSTVJT5fn18DOrGDAPzbBIfqzkwVYiUO/v4CnkDU9XzCoohT9HH6GLUrWv0a2c
	Pr8CaiOD6kDJPcKDTllKWK59PQMDcsssX94l5tDmhDww6FgjHx5GTmpy8YBordl8iCzb
	hPzLbV4Ck9w/UbRjLjtiPuZmDzJ9xc/LyHPDIqY+h/xG/cpvhHb2u/t6h1MphhDXrBFg
	dtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HWAxn6qNLaVcEywtq5Lc+6RN38I+jkp+WzsOPnE0K7U=;
	b=EK00fyTWQ0Q1LnHH81RyBEjMNQr4GaeLBEIvmJuvawQYjQAYhv55szdHvc1J2BT5j0
	5uqHF3B3C+brSidcnfIPCfSkbRuTJBMbrtZ7dOg3b2BXsnWPiXP/CQ8/P6qs+ZQo565B
	Q608egToZGUhGHPaqXRRIRE1A0OW24DIr6vkf0f/eWRPjWaK0GMxgbvMOXe23RTV6j8G
	2jmzGYtYTqSI3fvJyFCf0IwMFp9LVYi40+5PfO1zWPucOexEG3JfNSP9WqEy40vDQTfs
	gqg318+EjEcuTwAR732GeDHlB+AIJDmx7PLodBtR98/448+dWmLZock7uCe7QzpLZ/Sl
	PWCA==
X-Gm-Message-State: AOUpUlGLNJRA4MkSnv9aUxcoV2yx9bzbSGjTTlG88x7OcFBFTQeY+Yft
	fMTA8NxaKHw/UWXzpPGnabTuF+PLmfgHcmFFUOrwLg==
X-Google-Smtp-Source: AA+uWPwR5qTDtPY++cskrv/OOw1xkr2XctkmLMCmso9D/RLnuNFcSmL+QPmgILrEU3QceEzMlWHflop9bnQu9ELVeuo=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr19755228oig.245.1533638309016; 
	Tue, 07 Aug 2018 03:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Tue, 7 Aug 2018 03:38:08 -0700 (PDT)
In-Reply-To: <1533636928.8352.5.camel@collabora.co.uk>
References: <1533630587.8352.1.camel@collabora.co.uk>
	<CAJTo0La6RFY0VKfbsUoPGcV1MB_Z0DuhHKQSAs=a74q0+qRERA@mail.gmail.com>
	<1533636928.8352.5.camel@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Aug 2018 11:38:08 +0100
Message-ID: <CAJTo0LZeNUVt5asvd63=UswR9z3RisPTTrq7D+R-ZFJzsBAhtw@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Extract GPL sources
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
X-List-Received-Date: Tue, 07 Aug 2018 10:38:28 -0000
Content-Type: text/plain; charset="UTF-8"

I believe this is fixed in Pyro 2.3.4.

Ross


On 7 August 2018 at 11:15, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Thanks Ross,
>
> I have an issue when using the archiver:
>
> local.conf:
>
> INHERIT += "archiver"
> ARCHIVER_MODE[src] = "patched"
> COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
>
> ERROR: gmp-native-6.1.2-r0 do_unpack_and_patch: Command Error: 'quilt --quiltrc
> /home/aragua/src/poky/build2/tmp/work/x86_64-linux/gmp-native/6.1.2-r0/archiver-work//recipe-
> sysroot-native/etc/quiltrc push' exited with 0  Output:
> /bin/sh: quilt: command not found
> ERROR: gmp-native-6.1.2-r0 do_unpack_and_patch: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: /home/aragua/src/poky/build2/tmp/work/x86_64-linux/gmp-
> native/6.1.2-r0/temp/log.do_unpack_and_patch.8027
> ERROR: Task (virtual:native:/home/aragua/src/poky/meta/recipes-
> support/gmp/gmp_6.1.2.bb:do_unpack_and_patch) failed with exit code '1'
>
> I tried to drop native from COPYLEFT_RECIPE_TYPES without effect.
>
> Where can I add quilt-native dependency?
>
> For information I use pyro release. Is there any known bug for that release?
>
> Thanks
>
> On Tue, 2018-08-07 at 10:10 +0100, Burton, Ross wrote:
>> Have a look at the archiver class.
>>
>> Ross
>>
>> On 7 August 2018 at 09:29, Fabien Lahoudere
>> <fabien.lahoudere@collabora.co.uk> wrote:
>> > Hello
>> >
>> > I need to extract all *GPL* sources patched related to an image in order to publish them.
>> > I want to do it automatically, ie 'bitbake myimage -c extract-gpl-sources'
>> > Is there a mechanism to do that?
>> > If not do you have any idea how I can implement it?
>> >
>> > Thanks
>> >
>> > --
>> > Fabien
>> > --
>> > _______________________________________________
>> > yocto mailing list
>> > yocto@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/yocto
> --
> Fabien

