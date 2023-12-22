Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04051C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 03:51:23 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.12454.1703217074253988267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 19:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqgMaY/S;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e6c8b70766so14973547b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 19:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703217073; x=1703821873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iS1W5UFpb1XXu35qz9DEUUVE72Y51N8iYzUsBIesM1M=;
        b=iqgMaY/SeostLtWZFjkFqUF9gzT9wYFcQU62f1VzXAsnNpmwSCCWCT9Vm/meZLrI1H
         aNzwF+bcynYoChrWubsSCNCycOVgVN115qv5wCakJNK0NJ7TAvs3qpBlD6ttvqd0KVD/
         tRrlS3EkFryan9Untgu8yattooXqtzQDHR9MV8j6Gj4wssmWL2mbDqGftdIT/kx6SpQH
         Oaew22NmuGKaRWZpXfJXEz889qpYjqtDaowur91ZVZntujFS7y5al2N7DBS05f6gQnNi
         JEoVdGJVOSnufXJ8V2IxL5wEJlcE3D4vumG2Qt9xek/5lAgJUGV//aCmW08vWM8pRQDL
         35EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703217073; x=1703821873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS1W5UFpb1XXu35qz9DEUUVE72Y51N8iYzUsBIesM1M=;
        b=a2quXSmuMXQb/0kCe0nz9PNSlkVt3jibRNbm/rXxO1JDkuBvieGHFxGijiepMx1Wga
         dBEF9RIo7ZJ07W6m+f1IC9B1bD6u9aTFLjDBOdh1JpLI3ysmd5DImRNXU/Dw8Ggvq6Rw
         6wn29qbG2l58tj70ESTTvJvHERWY8Dd19qLPT68jVczNoRx+OL4nB3vLB3GwG1IJL8QQ
         j9C6h9NV1OEiAADoTRIMuOaM/wttadaByL6PUVM6B+clQKbqrmp4jLt7xsACsoPbFj2W
         LaiUBfgmoB2txcJs5WyPAww+jQNuR3d3EnvBevgL5+SwTSxProWTz1XamGFwhnLfnAIt
         fuuQ==
X-Gm-Message-State: AOJu0YzR/CY5wYe7b90c/mhws9yl5yCxhKmnQcTsemVVfWr/pkcHoaAf
	lWP8hIid8OwkO7jTVb2R1ZWthP9Ov6MxM2MiuTo=
X-Google-Smtp-Source: AGHT+IF59lqDUxib2Kz97W0bbh29VtZvOWO6Qx6ajW2br9L8KLaj9YWyUxqefzTJNxZD1UWkn2M93/CCFPyorZZ7Jzk=
X-Received: by 2002:a0d:d8d1:0:b0:5e8:3056:cb0e with SMTP id
 a200-20020a0dd8d1000000b005e83056cb0emr594600ywe.89.1703217073299; Thu, 21
 Dec 2023 19:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20231221215733.1057373-1-renat_khalikov@trimble.com>
In-Reply-To: <20231221215733.1057373-1-renat_khalikov@trimble.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 21 Dec 2023 19:51:02 -0800
Message-ID: <CANx9H-AZmmGdK9s4R1kCyW1DgcvrnSBUsCGH-mXuDhAyKVL_5Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-maturin: Add missing space appending to CFLAGS
To: Renat Khalikov <renat_khalikov@trimble.com>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a12647060d11208b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 03:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192857

--000000000000a12647060d11208b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acknowledged. This was intended but not present in the series as merged.

On Thu, Dec 21, 2023 at 1:57=E2=80=AFPM Renat Khalikov <renat_khalikov@trim=
ble.com>
wrote:

> When the CFLAGS variable is appended to, the missing space causes build
> errors when CFLAGS was set previously.
>
> For example:
>
>   error: unrecognized command-line option
> '-mno-unaligned-access-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSR=
C_DIR}/cargo_home'
>
> Signed-off-by: Renat Khalikov <renat_khalikov@trimble.com>
> CC: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/recipes-devtools/python/python3-maturin_1.4.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> index 07ad1201b8..82e65abb24 100644
> --- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> @@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D
> "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378b
>
>  S =3D "${WORKDIR}/maturin-${PV}"
>
> -CFLAGS:append =3D
> "-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
> +CFLAGS:append =3D "
> -fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
>
>  DEPENDS +=3D "\
>      python3-setuptools-rust-native \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192852):
> https://lists.openembedded.org/g/openembedded-core/message/192852
> Mute This Topic: https://lists.openembedded.org/mt/103308686/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a12647060d11208b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Acknowledged. This was intended but not present in the se=
ries as merged.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Dec 21, 2023 at 1:57=E2=80=AFPM Renat Khalikov =
&lt;<a href=3D"mailto:renat_khalikov@trimble.com">renat_khalikov@trimble.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">When the CFLAGS variable is appe=
nded to, the missing space causes build<br>
errors when CFLAGS was set previously.<br>
<br>
For example:<br>
<br>
=C2=A0 error: unrecognized command-line option &#39;-mno-unaligned-access-f=
debug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home&#39;<br>
<br>
Signed-off-by: Renat Khalikov &lt;<a href=3D"mailto:renat_khalikov@trimble.=
com" target=3D"_blank">renat_khalikov@trimble.com</a>&gt;<br>
CC: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_bl=
ank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.4.0.bb</a> | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-maturin=
_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.4.0.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.4.0.bb</a><br>
index 07ad1201b8..82e65abb24 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.4.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.4.0.bb</a><br>
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D &quot;ed12e1768094a7adeafc3a74ebdb8d=
c2201fa64c4e7e31f14cfc70378b<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/maturin-${PV}&quot;<br>
<br>
-CFLAGS:append =3D &quot;-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGS=
RC_DIR}/cargo_home&quot;<br>
+CFLAGS:append =3D &quot; -fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBG=
SRC_DIR}/cargo_home&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-setuptools-rust-native \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192852): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192852" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192852</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103308686/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103308686/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a12647060d11208b--

