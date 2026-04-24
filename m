Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77452FED3C0
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 13:04:47 +0000 (UTC)
Subject: Re: [PATCH 10/49] groff: upgrade 1.24.0 -> 1.24.1
To: openembedded-core@lists.openembedded.org
From: "Jonas Gorski" <jonas.gorski@bisdn.de>
X-Originating-Location: DE (62.80.99.152)
X-Originating-Platform: Linux Firefox 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 06:04:39 -0700
References: <20260421095559.1856-1-wangmy@fujitsu.com> <20260421095559.1856-10-wangmy@fujitsu.com>
In-Reply-To: <20260421095559.1856-10-wangmy@fujitsu.com>
Message-ID: <1040341.1777035879357598964@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235861

On Tue, Apr 21, 2026 at 11:56 AM, wangmy wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-extended/groff/{groff_1.24.0.bb =3D> groff_1.24.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/groff/{groff_1.24.0.bb =3D> groff_1.24.1.bb=
} (96%)
>=20
> diff --git a/meta/recipes-extended/groff/groff_1.24.0.bb
> b/meta/recipes-extended/groff/groff_1.24.1.bb
> similarity index 96%
> rename from meta/recipes-extended/groff/groff_1.24.0.bb
> rename to meta/recipes-extended/groff/groff_1.24.1.bb
> index dbc8cdf6d0..c4df5f1b18 100644
> --- a/meta/recipes-extended/groff/groff_1.24.0.bb
> +++ b/meta/recipes-extended/groff/groff_1.24.1.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
>           =20
> file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D
> "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
> +SRC_URI[sha256sum] =3D
> "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
> =20
>  DEPENDS =3D "bison-native groff-native"
>  RDEPENDS:${PN} +=3D "perl sed"
> --=20
> 2.43.0

I was still seeing build failures even with the race fix applied, but updat=
ing to 1.24.1 fixed them (combined with the fix from commit  d1a02bdd2426 (=
"74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8").
So in way:

Tested-by: Jonas Gorski <jonas.gorski@bisdn.de>

Best regards,
Jonas

