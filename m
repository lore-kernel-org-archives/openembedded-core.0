Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCD6C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:26:06 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.7582.1665415556023104011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 08:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LDpyM3Qs;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z3so15404725edc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LyQkbD88XW0VUjDlVvJ2te1Fobx17h4h11CXEqlWeyw=;
        b=LDpyM3QsD84VoZSNpkrdIIHg94C2OxA6Ap5y/j7u3znn0kGNt3M2eknKO2X8G2JEYC
         WtJW1r06q6+sZnp0zDsmINBXghRc26zW0mOGZG1/MQWc+S+daW7J1IEhGIoy2mjWn8Ey
         vb3r4jhXF6Soz6EMCqk1t4SDNxwbjxmXv2vKR9xBACqHlj+sCb+qfGMZHvgfHspf8Tu9
         PuvJnGxtaSuYZr1/EAdR4miUKVMVuIwSgtVWcsx3MHr0ywPGz6FUV1mxCKvVbuBvXIp+
         Kkgd5fnfUHH/A4v5FVcZtZGqbtqYmS27Xs7uYu6YNHf8mVCO5mvo71DAoMpVFEgpiVNg
         mF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyQkbD88XW0VUjDlVvJ2te1Fobx17h4h11CXEqlWeyw=;
        b=pfGna/M2891Xir88v48kMyYk2IbEdnVacTiqRShHGATyX4/msKCt3o4D6YzVq32Fd6
         SqS6Zbil5Moe1lZfhG/pVHd7BRb1CmzKWt6/ZuDKki8nUcnKAmmGRrlWhufxaXLUHweq
         g2+MDHVUpDbYUenoZfqPbliBYCb5pnBe5vUvXSiAEYM80YUBAw948CAdOh0EwJ3jYsEZ
         Q1YvlDuu2J5x113I4yBGc6tsZtQeo8F0nNGg0Uu+5Izh3i0rQiiu+aFmymh+8J4EJCsk
         4aDhOL0DteKnl8OCSA7MoJ5k0i7kAgmu1a9JBTCsDpNeQ6/LMI62R4ksNwLdm7aILhEz
         OS0A==
X-Gm-Message-State: ACrzQf0gS4OEZMhMZBFhccqQMHz74EJ5lQUpvh3mqQh6yU0Cz6qtP2pE
	h7ChN1yQH6dy6RmwPHuqlKNQyUQXjtSEEN4IvQc=
X-Google-Smtp-Source: 
 AMsMyM4km906CPQG45uGrjLZiYCN5XBbngTDBmzCxiNHyl3P6vKkKV9UhFxJc32veSUbgNlaPaofMSgigGLujLx3T+o=
X-Received: by 2002:aa7:d5d3:0:b0:458:814c:6d57 with SMTP id
 d19-20020aa7d5d3000000b00458814c6d57mr18549808eds.186.1665415554388; Mon, 10
 Oct 2022 08:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221010115818.10917-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20221010115818.10917-1-thakur.virendra1810@gmail.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Mon, 10 Oct 2022 20:55:41 +0530
Message-ID: 
 <CACpMEhNrnTu4+w0onJkUb+juUejPTOWkUTv2Tu4R2dc1m2nEfQ@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH] python3: Whitelist CVE-2018-25032
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>, virendrak@kpit.com
Content-Type: multipart/alternative; boundary="00000000000085d5dd05eaafc693"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 15:26:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171577

--00000000000085d5dd05eaafc693
Content-Type: text/plain; charset="UTF-8"

Hi Virendra,

Please add one space after # in both the comments.

On Mon, 10 Oct, 2022, 5:28 pm virendra thakur, <
thakur.virendra1810@gmail.com> wrote:

> zlib v1.2.11 as used in Windows binary releases contains a security
> issue.
> Link: https://bugs.python.org/issue47194
>
> Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.8.13.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb
> b/meta/recipes-devtools/python/python3_3.8.13.bb
> index d87abe2351..e0e6861677 100644
> --- a/meta/recipes-devtools/python/python3_3.8.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.13.bb
> @@ -62,6 +62,10 @@ CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
>  # The module will be removed in the future and flaws documented.
>  CVE_CHECK_WHITELIST += "CVE-2015-20107"
>
> +#zlib v1.2.11 as used in Windows binary releases contains a security issue
> +#https://bugs.python.org/issue47194
> +CVE_CHECK_WHITELIST += "CVE-2018-25032"
> +
>  PYTHON_MAJMIN = "3.8"
>
>  S = "${WORKDIR}/Python-${PV}"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171574):
> https://lists.openembedded.org/g/openembedded-core/message/171574
> Mute This Topic: https://lists.openembedded.org/mt/94234436/6360406
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000085d5dd05eaafc693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Virendra,</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Please add one space after # in both the comments.<br><br><div =
class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 10 Oct, 2022, 5:28 pm virendra thakur, &lt;<a href=3D"mailto:thakur.v=
irendra1810@gmail.com">thakur.virendra1810@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">zlib v1.2.11 as used in Windows binary rel=
eases contains a security<br>
issue.<br>
Link: <a href=3D"https://bugs.python.org/issue47194" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://bugs.python.org/issue47194</a><br>
<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:thakur.virendra1810@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">thakur.virendra1810@gmail.com=
</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a> | 4 ++++=
<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a> b=
/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
index d87abe2351..e0e6861677 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
@@ -62,6 +62,10 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-15523 CVE-2022-2=
6488&quot;<br>
=C2=A0# The module will be removed in the future and flaws documented.<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-20107&quot;<br>
<br>
+#zlib v1.2.11 as used in Windows binary releases contains a security issue=
<br>
+#<a href=3D"https://bugs.python.org/issue47194" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://bugs.python.org/issue47194</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-25032&quot;<br>
+<br>
=C2=A0PYTHON_MAJMIN =3D &quot;3.8&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171574): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171574" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/171574</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94234436/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/94234436/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000085d5dd05eaafc693--

