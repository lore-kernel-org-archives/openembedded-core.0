Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780ECCCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:06:21 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5797.1762455973836618436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hr4qZ0i1;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7866c61a9bbso12778597b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762455973; x=1763060773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ydFbFHxQEdOtDw0j1eS2BoPGe2WWt+utUnZfPUZiDs=;
        b=hr4qZ0i18si+2V3M2FuCVDjhzjWr1RA0o61ktWVQase6aYvzSqX30KpAFYZTpFjLeB
         xgNVOB4j96l+esYD1ahyDH4sQibrmxyEd2SnAT0nHtoOTkxXyV7ko9eQe93xVJbCSinb
         38UO1xP2ahczW6/ecp+YV7iStRBWZUyLtf/VhXALBlT6DWlmFsJ+OHonGcUGICF24j6N
         2KmqSHMMZ/xCAGYt04SshJYBTfuQo8XjGZ5vKI/8y4IVKb76YypEqQABro/eprHj2qUQ
         V/gaxky0AZpKND+IRD4V+HJi7/ft8ogs1eeFP3Fl5JQhlCmktc5sXBb7N98GJaFtxR9t
         DmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762455973; x=1763060773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ydFbFHxQEdOtDw0j1eS2BoPGe2WWt+utUnZfPUZiDs=;
        b=A9Pnfi18+6QRyBy8k8eTxVnna+L2lqzOJiNeoA0WIOpLfQzAjLOszsBDNXxJPw65Lh
         yga8vFPnffmVaI/btLeOC4dNg7mfS+26ZKZaYFbL6NQSeMUw7yKL6NW/z7ud0CHAqscA
         7kTkEcRbt/31HtB1fZLyeMD2Gurf17mYWYgEd7luhuaIPKtbf49oflK34AORyT10Zy5v
         tIxgV85uc2yZetENy+5qBGQe6cPor54ycyaPYKqgVeSLfTjfhI/YA+jHAj5eTdhYIe80
         nZMbvicOyrAUv17E5Mq2lpXlMijeCK0FuCbMSRni3ofjmyXvY6IK4UxPrdFftPZQ9Dsg
         rUig==
X-Gm-Message-State: AOJu0YxfE+1Rr86jxnDfzENu+mtDEuriCOaSqvkLxkMtMNIXs3CgG/jx
	t/690b41kJRRpP/+yYQMbn1kGjZx6EnRgrr4fGHY+bWSHzIO5ENtwKTOt90mGOtVtghoZrRrpEz
	wFaobESwFK1LDsGdKrkRchqJx5JpH4yA=
X-Gm-Gg: ASbGncs2uAfbOD3JBCFZfbAc1ZjWNSaI/lrj8Z3blDdxf2TRM9b++CPZsnC7HsrlNrm
	Yj/OAqINe5E60VCJUmy2ZREESOyJ4UGCPhKQhwO9bQX84DTDs5AAhYspSjmyKSzSZUw4wuj7fRj
	jxinMGt8U0AtndSmwKLVWbBsRFkOVUsXoIOKV5yh0AU0wZcBUpg0XR02V1/lYD4dKaYAlAB9Nju
	K+7f6Bw8fVFSguK8zKJoh4kKJQWfHycTlQlbIXzMyjtk+Ec+8pc4onikAP2NYVAW+SKdoltVrLq
	VKMH4B7v/CfKEt5S2CthaFwapkY63j9VO6lPmQMJd9P+
X-Google-Smtp-Source: AGHT+IGybDZvPMGUThsNsZNcPjW+CrvuD+1cAV8rcGtXVWBvU0rRM7jbkZvrvffZfNyRuB/NwytGEbJRtIm8zyvvkw8=
X-Received: by 2002:a05:690e:150e:b0:63f:a3bf:b7ff with SMTP id
 956f58d0204a3-640c4182de0mr438173d50.2.1762455972568; Thu, 06 Nov 2025
 11:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20251106181103.515146-1-raj.khem@gmail.com> <CADySD0G4DAJ2Cjudf_jx0=vBR23W6LB-qxRNqXeL-m5Uas+7rA@mail.gmail.com>
In-Reply-To: <CADySD0G4DAJ2Cjudf_jx0=vBR23W6LB-qxRNqXeL-m5Uas+7rA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Nov 2025 11:05:45 -0800
X-Gm-Features: AWmQ_bmXl1saxDGRb84zQDXIPQRRS_VNKQd0OJxtEphdsb7Tp2B_rKBJxFn4-bM
Message-ID: <CAMKF1spZS_g-zi0rvm02QwAMJKnHgF7DFU_-XKpXX--2wx3TBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libclc: Add misssing quotes around target list
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d62b50642f1c243"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 19:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225990

--0000000000002d62b50642f1c243
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 11:00=E2=80=AFAM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:

> On Fri, Nov 7, 2025 at 7:44=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Defualt for LIBCLC_TARGETS is `all` so a single
>
> there is a typo -> "Defualt"
>

indeed. Thanks


>
> > target is ok but when its overidden with a semi-colon
> > separated list to use a subset of targets, e.g.
> >
> > LIBCLC_TARGETS:class-nativesdk =3D
> "amdgcn--;amdgcn--amdhsa;nvptx--;nvptx64--;nvptx--nvidiacl;nvptx64--nvidi=
acl"
> >
> > cmake rejects it.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/clang/libclc_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/clang/libclc_git.bb
> b/meta/recipes-devtools/clang/libclc_git.bb
> > index 60909339e70..c4b4881542f 100644
> > --- a/meta/recipes-devtools/clang/libclc_git.bb
> > +++ b/meta/recipes-devtools/clang/libclc_git.bb
> > @@ -21,7 +21,7 @@ B_NATIVE =3D "${B}-native"
> >  # Semicolon-separated list of targets to build
> >  LIBCLC_TARGETS ?=3D "all"
> >
> > -EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS}"
> > +EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D'${LIBCLC_TARGETS}'"
> >  EXTRA_OECMAKE:append:class-target =3D "
> -DPREPARE_BUILTINS=3D${B_NATIVE}/prepare_builtins"
> >  EXTRA_OECMAKE:append:class-nativesdk =3D "
> -DPREPARE_BUILTINS=3D${B_NATIVE}/prepare_builtins"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#225985):
> https://lists.openembedded.org/g/openembedded-core/message/225985
> > Mute This Topic: https://lists.openembedded.org/mt/116157847/3619737
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002d62b50642f1c243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, =
2025 at 11:00=E2=80=AFAM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Nov 7, 2025 at 7:44=E2=80=AFAM Khe=
m Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Defualt for LIBCLC_TARGETS is `all` so a single<br>
<br>
there is a typo -&gt; &quot;Defualt&quot;<br></blockquote><div><br></div><d=
iv>indeed. Thanks=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; target is ok but when its overidden with a semi-colon<br>
&gt; separated list to use a subset of targets, e.g.<br>
&gt;<br>
&gt; LIBCLC_TARGETS:class-nativesdk =3D &quot;amdgcn--;amdgcn--amdhsa;nvptx=
--;nvptx64--;nvptx--nvidiacl;nvptx64--nvidiacl&quot;<br>
&gt;<br>
&gt; cmake rejects it.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://libclc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libclc_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://libclc_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libclc_git.bb</a> b/meta/recipes-d=
evtools/clang/<a href=3D"http://libclc_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libclc_git.bb</a><br>
&gt; index 60909339e70..c4b4881542f 100644<br>
&gt; --- a/meta/recipes-devtools/clang/<a href=3D"http://libclc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libclc_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://libclc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libclc_git.bb</a><br>
&gt; @@ -21,7 +21,7 @@ B_NATIVE =3D &quot;${B}-native&quot;<br>
&gt;=C2=A0 # Semicolon-separated list of targets to build<br>
&gt;=C2=A0 LIBCLC_TARGETS ?=3D &quot;all&quot;<br>
&gt;<br>
&gt; -EXTRA_OECMAKE +=3D &quot;-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS=
}&quot;<br>
&gt; +EXTRA_OECMAKE +=3D &quot;-DLIBCLC_TARGETS_TO_BUILD=3D&#39;${LIBCLC_TA=
RGETS}&#39;&quot;<br>
&gt;=C2=A0 EXTRA_OECMAKE:append:class-target =3D &quot; -DPREPARE_BUILTINS=
=3D${B_NATIVE}/prepare_builtins&quot;<br>
&gt;=C2=A0 EXTRA_OECMAKE:append:class-nativesdk =3D &quot; -DPREPARE_BUILTI=
NS=3D${B_NATIVE}/prepare_builtins&quot;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#225985): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/225985" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/225985</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11615784=
7/3619737" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116157847/3619737</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000002d62b50642f1c243--

