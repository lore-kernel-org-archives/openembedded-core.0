Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77330C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 07:43:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.46026.1748331785333679435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 00:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vv4g9fP1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B44743B83;
	Tue, 27 May 2025 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748331783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4JsoKeHdqE402BCnghLDPQAA7cKAmOy5nObANzx/t4=;
	b=Vv4g9fP1npj/mw8fCU4BHLt1xY7nYcma1rewYTDT5EDgyAGHEkHaxKHcojpezaD7zv07dk
	2DHDgc9HKUtPVUFL+xl5iR/NF/dRSLkzxC/LKmqexQgGgmAcHr+BwyHZiIGiOA1H5OqoAD
	V04Sv69sfjKvcPczjBQ5B1uWgE9RvshILFc3H5NrAkTI6VXIb9sUUz/N7Id+nNsIhwUHt8
	qk0iq7pPtYQKKuBODDBz6V+39mmTMq8DV6uNqEcHzDqKf6EKx+T+Wq2BORQMWndtyfSVuE
	hbfrN6gE+QjFsJ4j9uc7QBdiU5Vy42mw0xIP6lqzJMytkvuLluzHvlLnEzNYtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 09:43:02 +0200
Message-Id: <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
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
In-Reply-To: <aDVnDQPSPFFeYgYG@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleekudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudehgefgteegheegjeehhffhgeelkeehgfelfeeukeetvdekiedttdevgeefudeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeekugejjeemsghffedumegslegtgeemudgrgeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemkegujeejmegsfhefudemsgeltgegmedurgegiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhkk
 hhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217285

On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
>> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
>> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.opene=
mbedded.org wrote:
>> >
>> > I reviewed the runqemu and qemu-system-aarch64 arguments but could not=
 see major differences.
>> > One difference is that autobuilder runs with tap and I with slirp netw=
orking, but that
>> > should not affect rootfs/ESP partition detection in u-boot. I've sent =
out v4 now.
>> > If this still fails on autobuilder, then I'd need know what config fra=
gments
>> > are applied. I've configured qemuarm64 and genericarm64 with
>> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS +=3D "slirp"
>> > and SANITY_TESTED_DISTROS =3D "" to conf/local.conf. Maybe autobuilder
>> > scripts add something more.
>> >
>> > Cheers,
>> >
>> > -Mikko
>>=20
>> Hi Mikko,
>>=20
>> Thanks for the new version, but I confirm it still fails.
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772
>
> Is it possible to grab the full boot log
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.=
20250526163143 ?
>
> It was referred in
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_inl=
ine
>

The file is gone :(

I will launch a new build so I can capture the file.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


