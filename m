Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.4576.1631217256006976074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 12:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Pv1Tr++D;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631217257;
  x=1662753257;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nk196MCg41Vq54rXZM6tybLIaOkYeDJBfhCnzRv0Gcw=;
  b=Pv1Tr++Dd2XTG5YuYntLQlbXL71R9cajowI9c3t9JMG0y5wuHzKIniK8
   D75epDj2uJF4Gb9B/HwwBpxOcTLdz6sLhmPoWEgvFKCaoO47EuFTFX0Ov
   DyuDQ//nmAPehva80KbIFk61hmfGXXeW7rCbbk3PwxJ2LaZkyyKlP5EFM
   tt8SY6PAS3ixfDXhOqo1gG5+gk0TPj1DLwcYWp97O63qvWEucIdtLK974
   ZTx1fK28vctpvV9L96UHm2tUuuPl40GWv7B0KfhRtrlKUg9QdzohMXujw
   2i8pQ2aTV2mhGHQM62r1iJpqxil11m6+/TNs6+vmFxQweLcC4Jh9WT56A
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
Thread-Topic: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
Thread-Index: AQHXoMddscbnDYFTr0CAdWUk/6vbC6ucJing
Date: Thu, 9 Sep 2021 19:54:12 +0000
Message-ID: <1591b3098689406f83f576e5f5429ff2@axis.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
 <20210903132459.2560051-12-ross.burton@arm.com>
In-Reply-To: <20210903132459.2560051-12-ross.burton@arm.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 3 september 2021 15:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
>=20
> "BSD" is ambiguous, ffmpeg comprises of several licenses which are
> BSD-like.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-
> multimedia/ffmpeg/ffmpeg_4.4.bb
> index e19077541ec..f822ba9ab78 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "FFmpeg is the leading multimedia framewo=
rk,
> able to decode, encod
>  HOMEPAGE =3D "https://www.ffmpeg.org/"
>  SECTION =3D "libs"
>=20
> -LICENSE =3D "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> +LICENSE =3D "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-Cla=
use & IJG"

There is no "Expat" license in neither meta/files/common-licenses nor=20
in meta/conf/licenses.conf.

>  LICENSE:${PN} =3D "GPLv2+"
>  LICENSE:libavcodec =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GP=
Lv2+', 'LGPLv2.1+', d)}"
>  LICENSE:libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
> --
> 2.25.1

//Peter

