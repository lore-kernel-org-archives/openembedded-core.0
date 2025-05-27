Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35674C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:37:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.47596.1748338656432853037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NXjE2flz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 386B24316E;
	Tue, 27 May 2025 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748338654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2leXR2vfmW9o0sWeba+8O8vcYBFed04O3ted/I8OOY=;
	b=NXjE2flzviAuACPOVcAVWoqLsfLdGbrGzihpFb6u6mHuLjaU5I4429SFD7ixrhwAQHHhhe
	ikguMl6+uGGVGG01b1n+xtboA2S2XJihmVFk/L6r8rvD0hNUSow2lrNFy3Lb0Ny9jZ3TMY
	he4A8s4V2S3hrOSHWSs1vajX7lkQRaal5qe62IBj28wQwBxyOvTaC061KQcPK8+sjk8uIL
	wxseTbWJuxu/efADj6IeGbOGSVxuZmFxB6JmbrOup5yBumpddHEdX7uwxgTERrG+BoarIH
	H5yiP+7HLu4WaTruqkPcRFAzNGjpld3eGOj3S1Ch1hYSW6tu3O8qj0w9hI6wfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 11:37:33 +0200
Message-Id: <DA6UBTHJ83S9.34WKJTD4HEHZK@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org> <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com> <aDVnDQPSPFFeYgYG@nuoska>
 <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com> <aDV9qIaaHZu88OQe@nuoska>
In-Reply-To: <aDV9qIaaHZu88OQe@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudehgefgteegheegjeehhffhgeelkeehgfelfeeukeetvdekiedttdevgeefudeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegtudgtieemfeeigegsmeelkegrheemtgguudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdutgeimeefieegsgemleekrgehmegtugdugedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhkk
 hhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217295

On Tue May 27, 2025 at 10:54 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Tue, May 27, 2025 at 09:43:02AM +0200, Mathieu Dubois-Briand wrote:
>> On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
>> > On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
>> >> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
>> >> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.op=
enembedded.org wrote:
>> >> >
>> >> > I reviewed the runqemu and qemu-system-aarch64 arguments but could =
not see major differences.
>> >> > One difference is that autobuilder runs with tap and I with slirp n=
etworking, but that
>> >> > should not affect rootfs/ESP partition detection in u-boot. I've se=
nt out v4 now.
>> >> > If this still fails on autobuilder, then I'd need know what config =
fragments
>> >> > are applied. I've configured qemuarm64 and genericarm64 with
>> >> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS +=3D "slirp=
"
>> >> > and SANITY_TESTED_DISTROS =3D "" to conf/local.conf. Maybe autobuil=
der
>> >> > scripts add something more.
>> >> >
>> >> > Cheers,
>> >> >
>> >> > -Mikko
>> >>=20
>> >> Hi Mikko,
>> >>=20
>> >> Thanks for the new version, but I confirm it still fails.
>> >>=20
>> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/17=
72
>> >
>> > Is it possible to grab the full boot log
>> > /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659=
/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_l=
og.20250526163143 ?
>> >
>> > It was referred in
>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_=
inline
>> >
>>=20
>> The file is gone :(
>>=20
>> I will launch a new build so I can capture the file.
>
> I finally reproduced this. The ESP partition is missing grub-efi
> binaries and only config file is there. I have fixes pending for this
> missing dependency on aarch64 and of course was building with them
> in my tree. I will add a workaround to this test case and
> try get to rebasing the fixes to wic...
>
> Cheers,
>
> -Mikko

Oops, I replied before I saw your own reply. Thanks for the update!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


