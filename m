Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE24C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:03:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11877.1741863802179824688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gW4Ap9yR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 246952047B;
	Thu, 13 Mar 2025 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741863800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elZIlE3aqRb1PrmWVDUO8eA9RGcNJKUIHpfeIH1AFI8=;
	b=gW4Ap9yR7II+EwzgSXCBJf5O6W+xpDuNI1dDl6iBudTCEJl1Psx/CkvOr//WhDSKUCcrgi
	b83fKv0nT94gyX3fTnUzTnXGMgP/zb/75wa6EzEkic8UbsrI3RTPMCQx88con0zFe/y5fU
	rkjWCfTOB3yPbHqbFr54JrcdSAlPfIGsbcv9sMj4pQ6Odq6PRlXqWWLgZPclBZcdPxmcZA
	RHgSVtiksNq4kY29IVzVKd3ccIPokPxk/r6BelH0ywD9HVF4D8E0GVSV2r0dvQRLJYq6QX
	8VWqThu3WcVHxWWSMtVxr0Nmh1/oG8hUqsVa8vMrKFcG1460fURmv057QB5JUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 12:03:16 +0100
Message-Id: <D8F36LBQA7AM.2Z50KMS4GASA2@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] scripts/install-buildtools: add an option
 to preserve downloads
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250311104152.393470-1-alex.kanavin@gmail.com>
In-Reply-To: <20250311104152.393470-1-alex.kanavin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiheffleffuddujeegfedvffetteduvdfhuedtudetveffgeffueduvddvtdehudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhis
 hhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212760

Hi Alex,

On Tue Mar 11, 2025 at 11:41 AM CET, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> By default the script puts everything it downloads into a temporary
> directory and erases it after unpacking and installing the buildtools.
>
> This isn't great for traceability and reproducibility of builds
> (being able to see what was downloaded exactly, and being able
> to reproduce setting up a build, especially if the buildtools
> download location isn't available for whatever reason).
>
> This commit adds an option to download items into a specified directory
> and keep them there. I would particularly like to use it
> with bitbake-setup, where an optional script to install the buildtools
> would ensure the tarball remains available on local disk.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/install-buildtools | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index 639ebb12d78..1a68aad53e7 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -142,6 +142,9 @@ def main():
>                          default=3DDEFAULT_INSTALL_DIR,
>                          help=3D'directory where buildtools SDK will be i=
nstalled (optional)',
>                          action=3D'store')
> +    parser.add_argument('--keep-downloads-directory',
> +                        help=3D'use this directory for tarball/checksum =
downloads and do not erase them (default is a temporary directory which is =
deleted after unpacking and installing the buildtools)',
> +                        action=3D'store')
>      parser.add_argument('-r', '--release',
>                          default=3DDEFAULT_RELEASE,
>                          help=3D'Yocto Project release string for SDK whi=
ch will be '
> @@ -235,11 +238,11 @@ def main():
>                  safe_filename =3D quote(filename)
>                  buildtools_url =3D "%s/%s/buildtools/%s" % (base_url, ar=
gs.release, safe_filename)
> =20
> -    tmpsdk_dir =3D tempfile.mkdtemp()
> +    sdk_dir =3D args.keep_downloads_directory or tempfile.mkdtemp()

How about also creating the directory if args.keep_downloads_directory is s=
et?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

