Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CEA7971938
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:36:13 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so6045121wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=RuRzwiPasH5T71rfHdfERbcnSGwk0i4Jm1VFY8ITaH8=;
	b=XU/un/Bo3aF/Ztkjv0pV8lejT7Cl8Mx/FHhegWvbr0qOfFV/tQTxuJzMgsKWaSCAIX
	CfGzPSknMftw8jkgZsrirlJHEARj54aLk9pw5Um+5B6wbtqMpldaXIrp5SCa5AeZxnco
	53rS9DF+MVWYIMTV56sSphyBc9/9nt/yfagq0utGKnY3SIZo6++hUEVPfuqlJdoy1Drw
	arOS+Ty20jcSAqocbAR3dAle5S6QDqH9DM818LA4DS1D6Jdwdz1M2Za30aQEcc3lz92J
	SmoRPtUgRt54AVTm8eJwW/pFISeZXpxlzMA+cXUyIIaND9nEnkeWZ2SIvD13OSYK9Tce
	GEvg==
X-Gm-Message-State: ALoCoQkN+Uj4KB3Wz0O8D3u26PrttMJmHsaKL+7OUcikFuccqbSNz5ByXgzWoMiDhaYaw2p64dCE
X-Received: by 10.180.187.44 with SMTP id fp12mr20737370wic.72.1414409773679; 
	Mon, 27 Oct 2014 04:36:13 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a450:6148:7bd:4c3f?
	([2001:610:612:0:a450:6148:7bd:4c3f])
	by mx.google.com with ESMTPSA id u5sm11577758wiz.9.2014.10.27.04.36.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Oct 2014 04:36:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414395756-29588-1-git-send-email-pascal.bach@siemens.com>
Date: Mon, 27 Oct 2014 12:36:11 +0100
Message-Id: <8AB2212A-15FB-4CB1-B88B-8C7C8FF5C86D@dominion.thruhere.net>
References: <1414395756-29588-1-git-send-email-pascal.bach@siemens.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types.bbclass: Make ubi depend on ubifs
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
X-List-Received-Date: Mon, 27 Oct 2014 11:36:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 27 okt. 2014, om 08:42 heeft Pascal Bach <pascal.bach@siemens.com> =
het volgende geschreven:
>=20
> The ubi command assumes the ubifs file is present.
> This makes sure this is really the case.
>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
> meta/classes/image_types.bbclass |    2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/image_types.bbclass =
b/meta/classes/image_types.bbclass
> index 99a07da..76190fd 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -96,6 +96,8 @@ IMAGE_CMD_ubi () {
> 	mkfs.ubifs -r ${IMAGE_ROOTFS} -o =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
> 	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi =
${UBINIZE_ARGS} ubinize.cfg
> }
> +IMAGE_TYPEDEP_ubi =3D "ubifs"
> +

'ubifs' or 'ubifs-native'?=

