Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40892C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 05:22:10 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.3671.1652764921685322238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 22:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AMkeHwK8;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id g14so1859061uan.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 22:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWSEDq2z2RYfNVaLMKEKOXa2ij3yO3qIBF9BwG0MM74=;
        b=AMkeHwK8nBypIxB1YelMDSJ4t2CEToEJ9hpLoTgsjTjbojbDzdMnLS8efAcGBL67Sq
         c9V137fdXnYUXOb0xlfJpNIIVpe+lWzk9b/wM7Ucu1xUJfdbLsgnkFpTwQOMzWuBFCMT
         Z8RQH0MZeUZhXm/z2NP3+CO1q9VhA/aLc0qtBeiN9CkpHivzCNgRrg2ZfnZ3SV2DvbnZ
         bgAbFhocPdrWwRrleeEIiThLvW0xQxz8SXAoKKQcyhCWHok6wQEO9k/KBrg8MnRKrZnu
         tperTEtj0gK3clPwuOjwnVGY1T0UAE1969YLwb0PeAHotZyNdsOcZRB9FVPKluaR0snj
         VYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWSEDq2z2RYfNVaLMKEKOXa2ij3yO3qIBF9BwG0MM74=;
        b=jR9UK/80TFVGt8YVWMThd/mmJFcMlxEWsy2Ax/JHyEaXZ2BCK4e//X2um80g+/I7XY
         2ls5q4jvJcZcUKm/uW0J77kKiiS/h3Aq0ObvK+2otpiHAO2dt42BF3K4nu+oCBVqPh01
         LqhdYdVy5Uh8lXRfCBPeZaNnDlKp7ka+MQEqWSvlp3l81pYtBbM8RxDNLxjwlN5r4Kr/
         RkuEonKbU9m9QwM2lYvwDfRMfd0mfVsdugUTRgWeiIw1HuSQzF4dwVexEanpRqx1PuKh
         d2lbsn9eXtTDSHNzVhejyjOhKjCPWrL5jA6l9pVHRPwrxSdp2uYtuRc5YTjqA5B4m6Z3
         It8w==
X-Gm-Message-State: AOAM530b7V3z0Y51n5KBOJg8LmSn83XuznPsZ/lqwBKwrih9kFsrFl2K
	TwJROq8VWMXSOno6O6Q2iwgkXdK+XkJ+AqDfcw0=
X-Google-Smtp-Source: 
 ABdhPJzZtWJuKgI36fku9nOoXW15KhUDoLxoPE+WDbWFTPe+g3WnlOuBp2+gkiA4TLTPqyRIjMUa+nlGqWzrv4FuPfM=
X-Received: by 2002:ab0:4590:0:b0:368:a43a:353b with SMTP id
 u16-20020ab04590000000b00368a43a353bmr3886457uau.92.1652764920759; Mon, 16
 May 2022 22:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220516071118.496613-1-samuli.piippo@qt.io>
 <f843ab80-94fb-a6d9-ef87-fc815baa2862@gmail.com>
In-Reply-To: <f843ab80-94fb-a6d9-ef87-fc815baa2862@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 17 May 2022 08:21:49 +0300
Message-ID: 
 <CABXoSoUq7=P_+Pe6ZPJqzObROggoRRBjaJFcVixj+z3+eeB12Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Bump to latest 2.38 release branch
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ffc9b505df2e5145"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 05:22:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165705

--000000000000ffc9b505df2e5145
Content-Type: text/plain; charset="UTF-8"

Previous update brought
caa6172de4b x86: Disallow invalid relocation against protected symbol
and it was later fixed in
9c67f6382ac x86: Properly handle function pointer reference

https://bugreports.qt.io/browse/QTBUG-103465

On Mon, 16 May 2022 at 19:12, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/16/22 12:11 AM, Samuli Piippo wrote:
> > Fixes Qt build with GCC 12.1.
> >
> > Brings following fixes
> >
> >   * 3d549e5ccc0 PR29142, segv in ar with empty archive and libdeps
> specified
> >   * c473aa1b9d8 M68K: avoid quadratic slowdlow in label alignment check
> >   * 8d1187516e3 Adjust ld ctf test for 32-bit targets
> >   * 9c67f6382ac x86: Properly handle function pointer reference
> >   * 9a01457e02e s390: Add DT_JMPREL pointing to .rela.[i]plt with
> static-pie
> >   * 82a5bb730a1 s390: Avoid dynamic TLS relocs in PIE
> >   * d54081c642a LoongArch: Update ABI eflag in elf header.
> >   * fb4d148004f IBM zSystems: Add support for z16 as CPU name.
> >   * 975b5540232 libctf, ld: diagnose corrupted CTF header cth_strlen
> >   * 99852365513 dlltool: Use the output name as basis for deterministic
> temp prefixes
> >   * 210bf1d6225 Updated Serbian (for binutils/) and Russian (for gprof/)
> translations
> >   * fcf60fe8482 PR28959, obdump doesn't disassemble mftb instruction
> >   * e4a35c73196 PowerPC64 DT_RELR relative reloc addresses
> >   * 7183434818e Work around gcc-4 warnings in elf64-ppc.c
>
> this looks ok. Out of curiousity which fix is particularly needed for QT
>
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >   meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc
> b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > index 3544c0c7e7..dc0a2a4054 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > @@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
> >
> > -SRCREV ?= "6938a3aca19044aeb9bc4b9564e04f9092a701ed"
> > +SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
> >   BINUTILS_GIT_URI ?= "git://
> sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git
> <http://sourceware.org/git/binutils-gdb.git;branch=$%7BSRCBRANCH%7D;protocol=git>
> "
> >   SRC_URI = "\
> >        ${BINUTILS_GIT_URI} \
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165688):
> https://lists.openembedded.org/g/openembedded-core/message/165688
> Mute This Topic: https://lists.openembedded.org/mt/91134867/3617605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ffc9b505df2e5145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Previous update brought</div><div>caa6172de4b x86: Di=
sallow invalid relocation against protected symbol</div><div>and it was lat=
er fixed in</div><div>9c67f6382ac x86: Properly handle function pointer ref=
erence</div><div><br></div><div><a href=3D"https://bugreports.qt.io/browse/=
QTBUG-103465">https://bugreports.qt.io/browse/QTBUG-103465</a></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 16 May 2022 at 19:12, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On 5/16/22 12:11 AM, Samuli Piippo wrote:<br>
&gt; Fixes Qt build with GCC 12.1.<br>
&gt; <br>
&gt; Brings following fixes<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* 3d549e5ccc0 PR29142, segv in ar with empty archive and l=
ibdeps specified<br>
&gt;=C2=A0 =C2=A0* c473aa1b9d8 M68K: avoid quadratic slowdlow in label alig=
nment check<br>
&gt;=C2=A0 =C2=A0* 8d1187516e3 Adjust ld ctf test for 32-bit targets<br>
&gt;=C2=A0 =C2=A0* 9c67f6382ac x86: Properly handle function pointer refere=
nce<br>
&gt;=C2=A0 =C2=A0* 9a01457e02e s390: Add DT_JMPREL pointing to .rela.[i]plt=
 with static-pie<br>
&gt;=C2=A0 =C2=A0* 82a5bb730a1 s390: Avoid dynamic TLS relocs in PIE<br>
&gt;=C2=A0 =C2=A0* d54081c642a LoongArch: Update ABI eflag in elf header.<b=
r>
&gt;=C2=A0 =C2=A0* fb4d148004f IBM zSystems: Add support for z16 as CPU nam=
e.<br>
&gt;=C2=A0 =C2=A0* 975b5540232 libctf, ld: diagnose corrupted CTF header ct=
h_strlen<br>
&gt;=C2=A0 =C2=A0* 99852365513 dlltool: Use the output name as basis for de=
terministic temp prefixes<br>
&gt;=C2=A0 =C2=A0* 210bf1d6225 Updated Serbian (for binutils/) and Russian =
(for gprof/) translations<br>
&gt;=C2=A0 =C2=A0* fcf60fe8482 PR28959, obdump doesn&#39;t disassemble mftb=
 instruction<br>
&gt;=C2=A0 =C2=A0* e4a35c73196 PowerPC64 DT_RELR relative reloc addresses<b=
r>
&gt;=C2=A0 =C2=A0* 7183434818e Work around gcc-4 warnings in elf64-ppc.c<br=
>
<br>
this looks ok. Out of curiousity which fix is particularly needed for QT<br=
>
<br>
&gt; <br>
&gt; Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io=
" target=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-<br=
>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.38.inc<br>
&gt; index 3544c0c7e7..dc0a2a4054 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
&gt; @@ -18,7 +18,7 @@ SRCBRANCH ?=3D &quot;binutils-2_38-branch&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&=
gt;\d+_(\d_?)*)&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRCREV ?=3D &quot;6938a3aca19044aeb9bc4b9564e04f9092a701ed&quot;<br>
&gt; +SRCREV ?=3D &quot;134f17ef688ba4c72a6c4e57af7382882cc1a705&quot;<br>
&gt;=C2=A0 =C2=A0BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://source=
ware.org/git/binutils-gdb.git;branch=3D$%7BSRCBRANCH%7D;protocol=3Dgit" rel=
=3D"noreferrer" target=3D"_blank">sourceware.org/git/binutils-gdb.git;branc=
h=3D${SRCBRANCH};protocol=3Dgit</a>&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BINUTILS_GIT_URI} \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165688): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165688" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165688</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91134867/3617=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91134867/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com" t=
arget=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ffc9b505df2e5145--

