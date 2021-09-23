Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.83])
 by mx.groups.io with SMTP id smtpd.web09.2122.1632389030280431927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 02:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=XZlYlM47;
 spf=pass (domain: outlook.com, ip: 40.92.66.83, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8BtLVwEayMdFaLAPV5XXU5NQGpjp0PJy2WLfzVTS5GAEr+KDzQ3UtT0k9CEk/ZXcFDCPcAL5Rd4XFxqFs4ZQWlkqeCEP3168s4+QlJ0xBjWL7X/Sf7x0zWygvZ20hnnOdkZSGX9qfBeUEZiwW1RQg/guQGYgyDM4qbybqUuMu6x+ipDWlYpVsIAqPzSxPJrcM+DouWVPzvvV0k/MHjMtmDP1DGAZrsZ2C48gnq2Gyxht5UuXyt0NqlfciB1rEJpruxMpGXWzy1+bXXh29sxU3fmjHq9WJAK5V4IBbdf4eAU8B9+dQxtPfS+y821TlFkwPR7eU5z5sQXNFNDWo98MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=odyFTjf2woJQWMdfdPPqFffJXryjC17332hihFaHjU0=;
 b=HURn0qYpG/PJjFtaYkIFUBafXcYNEmQM8F3nCAAm12DXNovt2/nPK1ApUjclqcof3EsF85uys0WhzHKukntVUrO0nJpmheoKF5OzaaL3tBXc5Bt8zOWB9tcKif074yv/tnzOos3lb6ze2Ju9j7MAORSH9ks9jwB6aUCJCxMcqdQ3BNnLpBSJRzNtLY21BkB5s4QzGoPlq/r0Dj4VpJAlV6mdrbHWwBcq7yZiR0ZaIP/aN6kz6MAi6kcUYHR7XG2H0gHNS9gFf6XK0nA/20QDxB5EAiAsBF1uVGQOisLaZ4zikiMJT8+pGgwFiga90yhR3GqOjgCvpSPvEnalpn4dHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odyFTjf2woJQWMdfdPPqFffJXryjC17332hihFaHjU0=;
 b=XZlYlM47lTJMq9w9rIXIapNfuemX9qimxtC+K+95TXzhN8ZTJuUGNqVXYc9HjAwOLd0MAw1mDX5vK+UtuHS33bA28qPAUegA4e2viyZmKL3p4I5wP4rT8bZhl1kKizICM2q8Qol33RMNhtDgOSTv8sBpNF4/nsBjhXI+EUHgQj8LFyqjPa3Z4loAM7vFy3xvFJG1lMI8C+7zEhiFHWgb+sxLNpPdT1geqgjJCJVPeynEkxM3OcpPPDwVmYeXjCXX6wacLUT5M+CEwxwVj6WLf2kDC6zyMk/vp8Yd5lYh4H1WniAeLBDieR3azavO9Ho9n8WB1+/0/a9DDQ+yHSC8ow==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4116.eurprd09.prod.outlook.com (2603:10a6:208:19d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 09:23:47 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 09:23:47 +0000
Subject: Re: [OE-core] [hardknott][PATCH] mesa: Add patches for red label issues on video for VC4 and Freedreno
To: Pablo Saavedra Rodi?o <psaavedra@igalia.com>,
 openembedded-core@lists.openembedded.org
References: <20210923090547.3260456-1-psaavedra@igalia.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB464212C3B0711CA383BE3E78A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 23 Sep 2021 11:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210923090547.3260456-1-psaavedra@igalia.com>
X-TMN: [kUNf8GWC7rGSoJfsh7HdpyAx9n7R7DLuJyHfZiVgpaiq1uI878JaGrPxfIzhznIv0ny0dZVl7nM=]
X-ClientProxiedBy: AM0PR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <02cbc088-465e-5899-a299-91863e671c7e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:11df:cd87:699f:18eb] (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by AM0PR01CA0112.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 09:23:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef798c2-9c22-45ec-bf13-08d97e73d8c3
X-MS-TrafficTypeDiagnostic: AM0PR09MB4116:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7g6K6WJL7hY8TpKAm9O1MNSaFrKtpAOWkdlP0cnoE4zpRCr/xR3XumqeS/OLpJIirDaOuXUEjB0vjFCRhMEmQ+pF/+eSWl/17Jh+FmWWXak37IzhWiLGi3ddnk4WySutmBkplIuhW3bXbj136o2p/npye+ONGQp3yU7aGADgYMZGNPXq4OBeMsTjx5JMp71UXT2wmEL95gTKcKZE91g+XXXywnw0SKvgv+WYUB8p401d86GCQ45M79+/s6NW/ycrJQp+fcKIX0NLdZM+N8KSLrrzzYWYr1DQuPKlxFJz30n00rpi21+e73FyAvX0+hA+Uy6pcoWd141wrgOsKUxBeKhawSHD5PvzeNR0i7Dn9mlq5uYhVMRdetTCk+BRAzTIy+PMgYoDLacMf+fuu831P5av6L02wij7oGCOTK487ba8V0zR3GH9FCKXjOjzwzXjj50FslTNABKdoqoc7y14k4LQLw02dNbFlgz1RTH1avvnVQoMjy1zE9I+vEikBxFx0glZT4gZrIg7tSj8nKCa3Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	us5m9BzNHJVky7OyrFvzRGVeg2W4uNfGXqQNkqspG1bXDjzh4Ncro3X4W5SU57wN8s2v4MOEt0K1WNiZe34tBwVUTnc4cUBL4Vsajde7RXgJa68uljCAVsL3Pv9+qtJVvAqXrVbqjd6fGtKtasLrNSNoKM5p8PIe4qv397UxjOF0tbpOtw2ri7ePjHwvuHZwwVQUuIUJe8zTff1r0cq8bg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef798c2-9c22-45ec-bf13-08d97e73d8c3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:23:47.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4116
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 23.09.21 11:05, Pablo Saavedra Rodi?o wrote:
> freedreno,v3d: YUV formats are supported as external-only dmabuf
> modifiers.
>=20
> This patch fix red label issues on video for Raspberry 4-64 Mesa VC4
> driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver
>=20
> Issue was originally reported in meta-webkit [1] and later contributed
> in Mesa [2]  where it was already merged in master.
>=20
> * Commits for VC4 [3] had been nominated for stable 21.1 and already in
>    21.2 (available in honister).
> * Commit for Freedreno [4] also reported (not merged yet).
>=20
> [1] https://github.com/Igalia/meta-webkit/issues/185
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10534
> [4] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
>=20
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>   ...rmats-are-supported-as-external-only.patch | 31 +++++++++++++++++
>   ...at-is_dmabuf_modifier_supported-are-.patch | 32 +++++++++++++++++
>   ...at-query_dmabuf_modifiers-are-extern.patch | 31 +++++++++++++++++
>   ...OD_BROADCOM_SAND128-only-available-f.patch | 34 +++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc           |  4 +++
>   5 files changed, 132 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-YUV-=
formats-are-supported-as-external-only.patch
>   create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-YUV-format=
s-at-is_dmabuf_modifier_supported-are-.patch
>   create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-YUV-format=
s-at-query_dmabuf_modifiers-are-extern.patch
>   create mode 100644 meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT=
_MOD_BROADCOM_SAND128-only-available-f.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-=
are-supported-as-external-only.patch b/meta/recipes-graphics/mesa/files/000=
1-freedreno-YUV-formats-are-supported-as-external-only.patch
> new file mode 100644
> index 0000000000..92f4b40997
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-sup=
ported-as-external-only.patch
> @@ -0,0 +1,31 @@
> +From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00 2001
> +From: Pablo Saavedra <psaavedra@igalia.com>
> +Date: Thu, 23 Sep 2021 10:23:56 +0200
> +Subject: [PATCH] freedreno: YUV formats are supported as external-only d=
mabuf
> + modifiers
> +
> +Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> +
> +Co-authored-by: Alberto Garcia <berto@igalia.com>
> +Co-authored-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>

All the patches are missing an Upstream-Status - if that is already=20
merged upstream, as you mentioned, it should be Upstream-Status:=20
Accepted (or Upstream-Status: Backport)

Adding it would certainly make it easier on the next update to identify=20
the patches that can easily be dropped

Also I'm not seeing any info that this series has been applied to master=20
(but I might be wrong here)

> +---
> + src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gall=
ium/drivers/freedreno/freedreno_screen.c
> +index a9cd0e2..dc2b79d 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> +@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pipe_screen =
*pscreen,
> + 			modifiers[num] =3D screen->supported_modifiers[i];
> +
> + 		if (external_only)
> +-			external_only[num] =3D 0;
> ++			external_only[num] =3D util_format_is_yuv(format);
> +
> + 		num++;
> + 	}
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_=
dmabuf_modifier_supported-are-.patch b/meta/recipes-graphics/mesa/files/000=
1-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch
> new file mode 100644
> index 0000000000..c2e5462dd1
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_=
modifier_supported-are-.patch
> @@ -0,0 +1,32 @@
> +From 389bffa0981bba60f9d081063c150fb17e497c4a Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:15:27 +0200
> +Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported are
> + external_only
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on vid=
eo"
> +
> +Fixes: 6ee10ab3de86 "gallium: Add pipe_screen::is_dmabuf_modifier_suppor=
ted"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index 4f69c20..a5c94db 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct pipe_=
screen *pscreen,
> +         for (i =3D 0; i < ARRAY_SIZE(v3d_available_modifiers); i++) {
> +                 if (v3d_available_modifiers[i] =3D=3D modifier) {
> +                         if (external_only)
> +-                                *external_only =3D false;
> ++                                *external_only =3D util_format_is_yuv(f=
ormat);
> +
> +                         return true;
> +                 }
> diff --git a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-que=
ry_dmabuf_modifiers-are-extern.patch b/meta/recipes-graphics/mesa/files/000=
2-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch
> new file mode 100644
> index 0000000000..dfbe994048
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmab=
uf_modifiers-are-extern.patch
> @@ -0,0 +1,31 @@
> +From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:37:25 +0200
> +Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are external=
_only
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on vid=
eo"
> +
> +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 suppor=
t"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index a5c94db..edde17d 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen=
 *pscreen,
> +         for (i =3D 0; i < *count; i++) {
> +                 modifiers[i] =3D v3d_available_modifiers[i];
> +                 if (external_only)
> +-                        external_only[i] =3D false;
> ++                        external_only[i] =3D util_format_is_yuv(format)=
;
> +        }
> + }
> +
> diff --git a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BRO=
ADCOM_SAND128-only-available-f.patch b/meta/recipes-graphics/mesa/files/000=
3-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> new file mode 100644
> index 0000000000..7d60a31f53
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_S=
AND128-only-available-f.patch
> @@ -0,0 +1,34 @@
> +From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:47:53 +0200
> +Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only available for=
 NV12
> + format.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We were exposing as available DRM_FORMAT_MOD_BROADCOM_SAND128 for
> +any format.
> +
> +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 suppor=
t"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index edde17d..684f912 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_scree=
n *pscreen,
> +         int i;
> +         int num_modifiers =3D ARRAY_SIZE(v3d_available_modifiers);
> +
> ++        /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 only for PIPE_FORMAT_=
NV12 */
> ++        if (format !=3D PIPE_FORMAT_NV12)
> ++                num_modifiers--;
> ++
> +         if (!modifiers) {
> +                 *count =3D num_modifiers;
> +                 return;
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index a85f94c75e..8d8871aa5d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,6 +19,10 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
>              file://0002-meson.build-make-TLS-ELF-optional.patch \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pat=
ch \
>              file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.p=
atch \
> +           file://0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-a=
re-.patch \
> +           file://0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-ext=
ern.patch \
> +           file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-availabl=
e-f.patch \
> +           file://0001-freedreno-YUV-formats-are-supported-as-external-o=
nly.patch \
>              "
>  =20
>   SRC_URI[sha256sum] =3D "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05=
158c3b2cde2f6912b"
>=20
>=20
>=20
>=20
>=20
