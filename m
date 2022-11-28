Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D441C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 20:59:02 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.130445.1669669136670687886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 12:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ivzrKnZA;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id n1so9910293ljg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROiuXtZUAX2EvBvJUc6i3jaurQxI7LVb8ocNEC85y54=;
        b=ivzrKnZAFHMrjbQ+KNki+2/DlzPW/m6KC1vzJ/l16TzYJw+nHwxV75zv7FR8JCl9kM
         zWkJyXzgjNopUOvMdX635K+9HaJYoPVE1IZ/n4PpNjTqHecv++lhrmddDMShXLxdywrx
         g11IitBm42jhzxzRD/P5DAsbe44GSobYkrMs8RjhP5kKYPleaas/DRTqytbYArIQu6vl
         1VidStHADtO012xp449RjycTL8mBe9CzrEtrw8hF4086H4p2OSSFRpki6/Fl78Oqc/rc
         KSDa6SKhLCcPjx/ngpr4b+iRk8ylv4Gvr8+5IgCl3HV9xIJNxl+gCQFsyubf3C/pyJ8F
         j1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROiuXtZUAX2EvBvJUc6i3jaurQxI7LVb8ocNEC85y54=;
        b=QGIty6vb35F1S9R6y7uiPNcK35pwKuGQtHMk1B+2aSBI864Nx8y682OYz4q48kIHgR
         ewdilQCJfuF/2NfTG1URUVkRaKlKoaAVGoek6Jbr+vfGsjM/37kGTnzPNho7eTV3NhHm
         nBIo5bDsh91h1wxk9xtDcXnzIIOppRRo4jsW+l0aFkt0hNEp8AGSA1DBF697VknEjEgJ
         e4NQu7V5PRwnHJ5CHx99ZSqIWZSYiRhaFR4D4isKqq59AAaCRvcjoXTuncRMymkNnDwX
         9B1TBah75r7J3pszSdt4gxguz4YwZG2iyEBDVpOwAhfYeTxAunq0Zkk07OpMbTmtcBgJ
         VKlQ==
X-Gm-Message-State: ANoB5pkTK9jyJu6K6NZ/bwHhV+ZcXL/OTdFItXv4zMxKvNGM2a3/xszV
	0FaC8Q/yyTw2ezBfK0D7tWa4N+vkO/G1RKOoynjZ5LS0
X-Google-Smtp-Source: AA0mqf5mL47M4QwYXNulFHRzCb0MBQsvXiqYxk7G4DoBGmc9GJmlgF06sVg7YEkY4oXhwXVftm2mAHPTrsPLi7Ir8rU=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr17088364ljr.222.1669669134810; Mon, 28
 Nov 2022 12:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20221128204631.14661-1-reatmon@ti.com>
In-Reply-To: <20221128204631.14661-1-reatmon@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 21:58:43 +0100
Message-ID: <CANNYZj8Q2Cu9Z2ujN_frFs2UC4O0PU1tgm2j24843kv_M5eqqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][master] go: Update patch due to build errors
To: reatmon@ti.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 20:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173947

What build errors is this addressing and how can they be observed?

Alex

On Mon, 28 Nov 2022 at 21:46, Ryan Eatmon via lists.openembedded.org
<reatmon=ti.com@lists.openembedded.org> wrote:
>
> The previous version of this patch was a little too zealous in
> cleaning up the envvironment.  Some of the variable impacted
> by the filerCompilerFlags() function require at least one
> value to remain in the array.  In this case, the values for
> ccExe, cxxExe, and fcExe require a value or it results in
> a panic related to accessing a value out of range.
>
> The updated patch adds a flag that requires keeping the first
> value so that at least one thing remains and the assignments
> for the Exes set that flag to true.  The first item in the
> array should be the compiler name anyway so it should remain.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 17fa9d9831..43be5cd2e8 100644
> --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -74,7 +74,7 @@ index c88b315..a06455c 100644
>  +              cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
>
>  -              ccExe := b.ccExe()
> -+              ccExe := filterCompilerFlags(b.ccExe())
> ++              ccExe := filterCompilerFlags(b.ccExe(), true)
>                 fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
>                 // Include the C compiler tool ID so that if the C
>                 // compiler changes we rebuild the package.
> @@ -83,7 +83,7 @@ index c88b315..a06455c 100644
>                 }
>                 if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
>  -                      cxxExe := b.cxxExe()
> -+                      cxxExe := filterCompilerFlags(b.cxxExe())
> ++                      cxxExe := filterCompilerFlags(b.cxxExe(), true)
>                         fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
>                         if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
>                                 fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> @@ -91,7 +91,7 @@ index c88b315..a06455c 100644
>                 }
>                 if len(p.FFiles) > 0 {
>  -                      fcExe := b.fcExe()
> -+                      fcExe := filterCompilerFlags(b.fcExe())
> ++                      fcExe := filterCompilerFlags(b.fcExe(), true)
>                         fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
>                         if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
>                                 fmt.Fprintf(h, "FC ID=%q\n", fcID)
> @@ -104,20 +104,22 @@ index c88b315..a06455c 100644
>         }
>
>         // Configuration specific to compiler toolchain.
> -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
> +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
>         return args
>   }
>
>  +var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
>  +
> -+func filterCompilerFlags(flags []string) []string {
> ++func filterCompilerFlags(flags []string, keepfirst bool) []string {
>  +      var newflags []string
> ++   var realkeepfirst bool = keepfirst
>  +      if !filterFlags {
>  +              return flags
>  +      }
>  +      for _, flag := range flags {
> -+              if strings.HasPrefix(flag, "-m") {
> ++              if strings.HasPrefix(flag, "-m") || realkeepfirst {
>  +                      newflags = append(newflags, flag)
> ++           realkeepfirst = false
>  +              }
>  +      }
>  +      return newflags
> @@ -129,21 +131,21 @@ index c88b315..a06455c 100644
>         defaults := "-g -O2"
>
>         if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
>         if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
>                 return
>         }
>  +      if filtered {
> -+              cppflags = filterCompilerFlags(cppflags)
> -+              cflags = filterCompilerFlags(cflags)
> -+              cxxflags = filterCompilerFlags(cxxflags)
> -+              fflags = filterCompilerFlags(fflags)
> -+              ldflags = filterCompilerFlags(ldflags)
> ++              cppflags = filterCompilerFlags(cppflags, false)
> ++              cflags = filterCompilerFlags(cflags, false)
> ++              cxxflags = filterCompilerFlags(cxxflags, false)
> ++              fflags = filterCompilerFlags(fflags, false)
> ++              ldflags = filterCompilerFlags(ldflags, false)
>  +      }
>
>         return
>   }
> -@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
>
>   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
>         p := a.Package
> @@ -152,7 +154,7 @@ index c88b315..a06455c 100644
>         if err != nil {
>                 return nil, nil, err
>         }
> -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
>
>   // Run SWIG on one SWIG input file.
>   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173944): https://lists.openembedded.org/g/openembedded-core/message/173944
> Mute This Topic: https://lists.openembedded.org/mt/95320460/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

