Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C66C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 11:41:18 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.121518.1703763673139390688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 03:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RkWwTEB2;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccd4b743e2so20338521fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 03:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703763671; x=1704368471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHOool5Jkiudc7ZVmAOPWeU98YrOkFtkPp1YpQUftVc=;
        b=RkWwTEB2w6KHSjwG6kSSefD4PZly7CCSZFbr+QlcQoTT6FgmxoslXBwwqMtQy+2KQQ
         toHwpQ19mosTOqCw1y9YujXOzgecCq5MfaIrOqC/jTghw+Gx60eQ61Oig6zeHC0jaQEh
         dXuUv1obyiVcyk7albglVdSfOdcPW3H0pgspx+P5R7qkqyzBLjdBR9lVtah22GU8lfw1
         wqWvCP48YcDjxx/C0TPmAZcCOE/wdKXmd+Ru02URcbqWitWRAwS4DX2nEVQsdD0Dyj2F
         a1O/wt1nat/7xsOcLsMWjp74u3nZxPaqm8hhdS0UdEEri67YyUZagiEqTJp+XIJQEEiV
         bpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703763671; x=1704368471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHOool5Jkiudc7ZVmAOPWeU98YrOkFtkPp1YpQUftVc=;
        b=S8NVYzvOsKFc6rfDvhs0TS9aQ4khfLIvc6PBXEkmNwOXqY6Kf3reLiWWMy72cleFSA
         ff9aqxT18f+mpW9MKkBI7jVeiKlspB4biZqlEEphphuM3naUMKimKrQryDc+hIwkDMAA
         zLrgN5XgOH49CxyEUmNgoabhFvVYmvwYvsfEtjpq9NNUApBS4wDxldB68MU6RQ2btwuX
         ppsaKTos9oppCmPGv0lewWR4G5D+4dAJDeU4r1gnI1SNtjk1dob9u6u21Ls1uxZ6FvcZ
         2OSXbSyZ10AlcUkORBFvx3wJACgeghKAuMcsZv6bqCAv/yE8bw+l82CwZt1xWHcVj+PC
         5XOg==
X-Gm-Message-State: AOJu0YzAPkcxwaTBTZqNyW3g59SaWaHIprRr/1n5H1buDmiMp9khpKls
	ZGZddnKcsk6gXLHWEI1lfrK/M9ZDSIckqscTxUk=
X-Google-Smtp-Source: AGHT+IF6XHC5nSpM02/w+K1AvWfRzTzLWHOTzTtfK1nZ3y3uSFaEXISeG9qBK4JNjpPi2olSxfE/rcYBc9xqe4vfpSQ=
X-Received: by 2002:a05:6512:3f29:b0:50e:8762:3b7 with SMTP id
 y41-20020a0565123f2900b0050e876203b7mr905616lfa.169.1703763670816; Thu, 28
 Dec 2023 03:41:10 -0800 (PST)
MIME-Version: 1.0
References: <1703682337-23924-1-git-send-email-wangmy@fujitsu.com> <202312272101425eb74f55@mail.local>
In-Reply-To: <202312272101425eb74f55@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Dec 2023 12:41:01 +0100
Message-ID: <CANNYZj8tjqpUHQBwzJgwNf0_goaGAd7x0OaL5Q7-zgFtCBq5_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] aspell: upgrade 0.60.8 -> 0.60.8.1
To: alexandre.belloni@bootlin.com
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 11:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192978

This can probably be fixed properly by using % in bbappend filename?

Alex

On Wed, 27 Dec 2023 at 22:01, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
>
> Hello,
>
> This breaks the selftests:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/1080/steps/12/logs/stdio
> ERROR: No recipes in default available for:
>   /home/pokybuild/yocto-worker/qemux86-tc/build/build-st-3959354/meta-selftest/recipes-test/aspell/aspell_0.60.8.bbappend
>
> On 27/12/2023 21:05:37+0800, wangmy wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > CVE-2019-25051.patch
> > removed since it's included in 0.60.8.1
> >
> > Changelog:
> > ============
> > -Fix memory leak in suggestion code introduced in 0.60.8.
> > -Various documentation fixes.
> > -Fix various warnings when compiling with -Wall.
> > -Fix two buffer overflows found by Google's OSS-Fuzz.
> > -Other minor updates.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
> >  .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
> >  2 files changed, 2 insertions(+), 106 deletions(-)
> >  rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
> >  delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch
> >
> > diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> > similarity index 83%
> > rename from meta/recipes-support/aspell/aspell_0.60.8.bb
> > rename to meta/recipes-support/aspell/aspell_0.60.8.1.bb
> > index 39b55f4ff2..0ea9b063e0 100644
> > --- a/meta/recipes-support/aspell/aspell_0.60.8.bb
> > +++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> > @@ -13,11 +13,8 @@ HOMEPAGE = "http://aspell.net/"
> >  LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> >
> > -SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
> > -           file://CVE-2019-25051.patch \
> > -"
> > -SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
> > -SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
> > +SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
> > +SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
> >
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
> > diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
> > deleted file mode 100644
> > index 8513f6de79..0000000000
> > --- a/meta/recipes-support/aspell/files/CVE-2019-25051.patch
> > +++ /dev/null
> > @@ -1,101 +0,0 @@
> > -From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
> > -From: Kevin Atkinson <kevina@gnu.org>
> > -Date: Sat, 21 Dec 2019 20:32:47 +0000
> > -Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
> > - to prevent a buffer overflow
> > -
> > -Bug found using OSS-Fuze.
> > -
> > -Upstream-Status: Backport
> > -[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
> > -CVE: CVE-2019-25051
> > -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> > ----
> > - common/objstack.hpp | 18 ++++++++++++++----
> > - 1 file changed, 14 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/common/objstack.hpp b/common/objstack.hpp
> > -index 3997bf7..bd97ccd 100644
> > ---- a/common/objstack.hpp
> > -+++ b/common/objstack.hpp
> > -@@ -5,6 +5,7 @@
> > - #include "parm_string.hpp"
> > - #include <stdlib.h>
> > - #include <assert.h>
> > -+#include <stddef.h>
> > -
> > - namespace acommon {
> > -
> > -@@ -26,6 +27,12 @@ class ObjStack
> > -   byte * temp_end;
> > -   void setup_chunk();
> > -   void new_chunk();
> > -+  bool will_overflow(size_t sz) const {
> > -+    return offsetof(Node,data) + sz > chunk_size;
> > -+  }
> > -+  void check_size(size_t sz) {
> > -+    assert(!will_overflow(sz));
> > -+  }
> > -
> > -   ObjStack(const ObjStack &);
> > -   void operator=(const ObjStack &);
> > -@@ -56,7 +63,7 @@ class ObjStack
> > -   void * alloc_bottom(size_t size)  {
> > -     byte * tmp = bottom;
> > -     bottom += size;
> > --    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
> > -+    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
> > -     return tmp;
> > -   }
> > -   // This alloc_bottom will insure that the object is aligned based on the
> > -@@ -66,7 +73,7 @@ class ObjStack
> > -     align_bottom(align);
> > -     byte * tmp = bottom;
> > -     bottom += size;
> > --    if (bottom > top) {new_chunk(); goto loop;}
> > -+    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
> > -     return tmp;
> > -   }
> > -   char * dup_bottom(ParmString str) {
> > -@@ -79,7 +86,7 @@ class ObjStack
> > -   // always be aligned as such.
> > -   void * alloc_top(size_t size) {
> > -     top -= size;
> > --    if (top < bottom) {new_chunk(); top -= size;}
> > -+    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
> > -     return top;
> > -   }
> > -   // This alloc_top will insure that the object is aligned based on
> > -@@ -88,7 +95,7 @@ class ObjStack
> > -   {loop:
> > -     top -= size;
> > -     align_top(align);
> > --    if (top < bottom) {new_chunk(); goto loop;}
> > -+    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
> > -     return top;
> > -   }
> > -   char * dup_top(ParmString str) {
> > -@@ -117,6 +124,7 @@ class ObjStack
> > -   void * alloc_temp(size_t size) {
> > -     temp_end = bottom + size;
> > -     if (temp_end > top) {
> > -+      check_size(size);
> > -       new_chunk();
> > -       temp_end = bottom + size;
> > -     }
> > -@@ -131,6 +139,7 @@ class ObjStack
> > -     } else {
> > -       size_t s = temp_end - bottom;
> > -       byte * p = bottom;
> > -+      check_size(size);
> > -       new_chunk();
> > -       memcpy(bottom, p, s);
> > -       temp_end = bottom + size;
> > -@@ -150,6 +159,7 @@ class ObjStack
> > -     } else {
> > -       size_t s = temp_end - bottom;
> > -       byte * p = bottom;
> > -+      check_size(size);
> > -       new_chunk();
> > -       memcpy(bottom, p, s);
> > -       temp_end = bottom + size;
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192968): https://lists.openembedded.org/g/openembedded-core/message/192968
> Mute This Topic: https://lists.openembedded.org/mt/103384053/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

