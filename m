Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E569CEB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 08:07:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1684.1690013266560796702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 01:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b90q4H6+;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso22764815e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690013265; x=1690618065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kJs8szEDTyy+AeAzyt3znNxK/hmfiwBa4YOFtGCioNU=;
        b=b90q4H6+E+nYKwxfDqJKoIkUQp+ensLi0TsJ9RsxJH0XykLyx+AFa1CbAQXH+c1sVG
         YVpJsk+5OWVaSDiy0okLMmNrky4MYfKTu2C6TCBljUREmDxL4m3vtYFsVTV64lJc5zJR
         L3uN3CTVK+QQCrIqrEkZCopnIBXkiPA8evUIKfEMm2qhxkR+dh/cGdGZhZ4OjA9vKJSp
         2epRA34XyqSUgVQsSNCTO3J1PhDiKDWiCazZcutPr4nBswsJnAANnXMXAdS9pnWWfhzC
         AaH+FF5vYQNYkaKSCvR/umAmZ++AlA6wwv5xiGtdQI/syHixkkWsNhVzEIuFUncmsdY7
         M0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690013265; x=1690618065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJs8szEDTyy+AeAzyt3znNxK/hmfiwBa4YOFtGCioNU=;
        b=Y6JxpJ/UPlXq5MdGVgoKC/bpe1uxfHkd3xCuZGW/tYrIzj/uCLM5nYWkOtBRCx17z4
         NZG5wDnPTsbWgOgui3Sh7YdiM652cuClbBwOHxI8Lsf+gRia1VVk4d/6fHV5upHg7NpE
         fiQHDK0TkDIExGc4seSyp9r8335vO++LTNiNy9IgKxNglTnb1WGKU3nywSSfAt8GoccJ
         ckqH7nhYCnRZQNw5MM1mY0hOkGrP4X8q7r6eRMRyMlS80pZ3C4Xsl5d4sjk0arOABlEz
         g0vSja0wVDEN8MFzHTQqBhDcVj9YlikFrnyHhoDOOKft1v6lfhFZ3iSsil7EBOg7gZlb
         6Ksw==
X-Gm-Message-State: ABy/qLY6SZIeaOCLRfoCole7mxTf/cinZD0etoqIFS81NQZGoJ2MdMLP
	dfjMVjHQ1Yd4mTRcCt0BaLXC0GG4BFNplCB0rWo=
X-Google-Smtp-Source: APBJJlHMmrnIihClc/qb/ijy80jPm3xjOJ3eZttNtR3krc7szjl0jlRMvxFIOWPc+h6ZdTeyNopdWTRFLNOH9TTYXWQ=
X-Received: by 2002:a7b:c393:0:b0:3fa:77ed:9894 with SMTP id
 s19-20020a7bc393000000b003fa77ed9894mr3045957wmj.7.1690013264546; Sat, 22 Jul
 2023 01:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230722090703.1372912-1-rfried.dev@gmail.com>
In-Reply-To: <20230722090703.1372912-1-rfried.dev@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Jul 2023 10:07:33 +0200
Message-ID: <CA+chaQeNUSRyHwMQKrz-dXvP5-hh-U+7y_PHMQ91L4Z4ZU+2Qw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] bitwise: Upgrade 0.43 -> 0.50
To: Ramon Fried <rfried.dev@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c8f6a06010ee0e6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 08:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184715

--0000000000004c8f6a06010ee0e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patches for meta-oe need to be sent to openembedded-devel ML not
openembedded-core (see README file and I recommend to set the recipients
for each repository with "git config sendemail.to" so that you don't need
to update --to argument when sending patches).

On Sat, Jul 22, 2023 at 8:07=E2=80=AFAM Ramon Fried <rfried.dev@gmail.com> =
wrote:

> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  .../bitwise/{bitwise_0.43.bb =3D> bitwise_0.50.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/bitwise/{bitwise_0.43.bb =3D>
> bitwise_0.50.bb} (91%)
>
> diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
> b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
> rename to meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> index 3a9943916..5cd20c5b1 100644
> --- a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
> +++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "
> https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitw
>             file://run-ptest \
>             file://ptest.out.expected \
>             "
> -SRC_URI[sha256sum] =3D
> "f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb"
> +SRC_URI[sha256sum] =3D
> "806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/mellowcandle/bitwise/releases=
"
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184714):
> https://lists.openembedded.org/g/openembedded-core/message/184714
> Mute This Topic: https://lists.openembedded.org/mt/100291403/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004c8f6a06010ee0e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patches for meta-oe need to be sent to openembedded-devel =
ML not openembedded-core (see README file and I recommend to set the recipi=
ents for each repository with &quot;<span style=3D"color:rgb(46,26,5)">git =
config <a href=3D"http://sendemail.to">sendemail.to</a>&quot; so that you d=
on&#39;t need to update --to argument when sending patches</span>).<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Jul 22, 2023 at 8:07=E2=80=AFAM Ramon Fried &lt;<a href=3D"mailto:rfrie=
d.dev@gmail.com">rfried.dev@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Signed-off-by: Ramon Fried &lt;<a href=
=3D"mailto:rfried.dev@gmail.com" target=3D"_blank">rfried.dev@gmail.com</a>=
&gt;<br>
---<br>
=C2=A0.../bitwise/{<a href=3D"http://bitwise_0.43.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">bitwise_0.43.bb</a> =3D&gt; <a href=3D"http://bitwise_0.50.=
bb" rel=3D"noreferrer" target=3D"_blank">bitwise_0.50.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/bitwise/{<a href=3D"http://bitwise_0.=
43.bb" rel=3D"noreferrer" target=3D"_blank">bitwise_0.43.bb</a> =3D&gt; <a =
href=3D"http://bitwise_0.50.bb" rel=3D"noreferrer" target=3D"_blank">bitwis=
e_0.50.bb</a>} (91%)<br>
<br>
diff --git a/meta-oe/recipes-extended/bitwise/<a href=3D"http://bitwise_0.4=
3.bb" rel=3D"noreferrer" target=3D"_blank">bitwise_0.43.bb</a> b/meta-oe/re=
cipes-extended/bitwise/<a href=3D"http://bitwise_0.50.bb" rel=3D"noreferrer=
" target=3D"_blank">bitwise_0.50.bb</a><br>
similarity index 91%<br>
rename from meta-oe/recipes-extended/bitwise/<a href=3D"http://bitwise_0.43=
.bb" rel=3D"noreferrer" target=3D"_blank">bitwise_0.43.bb</a><br>
rename to meta-oe/recipes-extended/bitwise/<a href=3D"http://bitwise_0.50.b=
b" rel=3D"noreferrer" target=3D"_blank">bitwise_0.50.bb</a><br>
index 3a9943916..5cd20c5b1 100644<br>
--- a/meta-oe/recipes-extended/bitwise/<a href=3D"http://bitwise_0.43.bb" r=
el=3D"noreferrer" target=3D"_blank">bitwise_0.43.bb</a><br>
+++ b/meta-oe/recipes-extended/bitwise/<a href=3D"http://bitwise_0.50.bb" r=
el=3D"noreferrer" target=3D"_blank">bitwise_0.50.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mellowcan=
dle/bitwise/releases/download/v$%7BPV%7D/bitw" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/mellowcandle/bitwise/releases/download/v${PV}/b=
itw</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest.out.expected \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f524f794188a10defc4df673d8cf0b3739f93e58e93af=
f0cdb8a99fbdcca2ffb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;806271fa5bf31de0600315e8720004a8f529954480e99=
1ca84a9868dc1cae97e&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mellowcand=
le/bitwise/releases" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/mellowcandle/bitwise/releases</a>&quot;<br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184714): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184714" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184714</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100291403/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100291403/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004c8f6a06010ee0e6--

