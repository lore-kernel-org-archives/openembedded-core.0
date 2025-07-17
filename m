Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFF9C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:42:45 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.118.1752770560124310823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZ7BNOgO;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70f862dbeaeso11942557b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752770559; x=1753375359; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYlUyNo45Bw/rPP5Qh/iM+HbQDLDXL1j3QXOPpKeOXU=;
        b=kZ7BNOgO7UpcNn5ZW/VOnnzvjRIlWPS2g9/yiXB6Gnpb4BAXCjLf6wrFJ2B689hzUy
         SsUm28bU7BaoTdwrmbXw6W7zqAKPcfWp2bbjR0SbO60AQatBNd+w89/ulitD4w7IC0Qo
         pa2UG6Eqd0srx4QuMwNOzJ7tyOgW3J00Erkp4c1WphSfnTjKONTY2uTResjw65ssNMs8
         Ug3Ak8YmmND0JjuRZOKKfTQu5/bdomZPou20IOkNIw6Dc8jYQlEPIdyRVHKEtM4MJMQG
         x7WI4560Mso/Qm96bC7a3agUeQOnx5Sli9vEIF29Nx4JPBrNrVnLmtO1mhDKSqMDELd+
         psmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770559; x=1753375359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYlUyNo45Bw/rPP5Qh/iM+HbQDLDXL1j3QXOPpKeOXU=;
        b=u2gC/JS9kwx0GZLqR42NvwR+gYj8twKm3iUp/KvVV4nbznZxcKuP9yEwDkbLF+IN4O
         smxvD9CMb4YleJS447nz/33zTcnY3QGVMg157fiKewls6+vX4rCIOfju2dEKtPrjdBRx
         G5mQmimeQG67Z1YcRjeYsZrGhVDw0qrwDxAv3oboZ0x0Im/necbUjqQRBTYnpcoldLEg
         kJRFAoHKnfd2mcBWeLioaiakYoIlxxBPb7CE+nmb9w7wv/bO6M4WR1v8wkJ46f85pHRx
         DtC5my/cNtxLqRUytXQTpVUYlER7FEMtMrlnxqc0dsB25vJBCO1boJGkLFNranl4dNka
         RIYg==
X-Gm-Message-State: AOJu0YxFUs+trWa1GydT6ZVILNeVLW3tskFdP5Xg+sZ+CiorD6gNsoqS
	CoZxw+KsBqxOZJ3fmodGDsjxUCNmP9fhzJXPgRuQEHtz+oEQFlMJHqxoTfWBvqTOxgigX3wKvFg
	WyIAJiipNmWnDWwZ+DJJTM3bQH4n55wYh3JYK
X-Gm-Gg: ASbGncuE3MSvAXL3hu1+DD0KLOy0g9AgIPHbPLNFPloEgtQL1TLj0Mi+xIK/Lh7WVLW
	/6FgwVNGGqjK0E2aTW5PTqtXtZBnl/eIsI7VEsJStaqqaLeyv5y3ct2ZPhPvSADNF8Rry+QBDRt
	j67PLIKd9rmTe/dVWKoHJIlQzB/LKtQ+1a3wFhS3NbaldcKJZ/bbw2fy6MI4vzqu6VEInDRf4Rx
	Yqxnw==
X-Google-Smtp-Source: AGHT+IErlPTGzZoC0nVtaTjqJjFsAxYVtLDW5nvJAuS5/ocpowJxg5e8/de2Pr+iVvWa0LXsVt3lqX/jZvdSh1LBemY=
X-Received: by 2002:a05:690c:55c3:10b0:718:38bd:bb41 with SMTP id
 00721157ae682-71838bdcfdamr62990177b3.40.1752770558582; Thu, 17 Jul 2025
 09:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250717113529.1025378-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250717113529.1025378-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:42:12 -0700
X-Gm-Features: Ac12FXyUgPm8K5rrjvB9dpkIQM3Pgj3wTMFRDZeXl1jtezSh9UCJCelQ7VsLA8s
Message-ID: <CAMKF1srmb-dzya9PNRvXFHg=wF+-_rkf+vs1Kzqe8DoE0ahZ6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-7545
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220550

LGTM

On Thu, Jul 17, 2025 at 4:35=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> objcopy: Don't extend the output section size
> Since the output section contents are copied from the input, don't
> extend the output section size beyond the input section size.
>
> Backport a patch from upstream to fix CVE-2025-7545
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dpatch;h=3D08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.44.inc                |  1 +
>  .../binutils/0020-CVE-2025-7545.patch         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025=
-7545.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index 2219ada4ac..c8d655c990 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -43,4 +43,5 @@ SRC_URI =3D "\
>       file://0018-CVE-2025-5245.patch \
>       file://0019-CVE-2025-5244.patch \
>       file://0019-CVE-2025-3198.patch \
> +     file://0020-CVE-2025-7545.patch \
>  "
> diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.p=
atch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
> new file mode 100644
> index 0000000000..062d6721b6
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
> @@ -0,0 +1,39 @@
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sat, 21 Jun 2025 06:36:56 +0800
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dpatch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
> +CVE: CVE-2025-7545
> +
> +Since the output section contents are copied from the input, don't
> +extend the output section size beyond the input section size.
> +
> +       PR binutils/33049
> +       * objcopy.c (copy_section): Don't extend the output section
> +       size beyond the input section size.
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/binutils/objcopy.c b/binutils/objcopy.c
> +index e2e6bd7e..3cbb3977 100644
> +--- a/binutils/objcopy.c
> ++++ b/binutils/objcopy.c
> +@@ -4634,6 +4634,7 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *ob=
fd)
> +         char *to =3D (char *) memhunk;
> +         char *end =3D (char *) memhunk + size;
> +         int i;
> ++        bfd_size_type memhunk_size =3D size;
> +
> +         /* If the section address is not exactly divisible by the inter=
leave,
> +            then we must bias the from address.  If the copy_byte is les=
s than
> +@@ -4653,6 +4654,11 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *o=
bfd)
> +             }
> +
> +         size =3D (size + interleave - 1 - copy_byte) / interleave * cop=
y_width;
> ++
> ++          /* Don't extend the output section size.  */
> ++          if (size > memhunk_size)
> ++            size =3D memhunk_size;
> ++
> +         osection->lma /=3D interleave;
> +         if (copy_byte < extra)
> +           osection->lma++;
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220532): https://lists.openembedded.org/g/openembedde=
d-core/message/220532
> Mute This Topic: https://lists.openembedded.org/mt/114201310/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

