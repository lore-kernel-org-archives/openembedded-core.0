Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD12E9D823
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 21:54:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43496.1775426048091347501
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 14:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3aQGRjJd;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so6620665e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775426046; x=1776030846; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbSR2i99FMSFdsrOkPqc8CnS85Hdg28DTbt3Ds/xx8U=;
        b=3aQGRjJdDBkV6nVNZqXW08tHWNWnburCYVvDIoGy/IfponUUjLPWw/v7GOgVPTjylj
         4KLrM/Hi1AOnqZG5kS05FR3IZFrxs9PFMy0LMRBDs0VFHp9Zi3s8BPKZwBc5W0c1quFk
         3g+5PiWNLdB5PeFNn4grRWOMHsRvot9UgZJt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775426046; x=1776030846;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbSR2i99FMSFdsrOkPqc8CnS85Hdg28DTbt3Ds/xx8U=;
        b=LGr5h6Y3hOh3/B4xdxjtq3Nb34bU4ocbEybxCd/N2axpRbJ6+uhivo0zahWcbSiLVa
         JQoScfrRn6lX1UjjrS2+dcYsa5GSnarfg4G9qjIs1hbEz3EpvAuhjUsrgwpbODFiptRj
         kggKTHItwe59jAyTqTWAcLdEDnd0OF96o/IfjQQviegNHmNF64KtEQ+iP3rLmXMNWEcn
         3raIcbHEH81wCel7j1vjkBMP7+mS/xlACKFnORSRhcWnxvMCdjFRvGCpeE42r6jVDnot
         kL9Ry34d/jL3CErIRckd7RWP/WCS5DSY2u/z5eqg6aFuraRYfEpR4i9a+QAOIJrZ4Rms
         QmQQ==
X-Gm-Message-State: AOJu0YxJgvEACXC/k7N3gxIhfWKdDmLzmHPQa1kxluWOD8l+Pg+ZXk9S
	a5Iy1nidgSX7AZqpJyum4FJ7PYIBCuZL4DIOY/d+773rNOA0o0UWL3MOmFoPytRkpnc=
X-Gm-Gg: AeBDietpXM//p1FdA1KTep3kEfFjsFbNjmn1alxb0o4IfzqGbk9yLprWeOi9aDtPbGL
	DtNLbgC/2rySuZbgOrgBCBKVD3SWq7g5uw6OrF3rPqueGTT+9L7oibITaubLbzD/dB+Du00JCXw
	tsaGqn01VAg78sVBdFOo/tT6/qufD0p9aBRRZLbzlSLuM7mD4AsM+F+VlTXPd+ZOra8kLLsZfsz
	Le7rl4Bu7a7TbjDnmvSRXkjieqHoSVqLrSusVtm8NbQoLu0EREWX/GwIHJ3Fez1fV+wsUYaVYt6
	PDs0+ri59725m0ovx5Htqq8pXKEYS8DmnfAySfzHo0muQYISKFv7TPq1TEmgEKyXWD0kUFm40le
	fHkwT8PJVWqNtmtYtyE7lZBArvBFkJ6lJ/ZM24tCUh96jJjrlE362U/kAvNWJ3TAqiL6o+d5wgq
	vhGDczKkPeAlyjv3e9kXBTOndn7Kbo8nv36PQKT6OyNJtg2SKQvdqpBO0mfJ+lNBfppA6YBMhAx
	2rdzomkETQ3okM=
X-Received: by 2002:a05:600c:4593:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-488997e22d9mr164293115e9.28.1775426046071;
        Sun, 05 Apr 2026 14:54:06 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm33658287f8f.14.2026.04.05.14.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 14:54:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 23:54:04 +0200
Message-Id: <DHLK09AZHP31.17W5UUEWWUBPN@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
Subject: Re: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2026-4111
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260326075847.312211-1-vanusuri@mvista.com>
 <DHJV1CGLXDFY.1T23NFX2R5HE8@smile.fr>
 <CANQUz1_zvRNo3ydbnLHQX50Zp=BrSTugD3qJHR8D7yGPjP7GRg@mail.gmail.com>
In-Reply-To: <CANQUz1_zvRNo3ydbnLHQX50Zp=BrSTugD3qJHR8D7yGPjP7GRg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 21:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234636

On Sat Apr 4, 2026 at 10:16 AM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> This CVE fix already included in libarchive version 3.8.6 on the master
> branch.
>
> https://github.com/libarchive/libarchive/releases/tag/v3.8.6 .

That's right, as https://github.com/libarchive/libarchive/commit/ec19fcbd20=
b18bd3b0fdcf2b3fb97789cd1bf575.
So, master is already sorted.


> I will cherry-pick libarchive-3.8.6 from master and submit the patch to
> Whinlatter branch.

Yes, please.

Thanks!

> Thanks & Regards,
> Vijay
>
> On Sat, Apr 4, 2026 at 3:37=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>> On Thu Mar 26, 2026 at 8:58 AM CET, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Pick patch according to [1]
>> >
>> > [1] https://security-tracker.debian.org/tracker/CVE-2026-4111
>> > [2] https://github.com/libarchive/libarchive/pull/2877
>> > [3] https://access.redhat.com/errata/RHSA-2026:5080
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>>
>> Hello,
>>
>> As far as I can tell, this CVE applies to whinlatter and master.
>> Since this is the end of kirkstone soon, I'll take it into the reviews
>> series but can only merge it if there is a patch sent for this CVE in
>> those branches.
>>
>> Regards,
>>
>> >  .../libarchive/CVE-2026-4111-1.patch          |  32 ++
>> >  .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++++=
+
>> >  .../libarchive/libarchive_3.6.2.bb            |   2 +
>> >  3 files changed, 342 insertions(+)
>> >  create mode 100644
>> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
>> >  create mode 100644
>> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
>> >
>> > diff --git
>> a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
>> b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
>> > new file mode 100644
>> > index 0000000000..1f065b1364
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patc=
h
>> > @@ -0,0 +1,32 @@
>> > +From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 200=
1
>> > +From: Tim Kientzle <kientzle@acm.org>
>> > +Date: Sun, 1 Mar 2026 20:24:56 -0800
>> > +Subject: [PATCH] Reject filters when the block length is nonsensical
>> > +
>> > +Credit: Grzegorz Antoniak @antekone
>> > +
>> > +Upstream-Status: Backport [
>> https://github.com/libarchive/libarchive/commit/7273d04803a1e5a482f26d8d=
0fbaf2b204a72168
>> ]
>> > +CVE: CVE-2026-4111
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + libarchive/archive_read_support_format_rar5.c | 4 +++-
>> > + 1 file changed, 3 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/libarchive/archive_read_support_format_rar5.c
>> b/libarchive/archive_read_support_format_rar5.c
>> > +index 38979cb..867f0a8 100644
>> > +--- a/libarchive/archive_read_support_format_rar5.c
>> > ++++ b/libarchive/archive_read_support_format_rar5.c
>> > +@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar=
,
>> const uint8_t* p) {
>> > +     if(block_length < 4 ||
>> > +         block_length > 0x400000 ||
>> > +         filter_type > FILTER_ARM ||
>> > +-        !is_valid_filter_block_start(rar, block_start))
>> > ++        !is_valid_filter_block_start(rar, block_start) ||
>> > ++        (rar->cstate.window_size > 0 &&
>> > ++         (ssize_t)block_length > rar->cstate.window_size >> 1))
>> > +     {
>> > +             archive_set_error(&ar->archive, ARCHIVE_ERRNO_FILE_FORMA=
T,
>> > +                 "Invalid filter encountered");
>> > +--
>> > +2.25.1
>> > +
>> > diff --git
>> a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
>> b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
>> > new file mode 100644
>> > index 0000000000..243a03a8e5
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patc=
h
>> > @@ -0,0 +1,308 @@
>> > +From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 200=
1
>> > +From: Tim Kientzle <kientzle@acm.org>
>> > +Date: Sun, 1 Mar 2026 10:04:01 -0800
>> > +Subject: [PATCH] Infinite loop in Rar5 decompression
>> > +
>> > +Found by: Elhanan Haenel
>> > +
>> > +Upstream-Status: Backport [
>> https://github.com/libarchive/libarchive/commit/ef53e2023d75a205cf7cbddb=
5d01c4cc592e9ce4
>> ]
>> > +CVE: CVE-2026-4111
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + Makefile.am                                   |   2 +
>> > + libarchive/test/CMakeLists.txt                |   1 +
>> > + .../test/test_read_format_rar5_loop_bug.c     |  53 +++++
>> > + .../test_read_format_rar5_loop_bug.rar.uu     | 189 ++++++++++++++++=
++
>> > + 4 files changed, 245 insertions(+)
>> > + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c
>> > + create mode 100644
>> libarchive/test/test_read_format_rar5_loop_bug.rar.uu
>> > +
>> > +diff --git a/Makefile.am b/Makefile.am
>> > +index dd1620d..14edb2a 100644
>> > +--- a/Makefile.am
>> > ++++ b/Makefile.am
>> > +@@ -507,6 +507,7 @@ libarchive_test_SOURCES=3D \
>> > +     libarchive/test/test_read_format_rar_invalid1.c \
>> > +     libarchive/test/test_read_format_rar_overflow.c \
>> > +     libarchive/test/test_read_format_rar5.c \
>> > ++    libarchive/test/test_read_format_rar5_loop_bug.c \
>> > +     libarchive/test/test_read_format_raw.c \
>> > +     libarchive/test/test_read_format_tar.c \
>> > +     libarchive/test/test_read_format_tar_concatenated.c \
>> > +@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=3D\
>> > +
>>  libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
>> > +     libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
>> > +     libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
>> > ++    libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
>> > +     libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu=
 \
>> > +     libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu=
 \
>> > +     libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu=
 \
>> > +diff --git a/libarchive/test/CMakeLists.txt
>> b/libarchive/test/CMakeLists.txt
>> > +index 05c6fd7..c8f2e90 100644
>> > +--- a/libarchive/test/CMakeLists.txt
>> > ++++ b/libarchive/test/CMakeLists.txt
>> > +@@ -156,6 +156,7 @@ IF(ENABLE_TEST)
>> > +     test_read_format_rar_filter.c
>> > +     test_read_format_rar_overflow.c
>> > +     test_read_format_rar5.c
>> > ++    test_read_format_rar5_loop_bug.c
>> > +     test_read_format_raw.c
>> > +     test_read_format_tar.c
>> > +     test_read_format_tar_concatenated.c
>> > +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c
>> b/libarchive/test/test_read_format_rar5_loop_bug.c
>> > +new file mode 100644
>> > +index 0000000..77dd78c
>> > +--- /dev/null
>> > ++++ b/libarchive/test/test_read_format_rar5_loop_bug.c
>> > +@@ -0,0 +1,53 @@
>> > ++/*-
>> > ++ * Copyright (c) 2026 Tim Kientzle
>> > ++ * All rights reserved.
>> > ++ *
>> > ++ * Redistribution and use in source and binary forms, with or withou=
t
>> > ++ * modification, are permitted provided that the following condition=
s
>> > ++ * are met:
>> > ++ * 1. Redistributions of source code must retain the above copyright
>> > ++ *    notice, this list of conditions and the following disclaimer.
>> > ++ * 2. Redistributions in binary form must reproduce the above copyri=
ght
>> > ++ *    notice, this list of conditions and the following disclaimer i=
n
>> the
>> > ++ *    documentation and/or other materials provided with the
>> distribution.
>> > ++ *
>> > ++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY
>> EXPRESS OR
>> > ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
>> WARRANTIES
>> > ++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
>> DISCLAIMED.
>> > ++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIREC=
T,
>> > ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
>> (INCLUDING, BUT
>> > ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>> OF USE,
>> > ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
>> ANY
>> > ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TO=
RT
>> > ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
>> USE OF
>> > ++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> > ++ */
>> > ++#include "test.h"
>> > ++
>> > ++DEFINE_TEST(test_read_format_rar5_loop_bug)
>> > ++{
>> > ++  const char *reffile =3D "test_read_format_rar5_loop_bug.rar";
>> > ++  struct archive_entry *ae;
>> > ++  struct archive *a;
>> > ++  const void *buf;
>> > ++  size_t size;
>> > ++  la_int64_t offset;
>> > ++
>> > ++  extract_reference_file(reffile);
>> > ++  assert((a =3D archive_read_new()) !=3D NULL);
>> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a))=
;
>> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a))=
;
>> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a,
>> reffile, 10240));
>> > ++
>> > ++  // This has just one entry
>> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
>> > ++
>> > ++  // Read blocks until the end of the entry
>> > ++  while (ARCHIVE_OK =3D=3D archive_read_data_block(a, &buf, &size,
>> &offset)) {
>> > ++  }
>> > ++
>> > ++  assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
>> > ++
>> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
>> > ++  assertEqualInt(ARCHIVE_OK, archive_free(a));
>> > ++}
>> > +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
>> b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
>> > +new file mode 100644
>> > +index 0000000..3e47004
>> > +--- /dev/null
>> > ++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
>> > +@@ -0,0 +1,189 @@
>> > ++begin 644 test_read_format_rar5_loop_bug.rar
>> > ++M4F%R(1H'`0#%&C,R`P$``)T-9%L.`@+P0`"`@`P`@`,``6'(WFP@`?\7_U/^
>> > ++M8@!.`B`H````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++M````````````````````````````````````````````````````````````
>> > ++5```````````````````Y^;*!`@4`
>> > ++`
>> > ++end
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
>> b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
>> > index e74326b40f..85fe6e5baa 100644
>> > --- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
>> > +++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
>> > @@ -50,6 +50,8 @@ SRC_URI =3D "
>> http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
>> >
>>  file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
>> >             file://CVE-2025-60753-01.patch \
>> >             file://CVE-2025-60753-02.patch \
>> > +           file://CVE-2026-4111-1.patch \
>> > +           file://CVE-2026-4111-2.patch \
>> >             "
>> >  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
>> >
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


