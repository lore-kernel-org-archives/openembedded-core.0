Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDjqF-0007D6-7J
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 23:58:45 +0200
Received: by pbcum15 with SMTP id um15so2066724pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gmcyXSmm8pvtDEyO0V8iJNy+S4/vb5mFuMt0EbTupVE=;
	b=ROWSTq/X/noznQl5fLTP8mSpQumJXCsHTzwQ08TCMAZAN/2Q0PSSKBlX/GTTduVe3V
	9sRRghbuFEdSdyl6sW4ccGOacFPQP1+HEVbB9A6CPqZCQuRAP7+PBxeB3pFWcmeV57Vp
	Zej+URLrKas09d2d9Zxh10B1bT17O9jJ2KhlqGa652qBiBnsR2I+Z4iiaLK+jLsTm7Dd
	yhZQuH2bA4Xi0r6NZ907okiyh3LNv5ICPp3FLyBepmx9mxPw3Gs9BFf2Pq4FF8rZLAI8
	oL0jKEtjkTdNmM3aG3MIRlvzAyTqyZ5S7IrRncEcfAIrdXmgc9gmAOEO9mYB3npf/1LH
	oTkg==
Received: by 10.68.226.5 with SMTP id ro5mr562551pbc.138.1333144177247;
	Fri, 30 Mar 2012 14:49:37 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id l1sm8187069pbs.34.2012.03.30.14.49.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 14:49:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333113987-28576-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 30 Mar 2012 14:49:43 -0700
Message-Id: <41F67670-2671-4A3D-8A1C-641D5E9B6324@dominion.thruhere.net>
References: <20120330131340.GT25815@jama.jama.net>
	<1333113987-28576-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn8kIMS3wJpdNinC/IzC6pJzk9uZnNw0AQ6U/tIoD4NUBN4TconZeueLKaW6W48cDGCc8Jx
Subject: Re: [RFC][PATCH] arch-armv7a.inc: fix PACKAGE_EXTRA_ARCHS after armv7.inc was removed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 21:58:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I think opkg-config-base needs a PR bump for this, since arch.conf was =
broken:

=
https://github.com/Angstrom-distribution/buildhistory/commit/7ca5de97ae09a=
a77c89761a7909cb3c3b0ecdb7b

Op 30 mrt. 2012, om 06:26 heeft Martin Jansa het volgende geschreven:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/conf/machine/include/arm/arch-armv7a.inc |   16 ++++++++--------
> 1 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc =
b/meta/conf/machine/include/arm/arch-armv7a.inc
> index 92640e2..2542f45 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -16,9 +16,9 @@ TUNE_FEATURES_tune-armv7a ?=3D "armv7a vfp"
> TUNE_FEATURES_tune-armv7at ?=3D "armv7a vfp thumb"
> TUNE_FEATURES_tune-armv7a-neon ?=3D "armv7a vfp neon"
> TUNE_FEATURES_tune-armv7at-neon ?=3D "armv7a vfp neon thumb"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7a armv7a-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7a-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
>=20
> # VFP Tunes
> @@ -27,8 +27,8 @@ TUNE_FEATURES_tune-armv7ahf ?=3D =
"${TUNE_FEATURES_tune-armv7a} callconvention-hard
> TUNE_FEATURES_tune-armv7athf ?=3D "${TUNE_FEATURES_tune-armv7at} =
callconvention-hard"
> TUNE_FEATURES_tune-armv7ahf-neon ?=3D =
"${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
> TUNE_FEATURES_tune-armv7athf-neon ?=3D =
"${TUNE_FEATURES_tune_armv7at-neon} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7ahf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7ahf-vfp armv7at2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
> PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon =
armv7at2hf-vfp-neon"
>=20
> @@ -38,8 +38,8 @@ TUNE_FEATURES_tune-armv7ab ?=3D =
"${TUNE_FEATURES_tune-armv7a} bigendian"
> TUNE_FEATURES_tune-armv7atb ?=3D "${TUNE_FEATURES_tune-armv7at} =
bigendian"
> TUNE_FEATURES_tune-armv7ab-neon ?=3D =
"${TUNE_FEATURES_tune-armv7a-neon} bigendian"
> TUNE_FEATURES_tune-armv7atb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7at-neon} bigendian"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ab =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7ab-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7atb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7ab-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ab-vfp armv7at2b-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
> PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon =
armv7at2b-vfp-neon"
>=20
> @@ -49,8 +49,8 @@ TUNE_FEATURES_tune-armv7ahfb ?=3D =
"${TUNE_FEATURES_tune-armv7ab} callconvention-ha
> TUNE_FEATURES_tune-armv7athfb ?=3D "${TUNE_FEATURES_tune-armv7atb} =
callconvention-hard"
> TUNE_FEATURES_tune-armv7ahfb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
> TUNE_FEATURES_tune-armv7athfb-neon ?=3D =
"${TUNE_FEATURES_tune_armv7atb-neon} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7ahfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7ahfb-vfp armv7at2hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
> PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon =
armv7at2hfb-vfp-neon"
>=20
> --=20
> 1.7.8.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



