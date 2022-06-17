Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ED8C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 08:26:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.28291.1655454383177069559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 01:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M0V5FONF;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id l18so3957803lje.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 01:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mk13cmwSms1wsKOi8PFqISonGupZ2L1/DP/UNpYlbDE=;
        b=M0V5FONFw7xuVFRdoLehQR9Ih7jFWcH24l2SIPkaze0tMtJo+lhfG8nEnjCWrjhR7c
         QwR59RaACXVa8arsBV3Btd9iyERoVpGyq8gW9saCSeCStjnQK/SqJXpe0Z+p9S55aws/
         auaRDJHaBxm3eHb6FQ3yiKL4hx0L3op5bu0D4J+ZJRuu+1P/zrhnnJjooU/HVGSEM6bQ
         NFp5B80flMsFMbN/rvAqfF/UvDaLtgFDXURVNh0yJ1d2iseQ/A8KSe01rNi9lr4JmVtk
         uCbR8wwKGiFlzVDrGqnIRXI+OjNlNjuCatXc/36c9+MvnuiVuZy1GVY3DuEkLWFePrlc
         yXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mk13cmwSms1wsKOi8PFqISonGupZ2L1/DP/UNpYlbDE=;
        b=VVHJpQZKxIRsjh0leOTqIYsyO7TfYYTARaIzkVymi1pLS1wc8RMq7WPmmGRcJXLcpV
         mkNhVnOlAHwJCSDhiTk0dhuiLC74YwjPYdteb4Zc/sRg7MUCxdHW0poWak0BTIvo7jqG
         rntwN0NUsOlbQAJeZoDw9QWR7KEO7RLF4dbDMM/VW7CpOj24FKTZSMUMHCDqeWVjVYgi
         B1IAvS6TtbdCuyq8miQIvSLCvrAPOiV34bbHGCfXUKqGvSl5cXCRSLNdm/X6KslqlfcX
         I3b6Opz/sz9o9EAkA/waDXMTPcz6ZahGwJxtynumPK4jtc7NoKxUMlmtDsLgLU2hg/CZ
         PYJA==
X-Gm-Message-State: AJIora9KaycZitofeo/ACS0k1zIvrxHd5y1v9Q25iYpQXo+FvkioJL6q
	Z3XxcDvw33YlAN8/70vdiQ+Vp4cAWC89UcO/YMI=
X-Google-Smtp-Source: 
 AGRyM1uBkwzhZ70ax6qHhd4HpX0Rs7c/8B9NdE20s/YdMeb+apECmXI5FVsjhFS8bkph7WNA1jjngmb2Sxn44gttcHA=
X-Received: by 2002:a2e:3a18:0:b0:255:c053:1726 with SMTP id
 h24-20020a2e3a18000000b00255c0531726mr4440475lja.316.1655454381252; Fri, 17
 Jun 2022 01:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 17 Jun 2022 09:25:52 +0100
Message-ID: 
 <CANPvuRmROkc3V1Bi28NhbHu_ZegJ6Ng3x8dowa8F0fPzXs1vUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.11 -> 6.47.2
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005626db05e1a08242"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 08:26:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167019

--0000000000005626db05e1a08242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wangmy <wangmy@fujitsu.com> escreveu no dia sexta, 17/06/2022 =C3=A0(s) 07:=
25:

> Add dependence exceptiongroup.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-hypothesis_6.46.11.bb =3D> python3-hypothesis_6.47.2.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb =3D>
> python3-hypothesis_6.47.2.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> rename to meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
> index 1d9772d4ff..f56bf3d19e 100644
> --- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
> @@ -13,7 +13,7 @@ SRC_URI +=3D " \
>      file://test_rle.py \
>      "
>
> -SRC_URI[sha256sum] =3D
> "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
> +SRC_URI[sha256sum] =3D
> "9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f7b051779ded6ab73ee7"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-attrs \
> @@ -23,6 +23,7 @@ RDEPENDS:${PN} +=3D " \
>      python3-sortedcontainers \
>      python3-statistics \
>      python3-unittest \
> +    ${PYTHON_PN}-exceptiongroup \
>

IMO It's better to have it as python3-exceptiongroup for consistency with
the other python in RDEPENDS

Jose


>      "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167018):
> https://lists.openembedded.org/g/openembedded-core/message/167018
> Mute This Topic: https://lists.openembedded.org/mt/91816508/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005626db05e1a08242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">wangmy &lt;<a href=3D"mailto:wangmy@f=
ujitsu.com">wangmy@fujitsu.com</a>&gt; escreveu no dia sexta, 17/06/2022 =
=C3=A0(s) 07:25:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Add dependence exceptiongroup.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://hon3-hypothesis_6.46.11.bb" rel=3D"noreferrer" t=
arget=3D"_blank">hon3-hypothesis_6.46.11.bb</a> =3D&gt; <a href=3D"http://p=
ython3-hypothesis_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-h=
ypothesis_6.47.2.bb</a>} | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-hypoth=
esis_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.=
46.11.bb</a> =3D&gt; <a href=3D"http://python3-hypothesis_6.47.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-hypothe=
sis_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.4=
6.11.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-hypoth=
esis_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.4=
7.2.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-hypothes=
is_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.46=
.11.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis=
_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.=
bb</a><br>
index 1d9772d4ff..f56bf3d19e 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis_6.4=
6.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.46.11.bb=
</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis_6.4=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.bb</=
a><br>
@@ -13,7 +13,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://test_rle.py \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0=
519af97c46bddf43c42&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f=
7b051779ded6ab73ee7&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-attrs \<br>
@@ -23,6 +23,7 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-sortedcontainers \<br>
=C2=A0 =C2=A0 =C2=A0python3-statistics \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-exceptiongroup \<br></blockquote><div><br></div=
><div>IMO It&#39;s better to have it as python3-exceptiongroup=C2=A0for con=
sistency with the other python in RDEPENDS</div><div><br>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167018): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167018" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167018</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91816508/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91816508/5052612</a><br>
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
 Quaresma</div></div></div></div>

--0000000000005626db05e1a08242--

