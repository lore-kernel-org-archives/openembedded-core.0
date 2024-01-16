Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B719C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:24:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.22681.1705425872161249846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 09:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gf5iHVAZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so12380841e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705425870; x=1706030670; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NXFsn7XHgVT/dYlSwF28X++Fl5r1fiYDycJbk6zkGNE=;
        b=gf5iHVAZ766XfNigGRXNQaAbf5Fr9WIIh9kv5nh482zlf9iHgwsFUHA42JcPXfXPju
         OGZWPrGTo/DrqPWt8R8xX36Ib+bkhZuYHIQS3xxIULDwJSFeYfX1UNfvt69aOInnLXhQ
         vjwgvhBcJAzieDzMd6EcOjBD4qDjJR6gJ5zDxAMkYj+HGCHQVlwN/s/5OUT69hd3Zvrr
         NxZav4NmbNM/TkggaQgcIAF8VlhFJA+iqyVmdj7+Zp5yBkuoAGMM28Ic14nU42w1m7ms
         PpQK/9Q3bzubIXClSlOl/xgrnTIoXuvSsexbTo7sa2nIcioh2T/k579XkGHkRliQw/dB
         lRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705425870; x=1706030670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXFsn7XHgVT/dYlSwF28X++Fl5r1fiYDycJbk6zkGNE=;
        b=p6m3aAH3ABPN4Z4KjvLletJ+Ve0/tlkEYYzSRJ9NoTohnBOvCq4/orN7I4CbBc9ISD
         FVA08lp+Se0DkzNFnIkw6ud0bf0H/VHGdWEjQSgZua4Bo+cZPJYai/MGK3uh48vzSZUr
         r+TkCokkYP+xe9vFEQMUdojYOpDj6FB/xr84QusFLaD8FEQo8RAC+dYQ3f5YWwaVtWB4
         2ou08jXsrWIKw+WcTu74qw7fmzwP20vxKXq3ufi+8DciPFrATiozSpZSdAEWxulfTREf
         kfMLIrucDoeO7Sg12ZxBzw3m7Dqc9dQRiKyZl/XW62HuKh2PVh5hafDZqd/IZi1Kkcrj
         w5Bw==
X-Gm-Message-State: AOJu0YyBGWmgXv1bcFTwEJDgIZCb+waTxzW4CKCFlA8u/AbSCXIHC1FF
	ZYzTg9LFlDBmAiFIGo/8UFwSyosep55Sr9MpKFvD+mA1
X-Google-Smtp-Source: AGHT+IGWUick22YlD/Di4zTnOQrW5uMmv+fHLka3GlS+gaNS4/aL82mJRZvtwYE5p3GtYPTNXgWE+4buye/oCnCdStg=
X-Received: by 2002:a05:6512:220d:b0:50e:7be9:52fb with SMTP id
 h13-20020a056512220d00b0050e7be952fbmr4501244lfu.82.1705425870098; Tue, 16
 Jan 2024 09:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20240116165602.2053194-1-William.Lyu@windriver.com>
In-Reply-To: <20240116165602.2053194-1-William.Lyu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 18:24:19 +0100
Message-ID: <CANNYZj_CPwSSG1G95gGkaS72komPiXgZ8M=kDLJu_r2JW2M8dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] perl: Add option to prevent
 COMPLEMENTARY_GLOB from ignoring perl-modules
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d9454060f1367a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 17:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193869

--0000000000002d9454060f1367a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If this is only for fixing OpenSSL ptest, then it=E2=80=99s not needed perh=
aps,
once OpenSSL recipe is fixed?

Alex

On Tue 16. Jan 2024 at 17.56, Lyu, William via lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:

> From: William Lyu <William.Lyu@windriver.com>
>
> When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*
> packages recommended by perl-modules are ignored due to the defined
> behavior of COMPLEMENTARY_GLOB.
>
> This patch creates a new package perl-modules-force-all that RDEPENDS on
> the same set of packages perl-modules recommends. If another recipe
> always needs the packages recommended by perl-modules, it can add
> perl-modules-force-all to RDEPENDS to make sure that the recommended
> packages by perl-modules are not ignored by COMPLEMENTARY_GLOB.
>
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.38.2.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb
> b/meta/recipes-devtools/perl/perl_5.38.2.bb
> index a9d684cfc5..f75c5aa971 100644
> --- a/meta/recipes-devtools/perl/perl_5.38.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
> @@ -311,6 +311,14 @@ ALTERNATIVE_LINK_NAME[Thread.3] =3D
> "${mandir}/man3/Thread.3"
>  ALLOW_EMPTY:${PN}-modules =3D "1"
>  PACKAGES +=3D "${PN}-modules "
>
> +# When perl-modules is added through COMPLEMENTARY_GLOB, as it is
> recommending
> +# packages, all its recommendations will be ignored. So, we create a
> +# perl-modules-force-all package depending on the same set of packages a=
s
> listed
> +# in perl-modules to provide a way to guarantee COMPLEMENTARY_GLOB not
> removing
> +# these packages.
> +ALLOW_EMPTY:${PN}-modules-force-all =3D "1"
> +PACKAGES +=3D "${PN}-modules-force-all "
> +
>  PACKAGESPLITFUNCS =3D+ "split_perl_packages"
>
>  python split_perl_packages () {
> @@ -328,6 +336,20 @@ python split_perl_packages () {
>      packages =3D filter(lambda p: 'perl-module-' in p,
> d.getVar('PACKAGES').split())
>      d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
>
> +    # perl-modules-force-all provides a way to prevent COMPLEMENTARY_GLO=
B
> +    # from removing the packages specified in perl-modules.
> +    # perl-modules-force-all contains the same set of packages as
> perl-modules.
> +    d.setVar(
> +        d.expand("RDEPENDS:${PN}-modules-force-all"),
> +        d.getVar(d.expand("RRECOMMENDS:${PN}-modules"))
> +    )
> +
> +    # As perl-modules-force-all depends on all other, potentially
> non-existent,
> +    # perl packages, we allow these packages to be empty to prevent buil=
d
> +    # errors.
> +    for pkg in
> d.getVar(d.expand("RDEPENDS:${PN}-modules-force-all")).split():
> +        d.setVar(d.expand("ALLOW_EMPTY:" + pkg), "1")
> +
>      # Read the pre-generated dependency file, and use it to set module
> dependecies
>      for line in open(d.expand("${WORKDIR}") +
> '/perl-rdepends.txt').readlines():
>          splitline =3D line.split()
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193867):
> https://lists.openembedded.org/g/openembedded-core/message/193867
> Mute This Topic: https://lists.openembedded.org/mt/103766391/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002d9454060f1367a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If this is only for fixing OpenSSL ptest, then it=E2=80=
=99s not needed perhaps, once OpenSSL recipe is fixed?=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 16. Jan 2024 at 17.56=
, Lyu, William via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;william.lyu=3D<a href=3D"mailto:windriver.com@lists.openem=
bedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">From: William Lyu &lt;<a href=3D"mailto:William.Lyu@windrive=
r.com" target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
<br>
When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*<br>
packages recommended by perl-modules are ignored due to the defined<br>
behavior of COMPLEMENTARY_GLOB.<br>
<br>
This patch creates a new package perl-modules-force-all that RDEPENDS on<br=
>
the same set of packages perl-modules recommends. If another recipe<br>
always needs the packages recommended by perl-modules, it can add<br>
perl-modules-force-all to RDEPENDS to make sure that the recommended<br>
packages by perl-modules are not ignored by COMPLEMENTARY_GLOB.<br>
<br>
Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com"=
 target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.38.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.38.2.bb</a> | 22 ++++++++++++++++++++++=
<br>
=C2=A01 file changed, 22 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.38.2.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.38.2.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.38.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.38.2.bb</a><br>
index a9d684cfc5..f75c5aa971 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.38.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.38.2.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.38.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.38.2.bb</a><br>
@@ -311,6 +311,14 @@ ALTERNATIVE_LINK_NAME[Thread.3] =3D &quot;${mandir}/ma=
n3/Thread.3&quot;<br>
=C2=A0ALLOW_EMPTY:${PN}-modules =3D &quot;1&quot;<br>
=C2=A0PACKAGES +=3D &quot;${PN}-modules &quot;<br>
<br>
+# When perl-modules is added through COMPLEMENTARY_GLOB, as it is recommen=
ding<br>
+# packages, all its recommendations will be ignored. So, we create a<br>
+# perl-modules-force-all package depending on the same set of packages as =
listed<br>
+# in perl-modules to provide a way to guarantee COMPLEMENTARY_GLOB not rem=
oving<br>
+# these packages.<br>
+ALLOW_EMPTY:${PN}-modules-force-all =3D &quot;1&quot;<br>
+PACKAGES +=3D &quot;${PN}-modules-force-all &quot;<br>
+<br>
=C2=A0PACKAGESPLITFUNCS =3D+ &quot;split_perl_packages&quot;<br>
<br>
=C2=A0python split_perl_packages () {<br>
@@ -328,6 +336,20 @@ python split_perl_packages () {<br>
=C2=A0 =C2=A0 =C2=A0packages =3D filter(lambda p: &#39;perl-module-&#39; in=
 p, d.getVar(&#39;PACKAGES&#39;).split())<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(d.expand(&quot;RRECOMMENDS:${PN}-modules&quot;=
), &#39; &#39;.join(packages))<br>
<br>
+=C2=A0 =C2=A0 # perl-modules-force-all provides a way to prevent COMPLEMEN=
TARY_GLOB<br>
+=C2=A0 =C2=A0 # from removing the packages specified in perl-modules.<br>
+=C2=A0 =C2=A0 # perl-modules-force-all contains the same set of packages a=
s perl-modules.<br>
+=C2=A0 =C2=A0 d.setVar(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.expand(&quot;RDEPENDS:${PN}-modules-force-al=
l&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(d.expand(&quot;RRECOMMENDS:${PN}-modu=
les&quot;))<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # As perl-modules-force-all depends on all other, potentiall=
y non-existent,<br>
+=C2=A0 =C2=A0 # perl packages, we allow these packages to be empty to prev=
ent build<br>
+=C2=A0 =C2=A0 # errors.<br>
+=C2=A0 =C2=A0 for pkg in d.getVar(d.expand(&quot;RDEPENDS:${PN}-modules-fo=
rce-all&quot;)).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(d.expand(&quot;ALLOW_EMPTY:&quot; + p=
kg), &quot;1&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Read the pre-generated dependency file, and use it to=
 set module dependecies<br>
=C2=A0 =C2=A0 =C2=A0for line in open(d.expand(&quot;${WORKDIR}&quot;) + &#3=
9;/perl-rdepends.txt&#39;).readlines():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitline =3D line.split()<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193867): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193867" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193867</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103766391/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103766391/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002d9454060f1367a0--

