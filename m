Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E8FC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:56:41 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.12091.1672923392680499424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 04:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CMWjucnO;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id k4so33885732vsc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 04:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=53CI6usA/AeqTGMUNVPKSEBafRCDqEefNgv7iPtlBWE=;
        b=CMWjucnOJ1V6ATnxRDpnXgxih7CAFhFrlO4XzwsnmwnkOvHcRI9AVx1l1we8G4b9Aj
         5CnQ95Mm4t2F6j1ZjX8bMK/P6U45OgE+2+V+Sq0MdnwYvsMc0pQ37uB9vCjEVWasBbQM
         7DfBMJzihmDhq1UyMXy+wDQBGZgZtclgvRnGr/SfbLj2HdH9NFDDCQE8zqD17Zcw92yn
         7rACrUlrBzJrtn68WyTrLAwC3VGUgwVr8kJ4jMWdPK5dh2O1VPA/24U1N0VopyHqvmO1
         jk7K0pK5LQiC0e4k7C7sgFn1Jqf7NH/GR9RTNhqYWtOtd/DyCqrgL3IaugeFUe6lGED8
         0CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53CI6usA/AeqTGMUNVPKSEBafRCDqEefNgv7iPtlBWE=;
        b=S+GrLPm/ekdK9LnCXlyKVU2pyaG01L/ORzFi6YA9TITxHMEl/EI1nE/cgdBOwYmGpY
         9TaRVK9j1wJxkE4mmSEz82Hn4fy08PihG6ho4Sxb9PGN8ElqFz9qe1Co+zR5FcOPJDAf
         C2RwB3T6cp226WxAlYRuYAaifEpBm+nbElIuP399KOcRr6odD7EbkF0pbuhiOqUpoNHC
         U2j74J/VjsL1eQDrA887cSB+L6565f3yRzBJsBbLERwviXD2F4iehJR554r+ZikkmGFw
         pptZhqqPbvbnkRImX69C58aHENEcvpteDXcnUKEesWNHDqsHz5ckSiTWdN6atqBDB4SC
         akCg==
X-Gm-Message-State: AFqh2koN0KWYkOaBfzW4SOvNx3qnnjU5dtHwqYBZ7gchptd4sdlpLyu5
	/NYuDXq7KIpy8rH8+CGLJlz4Q4qF6P+BiGanOf0=
X-Google-Smtp-Source: AMrXdXuQCJ7muKfG8fqaxezHdGgrQqRrxWqOHtcpkf0jW03muL3m9ey1lMPOk9XalI6QospxndQye+/cITZEz+bqHRw=
X-Received: by 2002:a05:6102:22fb:b0:3cb:ba4:3831 with SMTP id
 b27-20020a05610222fb00b003cb0ba43831mr3920456vsh.87.1672923391615; Thu, 05
 Jan 2023 04:56:31 -0800 (PST)
MIME-Version: 1.0
References: <172C139C5D52718E.368@lists.openembedded.org> <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
In-Reply-To: <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 5 Jan 2023 12:56:20 +0000
Message-ID: <CANPvuRkie7KMPgw87JN894ZeRxaKTCpkux26MM+h77gEK=Ai1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3][master] go: Update reproducibility patch to
 fix panic errors
To: reatmon@ti.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e6a4e05f183d42f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 12:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175521

--0000000000007e6a4e05f183d42f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

I am building with this patch and it fixes the problem in my machines,
riscv and am6xxx.

Thanks for fixing this issue.

Jose

Ryan Eatmon via lists.openembedded.org <reatmon=3D
ti.com@lists.openembedded.org> escreveu no dia segunda, 5/12/2022 =C3=A0(s)
19:49:

>
> This might have gotten lost in the fun of the YPS and the many
> discussions around the previous versions of then patch.  Was there any
> more feedback or changes that folks want me to make for this patch, or
> is it good to go?  Just curious if there was more that you needed from me=
?
>
>
> On 11/29/2022 8:12, Ryan Eatmon via lists.openembedded.org wrote:
> > Based on a discussion on the mailing list [1], there are panic
> > errors that occur on a few platforms caused by the patch.  We
> > cannot simply remove the original patch due to the
> > reproducibility issues that it addresses, so this patch on the
> > original patch fixes the cause of the panic errors.
> >
> > The previous version of this patch was a little too aggressive
> > in cleaning up the environment.  Some of the variables impacted
> > by the filerCompilerFlags() function require at least one value
> > to remain in the array.  In this case, the values for ccExe,
> > cxxExe, and fcExe require a value or later code that access
> > them result in a panic related to accessing a value out of range.
> >
> > This updated patch adds a flag that requires keeping the first
> > value so that at least one thing remains and the assignments
> > for the Exes set that flag to true.  The first item in the
> > array should be the executable name, so leaving it should be
> > safe.
> >
> > I have run the oe-selftest and everything passed in my setup.
> >
> > There is a bug report [2] filed for the issue that this patch
> > addresses.
> >
> > [YOCTO #14976]
> >
> > [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
> > [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14976
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> > v3: Added [YOCTO #14976] to commit message.
> > v2: Added more background and bug report link to commit message.
> >
> >   ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++--------=
-
> >   1 file changed, 16 insertions(+), 14 deletions(-)
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > index 17fa9d9831..43be5cd2e8 100644
> > ---
> a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > +++
> b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > @@ -74,7 +74,7 @@ index c88b315..a06455c 100644
> >   +           cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D
> b.CFlags(p, true)
> >
> >   -           ccExe :=3D b.ccExe()
> > -+            ccExe :=3D filterCompilerFlags(b.ccExe())
> > ++            ccExe :=3D filterCompilerFlags(b.ccExe(), true)
> >               fmt.Fprintf(h, "CC=3D%q %q %q %q\n", ccExe, cppflags,
> cflags, ldflags)
> >               // Include the C compiler tool ID so that if the C
> >               // compiler changes we rebuild the package.
> > @@ -83,7 +83,7 @@ index c88b315..a06455c 100644
> >               }
> >               if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> >   -                   cxxExe :=3D b.cxxExe()
> > -+                    cxxExe :=3D filterCompilerFlags(b.cxxExe())
> > ++                    cxxExe :=3D filterCompilerFlags(b.cxxExe(), true)
> >                       fmt.Fprintf(h, "CXX=3D%q %q\n", cxxExe, cxxflags)
> >                       if cxxID, err :=3D b.gccToolID(cxxExe[0], "c++");
> err =3D=3D nil {
> >                               fmt.Fprintf(h, "CXX ID=3D%q\n", cxxID)
> > @@ -91,7 +91,7 @@ index c88b315..a06455c 100644
> >               }
> >               if len(p.FFiles) > 0 {
> >   -                   fcExe :=3D b.fcExe()
> > -+                    fcExe :=3D filterCompilerFlags(b.fcExe())
> > ++                    fcExe :=3D filterCompilerFlags(b.fcExe(), true)
> >                       fmt.Fprintf(h, "FC=3D%q %q\n", fcExe, fflags)
> >                       if fcID, err :=3D b.gccToolID(fcExe[0], "f95"); e=
rr
> =3D=3D nil {
> >                               fmt.Fprintf(h, "FC ID=3D%q\n", fcID)
> > @@ -104,20 +104,22 @@ index c88b315..a06455c 100644
> >       }
> >
> >       // Configuration specific to compiler toolchain.
> > -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
> > +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
> >       return args
> >    }
> >
> >   +var filterFlags =3D os.Getenv("CGO_PEDANTIC") =3D=3D ""
> >   +
> > -+func filterCompilerFlags(flags []string) []string {
> > ++func filterCompilerFlags(flags []string, keepfirst bool) []string {
> >   +   var newflags []string
> > ++   var realkeepfirst bool =3D keepfirst
> >   +   if !filterFlags {
> >   +           return flags
> >   +   }
> >   +   for _, flag :=3D range flags {
> > -+            if strings.HasPrefix(flag, "-m") {
> > ++            if strings.HasPrefix(flag, "-m") || realkeepfirst {
> >   +                   newflags =3D append(newflags, flag)
> > ++           realkeepfirst =3D false
> >   +           }
> >   +   }
> >   +   return newflags
> > @@ -129,21 +131,21 @@ index c88b315..a06455c 100644
> >       defaults :=3D "-g -O2"
> >
> >       if cppflags, err =3D buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err !=3D nil {
> > -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> > +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> >       if ldflags, err =3D buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS,
> checkLinkerFlags); err !=3D nil {
> >               return
> >       }
> >   +   if filtered {
> > -+            cppflags =3D filterCompilerFlags(cppflags)
> > -+            cflags =3D filterCompilerFlags(cflags)
> > -+            cxxflags =3D filterCompilerFlags(cxxflags)
> > -+            fflags =3D filterCompilerFlags(fflags)
> > -+            ldflags =3D filterCompilerFlags(ldflags)
> > ++            cppflags =3D filterCompilerFlags(cppflags, false)
> > ++            cflags =3D filterCompilerFlags(cflags, false)
> > ++            cxxflags =3D filterCompilerFlags(cxxflags, false)
> > ++            fflags =3D filterCompilerFlags(fflags, false)
> > ++            ldflags =3D filterCompilerFlags(ldflags, false)
> >   +   }
> >
> >       return
> >    }
> > -@@ -2739,7 +2763,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)
> > +@@ -2739,7 +2765,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)
> >
> >    func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> >       p :=3D a.Package
> > @@ -152,7 +154,7 @@ index c88b315..a06455c 100644
> >       if err !=3D nil {
> >               return nil, nil, err
> >       }
> > -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> > +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> >
> >    // Run SWIG on one SWIG input file.
> >    func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC strin=
g,
> err error) {
> >
> >
> >
> >
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174301):
> https://lists.openembedded.org/g/openembedded-core/message/174301
> Mute This Topic: https://lists.openembedded.org/mt/95334740/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007e6a4e05f183d42f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ryan,<br><br>I am building with this patch and it fixes=
=C2=A0the problem in my machines, riscv and am6xxx.<br><br>Thanks for fixin=
g this issue.<br><br>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Ryan Eatmon via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@l=
ists.openembedded.org">ti.com@lists.openembedded.org</a>&gt; escreveu no di=
a segunda, 5/12/2022 =C3=A0(s) 19:49:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
This might have gotten lost in the fun of the YPS and the many <br>
discussions around the previous versions of then patch.=C2=A0 Was there any=
 <br>
more feedback or changes that folks want me to make for this patch, or <br>
is it good to go?=C2=A0 Just curious if there was more that you needed from=
 me?<br>
<br>
<br>
On 11/29/2022 8:12, Ryan Eatmon via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; Based on a discussion on the mailing list [1], there are panic<br>
&gt; errors that occur on a few platforms caused by the patch.=C2=A0 We<br>
&gt; cannot simply remove the original patch due to the<br>
&gt; reproducibility issues that it addresses, so this patch on the<br>
&gt; original patch fixes the cause of the panic errors.<br>
&gt; <br>
&gt; The previous version of this patch was a little too aggressive<br>
&gt; in cleaning up the environment.=C2=A0 Some of the variables impacted<b=
r>
&gt; by the filerCompilerFlags() function require at least one value<br>
&gt; to remain in the array.=C2=A0 In this case, the values for ccExe,<br>
&gt; cxxExe, and fcExe require a value or later code that access<br>
&gt; them result in a panic related to accessing a value out of range.<br>
&gt; <br>
&gt; This updated patch adds a flag that requires keeping the first<br>
&gt; value so that at least one thing remains and the assignments<br>
&gt; for the Exes set that flag to true.=C2=A0 The first item in the<br>
&gt; array should be the executable name, so leaving it should be<br>
&gt; safe.<br>
&gt; <br>
&gt; I have run the oe-selftest and everything passed in my setup.<br>
&gt; <br>
&gt; There is a bug report [2] filed for the issue that this patch<br>
&gt; addresses.<br>
&gt; <br>
&gt; [YOCTO #14976]<br>
&gt; <br>
&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/topi=
c/94022663" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/topic/94022663</a><br>
&gt; [2] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D149=
76" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D14976</a><br>
&gt; <br>
&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" targe=
t=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt; ---<br>
&gt; v3: Added [YOCTO #14976] to commit message.<br>
&gt; v2: Added more background and bug report link to commit message.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0...ent-based-hash-generation-less-pedan.patch | 30 +++++++=
+++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 16 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-base=
d-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-g=
o-make-content-based-hash-generation-less-pedan.patch<br>
&gt; index 17fa9d9831..43be5cd2e8 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
&gt; @@ -74,7 +74,7 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cppflags, cflags=
, cxxflags, fflags, ldflags, _ :=3D b.CFlags(p, true)<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ccExe :=3D b.ccE=
xe()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ccExe :=3D filterCompilerF=
lags(b.ccExe())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ccExe :=3D filterCompilerF=
lags(b.ccExe(), true)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &=
quot;CC=3D%q %q %q %q\n&quot;, ccExe, cppflags, cflags, ldflags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Include the C=
 compiler tool ID so that if the C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// compiler chan=
ges we rebuild the package.<br>
&gt; @@ -83,7 +83,7 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFile=
s)+len(p.SwigCXXFiles) &gt; 0 {<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cxxExe :=3D b.cxxExe()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cxxExe :=3D filterCompilerFlags(b.cxxExe())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cxxExe :=3D filterCompilerFlags(b.cxxExe(), true)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, cxxExe, cxxflags)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if cxxID, err :=3D b.gccToolID(cxxExe[0], &quot;c++&quot;); er=
r =3D=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;CXX ID=3D%q\n=
&quot;, cxxID)<br>
&gt; @@ -91,7 +91,7 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles)=
 &gt; 0 {<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fcExe :=3D b.fcExe()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fcExe :=3D filterCompilerFlags(b.fcExe())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fcExe :=3D filterCompilerFlags(b.fcExe(), true)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, fcExe, fflags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if fcID, err :=3D b.gccToolID(fcExe[0], &quot;f95&quot;); err =
=3D=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;FC ID=3D%q\n&=
quot;, fcID)<br>
&gt; @@ -104,20 +104,22 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Configuration specific to compiler toolch=
ain.<br>
&gt; -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {<br>
&gt; +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return args<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0+var filterFlags =3D os.Getenv(&quot;CGO_PEDANTIC&quot;) =
=3D=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0+<br>
&gt; -+func filterCompilerFlags(flags []string) []string {<br>
&gt; ++func filterCompilerFlags(flags []string, keepfirst bool) []string {<=
br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0var newflags []string<br>
&gt; ++=C2=A0 =C2=A0var realkeepfirst bool =3D keepfirst<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0if !filterFlags {<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return flags<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0for _, flag :=3D range flags {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(flag,=
 &quot;-m&quot;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(flag,=
 &quot;-m&quot;) || realkeepfirst {<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0newflags =3D append(newflags, flag)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realkeepfirst =3D false<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0return newflags<br>
&gt; @@ -129,21 +131,21 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLA=
GS&quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<=
br>
&gt; -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cpp=
flags, cflags, cxxflags, fflags, l<br>
&gt; +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cpp=
flags, cflags, cxxflags, fflags, l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ldflags, err =3D buildFlags(&quot;LDFLAGS=
&quot;, defaults, p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0if filtered {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags =3D filterCompile=
rFlags(cppflags)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D filterCompilerF=
lags(cflags)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxxflags =3D filterCompile=
rFlags(cxxflags)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflags =3D filterCompilerF=
lags(fflags)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldflags =3D filterCompiler=
Flags(ldflags)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags =3D filterCompile=
rFlags(cppflags, false)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D filterCompilerF=
lags(cflags, false)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxxflags =3D filterCompile=
rFlags(cxxflags, false)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflags =3D filterCompilerF=
lags(fflags, false)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldflags =3D filterCompiler=
Flags(ldflags, false)<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; -@@ -2739,7 +2763,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt; +@@ -2739,7 +2765,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 func (b *Builder) cgo(a *Action, cgoExe, objdir string, p=
cCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) =
(outGo, outObj []string, err error) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
&gt; @@ -152,7 +154,7 @@ index c88b315..a06455c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil,=
 err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (i=
ntsize string, err error) {<br>
&gt; +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (i=
ntsize string, err error) {<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 // Run SWIG on one SWIG input file.<br>
&gt;=C2=A0 =C2=A0 func (b *Builder) swigOne(a *Action, p *load.Package, fil=
e, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, ou=
tC string, err error) {<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174301): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174301" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174301</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95334740/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95334740/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--0000000000007e6a4e05f183d42f--

