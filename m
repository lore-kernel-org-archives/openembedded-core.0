Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA2CCAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 12:26:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12027.1757334364078036135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 05:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AgCnPjF7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3A8F2C653F4
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 12:25:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD2446061A;
	Mon,  8 Sep 2025 12:26:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3859102F24A8;
	Mon,  8 Sep 2025 14:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757334360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ZGTMvS9sx1jA+n+gCLVo5h5Jm5KJXlg/0XcFiPPCUDo=;
	b=AgCnPjF71L2VViiac+tuL/3r9t6ul4R+fpXHcxJ1qBPHtkC9XFKydNFterRPtS9Y/2EQQ3
	6X5shTy78SScES+v52+vRPQnpZqARcPjc2bF7xA1mRTzCEh9XG3Ek4vvT9fchIpmUzvJck
	Rr3ElLwQuxs+IrtWyLYOLj1WwcjglV1jUKfn7OEdrUIstOApSIIdkbhlIjqxa9hrGXdA47
	5vRGhKMZZLfbEAVie9ki8MctR2HzrvMNxZE1xiz30tb2bxwyzoswgPe/JrZUXujQ588wv5
	XReN+yz9pwJExy3FNyjEkhLnSDrPxUqEDlpmYzB01llou+c3hcTIJE2B9e5nLw==
Content-Type: multipart/mixed;
 boundary=3ca16f73673b4810f3abcc3c60049cdfb55e08c03725f1325d2a377b7601
Mime-Version: 1.0
Date: Mon, 08 Sep 2025 14:25:52 +0200
Message-Id: <DCNF1CJJ7WH3.1SH2QIZU7LIUN@bootlin.com>
Subject: Re: [OE-core][PATCH v3 1/8] bootimg_pcbios: support grub hybrid
 boot
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250905164136.2896809-1-vince@underview.tech>
 <DCMMGFDTYJD0.3EMQPQ884OGL2@bootlin.com>
 <CAPQx_gPwZ7y0kddQc3TvKSeb18-Zmf8ZW5q38M9uiCYV2qTEbw@mail.gmail.com>
In-Reply-To: <CAPQx_gPwZ7y0kddQc3TvKSeb18-Zmf8ZW5q38M9uiCYV2qTEbw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 12:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223065

--3ca16f73673b4810f3abcc3c60049cdfb55e08c03725f1325d2a377b7601
Content-Type: multipart/alternative;
 boundary=b1ad86f34f376aba3a850c165e8d63bf0bc97a77a624320151b83e21fa11

--b1ad86f34f376aba3a850c165e8d63bf0bc97a77a624320151b83e21fa11
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

Hi Vincent,

Here is the log file, but there isn't much.

About build host, this is not a docker, so I believe I have no easy way
to provide you with a reproducible setup.

Configuration can be seen here: https://autobuilder.yoctoproject.org/valkyr=
ie/api/v2/logs/3445173/raw_inline

Best regards,
Mathieu

On Sun Sep 7, 2025 at 5:47 PM CEST, Vincent Davis Jr wrote:
> Okay
>
> Is there anyway I can see
>
> qemu_boot_log.20250907083922?
>
> Also assuming we are running in a docker container.
>
> May I see the Docker file.
>
> Ran v3 against latest poky using an ubuntu docker container after cherry
> picking v3 commits into it.
>
> DISTRO =3D "poky"
> MACHINE =3D "qemux86-64" I believe not near computer.
>
> My docker file and docker compose file
>
> https://github.com/under-view/docker-builds/blob/master/containers/yocto-=
project/ubuntu-24.04/Dockerfile
>
> https://github.com/under-view/docker-builds/blob/master/composes/default-=
compose.yaml
>
>
>
>
>
>
> On Sun, Sep 7, 2025, 10:02=E2=80=AFAM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Fri Sep 5, 2025 at 6:41 PM CEST, Vincent Davis Jr wrote:
>> > If caller wants to primarily leverage
>> > grub as the primary boot loader current
>> > oe-core doesn't support booting grub when
>> > the boot firmware is legacy BIOS based and
>> > the partition table format is GPT based.
>> >
>> > Issue GPT header reside where core.img
>> > should be located (at byte 512).
>> >
>> > To navigate around issue core.img was
>> > moved to a seperate partition.
>> >
>> > If disk is a GPT disk caller must specify
>> > the file system type as none and set the
>> > partition type as BIOS boot. No filesystem
>> > will be created on partition. This also
>> > allows wic plugin to know where to dd
>> > core.img.
>> >
>> > Unfortunately No deep dive into grub-install
>> > was perform to know the exact bytes changed
>> > in hybrid boot case. To see the change in
>> > bytes generated boot.img + core.img was compared
>> > to boot.img + core.img after grub-install was
>> > executed using the xxd command.
>> >
>> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
>> > ---
>>
>> Hi Vincent,
>>
>> We still have the same failure as on v2. Still happening with selftests
>> running on debian host, so there might be something related to the host
>> configuration.
>>
>> ERROR: Qemu log output from
>> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2287526/tm=
p/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log=
.20250907083922:
>> SeaBIOS (version rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org)
>> ...
>> iPXE (http://ipxe.org) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 CA=
00
>> Press Ctrl-B to configure iPXE (PCI 00:02.0)...
>> ...
>> Booting from Hard Disk..
>> 2025-09-07 08:56:24,256 - oe-selftest - INFO - 9: 79/94 577/639 (1085.73=
s)
>> (0 failed) (wic.Wic2.test_grub_install_biosplusefi_qemu)
>> 2025-09-07 08:56:24,265 - oe-selftest - INFO -
>> testtools.testresult.real._StringException: Traceback (most recent call
>> last):
>>   File
>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/util=
s/commands.py",
>> line 390, in runqemu
>>     qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemupa=
rams,
>> launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
>>   File
>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/targ=
etcontrol.py",
>> line 179, in start
>>     raise RuntimeError("%s - FAILED to start qemu - check the task log a=
nd
>> the boot log" % self.pn)
>> RuntimeError: core-image-minimal - FAILED to start qemu - check the task
>> log and the boot log
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2280
>>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--b1ad86f34f376aba3a850c165e8d63bf0bc97a77a624320151b83e21fa11--

--3ca16f73673b4810f3abcc3c60049cdfb55e08c03725f1325d2a377b7601
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=qemu_boot_log.20250907083922
Content-Type: text/plain; charset=utf-8; name=qemu_boot_log.20250907083922

G2MbWz83bBtbMkobWzBtU2VhQklPUyAodmVyc2lvbiByZWwtMS4xNi4zLTAtZ2E2ZWQ2YjcwMWYw
YS1wcmVidWlsdC5xZW11Lm9yZykNCgoKaVBYRSAoaHR0cDovL2lweGUub3JnKSAwMDowMi4wIENB
MDAgUENJMi4xMCBQblAgUE1NKzBFRkM2NTYwKzBFRjI2NTYwIENBMDANClByZXNzIEN0cmwtQiB0
byBjb25maWd1cmUgaVBYRSAoUENJIDAwOjAyLjApLi4uDSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
CgoKQm9vdGluZyBmcm9tIEhhcmQgRGlzay4u
--3ca16f73673b4810f3abcc3c60049cdfb55e08c03725f1325d2a377b7601--

