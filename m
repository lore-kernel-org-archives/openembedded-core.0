Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346C8C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 08:21:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10653.1752049298128639291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 01:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NsvroMZP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01B8342E79;
	Wed,  9 Jul 2025 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752049295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbghBc26UcAMMIyY1+jbKakaxfUGG+nt/w8QGvktuwM=;
	b=NsvroMZPYhXptg8EL44i18Minq8b+/5CVXbHUI3vrkE4m6Rose7xHGiMOXEZBdcEW5z/2s
	ywsb5G3recxWF9pWG1XzLplrLgPxtAkXnzA05/ibNNC0sLHjwC1e2M3k0eHRf79s3fLEwh
	S9moygEUuYEHvPLNZW4LklDrboWCTo0crfTI1GVTqquwUTIUBnXDws4QkzkyVd3ckvkaGb
	DWgDqlqMD0eGCVHG1fJmfl3v1bFZ3uDyNJv0GHrqsf0SAAWNEPvkEOdKYFS8+e3xxiMhdl
	1FkqwFm7Bx7b1VP4gGNZ6safvA9ft7m8tKbT0VKN4qghws6NRTJ67sjOzdXvIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 10:21:34 +0200
Message-Id: <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, <adrian.freihofer@siemens.com>, "Marek Vasut"
 <marek.vasut@mailbox.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tom Rini" <trini@konsulko.com>, "Fabio Estevam" <festevam@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
 <20250708175732.GU6424@bill-the-cat>
In-Reply-To: <20250708175732.GU6424@bill-the-cat>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheehveeggfdvgefhgfehieetvddvfedtleehheffvdetteekheegtedutdfhvdehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehtrhhinhhisehkohhnshhulhhkohdrt
 ghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomhdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtsehmrghilhgsohigrdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220082

On Tue Jul 8, 2025 at 7:57 PM CEST, Tom Rini wrote:
> On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
>> Hi Mathieu,
>>=20
>> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
>> <mathieu.dubois-briand@bootlin.com> wrote:
>> >
>> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openembedd=
ed.org wrote:
>> > > Upgrade to U-Boot 2025.07.
>> > >
>> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
>> > > ---
>> >
>> > Hi Fabio,
>> >
>> > Thanks for your patch.
>> >
>> > It looks like this is breaking selftests on the autobuilder:
>> >
>> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitImageT=
ests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
>> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
>> > ...
>> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
>> > ...
>> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No su=
ch file or directory
>> >
>> >
>> > Both on debian and armhost:
>> >
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/192=
3
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/207=
7
>> >
>> > Can you have a look at these failures please?
>>=20
>> Thanks for the report.
>>=20
>> I am adding some folks on CC in case they have some ideas.
>
> Interesting. How can we trigger that outside of the autobuilder?

Hi,

It's not so easy to reproduce, as it looks like it is somehow linked
with the host environment: this have been failing on debian workers but
not on the fedora ones.
So basic instructions are below, but this was not enough to reproduce it
in the ubuntu 24.4 docker I've been using so far.

git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder.yoctopr=
oject.org/valkyrie/a-full-1972
cd poky-ci-archive
. oe-init-build-env

Add following lines in conf/local.conf (I bet only the last one is
really needed, but let's try to be as close as possible as the
autobuilder configuration):
MACHINE =3D "qemux86-64"
DISTRO =3D "poky"
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm"
RPM_GPG_SIGN_CHUNK =3D '1'
IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
SANITY_TESTED_DISTROS =3D ''

Add poky-ci-archive/meta-selftest in conf/bblayers.conf.

And finally, run the tests:
oe-selftest -r fitimage.UBootFitImageTests.test_sign_cascaded_uboot_fit_ima=
ge
oe-selftest -r fitimage.UBootFitImageTests.test_sign_standalone_uboot_atf_t=
ee_fit_image


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


