Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A420FC4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 21:26:22 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.131221.1669670776299433020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 13:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FGHaxGhX;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id r8so14677493ljn.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 13:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p6lNar9RMHM9bOMbUzt7vpkQ+g7AXT7xVfzAFvbzaoU=;
        b=FGHaxGhXqTKVlQySIuPmMjiiGIkndqkq888p5fVUB7UwFAz4eBHCUgLA6mBkqP7+K7
         Duy0SBhY45GBkPjvPb7FPWKVIgLBeKs9UxMNjTrgkIQ+gLsMzyj4/27NvoZsbxubrGu+
         HXKveRJRTZmRAeixcKwMQqhcQgoWwqcTLPH6E7ca4YoEce8BdCulqLiO4S6XMEAT3bPd
         8BCVfOledp0SML9z5D8rGJ4gNDZhdlGO+ZycYldMkVrfsZpqHJvFXAxwjyl4yQzpkQsl
         m8yeJA2OaIArItB1GJEvpNQ60wVGAf1fHBOFEGqRhkgYImza04QY58nmXVx8a3ym3ey6
         ROdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6lNar9RMHM9bOMbUzt7vpkQ+g7AXT7xVfzAFvbzaoU=;
        b=GjpUvifKQqIXPs7MmR0Kpa7VHHxgMUWs766ZUp9Gp8CPrImanD//V2iTnPnBzPXlNg
         Bv95CqVlKbyMT1ojjxFqrQcmf7kOriE7ARJnbVQOtndP5ghQOycEHQyzC5mmPC8f4GEK
         uQa2OZrOuDvGOkJYA1OeHO5UCmRHHU3BWLoTaVnxiGe5txe/LEXfazKJiDHsCsWlBEmU
         rTRG4SSEycPXNksTkoCA5i3cybcckGvGeLJjkVfnvgITpBhTEhHLDkATcNTaJ1Mr4E86
         CBzfh62BcOr0S7oYE4wfGPieduOA0wPkesYFCrTHtXkmXsjFfDvxaaBHEyKuXAP1XCQc
         huZA==
X-Gm-Message-State: ANoB5pmeS1kpHd5adHRvZ0jKLW4FqYqPvEI7mei9UZijc/wmMqZS/4Xt
	opedqX2gzJ39EKf8slHVY00N8L6Gm547wRigHh0=
X-Google-Smtp-Source: AA0mqf6UI+Hx/sQcCwr1qG4zfEGjwXNWnatcz3jvMfshL1bPMbcSgAEx20me1h3z+sMZsg8ZbNfSCgFvFpOlxMAuoKM=
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id
 h5-20020a05651c114500b002778759bf65mr16353080ljo.108.1669670774303; Mon, 28
 Nov 2022 13:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20221128204631.14661-1-reatmon@ti.com> <CANNYZj8Q2Cu9Z2ujN_frFs2UC4O0PU1tgm2j24843kv_M5eqqg@mail.gmail.com>
 <20221128212153.GO22689@denix.org>
In-Reply-To: <20221128212153.GO22689@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 22:26:02 +0100
Message-ID: <CANNYZj8cvfd5wCYzkQp6MZBYRwQFx8yfuhFrOuBvq=-soH=Wtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][master] go: Update patch due to build errors
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 21:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173950

Ok then you need to place all of this and the bug link into the commit
message, and then you can run the reproducibility test locally, no?

Alex

On Mon, 28 Nov 2022 at 22:22, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Nov 28, 2022 at 09:58:43PM +0100, Alexander Kanavin wrote:
> > What build errors is this addressing and how can they be observed?
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976
>
>
> > On Mon, 28 Nov 2022 at 21:46, Ryan Eatmon via lists.openembedded.org
> > <reatmon=ti.com@lists.openembedded.org> wrote:
> > >
> > > The previous version of this patch was a little too zealous in
> > > cleaning up the envvironment.  Some of the variable impacted
> > > by the filerCompilerFlags() function require at least one
> > > value to remain in the array.  In this case, the values for
> > > ccExe, cxxExe, and fcExe require a value or it results in
> > > a panic related to accessing a value out of range.
> > >
> > > The updated patch adds a flag that requires keeping the first
> > > value so that at least one thing remains and the assignments
> > > for the Exes set that flag to true.  The first item in the
> > > array should be the compiler name anyway so it should remain.
> > >
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > ---
> > >  ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
> > >  1 file changed, 16 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > index 17fa9d9831..43be5cd2e8 100644
> > > --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > @@ -74,7 +74,7 @@ index c88b315..a06455c 100644
> > >  +              cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> > >
> > >  -              ccExe := b.ccExe()
> > > -+              ccExe := filterCompilerFlags(b.ccExe())
> > > ++              ccExe := filterCompilerFlags(b.ccExe(), true)
> > >                 fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> > >                 // Include the C compiler tool ID so that if the C
> > >                 // compiler changes we rebuild the package.
> > > @@ -83,7 +83,7 @@ index c88b315..a06455c 100644
> > >                 }
> > >                 if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> > >  -                      cxxExe := b.cxxExe()
> > > -+                      cxxExe := filterCompilerFlags(b.cxxExe())
> > > ++                      cxxExe := filterCompilerFlags(b.cxxExe(), true)
> > >                         fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> > >                         if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> > >                                 fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> > > @@ -91,7 +91,7 @@ index c88b315..a06455c 100644
> > >                 }
> > >                 if len(p.FFiles) > 0 {
> > >  -                      fcExe := b.fcExe()
> > > -+                      fcExe := filterCompilerFlags(b.fcExe())
> > > ++                      fcExe := filterCompilerFlags(b.fcExe(), true)
> > >                         fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> > >                         if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> > >                                 fmt.Fprintf(h, "FC ID=%q\n", fcID)
> > > @@ -104,20 +104,22 @@ index c88b315..a06455c 100644
> > >         }
> > >
> > >         // Configuration specific to compiler toolchain.
> > > -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
> > > +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
> > >         return args
> > >   }
> > >
> > >  +var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> > >  +
> > > -+func filterCompilerFlags(flags []string) []string {
> > > ++func filterCompilerFlags(flags []string, keepfirst bool) []string {
> > >  +      var newflags []string
> > > ++   var realkeepfirst bool = keepfirst
> > >  +      if !filterFlags {
> > >  +              return flags
> > >  +      }
> > >  +      for _, flag := range flags {
> > > -+              if strings.HasPrefix(flag, "-m") {
> > > ++              if strings.HasPrefix(flag, "-m") || realkeepfirst {
> > >  +                      newflags = append(newflags, flag)
> > > ++           realkeepfirst = false
> > >  +              }
> > >  +      }
> > >  +      return newflags
> > > @@ -129,21 +131,21 @@ index c88b315..a06455c 100644
> > >         defaults := "-g -O2"
> > >
> > >         if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> > > -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> > > +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> > >         if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
> > >                 return
> > >         }
> > >  +      if filtered {
> > > -+              cppflags = filterCompilerFlags(cppflags)
> > > -+              cflags = filterCompilerFlags(cflags)
> > > -+              cxxflags = filterCompilerFlags(cxxflags)
> > > -+              fflags = filterCompilerFlags(fflags)
> > > -+              ldflags = filterCompilerFlags(ldflags)
> > > ++              cppflags = filterCompilerFlags(cppflags, false)
> > > ++              cflags = filterCompilerFlags(cflags, false)
> > > ++              cxxflags = filterCompilerFlags(cxxflags, false)
> > > ++              fflags = filterCompilerFlags(fflags, false)
> > > ++              ldflags = filterCompilerFlags(ldflags, false)
> > >  +      }
> > >
> > >         return
> > >   }
> > > -@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> > > +@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> > >
> > >   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
> > >         p := a.Package
> > > @@ -152,7 +154,7 @@ index c88b315..a06455c 100644
> > >         if err != nil {
> > >                 return nil, nil, err
> > >         }
> > > -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> > > +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> > >
> > >   // Run SWIG on one SWIG input file.
> > >   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173949): https://lists.openembedded.org/g/openembedded-core/message/173949
> Mute This Topic: https://lists.openembedded.org/mt/95320460/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

