Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452BCC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 16:29:18 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.46577.1676996955344853063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 08:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLf/M8jI;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: rwmacleod@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id g12so6961457vsf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2m/eH4xUOakv9vT0+73bn5Grsg7avOrN6wBQWZPK5gs=;
        b=ZLf/M8jI5SzBc0GUmCEOctMwxb4In/TpC2pFxKs79oeXtmIbzkgQhcJLTdHgxYFT1Z
         d+CgF20+QddmGPWXdRdNE0YlSSQYyVxq5P2qrUifNB+VGvcgGWAdfZ6vA7fqoi+ZyYhi
         iQXLNXJpF0KLhjkbX+E+2eDbo1PO7v9z1rPx8t/jggqZBak7t++HKIVJwszKnESNYT+s
         Fb+a9BdDHqW+dtrmMe13kLNikidjNm3OCjgbx7NVhSkDNg5+03cfno/Rzd2lsdQgDLqi
         sfjvRfz8rpkhz9iE01Z4wfxI5DE/LJHSZcel98XB0mEcVsP9pEgt9CwJ5MSpCa45EjDQ
         km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2m/eH4xUOakv9vT0+73bn5Grsg7avOrN6wBQWZPK5gs=;
        b=DNHYdDPetxLeYT+MD18YXJkMzbqdzxVDHMrp4dMfpy7mqomrueZSEVoCzIep2xDPOm
         lrcYBf6WsIpLEwtrgLpYf0uDkYHinIo3GwkzFcL2Y57xJ7Mr6ksS/5d2qSY+d7Sg4FbY
         5wMAzgRWFNQHt048XTaqTXrUVoix2aSq83RXWSo1Za4VwjNe4L5YC1h8p7Hk2Xnrg+Hr
         4sk5XlczKHNx0QhnvfM43RZ0mEklVA2smP/unzm7ampNi6ltxJGuE64Zk00sc62SgmhC
         VusCAOHGBxULIO5nid/SUhuTuXeaT1s5g1Lv9e5TiJF4kNaoKR4mGnnJFboMdBRdNXb2
         lLpA==
X-Gm-Message-State: AO0yUKVdZFujQrUjqKu4mZ0fJGBWIRu95PquQHHqBQp42Wwp4ItI1NxI
	B28Zs+U04M9Qnik9aRusR7coJCFxN2vD1pIDBAOqaVX2
X-Google-Smtp-Source: AK7set9UUP0qyDPNvAhukzQnLhY33bhanKTHoUC8pMcYGOvPAcgVOgSHO7+gFiXyqYEfPnEQlPA4ACajoXPl2RKpZRM=
X-Received: by 2002:a67:f4c5:0:b0:412:37d9:489a with SMTP id
 s5-20020a67f4c5000000b0041237d9489amr1124546vsn.21.1676996953909; Tue, 21 Feb
 2023 08:29:13 -0800 (PST)
MIME-Version: 1.0
References: <1996fa4b82dc285843621a3cd901fe687f0396c7.camel@klomp.org>
In-Reply-To: <1996fa4b82dc285843621a3cd901fe687f0396c7.camel@klomp.org>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Tue, 21 Feb 2023 11:29:00 -0500
Message-ID: <CAK6=ix6HBt0HekELvHyPdLFODSoDZ-jE_zkEFtJ2+ykxTzphEw@mail.gmail.com>
Subject: Fwd: elfutils 0.189 release next week (~Feb 28)
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ba2d1505f5384727"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177526

--000000000000ba2d1505f5384727
Content-Type: text/plain; charset="UTF-8"

I don't see anything Uber critical in this update but should we take 0.189
for the 4.2 release in a week? The maintainers seem to be open to releasing
a little earlier if prompted.

Randy


---------- Forwarded message ---------
From: Mark Wielaard <mark@klomp.org>
Date: Tue., Feb. 21, 2023, 08:33
Subject: elfutils 0.189 release next week
To: <elfutils-devel@sourceware.org>


Hi,

We accumulated a lot of patches since 0.188 (59 commits by 13 authors)
with some nice new features and some important bug fixes. So it would
be good to push a new release out.

I cleaned up the patchwork list and will go over the following 25
pending patches to see what can be incorporated:
https://patchwork.sourceware.org/project/elfutils/list/ [*]
If your patch is not on that list please ping.

I propose to do the 0.189 release on Tuesday February 28, but it can be
earlier or later if that is more convenient.

Cheers,

Mark

[*] That is this list of patches:
git pw patch list --format simple --state New --state RFC --state
Under-Review --state Changes-Requested --column Name

[2/2] libdw: Use elf_rawdata when checking .debug section
[1/2] libelf: memmove any extra bytes left by elf_cvt_gnuhash convers...
A scenario where Perf cannot unwind the user stack by dwarf with libd...
PR28873 - Implement eu-readelf -D
[v2,16/16] lib: Use HAVE_LIBINTL_H to guard #include <libintl.h>
[v2,15/16] libelf: F_GETFD may not predefined with msvc/mingw, guard ...
[v2,14/16] Add function sys_get_page_size to replace platform depende...
[v2,12/16] libasm/debuginfod: fchmod doesn't present on win32
[v2,11/16] libebl/libdwelf: define ssize_t and pid_t for MSVC within ...
[v2,10/16] libasm: stdio_ext.h are not present on win32
[v2,09/16] libelf: uid_t, gid_t and mode_t are not comes with msvcrt,...
[v2,08/16] lib: Implement error properly even when not HAVE_ERR_H
[v2,07/16] libdw: Fixes compile of dwarf_whatattr.c and dwarf_whatfor...
[v2,05/16] libcpu: Remove the need of NMNES by using enum
[v2,04/16] Fixes usage of basename about prototype differences
[v2,03/16] Use configure to detect HAVE_DECL_MMAP and use it for syst...
[v2,02/16] move platform depended include into system.h of libebl
PATCH: Bug debuginfod/29472 followup
[RFC] backends: Add RISC-V object attribute printing
[Bug,libdw/29434] Memory leak in `dwarf_getscopes`
[PATCHv2] strip: keep .ctf section in stripped file
[4/4] libdwfl, eu-stack, aarch64: Add API for setting AARCH64 PAC mas...
[3/4] libdwfl, aarch64: Demangle return addresses using a PAC mask
[2/4] libdw, aarch64: Implement DW_CFA_AARCH64_negate_ra_state CFI in...
[1/4] aarch64: Create definitions for AARCH64_RA_SIGN_STATE register

--000000000000ba2d1505f5384727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto">I don&#39;t see anything Uber crit=
ical in this update but should we take 0.189 for the 4.2 release in a week?=
 The maintainers seem to be open to releasing a little earlier if prompted.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Randy</div><br><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- For=
warded message ---------<br>From: <strong class=3D"gmail_sendername" dir=3D=
"auto">Mark Wielaard</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:mark=
@klomp.org">mark@klomp.org</a>&gt;</span><br>Date: Tue., Feb. 21, 2023, 08:=
33<br>Subject: elfutils 0.189 release next week<br>To:  &lt;<a href=3D"mail=
to:elfutils-devel@sourceware.org">elfutils-devel@sourceware.org</a>&gt;<br>=
</div><br><br>Hi,<br>
<br>
We accumulated a lot of patches since 0.188 (59 commits by 13 authors)<br>
with some nice new features and some important bug fixes. So it would<br>
be good to push a new release out.<br>
<br>
I cleaned up the patchwork list and will go over the following 25<br>
pending patches to see what can be incorporated:<br>
<a href=3D"https://patchwork.sourceware.org/project/elfutils/list/" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://patchwork.sourceware.org/p=
roject/elfutils/list/</a> [*]<br>
If your patch is not on that list please ping.<br>
<br>
I propose to do the 0.189 release on Tuesday February 28, but it can be<br>
earlier or later if that is more convenient.<br>
<br>
Cheers,<br>
<br>
Mark<br>
<br>
[*] That is this list of patches:<br>
git pw patch list --format simple --state New --state RFC --state<br>
Under-Review --state Changes-Requested --column Name<br>
<br>
[2/2] libdw: Use elf_rawdata when checking .debug section<br>
[1/2] libelf: memmove any extra bytes left by elf_cvt_gnuhash convers...<br=
>
A scenario where Perf cannot unwind the user stack by dwarf with libd...<br=
>
PR28873 - Implement eu-readelf -D<br>
[v2,16/16] lib: Use HAVE_LIBINTL_H to guard #include &lt;libintl.h&gt;<br>
[v2,15/16] libelf: F_GETFD may not predefined with msvc/mingw, guard ...<br=
>
[v2,14/16] Add function sys_get_page_size to replace platform depende...<br=
>
[v2,12/16] libasm/debuginfod: fchmod doesn&#39;t present on win32<br>
[v2,11/16] libebl/libdwelf: define ssize_t and pid_t for MSVC within ...<br=
>
[v2,10/16] libasm: stdio_ext.h are not present on win32<br>
[v2,09/16] libelf: uid_t, gid_t and mode_t are not comes with msvcrt,...<br=
>
[v2,08/16] lib: Implement error properly even when not HAVE_ERR_H<br>
[v2,07/16] libdw: Fixes compile of dwarf_whatattr.c and dwarf_whatfor...<br=
>
[v2,05/16] libcpu: Remove the need of NMNES by using enum<br>
[v2,04/16] Fixes usage of basename about prototype differences<br>
[v2,03/16] Use configure to detect HAVE_DECL_MMAP and use it for syst...<br=
>
[v2,02/16] move platform depended include into system.h of libebl<br>
PATCH: Bug debuginfod/29472 followup<br>
[RFC] backends: Add RISC-V object attribute printing<br>
[Bug,libdw/29434] Memory leak in `dwarf_getscopes`<br>
[PATCHv2] strip: keep .ctf section in stripped file<br>
[4/4] libdwfl, eu-stack, aarch64: Add API for setting AARCH64 PAC mas...<br=
>
[3/4] libdwfl, aarch64: Demangle return addresses using a PAC mask<br>
[2/4] libdw, aarch64: Implement DW_CFA_AARCH64_negate_ra_state CFI in...<br=
>
[1/4] aarch64: Create definitions for AARCH64_RA_SIGN_STATE register<br>
<br>
</div></div></div>

--000000000000ba2d1505f5384727--

