Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11602.1793279495799836372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 06:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wfSbYway;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53669f7b518so25110251cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279495; x=1793884295; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWU1YmEgmgO4hQ+YhOraGxtXnxV9kM/g9CHQpVUwovk=;
        b=wfSbYwayD2lB8bR3SbGG19nyNDGs8gp91f52WQyNseMNw49DYxaOkdGVZB8E1sxL12
         HOcl88z5tR6EzAUjbj4eiDFDVZ5jec02oSrGNscPUOQfx70vlWVrabaHyQ94waqeGb5A
         Bq/t2A9Vy/3Nipmee9JlEdS7towl+gruCbkKUOP8LWYPDemNR6tzly8ltoJzkMx6tsDm
         0zANzIJN0njUsxrT6KmdXl3E0zyl4CcnxB3kO49Vc1+P/xv78UmDioPZafzeoraQxCFt
         +aiwPQ20Wv3yPY2QQS2UWGWiLPIeYVi9wrbA7f06x5LeJ55+LSpStjw46ybxFmgJJxQo
         X3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279495; x=1793884295;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWU1YmEgmgO4hQ+YhOraGxtXnxV9kM/g9CHQpVUwovk=;
        b=JjGuO3p4Id4bCZ96TH2Q+kf6WZlj8d3ru7lRSAAeLlFxDZ/SJdRpHp6xsu3NuB5Or1
         EK90umiX8BfCYYBB1fX9hD86UeEFoeivPaqk65QHgyChQ/5iC893BFwU7JosMEjUWNwB
         CgB61jGZs0GiK0VjRhEUxiasikfDXPcIY5/GZsYjJeTpV7Zj8fa00OehFas+Iz90b/X+
         63IHFyNJJ9KLbp0RN3PCIp19gADmoZhso7a5CrmjkrITN3op4UpCx1KV6UIQCCtNKTh+
         vLfY8ErhYsBjaRRZKV4lUp/R8h6retYpP1h/B9XWrCgDFzji2DBvQs+fvnwdtMRd4IdP
         23FA==
X-Gm-Message-State: AFq9FYLYrhG0X4QwwvJhS2z1p6QGmRQtMs5xk64xtT+R21mXlsoF64Of
	H2qu6LlDyc8jyV2EsgO2i8wkZ6fppqzyshPXeau0iC/QkCjxhU9GN1pOHrwK2GcB
X-Gm-Gg: AYBFou3wRR5NjHBXa2p9ZkpReevOhTpF6FplqBINtS8D2Rd8IfEpkzeTIIQWiFM02eg
	HXOWNVu+lzB900VrSFOhk9+QMPIpzJHXUAXpM6wZ98BvjptV52oYrqHiWximuEs1QPdT1I44ZdI
	KdUPH0xvXLggDjnqMubKZvJeox0Te2QSwqp89ZymSorwdmv3r51arKLpA7mdu0F7JKNC2HrbR0f
	US8/7haSAGeZlsswhwn1KF06N6tlca8RseZ5pnPrE7xG4psF1hYl8cdVGhrqZffZPb5g4+U22SP
	UD4L9VWr3tDa/rqp7xP2tiWMe6leHxYs2E0uYg63dMpSpEbJ3qRQqsAS7xuTkuuqnYlskA7qY9k
	mA6TqV7t9XnK014NKuM2hqVKazCVy56ESZQT7Tw/rwdo7XCL9BNFb9fWzfkJXZclSk0y7euy6qA
	vvk/U5R56NzB7+mOgNbGe2/ptLGskA4dNswEXmkeTCYtBITDaFHcUu4GatrATkrd+/s9t3H2zBu
	NcDhe/+aH/WoERuIy3nj3Q47n+8yuEzv0syoK2g31WHp+K/GvU39dZVEhD3jCJJPrCd5+0KOgdv
	mlEQFx0oExqG5PvUytb4hkNi1oAuUymUHoAWVqBBIO8NDx5Dnp3Ek7+1r/F4O6E+j6AmHMrJMuJ
	lMT1ab2HI+u7RtNAsM1Tw4fc0pWMkvD7oSiBnuAfP4tFAHeLNthB1
X-Received: by 2002:a05:622a:4b16:b0:535:85e1:ed5c with SMTP id d75a77b69052e-53fcb506ca5mr80811571cf.25.1793279494494;
        Thu, 29 Oct 2026 06:11:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c50495sm158597416d6.24.2026.10.29.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:11:33 -0700 (PDT)
Message-ID: <6ae34605.b3f5340a.13d355.bf9a@mx.google.com>
Date: Thu, 29 Oct 2026 06:11:33 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: add gzip-native to DEPENDS
In-Reply-To: <20261029124742.3223868-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029124742.3223868-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 13:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248947

On Thu, Oct 29, 2026 at 8:47 AM Vinicius Pedrosa <vinicius.eduardo.pedrosa@gm=
ail.com> wrote:
>
> gzip-native is only in do_deploy[depends]. On a fresh work directory,
> do_compile runs the host gzip to create kernel/config_data.gz and,
> with CONFIG_KERNEL_GZIP, the compressed kernel payload.
>
> do_unpack cleans ${B} but not the recipe sysroot. After do_deploy has
> run once, a rebuild from do_unpack picks up pigz from gzip-native
> instead. Same .config, same uncompressed IKCONFIG data, but
> config_data.gz and the kernel image come out different.
>
> Add gzip-native to DEPENDS so the same compressor is used from the
> first do_compile.
>
[...]
>
> Bruce, you sent "[8/8] linux-yocto: add gzip-native to DEPENDS" in
> 2023 (patchwork 29990) and withdrew it. This one puts the dependency
> in the class instead.

For the record, I withdrew that one because the motivation didn't hold
up. I was chasing a "gzip: abort: zlib version less than 1.2.3" failure
in do_compile. Richard pointed out that it looked like a stale zlib in
the sysroot that an existing kernel build didn't notice, rather than a
missing dependency. That made sense, so I dropped it and carried it
locally to see if it came back (it didn't).

Your reason is different, and a better one: the task-level dependency
from do_deploy leaks into do_compile through the recipe sysroot, so the
compressor (and the output) depends on whether do_deploy has already
run.

Class vs linux-yocto.inc is a wash, but having it in the class is
of course preferable.

>
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
> index 0a6d754..99d652b 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -19,7 +19,7 @@ KERNEL_PACKAGE_NAME ??=3D "kernel"
>  KERNEL_DEPLOYSUBDIR ??=3D "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") =3D=
=3D "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>
>  PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc kmod-native bc-nativ=
e bison-native"
> +DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc kmod-native bc-nativ=
e bison-native gzip-native"

With this in DEPENDS, the gzip-native entry in do_deploy[depends] is now
redundant. It doesn't hurt anything, so either drop it in a v2 or leave
it. Up to you.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Bruce
