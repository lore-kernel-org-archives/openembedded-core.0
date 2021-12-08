Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FD1C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 19:47:55 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.1276.1638992874033824219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 11:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GMbdJ8W2;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id t6so3036150qkg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 11:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AE26s3ieOXfyO+nqX1t05/9OEj7wtkU98uAAsnK1PO8=;
        b=GMbdJ8W2DeiXjGUHxcOtOgHQFVNW1B4o0+r6Uh9ZwzUziT2K9wJkNSCZzuKmIIf/j4
         x3honS/GRsDH6EjQGGleYFJZrQO8FXbUBzIlfvtVTSpsTXT/3AEfybRYqvEnVPJpicrO
         FJQwbQnv7V3WxffBpfvb1wpYECWoYtYxAuISTd4CPK/S592HIHcVIpbDlKL/5TfNuAF9
         VysaRvY6iSDtwZO7ypjZUgTGw46Lx4r0a3/v6yI/XEU/fIidmDyCIddtxSiuUXzjCa2u
         AYzr8O6hIgeJhuVYcwFq8mSLS4sBgDRioPFv1cp8qzpgxBZZ/92CuGZvgaRtWot8CeYH
         yjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AE26s3ieOXfyO+nqX1t05/9OEj7wtkU98uAAsnK1PO8=;
        b=Pw4vkF0KTfRl+Vbj0ZuPhP4oQOdEMvEhIose0JasRE+R+6/M8aLqfKSZr7USrxca1y
         7XsgWo7qxIMg358h9ZnKJQSiZW4hwaiJ8BRxXpoUF5Ca/Hc+VUumHZgwf6TioV5V7HF5
         g5+o+jpGf1wmiP96wWdBccdBLWqzKvP87UYqONa6byFx3LyLRnxluFhv1Hw8HTZGOWdf
         TvslwPzcRNaFgkkH+n+7G+eBtCuIXHe96tXhlw4MT7fr/aJ9iqjU2y8xwD7Tr2fbUfIU
         qW1lw5ZiCsE5wuPRZDgeu3ckhakbkQE2n1icKiFwnjCCH9DD2WNF9hdMT4MWpe6PkHHE
         Sj1Q==
X-Gm-Message-State: AOAM531v8ARmLIKlcaNtNCdMncgFl1hUMWE/0pOzalBP7tAeLz8zjTir
	YZIkWdlHOmNRn3b/FhGzrpF31UICQqXUgStjnFQ=
X-Google-Smtp-Source: 
 ABdhPJyfyAOY7zXFQJNANvDC4QX7zYu6tFo+t3Buo+VgA2qBeAPW9WU8Byl5NvTjk+JcNUHRmbLnIwEF6Ul50PnyzTk=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr9214928qkb.72.1638992873059;
 Wed, 08 Dec 2021 11:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20211206124721.3899116-1-ross.burton@arm.com>
 <CAMKF1sowYkumsC-DuphC3UxAEtWPsnEohYnkunct2iQFnaJH0w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sowYkumsC-DuphC3UxAEtWPsnEohYnkunct2iQFnaJH0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2021 11:47:27 -0800
Message-ID: 
 <CAMKF1spYHRXgiM5B0LfOmfx24tA3FAiKRXcycGh9YG64c88vxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcf-agent: cleanup patches
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 19:47:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159364

On Mon, Dec 6, 2021 at 10:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Dec 6, 2021 at 4:47 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > ldflags.patch isn't really suitable for upstream, so mark inappropriate.
> >
> > fix_ranlib.patch has been rebased into uselessness over time, it's now
> > setting RANLIB to just '$@' which expands to '' when called, so is a
> > null operation.
>
> this works with gcc-ranlib wrapper only which expands $@ shell array,
> but it will fail if RANLIB was set to <cross>-ranlib or
> <cross>-llvn-ranlib has same behaviour
> so IMO  this patch should be kept for portability reasons.

I have addressed it for llvm-ranlib in meta-clang, so it does not
bother me as much
if someone is not using gcc-ranlib or llvm-ranlib then it might be a
problem but perhaps
they will have to reason why they want to use bare ranlib

>
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../tcf-agent/tcf-agent/fix_ranlib.patch        | 17 -----------------
> >  .../tcf-agent/tcf-agent/ldflags.patch           |  6 +++++-
> >  .../recipes-devtools/tcf-agent/tcf-agent_git.bb |  1 -
> >  3 files changed, 5 insertions(+), 19 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
> >
> > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
> > deleted file mode 100644
> > index abd33babeb..0000000000
> > --- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -Actually pass the arguments to RANLIB.
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -Index: agent/Makefile.inc
> > -===================================================================
> > ---- a/Makefile.inc
> > -+++ b/Makefile.inc
> > -@@ -92,6 +92,7 @@ ifeq ($(OPSYS),GNU/Linux)
> > -     OPTS += -DUSE_uuid_generate=0
> > -   endif
> > -   OPTS += -DENABLE_arch_$(shell uname -m)
> > -+  RANLIB += $@
> > - endif
> > -
> > - ifneq ($(OPSYS),Windows)
> > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> > index c03c55d22b..dfe492091c 100644
> > --- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> > @@ -1,4 +1,8 @@
> > -Upstream-Status: Pending
> > +We need LDFLAGS to be respected otherwise there are QA warnings as the right
> > +flags don't get used.
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> >
> >  From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
> >  From: Abdur Rehman <abdur_rehman@mentor.com>
> > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > index d6d563d8e7..0d627f4e23 100644
> > --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > @@ -11,7 +11,6 @@ PV = "1.7.0+git${SRCPV}"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
> >  SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
> > -           file://fix_ranlib.patch \
> >             file://ldflags.patch \
> >             file://tcf-agent.init \
> >             file://tcf-agent.service \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159226): https://lists.openembedded.org/g/openembedded-core/message/159226
> > Mute This Topic: https://lists.openembedded.org/mt/87538834/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

