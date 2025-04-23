Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C68C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:04:17 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.9581.1745417051308091497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMf4iq3D;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso57149811fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745417049; x=1746021849; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vutlJ7/0PdyWMv6xYwRX6rVT405/Vnd5A2NsOnwpQLI=;
        b=cMf4iq3DkSpoceldesluFP89EFx9lDgvXdtYOk9TeDE27A1/egZJISp1s2NvXaH8rS
         CoHyRdVzB9MNUzQH7DZ+qktnfA+ZbAiaEwpUWfuDNp/9Lus4COFNu5Sw+U8QIb0bkdCR
         i9n7EAFd3CsH/D/q/q0yso/YmcgSawgBt2BUChFYvvdg5c509amrwLuzHVEFkKuUDyTW
         2Bb/XxBZkcqzHBSnnmRFSQiX8IHyF1yxeTRl4YNqwqzoNKNbnvBjS8eb485JrpaLCDY3
         jR+19hGMPQTlki9mPWDdDPgxz+UE22H6dVPkxIwbNeSuW4AKjGXDeOveos7X4R3JVljm
         kmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417049; x=1746021849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vutlJ7/0PdyWMv6xYwRX6rVT405/Vnd5A2NsOnwpQLI=;
        b=LHt9wmmDMyqjopTikDJrmWhSikHl+OSi/S2tahuy3C5Qp7vwLYah3C4Btq8U5UT/IN
         Ou4Zol1JIKc7wrwRz5rfH3TdH3OZtLFrqxssuNKsWMAn7lhCa+y2P9dYl/DKgo35C0pO
         HO6wWoZSawTjB5GLUBIpYYgix15QKuP2LiTfU4EE6ZZwg/c0ZwWLZRaGnJJ0XEXOggor
         +dwPd8XrbGDqfY5ju0PUctinsXiAYkYj090xKuXXRUCt5AUhMJzCeRSiXjMOclVIZfB1
         tFGqWu0qrGE0qzjbR8a3Bj6epSElr4i1fQWMkO9V6wzfADpZCdUgGyujeUDnwoo8Wy9x
         YWEw==
X-Forwarded-Encrypted: i=1; AJvYcCVI5dd+jp4MWSfGZxUZVKfd8DAQyRnbvDPLWQF9zgRIUFIg0g/6kfT8MU9AadN4WVKgkcVvgssrdTdiUMJZhNdcSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQWsOtukfJfk5ERsF0mJUmEhZ75yTbYgVC5rnkZzzzvwRquknN
	/SFP8orTQWPdNPdXMvzPN9uqNqIC98dMWwNaiThKIjMfbPAGyM/KKqlslEmjrUIOZTXSmlpKr2D
	8UrvkyfbMqei3ld5E+7HTMGUP5eY=
X-Gm-Gg: ASbGncvCgfZz1LkcnNRE3Dsco7Aavj36rwvHmA//7ayOjwUe2bpkuFiGHg14EYy9IrK
	LveQRXTPNZBolJ2KbDey47IAKe3htdeZHB7JvSnrvDUab0ENhJRpN/jZxWT584RU7HgDNN5mC11
	gFcX3HO+9B9BH81DJgKq1paRJ0kfxePENfXpE+
X-Google-Smtp-Source: AGHT+IE2ghHp+JrBXlHqfedW4N6WHmtKuHHRp1khail2Sb5iLJfuwcD6GiICGTEVw90L0SeaCRVzcCvsNWknIpCPaDI=
X-Received: by 2002:a05:651c:1a0a:b0:30d:e104:9ad4 with SMTP id
 38308e7fff4ca-31090578015mr51058841fa.41.1745417048731; Wed, 23 Apr 2025
 07:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <D99MUROJP27W.R1R8AFSIJZW9@bootlin.com> <20250423060951.1692070-1-haitao.mi@windriver.com>
In-Reply-To: <20250423060951.1692070-1-haitao.mi@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 23 Apr 2025 08:03:54 -0600
X-Gm-Features: ATxdqUEShpfyPFB2i6JxAF_nv3SaF3gc5nVldlFr6-OAram8wjaUfoDb--dK45c
Message-ID: <CAJdd5GY6o4D=ZZ+6aoufkZ63zOzhqVABV__6TXxHd-zQvEUoyA@mail.gmail.com>
Subject: Re: [PATCH v2] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM.
To: Haitao Mi <haitao.mi@windriver.com>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 14:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215310

Sorry, I wish we could merge this, but until we have a comprehensive
plan for what yocto purls look like, we need to wait. Just "making
something" is likely to need to be revised later, which will cause
confusion about what they mean, cause breakage, and IMHO, be worse off
in the long run.

FWIW, I'm not convinced we can use the deb:// and rpm:// protocols for
our purls anyway.

NACK

On Wed, Apr 23, 2025 at 12:09=E2=80=AFAM Haitao Mi <haitao.mi@windriver.com=
> wrote:
>
> A purl is composed with these fields:
> scheme:type/namespace/name@version?qualifiers#subpath
>
> Set 'namespace' field through SPDX_PURL_NAMESPACE variable, the default
> value is ${DISTRO}.
>
> Insert private project info into 'qualifiers' field through
> PACKAGE_URL_QUALIFIERS_EXTEND variable, join the key=3Dvalue format
> with '&' symbol.
>
> Set 'subpath' field through SPDX_PURL_SUBPATH variable, default is empty.
>
> Signed-off-by: Haitao Mi <haitao.mi@windriver.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  9 +++++++++
>  meta/lib/oe/spdx30_tasks.py          | 25 +++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 044517d9f7..962e46e836 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -117,6 +117,14 @@ SPDX_PACKAGE_VERSION ??=3D "${PV}"
>  SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
>      in software_Package"
>
> +SPDX_PURL_NAMESPACE ??=3D "${DISTRO}"
> +SPDX_PURL_NAMESPACE[doc] =3D "The value of the 'namespace' field in soft=
ware_packageUrl"
> +
> +SPDX_PURL_QUALIFIERS_EXTEND[doc] =3D "The project private info can be in=
serted into \
> +    the 'qualifiers' field of software_packageUrl through this variable.=
"
> +
> +SPDX_PURL_SUBPATH[doc] =3D "The value of the 'subpath' field in software=
_packageUrl"
> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> @@ -144,6 +152,7 @@ do_create_spdx[vardeps] +=3D "\
>      SPDX_NAMESPACE_PREFIX \
>      SPDX_UUID_NAMESPACE \
>      "
> +oe.spdx30_tasks.create_spdx[vardepsexclude] +=3D " MACHINE "
>
>  addtask do_create_spdx after \
>      do_collect_spdx_deps \
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ba965821f8..310638277e 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -631,6 +631,31 @@ def create_spdx(d):
>              set_var_field("SUMMARY", spdx_package, "summary", package=3D=
package)
>              set_var_field("DESCRIPTION", spdx_package, "description", pa=
ckage=3Dpackage)
>
> +            purl_qualifiers =3D "distro=3D%s-%s&arch=3D%s" % (d.getVar("=
DISTRO"), \
> +                                                        d.getVar("DISTRO=
_VERSION"), \
> +                                                        d.getVar("MACHIN=
E"), \
> +                                                        )
> +            purl_qualifiers_extend =3D d.getVar("SPDX_PURL_QUALIFIERS_EX=
TEND")
> +            if purl_qualifiers_extend:
> +                purl_qualifiers +=3D "&%s" % purl_qualifiers_extend
> +
> +            purl_type =3D d.getVar("IMAGE_PKGTYPE")
> +            if purl_type =3D=3D "ipk":
> +                purl_type =3D "yocto"
> +                purl_qualifiers =3D "file_extension=3Dipk&" + purl_quali=
fiers
> +
> +            purl_subpath =3D d.getVar("SPDX_PURL_SUBPATH")
> +            purl_subpath =3D "#" + purl_subpath if purl_subpath else ""
> +
> +            purl =3D "pkg:%s/%s/%s@%s?%s%s" % (purl_type, \
> +                                             d.getVar("SPDX_PURL_NAMESPA=
CE"), \
> +                                             pkg_name, \
> +                                             d.getVar("EXTENDPKGV"), \
> +                                             purl_qualifiers, \
> +                                             purl_subpath \
> +                                             )
> +            setattr(spdx_package, "software_packageUrl", purl)
> +
>              pkg_objset.new_scoped_relationship(
>                  [oe.sbom30.get_element_link_id(build)],
>                  oe.spdx30.RelationshipType.hasOutput,

