Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEC7C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 21:46:34 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.3036.1704231989928306042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 13:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKlyWdXq;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dbbc637df7so6550163a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704231989; x=1704836789; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs5rLHoknb3fOLQjv7jV3V9dceDDl2tbwfdZhhGqGuI=;
        b=CKlyWdXqbZV0SIwMPFQ9WY/R2ipd9VTAufICSetFN4UKlaNYP3XRwtBhMnYSYy668P
         2gtLrVWJHzejgmWmzIHtV5YxuSRoZwTh0QaceuQAK4MkXknt0NuxECo3asZQgcTr0vPW
         RoNsqLwFz1J3xxjPTjjaHJ76VveHfohn/oZqx8IkEcMFub6LGOmrAs5X+ciizEdl2e7i
         BScya9HJM+Z1e1oiNx2scXgFKIABOHHmYwea/nKPaVqh1U9OC4H4G1IetL3yosWw4rXq
         c8NdQsKsSFz1p8UlNqwSkDk1577lKMYgmCa5GmcCNxc9lpLg0LXp6mvPFNzH2q+L3Axc
         rJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704231989; x=1704836789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs5rLHoknb3fOLQjv7jV3V9dceDDl2tbwfdZhhGqGuI=;
        b=xQTdk83zhMcQusc/uajm1mWO5gYSh8bDnifbUT4qSWhIOILb08AFayXwFacrjyaXNv
         Hii2YMWvplWBL/Z6Jtw89GQMNmTMUFakRIJDsVtOt6p6e1B8QJqEkoGWwBg4Ng+891uD
         RukSszaLplrFEBl/kIUFdL9pYyOhORgUAJwS/XqamZXoKBr3P09OzH5DtqflpE29sr8v
         ea80+Ek355O0kUEsMwrb3tqqQPV3s/LkVmnV+CIl+ZZnEtMCys5GeWMLrFWmUWPC7Thj
         9GRY3J13OKX0iYBaerSjVKL8UOkGMhfSnzXLZ6PUSfUlRBckrLOGkpCn7DfAuKOyiT1b
         HZbQ==
X-Gm-Message-State: AOJu0YwCwqNqmt/xaYA3Fx1qaVjeXA/JIHr/atyf9+TeUuaw3uXB/TGk
	LeLE0uZT3/ngegUFhA0WQMot5QoZoC+qfTm8bMs=
X-Google-Smtp-Source: AGHT+IEVBmbWWWBTCtLwB6IOJBfAjg7CR4hOwnmDceIBi9EYldvkCtLF5nePPbYS9mmF/dj2nNJ4YOiIqY+/B5SVFxM=
X-Received: by 2002:a05:6871:2215:b0:1fa:f387:e0a1 with SMTP id
 sc21-20020a056871221500b001faf387e0a1mr21327188oab.9.1704231988957; Tue, 02
 Jan 2024 13:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20240102164023.3392969-1-William.Lyu@windriver.com>
In-Reply-To: <20240102164023.3392969-1-William.Lyu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jan 2024 13:46:03 -0800
Message-ID: <CAMKF1sornBmzu6-F2hrHqEbVuFShv1mapYwU+VjQE7gKqDC7Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: Correct LICENSE line in the recipe
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 21:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193259

On Tue, Jan 2, 2024 at 8:40=E2=80=AFAM Lyu, William via lists.openembedded.=
org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: William Lyu <William.Lyu@windriver.com>
>
> Correct the LICENSE line in the recipe to match the license information
> as described in the upstream website [1]:
>
> "License. The libraries and backends are dual GPLv2+/LGPLv3+. The
> utilities are GPLv3+."
>
> [1] https://sourceware.org/elfutils
>
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.189.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.189.bb
> index 220f747cb9..1bf1c366ae 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Utilities and libraries for handling compile=
d object files"
>  HOMEPAGE =3D "https://sourceware.org/elfutils"
>  DESCRIPTION =3D "elfutils is a collection of utilities and libraries to =
read, create and modify ELF binary files, find and handle DWARF debug data,=
 symbols, thread state and stacktraces for processes and core files on GNU/=
Linux."
>  SECTION =3D "base"
> -LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-3.0-or-later & GPL-3=
.0-or-later"
> +LICENSE =3D "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later=
"

Its resulting in
ERROR: elfutils-0.189-r0 do_package_qa: QA Issue: LICENSE:libdw
includes licenses (GPL-2.0-only) that are not listed in LICENSE
[unlisted-pkg-lics]
ERROR: elfutils-0.189-r0 do_package_qa: QA Issue: LICENSE:libelf
includes licenses (GPL-2.0-only) that are not listed in LICENSE
[unlisted-pkg-lics]
ERROR: elfutils-0.189-r0 do_package_qa: QA Issue: LICENSE:libasm
includes licenses (GPL-2.0-only) that are not listed in LICENSE
[unlisted-pkg-lics]
ERROR: elfutils-0.189-r0 do_package_qa: Fatal QA errors were found,
failing task.

because there is setting of LICENSE for individual output packages as
well, which needs to be addressed as well

>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
>                      file://debuginfod/debuginfod-client.c;endline=3D28;m=
d5=3Df0a7c3170776866ee94e8f9225a6ad79 \
>                      "
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193244): https://lists.openembedded.org/g/openembedde=
d-core/message/193244
> Mute This Topic: https://lists.openembedded.org/mt/103484710/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

