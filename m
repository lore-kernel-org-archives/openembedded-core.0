Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF850C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:53:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9276.1750319628536073161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NJq5AgNK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98C924435E;
	Thu, 19 Jun 2025 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750319626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=De8TCDFMsl/5xRFXqB+bUDSSj5wLLUj1uJSYw8SvanM=;
	b=NJq5AgNKk5/EzlAVikvhXNZYF3u53jS82wjyTVNPJPbJld6L5BnCo2gb+3xZdTanQsE0cS
	hRgtHemLT7vZoJhlGiEtmmdTuetNLfnvrtcnejhxUKL0D+7O0a2B/vWHvaMUE6OKxWnFvQ
	YuA3QjOe0722sWm41Ej3w0gTXmaQuLbe7s4qwRioHwesjmyXlxH0+VspNBd8TlBfCG9zb7
	C818tjeh/aNbbGcvDqBvlGAzJwcr1YZ7qJET0L17+iCBMODXpMbNMMxixvOKwG+8csCifn
	D70E3daBAvLdqRY+wFcHyWHUpmqEw+27w7YulKz7QitU/i9wfV/Jcgs0AIv32g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 09:53:46 +0200
Message-Id: <DAQCIVNY2M23.29XYUTYYDNS0L@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 2/8] qemu.inc: drop duplicates with
 default-providers.inc
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618212055.1529969-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250618212055.1529969-2-dmitry.baryshkov@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephefgleejgefgtdeuudevgfehgfeihffgfeejteekieettdffgeegvedufeetveetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvu
 gguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219055

On Wed Jun 18, 2025 at 11:20 PM CEST, Dmitry Baryshkov via lists.openembedd=
ed.org wrote:
> default-providers.inc already includes PREFERRED_PROVIDER values for
> xserver and GL libraries. Drop the same values being set in the machine
> config.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/conf/machine/include/qemu.inc | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index d7392d476238..c143e37f710e 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -1,10 +1,3 @@
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
> -
>  XSERVER ?=3D "xserver-xorg \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driv=
er-swrast xserver-xorg-extension-glx', '', d)} \
>              xf86-video-fbdev \

This conflicts with your previous patch ("qemu.inc: handle GLVND-related
providers"). Should this one be refreshed to:

  diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
  index 4fa18812db..c143e37f71 100644
  --- a/meta/conf/machine/include/qemu.inc
  +++ b/meta/conf/machine/include/qemu.inc
  @@ -1,10 +1,3 @@
  -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
  -PREFERRED_PROVIDER_virtual/egl ?=3D "${@bb.utils.contains('DISTRO_FEATUR=
ES','glvnd','libglvnd','mesa',d)}"
  -PREFERRED_PROVIDER_virtual/libgl ?=3D "${@bb.utils.contains('DISTRO_FEAT=
URES','glvnd','libglvnd','mesa',d)}"
  -PREFERRED_PROVIDER_virtual/libgles1 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES','glvnd','libglvnd','mesa',d)}"
  -PREFERRED_PROVIDER_virtual/libgles2 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES','glvnd','libglvnd','mesa',d)}"
  -PREFERRED_PROVIDER_virtual/libgles3 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES','glvnd','libglvnd','mesa',d)}"
  -
   XSERVER ?=3D "xserver-xorg \
               ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driv=
er-swrast xserver-xorg-extension-glx', '', d)} \
               xf86-video-fbdev \

or should the first one be dropped?

Dropping the first one for testing for now.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


