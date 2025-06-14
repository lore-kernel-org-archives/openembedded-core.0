Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EFAC71141
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 13:11:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9494.1749906665833054117
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YuzyqZ3S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85FE743A0D;
	Sat, 14 Jun 2025 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749906663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfFAe4gM1oSjdawBrILoix//oB+u5XhAUrnypemVmdg=;
	b=YuzyqZ3S6IRa58fcam5bd7TMgyR0+qm0iwFShDyUutKZNVXGhQxv0OzsZjw8SFmqqJRDP2
	r/FZpDnJNWJOSWN9mxdopPxfYNrLrltQXBHJksU8LtxsdNa+h5WOuZRHC3AHsDK4tCJg/g
	2iGDTL9yzUSQ7VRUWybpwZ9DAatDgyNg97IMl8+MAcHhJ+jGFN4KkQPusM7WQAXRdWfzGY
	RviPMz3rLrxXOq2j8sFnY4Ky3P0OEi2o8e4OyucwkdmEP2HFdRJ0sOagBBdIo87t5fpSjd
	IY4T/lA49+ivKB0WU/boxbyVoU7e1kT6cEdk89j99OcdbRr2AwRIBcjTXZIqrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 15:11:03 +0200
Message-Id: <DAMA532J68XE.3FVM6GD3KHACL@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 3/3] libglvnd: migrate from meta-oe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250613120358.2011626-3-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250613120358.2011626-3-dmitry.baryshkov@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvtdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegtjedvheemgeehkeejmegrhedtfeemsgehrgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgejvdehmeegheekjeemrgehtdefmegshegrhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrt
 ghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 13:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218635

On Fri Jun 13, 2025 at 2:03 PM CEST, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
> libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
> EGL / GLX libraries. It has been proposed and initially implemented by
> NVIDIA in order to simplify coinstallation of GL drivers provided by
> different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
> etc.) have already switched to libglvnd.
>
> Having libglvnd in OE-Core simplifies integration of this ABI into
> distro and BSP layers (e.g. it will help meta-tegra, which currently
> provides its own version of the recipe).
>
> Import recipe for libglvnd from the meta-oe layer (changes: fix virtual
> package names, add add the SUMMARY data, drop git@ from SRC_URI).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patch.

> +PACKAGECONFIG[glx] =3D "-Dglx=3Denabled,-Dglx=3Ddisabled,libx11 libxext =
xorgproto,,virtual-libglx-icd"

It looks like this dependency is not present in oe-core:

WARNING: Nothing RPROVIDES 'nativesdk-virtual-libglx-icd' (but virtual:nati=
vesdk:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/libglv=
nd/libglvnd_1.7.0.bb RDEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1799/ste=
ps/13/logs/stdio

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


