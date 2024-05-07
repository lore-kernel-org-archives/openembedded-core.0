Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A304C19F4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 22:50:26 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.2979.1715122224516273555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 15:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5iYcHer;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-23d477a1a4fso2697991fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 15:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715122224; x=1715727024; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8hNh2jt0HDzGJKGeGTq9d/XjThG9B2or95v6cJLfck=;
        b=b5iYcHerGf3KMaAznsfSAMKU5bC4JFvR/OcYTbyOb51Y9+rrLjO0rTJokLxCtVVCvy
         QW+4FfNAGOolbDSXH+/Dkb4eta/itwDl2at74pul5H5eYUwOEpYdF2+FoZCXajCHw4Q+
         Rb07qMS7D9ucMiZp/SO+KWs8Dqf9113OXyHtToc/DPpITb0yFnaCbr3HSzON2Wf3rl2h
         HSno4ZFmkWmJouyMukDk2K5J68UHR7Ny1hx5DO42papyf8+5+EYXH9AAXNk9K80vrgMS
         dffWegA7VPdedyi683LIuJ9IPO5rqzoXf9/agoGFDBQI65meYHLVf7UaKTX5dvdb9rmi
         OhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715122224; x=1715727024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8hNh2jt0HDzGJKGeGTq9d/XjThG9B2or95v6cJLfck=;
        b=PLUKpqn+WeunmtU3Pi+TidVzunCHe1nHi8gM81CduN99a+CoFe+jYEXCVrN7R2DJHu
         KjjM/Asc+8q4k61+X9uGy5n08R8pZYZBoqYaBaRNateEkE3UDdntrIVn9fezqT1VFf6m
         MfYLPlrVtk/qqqy7OgaiCg1Svv0EyuVs2jtv5UXwXhQ0Q5gJbOsyV8TQtZcnSdxllsoI
         bY8Q6UyeRqR70q8EoEJIg8cgf6QFxm0xSA1/91VvKSHxSxKtbTAlPKh8+KPDdWdNKdOX
         x75q9RQCk6pDdoIl4qn44fYhjWHJB4se46CFAuE2ugq5ufGWWwVdwdHRbf1/ka1wDkNf
         jTAA==
X-Gm-Message-State: AOJu0YyjL8LNUOxVKC0Fx1fvZD6Oqig0eGQuLbD/mT5pzPOWz+9J1CE7
	7h4ViCPD0Z6ucPJxspSipL5Uxwu6nBbJIjZbYP0NHd2P26h9NTONVR4W3Z5a1PXFsWcnP1wng4N
	0sbJ0RF/WLPa9LqroMAGxnk+4+84=
X-Google-Smtp-Source: AGHT+IHG/Vj7XtSVxMOTw2sRi3ouWZFux8N5JW9b2b9agJXJVuksAyq1+/rdlMcMvsoz+ox2VpHqtJ29RKcxXsSr/CM=
X-Received: by 2002:a05:6870:c6a3:b0:232:fb5e:c23b with SMTP id
 586e51a60fabf-240984389e1mr1347581fac.26.1715122223694; Tue, 07 May 2024
 15:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240507224726.3796162-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240507224726.3796162-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 May 2024 15:50:11 -0700
Message-ID: <CAMKF1sqYVDCdAOez+fYa8_pHxbDNW1n8U3doJtKM33hfer0dag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/devtool: Fix for usrmerge in DISTRO_FEATURES
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e3cb150617e502c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 22:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199110

--000000000000e3cb150617e502c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 3:47=E2=80=AFPM Richard Purdie via lists.openembedde=
d.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> If usrmerge is in DISTRO_FEATURES, assumptions in one of the tests would
> fail. Improve the test so it works in both cases.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> index c8f9534e416..882225dde34 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1773,6 +1773,8 @@ class DevtoolExtractTests(DevtoolBase):
>          # Definitions
>          testrecipe =3D 'mdadm'
>          testfile =3D '/sbin/mdadm'
> +        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
> +            testfile =3D '/usr/sbin/mdadm'
>          testimage =3D 'oe-selftest-image'
>          testcommand =3D '/sbin/mdadm --help'


Won=E2=80=99t this line also need to be covered as well ?
I wonder if these paths need to be absolute or can they be searched in
standard paths

>
>          # Build an image to run
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199109):
> https://lists.openembedded.org/g/openembedded-core/message/199109
> Mute This Topic: https://lists.openembedded.org/mt/105970675/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e3cb150617e502c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 7, 2024 at 3:47=E2=80=AFPM Richard Purdie via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ric=
hard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org"=
>linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">If usrmerge is in DISTRO_FEATURES, assumptions in o=
ne of the tests would<br>
fail. Improve the test so it works in both cases.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py<br>
index c8f9534e416..882225dde34 100644<br>
--- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
+++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
@@ -1773,6 +1773,8 @@ class DevtoolExtractTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Definitions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testrecipe =3D &#39;mdadm&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testfile =3D &#39;/sbin/mdadm&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;usrmerge&quot; in get_bb_var(&#39;DIS=
TRO_FEATURES&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile =3D &#39;/usr/sbin/mdad=
m&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testimage =3D &#39;oe-selftest-image&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testcommand =3D &#39;/sbin/mdadm --help&#=
39;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Won=E2=80=99t=
 this line also need to be covered as well ?</div><div dir=3D"auto">I wonde=
r if these paths need to be absolute or can they be searched in standard pa=
ths=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build an image to run<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199109): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199109" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199109</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105970675/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105970675/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e3cb150617e502c5--

