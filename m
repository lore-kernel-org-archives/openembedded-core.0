Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D59BC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 18:01:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.380.1664560893404705107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dFT4Hk+U;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id 10so999707pli.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3IJdAqzSQfcUwWDviiubCq8PkBqQlXqEfWo/m0LYxtM=;
        b=dFT4Hk+UlmDt3VqKHLN0FluLJhWyvHEN0qdBHxaPvXt1573MzdNE1HwHHIySIyWtrq
         JuPPBXNRGWNnsjUCRYLUonuq4yTWBotDr5lYR8LUsWb+pG7q2X3y53p21f+Tca+RCwz8
         4HjRhoJE+EIfuGCEUONpiY79irMhmNgm3jmVZ4YTbYH0grBO90DtA6LfVuP5BcHr3q1f
         ctczzF4LXscoeokigJYLyMU70zQqEASeUgz0ziBgO1Ag5VgvJaGDTMQlNpR6Hjrhm3nY
         5YzUZ6qMpMfIuATszQTSVsuQLMyl8OPARnwlFsoQix466xcaR19s16Jqw0YQxTg3aZrs
         UBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3IJdAqzSQfcUwWDviiubCq8PkBqQlXqEfWo/m0LYxtM=;
        b=UGpWlSNI14N+Gqt8E93MHMFLH8LrobqfD5p1oo4FDbwQ8p2EOI/LctpEwIUTqCwrCh
         gcLmYnC/9OJ9Iaq4RUh/O7oox9nX4P3E90GnGt5IACfE4yBUoIo45GQF+yiAs7Rs8+Iu
         m1FSRYVk8DsgMVquFmpgzRdyI0CX3ARniHDwMTQPLtZkxurOVhZHQWcetavsrh+XU8gb
         7oYWOMjIqxbNYm2QfPrjeo+RA90PezYCgCBY4dipU7WhOWgygWW8Ellai/fZbGbJ53pe
         PX6G9P+RTfXMrfro4DZrWByg6Q52/4gu5SfBnJd5uX2bGvQbH9NPHBtYnkpeQ9pv35GU
         QoMg==
X-Gm-Message-State: ACrzQf1PLuJy43QOeqHbubW+wF+TMn9KDpBJlaSf8e/nS2DYBUn2Ivsq
	cheLqueYMuLn+EiWieSJlEOE0b9fSLIA4ZUIwTo=
X-Google-Smtp-Source: 
 AMsMyM6KGxpH9vcEPFE36cOXtOe9fzDVpx+SAJ0ak28Emc/oQpukxl1B+ZBXMZrZz1QMywTDqW8AHFnDyvuxqw1q5cE=
X-Received: by 2002:a17:90a:fc98:b0:202:52cf:c117 with SMTP id
 ci24-20020a17090afc9800b0020252cfc117mr22975510pjb.26.1664560891842; Fri, 30
 Sep 2022 11:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <CANNYZj-15uhYQwhU95q0Yr=FcX_qGhWj5Vy=7qFdqyJ4QfSsww@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-15uhYQwhU95q0Yr=FcX_qGhWj5Vy=7qFdqyJ4QfSsww@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 30 Sep 2022 19:01:10 +0100
Message-ID: 
 <CANPvuRkXLnZMYGttuO1k6SVoN=vhee5K0uk7eXSzpYZxvQRiXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] go: drop patch to make content based hash
 generation less pedan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000aa558605e9e8c8fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 18:01:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171240

--000000000000aa558605e9e8c8fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia sexta,
30/09/2022 =C3=A0(s) 18:57:

> You need to remove the actual patch, and run the reproducibility test.
>

Forgot to remove the patch! Will send a v2 but I can't run the
reproducibility now.

Jose


> Alex
>
> On Fri, 30 Sept 2022 at 19:55, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > With patch in place I have see some build issues mainly in
> meta-virtualization
> > with ti am62xx-evm, am64xx-evm and riscv64 machines.
> >
> > All the mahines fails to build the following recipes:
> >
> > | Summary: 5 tasks failed:
> > |
> /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/ru=
nc/runc-opencontainers_git.bb:
> do_compile
> > |
> /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/sk=
opeo/skopeo_git.bb:
> do_compile
> > |
> /srv/oe/build/conf/../../layers/meta-lmp/meta-lmp-base/recipes-support/fi=
oconfig/fioconfig_git.bb:
> do_compile
> > |
> /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/do=
cker/docker-ce_git.bb:
> do_compile
> > |
> /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/co=
ntainerd/containerd-opencontainers_git.bb:
> do_compile
> > | Summary: There were 8 ERROR messages, returning a non-zero exit code.
> >
> > And all of them fails with the same issue:
> >
> > | panic: runtime error: index out of range [0] with length 0
> > |
> > | goroutine 6688 [running]:
> > | cmd/go/internal/work.(*Builder).buildActionID(0xc0000030e0,
> 0xc000172a00)
> > |
>  /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-=
sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.g=
o:281
> +0x2425
> > | cmd/go/internal/work.(*Builder).build(0xc0000030e0, {0xc000000238?,
> 0x0?}, 0xc000172a00)
> > |
>  /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-=
sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.g=
o:478
> +0x199
> > | cmd/go/internal/work.(*Builder).Do.func2({0xb2e4f0, 0xc000000238},
> 0xc000172a00)
> > |
>  /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-=
sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.g=
o:139
> +0x5fc
> > | cmd/go/internal/work.(*Builder).Do.func3()
> > |
>  /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-=
sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.g=
o:201
> +0xb9
> > | created by cmd/go/internal/work.(*Builder).Do
> > |
>  /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-=
sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.g=
o:187
> +0x3f5
> > | make: *** [Makefile:244: bin/containerd] Error 2
> > | make: *** Waiting for unfinished jobs....
> >
> > Without this patch everithing look good.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-devtools/go/go-1.19.inc | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.19.inc
> b/meta/recipes-devtools/go/go-1.19.inc
> > index f733a807b4..355a82eb9f 100644
> > --- a/meta/recipes-devtools/go/go-1.19.inc
> > +++ b/meta/recipes-devtools/go/go-1.19.inc
> > @@ -5,7 +5,6 @@ FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go:"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd=
74707"
> >
> >  SRC_URI +=3D "\
> > -
> file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
> >
> file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
> >      file://0004-ld-add-soname-to-shareable-objects.patch \
> >
> file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171233):
> https://lists.openembedded.org/g/openembedded-core/message/171233
> > Mute This Topic: https://lists.openembedded.org/mt/94022663/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000aa558605e9e8c8fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia sexta, 30=
/09/2022 =C3=A0(s) 18:57:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">You need to remove the actual patch, and run the reproducibility=
 test.<br></blockquote><div><br>Forgot to remove=C2=A0the patch! Will send =
a v2 but I can&#39;t run the reproducibility now.</div><div><br></div><div>=
Jose<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Fri, 30 Sept 2022 at 19:55, Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; With patch in place I have see some build issues mainly in meta-virtua=
lization<br>
&gt; with ti am62xx-evm, am64xx-evm and riscv64 machines.<br>
&gt;<br>
&gt; All the mahines fails to build the following recipes:<br>
&gt;<br>
&gt; | Summary: 5 tasks failed:<br>
&gt; |=C2=A0 /srv/oe/build/conf/../../layers/meta-virtualization/recipes-co=
ntainers/runc/runc-opencontainers_git.bb:do_compile<br>
&gt; |=C2=A0 /srv/oe/build/conf/../../layers/meta-virtualization/recipes-co=
ntainers/skopeo/skopeo_git.bb:do_compile<br>
&gt; |=C2=A0 /srv/oe/build/conf/../../layers/meta-lmp/meta-lmp-base/recipes=
-support/fioconfig/fioconfig_git.bb:do_compile<br>
&gt; |=C2=A0 /srv/oe/build/conf/../../layers/meta-virtualization/recipes-co=
ntainers/docker/docker-ce_git.bb:do_compile<br>
&gt; |=C2=A0 /srv/oe/build/conf/../../layers/meta-virtualization/recipes-co=
ntainers/containerd/containerd-opencontainers_git.bb:do_compile<br>
&gt; | Summary: There were 8 ERROR messages, returning a non-zero exit code=
.<br>
&gt;<br>
&gt; And all of them fails with the same issue:<br>
&gt;<br>
&gt; | panic: runtime error: index out of range [0] with length 0<br>
&gt; |<br>
&gt; | goroutine 6688 [running]:<br>
&gt; | cmd/go/internal/work.(*Builder).buildActionID(0xc0000030e0, 0xc00017=
2a00)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0/srv/oe/build/tmp-lmp/work/x86_64-linux/go=
-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/s=
rc/cmd/go/internal/work/exec.go:281 +0x2425<br>
&gt; | cmd/go/internal/work.(*Builder).build(0xc0000030e0, {0xc000000238?, =
0x0?}, 0xc000172a00)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0/srv/oe/build/tmp-lmp/work/x86_64-linux/go=
-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/s=
rc/cmd/go/internal/work/exec.go:478 +0x199<br>
&gt; | cmd/go/internal/work.(*Builder).Do.func2({0xb2e4f0, 0xc000000238}, 0=
xc000172a00)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0/srv/oe/build/tmp-lmp/work/x86_64-linux/go=
-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/s=
rc/cmd/go/internal/work/exec.go:139 +0x5fc<br>
&gt; | cmd/go/internal/work.(*Builder).Do.func3()<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0/srv/oe/build/tmp-lmp/work/x86_64-linux/go=
-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/s=
rc/cmd/go/internal/work/exec.go:201 +0xb9<br>
&gt; | created by cmd/go/internal/work.(*Builder).Do<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0/srv/oe/build/tmp-lmp/work/x86_64-linux/go=
-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/s=
rc/cmd/go/internal/work/exec.go:187 +0x3f5<br>
&gt; | make: *** [Makefile:244: bin/containerd] Error 2<br>
&gt; | make: *** Waiting for unfinished jobs....<br>
&gt;<br>
&gt; Without this patch everithing look good.<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-1.19.inc | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devto=
ols/go/go-1.19.inc<br>
&gt; index f733a807b4..355a82eb9f 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.19.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.19.inc<br>
&gt; @@ -5,7 +5,6 @@ FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go:=
&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 file://0001-cmd-go-make-content-based-hash-generation-l=
ess-pedan.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0003-allow-GOTOOLDIR-to-be-overridden-in-th=
e-environment.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0004-ld-add-soname-to-shareable-objects.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0005-make.bash-override-CC-when-building-di=
st-and-go_boot.patch \<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171233): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/171233" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/171233</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94022663=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94022663/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000aa558605e9e8c8fc--

