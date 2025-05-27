Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94CBC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:34:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.45319.1748327695802142937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 23:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M3ZL69KX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E53C41B5F;
	Tue, 27 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wm8rUsdCdY+R5im5iUdVNvNfkAxHOekh1/s5aD+2pEE=;
	b=M3ZL69KXjplvnpxZCXcz0tlLwEoHRfeDarcGnughz18s8tVkDOOE/Mpi0Vq6bW/FqIdvB/
	HNIBstDJ0kT1Fg6nzYIhJi0WeuSfdDXYLrf7/RwxJplS1tZ5+wVwBS6l7SKCCSqK1B7S/7
	+xkL4OQeOnIaDCMLwJpk/UxgqtxUdUyhmuD5yZroY9ni39KeylzhIPVHiFbeIfIYEiV77O
	8prMCfYR8Dzdfbrauzr1lNBeXPEabbCY8ru3dlNlzvABnItfbnnJKuh0zz3ySLQGTygL4T
	ZmxVUvqGpdMZWk26GHQNeVFUJE3HjtM1uH2YnA0OgyV1zMVjd+nG7aomfZQ8Yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 08:34:52 +0200
Message-Id: <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org> <aDQqIZgXepLP3xXD@nuoska>
In-Reply-To: <aDQqIZgXepLP3xXD@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvkefhveeflefgveegfffftdevteetjeekvdelvedtgfdtteeludeugeejhffgtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdhsrghmphhlvgdrsggvshhtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeekugejjeemsghffedumegslegtgeemudgrgeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemkegujeejmegsfhefudemsgeltgegmedurgegiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgsp
 ghrtghpthhtohepvddprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217282

On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
>> On Fri, May 23, 2025 at 03:15:51PM +0200, Mathieu Dubois-Briand wrote:
>> > On Thu May 22, 2025 at 3:41 PM CEST, Mikko Rapeli via lists.openembedd=
ed.org wrote:
>> > > Add a test case to boot target system via u-boot
>> > > using qemu with KVM. This was broken recently
>> > > and workaround proposed to u-boot. Test case
>> > > works with genericarm64 and qemuarm64 target machines
>> > > compiled and tested on aarch64 build host with KVM
>> > > support.
>> > >
>> > > Test execution time with full sstate cache is
>> > > around 170 seconds. qemu boot itself takes just
>> > > a few seconds to full userspace.
>> > >
>> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> > > ---
>> >=20
>> > Hi Mikko,
>> >=20
>> > I saw your other mail saying you will make an update, but as I had
>> > already picked these patches, here is the build result: the selftest i=
s
>> > failing on armhost:
>> >=20
>> > ---
>> > 2025-05-23 08:50:18,542 - oe-selftest - INFO - uboot.UBootTest.test_bo=
ot_uboot_kvm_to_full_target (subunit.RemotedTestCase)
>> > 2025-05-23 08:50:18,543 - oe-selftest - INFO -  ... ERROR
>> > ...
>> > QEMU 10.0.0 monitor - type 'help' for more information
>> > (qemu)
>> > Waiting at most 1000 seconds for login banner (05/23/25 08:33:29)
>> > Connection from 127.0.0.1:43786
>> > Target didn't reach login banner in 1000 seconds (05/23/25 08:50:12)
>> > Last 25 lines of login console (1721):
>> > Scanning bootdev 'virtio-blk#36.bootdev':
>> > Scanning bootdev 'virtio-net#32.bootdev':
>> > BOOTP broadcast 1
>> > ...
>> > BOOTP broadcast 17
>> >=20
>> > Retry time exceeded; starting again
>> > No more bootdevs
>> > ---  -----------  ------  --------  ----  ------------------------  --=
--------------
>> > (1 bootflow, 1 valid)
>> > =3D>
>> > ...
>> > RuntimeError: core-image-minimal - FAILED to start qemu - check the ta=
sk log and the boot log
>> > ---
>> >=20
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/174=
9
>>=20
>> Thanks, I will take a look. Boot to u-boot seems to ok so KVM is working=
 on
>> the aarch64 build machine but something in wic image ESP partition detec=
tion is not
>> working in the same way as on my aarch64 build machine and qemuarm64 and
>> genericarm64 configs.
>>=20
>> I will compare the runqemu and qemu-system-aarch64 arguments to figure o=
ut what is
>> different.
>>=20
>> One problem I thought I solved was to change from virtio scsi to virtio =
blk emulation
>> but that seems to be effecttive albeit with a warning:
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2468510/raw_in=
line
>>=20
>> runqemu - WARNING - Unknown QB_DRIVE_TYPE: vd
>> runqemu - WARNING - Failed to figure out drive type, consider define or =
fix QB_DRIVE_TYPE
>> runqemu - WARNING - Trying to use virtio block drive
>>=20
>> u-boot defconfig does not have scsi support but virtio blk works for dis=
k with ESP
>> partition in fat format.
>
> I reviewed the runqemu and qemu-system-aarch64 arguments but could not se=
e major differences.
> One difference is that autobuilder runs with tap and I with slirp network=
ing, but that
> should not affect rootfs/ESP partition detection in u-boot. I've sent out=
 v4 now.
> If this still fails on autobuilder, then I'd need know what config fragme=
nts
> are applied. I've configured qemuarm64 and genericarm64 with
> ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS +=3D "slirp"
> and SANITY_TESTED_DISTROS =3D "" to conf/local.conf. Maybe autobuilder
> scripts add something more.
>
> Cheers,
>
> -Mikko

Hi Mikko,

Thanks for the new version, but I confirm it still fails.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772

About the configuration, I believe everything is there:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772/ste=
ps/14/logs/stdio

But anyway, here is the configuration on the worker:

$ cat conf/auto.conf
MACHINE =3D "qemuarm64"
DISTRO =3D "poky"
SDKMACHINE =3D "aarch64"
PACKAGE_CLASSES =3D "package_rpm"
DL_DIR =3D '/srv/autobuilder/valkyrie.yocto.io/current_sources'
SSTATE_DIR ?=3D '/srv/autobuilder/valkyrie.yocto.io/pub/sstate'
RPM_GPG_SIGN_CHUNK =3D '1'
IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
SANITY_TESTED_DISTROS =3D ''
BB_HASHSERVE =3D 'wss://hashserv-eu.yoctoproject.org/ws'
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuilde=
r/autobuilder-resource-constraints'

local.conf is unmodified (local.conf.sample).

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


