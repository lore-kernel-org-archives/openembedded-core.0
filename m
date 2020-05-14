Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.4908.1589421628782093443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 19:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04E1xoYB005678
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 19:00:17 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 13 May 2020
 19:00:04 -0700
Subject: Re: [PATCH] gcr: depends on gnupg-native
To: <openembedded-core@lists.openembedded.org>
References: <20200511092342.29197-1-kai.kang@windriver.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <f00e9d2b-8ada-a259-337d-9c1fa37862ab@windriver.com>
Date: Thu, 14 May 2020 09:59:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511092342.29197-1-kai.kang@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04E1xoYB005678
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020/5/11 =E4=B8=8B=E5=8D=885:23, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to build gcr if no commmand gpg on build host:
>
> | meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or not =
executable
>
> Add dependency gnupg-native to fix the error.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-gnome/gcr/gcr_3.36.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/=
gcr/gcr_3.36.0.bb
> index 4fe3b2fff3..458dc8e6c4 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> @@ -8,7 +8,7 @@ BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issu=
es"
>   LICENSE =3D "GPLv2"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9=
abc605"
>  =20
> -DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt \
> +DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
>              ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-n=
ative', '', d)}"
>  =20
>   GNOMEBASEBUILDCLASS =3D "meson"

Any comment, please?

--=20
Kai Kang
Wind River Linux

