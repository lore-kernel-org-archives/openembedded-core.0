Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33CAF36C5C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:54:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24814.1776704088216799867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q4iDynrJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso10776185e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776704086; x=1777308886; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWw0CgcGWOXmTCd9xbuILzp96YzGcFkt+lsPGnqB7nw=;
        b=q4iDynrJSbcK1TKsotbcE9GYDkA8Q5WIU+0sOdBFaFc0mq76LP57NzyriA4hwmRqTG
         Vd04dWQI9LsM29K36T9pLkh8sr8j5CAkZUZkvzIAGe2vODcazxDBKk1UtGAbo2pNgV7R
         znyQ7Wc5C5aiyGD7ACNtB6UyU3rhzRyN2DnIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776704086; x=1777308886;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NWw0CgcGWOXmTCd9xbuILzp96YzGcFkt+lsPGnqB7nw=;
        b=n3N8NMXALcxEBZasYD1hl+M8H4NdILQI79w0viQA5f4EYqv9lMiy1ZE6RfKqcArntd
         3yAHbB3ldtWTWQjS5PMfTLSpTjfXmN0cx9tIQHQ/QsFR91XeFQrr/vWrBTtoTZsqGw85
         OGIrXRVBpJ212x25uOY8AfFqiguMQ4c2p6rAeVOU6UElN3G8u9MYeI07LWzhgprmRG7i
         5WahZu0PKbDMXWZDvPTMCyaHd7XgxB9XTUueZPvDFwaN1KDytC0n+f9Db2BS27frVxvt
         VvSEo4lz5pk9H5J65/b4L1it3hH8H5KODLm5kPhRvZENBVCs0Q4XJRRgzr0RUI4GFarJ
         mFEA==
X-Gm-Message-State: AOJu0YyNgdgwU0pUdOfuGDgjmYrssKWShgyeJxso1Nh7JLWS0ZtdVzm0
	8Ml63Soqju3bF+49NH+8KbRFrYPaw/ph/U6O3sPRGpmTrmNkdEk07fKSbyTmhC6Tb/Q=
X-Gm-Gg: AeBDieuGEvAG2a9HgTtrQrgzECoDZwejzWieoWkdJJ8HV9eRIuQHnyCrmo+zYiK9PcD
	5SjN1fTxXlHKvhZOJY6JTZM7HtNiNtnclhkDih0k2b8Zp+1AdoLwdu8MVxDxBhb1Ye/Hzjh8D67
	NdDcHu/e8y/nulnDhqInWFpag8P17fIFqNo0anLp/k/wflwARK8la9wep/lA19zysV2G8GgOde4
	RrqUYPdN1izwMHjB8fHKPuEPTLnyUnEqw43GNnPHTx+z/iGiB+Yc820jqrqUCVp/Uziz0beNyGg
	viq7qzz748Y+zC7t+xMKQjpN9Rke+rirl7G1Ruor8pM0lucLwtTbUWlTElVceaD8hWK4zM96sU0
	XJxjXGoCErcG598ukSdEOlVxw+b8hqUgrtTUOnXv2CQSM9mAA7Eoxz/5g7GxokHdsZTf1XyjeTO
	+VxtkjdRx1iIdIATQDmR2qVxvSZ6A4C4v5dsbvNsUU6ircYf9p4OAnKBjvu7fgWQiGc1jFoBk9T
	9TdGYeTlwCEVLOOLDNDVA==
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr169466255e9.2.1776704086362;
        Mon, 20 Apr 2026 09:54:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4890009e759sm229947675e9.6.2026.04.20.09.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 09:54:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 18:54:45 +0200
Message-Id: <DHY51908E4G1.NGQ6FJ2VY96A@smile.fr>
Subject: Re: [OE-core][scarthgap 04/11] dtc: backport fix for build with
 glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr> <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr> <CA+chaQf17Z9yPRyqUip6xWjJwGSc6CadNdqVURBsLx7SMUvy3g@mail.gmail.com>
In-Reply-To: <CA+chaQf17Z9yPRyqUip6xWjJwGSc6CadNdqVURBsLx7SMUvy3g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235580

On Mon Apr 20, 2026 at 10:29 AM CEST, Martin Jansa wrote:
> Hello Yoann,
>
> some of the follow-up glibc/gcc patches for ubuntu-26.04 are now in
> your contrib/stable/scarthgap-nut, but the 6 changes from this PR are
> still removed, is it intentional now when similar changes are going to
> be merged in whinlatter?

I've put some patches that I could not apply directly aside to test the
others.

> Should I resend the 6 on top of current
> stable/scarthgap-nut?

Yes, please. :)
That will be easier for me.

Thanks!

>
> Regards,
>
> On Mon, Mar 30, 2026 at 4:36=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>
>> On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
>> > From: Martin Jansa <martin.jansa@gmail.com>
>> >
>> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
>> > https://errors.yoctoproject.org/Errors/Details/903983/
>> >
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overla=
y_fixup_phandle=E2=80=99:
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment di=
scards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>> >       |                     ^
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment di=
scards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>> >   434 |                 sep =3D memchr(name, ':', fixup_len);
>> >       |                     ^
>> > cc1: all warnings being treated as errors
>> >
>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.co=
m>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > [YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
>> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> > ---
>>
>> Hello Martin,
>>
>> FYI, while it looked good, this patch and your whole series about glibc
>> 2.43 support:
>> * [scarthgap 04/11] dtc: backport fix for build with glibc-2.43
>> * [scarthgap 05/11] pseudo: Add fix for glibc 2.43
>> * [scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf u=
pdates
>> * [scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
>> * [scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-quali=
fiers
>> * [scarthgap 09/11] binutils: backport patch to fix build with glibc-2.4=
3 on host
>> ... will be put on hold until I can test it: So, not until Ubuntu 26.04
>> is released and the autobuilder gain an Ubuntu 26.04 worker (most likely
>> after Wrynose release).
>>
>> Thanks!
>>
>> Regards,
>>
>> >  .../0001-Fix-discarded-const-qualifiers.patch | 85 ++++++++++++++++++=
+
>> >  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
>> >  2 files changed, 86 insertions(+)
>> >  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-con=
st-qualifiers.patch
>> >
>> > diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qual=
ifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifi=
ers.patch
>> > new file mode 100644
>> > index 00000000000..c643410ae9b
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.=
patch
>> > @@ -0,0 +1,85 @@
>> > +From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 200=
1
>> > +From: Stephen Gallagher <sgallagh@redhat.com>
>> > +Date: Tue, 6 Jan 2026 14:19:30 -0500
>> > +Subject: [PATCH] Fix discarded const qualifiers
>> > +
>> > +It's unsafe to implicitly discard the const qualifier on a pointer. I=
n
>> > +overlay_fixup_phandle(), this was probably just an oversight, and mak=
ing
>> > +the "sep" variable a const char * is sufficient to fix it.
>> > +
>> > +In create_node(), however, the "p" variable is directly modifying the
>> > +buffer pointed to by "const char* node_name". To fix this, we need to
>> > +actually make a duplicate of the buffer and operate on that instead.
>> > +
>> > +This introduces a malloc()/free()  and an unbounded strdup() into the
>> > +operation, but fdtput isn't a long-running service and the node_name
>> > +argument comes directly from argv, so this shouldn't introduce a
>> > +significant performance impact.
>> > +
>> > +Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
>> > +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > +Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/d=
tc.git/commit/libfdt/fdt_overlay.c?h=3Dmain&id=3D9a1c801a1a3c102bf95c5339c9=
e985b26b823a21]
>> > +---
>> > + fdtput.c             | 8 +++++---
>> > + libfdt/fdt_overlay.c | 3 ++-
>> > + meson.build          | 3 ++-
>> > + 3 files changed, 9 insertions(+), 5 deletions(-)
>> > +
>> > +diff --git a/fdtput.c b/fdtput.c
>> > +index c2fecf4..8deec7e 100644
>> > +--- a/fdtput.c
>> > ++++ b/fdtput.c
>> > +@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char=
 *in_path)
>> > + static int create_node(char **blob, const char *node_name)
>> > + {
>> > +     int node =3D 0;
>> > +-    char *p;
>> > ++    const char *p;
>> > ++    char *path =3D NULL;
>> > +
>> > +     p =3D strrchr(node_name, '/');
>> > +     if (!p) {
>> > +             report_error(node_name, -1, -FDT_ERR_BADPATH);
>> > +             return -1;
>> > +     }
>> > +-    *p =3D '\0';
>> > +
>> > +     *blob =3D realloc_node(*blob, p + 1);
>> > +
>> > +     if (p > node_name) {
>> > +-            node =3D fdt_path_offset(*blob, node_name);
>> > ++            path =3D xstrndup(node_name, (size_t)(p - node_name));
>> > ++            node =3D fdt_path_offset(*blob, path);
>> > ++            free(path);
>> > +             if (node < 0) {
>> > +                     report_error(node_name, -1, node);
>> > +                     return -1;
>> > +diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
>> > +index 5c0c398..75b0619 100644
>> > +--- a/libfdt/fdt_overlay.c
>> > ++++ b/libfdt/fdt_overlay.c
>> > +@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void =
*fdto, int symbols_off,
>> > +             const char *fixup_str =3D value;
>> > +             uint32_t path_len, name_len;
>> > +             uint32_t fixup_len;
>> > +-            char *sep, *endptr;
>> > ++            const char *sep;
>> > ++            char *endptr;
>> > +             int poffset, ret;
>> > +
>> > +             fixup_end =3D memchr(value, '\0', len);
>> > +diff --git a/meson.build b/meson.build
>> > +index 8952e8a..ecb0ae0 100644
>> > +--- a/meson.build
>> > ++++ b/meson.build
>> > +@@ -14,7 +14,8 @@ add_project_arguments(
>> > +     '-Wstrict-prototypes',
>> > +     '-Wmissing-prototypes',
>> > +     '-Wredundant-decls',
>> > +-    '-Wshadow'
>> > ++    '-Wshadow',
>> > ++    '-Wdiscarded-qualifiers'
>> > +   ]),
>> > +   language: 'c'
>> > + )
>> > diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kerne=
l/dtc/dtc_1.7.0.bb
>> > index 0702fc16dfa..a2f41197fda 100644
>> > --- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
>> > +++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
>> > @@ -12,6 +12,7 @@ SRC_URI =3D " \
>> >      git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;prot=
ocol=3Dhttps \
>> >      file://0001-meson.build-bump-version-to-1.7.0.patch \
>> >      file://0002-meson-allow-building-from-shallow-clones.patch \
>> > +    file://0001-Fix-discarded-const-qualifiers.patch \
>> >  "
>> >  SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
>> >
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>


--=20
Yoann Congal
Smile ECS


