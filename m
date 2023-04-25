Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9CCC77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 14:26:18 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.80511.1682432770946449124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 07:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HfJE9S1E;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54f99770f86so68935027b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682432770; x=1685024770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ASXpik8riqvUL8IeAMj3mBmAAp87O5q4dvUX7D0ST7E=;
        b=HfJE9S1Ep7bTT8Qk4sWRPcOle/bag5pio0l8SmK01HTQUhWxuosFBIlwOzMWBBVea/
         ifVri9r50hGUHM70uLTSmURLDPSWMVfG3Dp54KwyoNWvcckD8o+K0CBq8/xIcSBwCyFJ
         xAMDBbyngkYFq22Nhm9wRPQMyrlyAoMy3QF4h/VKSLRI9B9W+fCComsFE4/aax1jYXuy
         Vv6DnIsnTfXTuGlqRVM8Z3FS+j2rMxyApeJ0cgTzvvr3xdYv/W2txcWlFq7WqogeLCy1
         0HS27v023I6/KfFdnQkiHuLjqJnodtpge7PdTNQr16J9SI59fwq5cmXiWmamzZeDdeGU
         ZzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682432770; x=1685024770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASXpik8riqvUL8IeAMj3mBmAAp87O5q4dvUX7D0ST7E=;
        b=KQxjQDbEYBZlzDx/Q2MsPuAcnUSlMHnnbEz/46zMn9yHIBbuz+nbz51vDi3XZY5ctq
         FdpkNpjCdpY3gU0ht7xCnqZpyCzv0zCIZOmCiw/VLRI0LteTETZZ1k3grmnQgruMqsH8
         blNfEUYF28ovRtfWiytHFZ9+lGFXEhbqfva+E17oActzt3Py3mY7mznqpxEgpqQZLTLV
         IFkzZLJ2J/9Mc2Y27HBHDJ2rC/2SC1iaAqRhtB4f0aG6EjK77cjTgW+0JvZFmsrvXXC3
         +XEoJzvdEOxrJa4qfSiwHdtQ8Y23AOMR6onRZlR7djrsw1rE2GqE2zUdVcoUllV5qoci
         h4pA==
X-Gm-Message-State: AAQBX9dtwnUWapJPTtcgWyAnYdrvlhMTl6IEX/Bg7dhYK9purqCXaA8z
	eXZiJfxok0DnvcdpaTA+I99tiZf8WD4SiCTCFPk=
X-Google-Smtp-Source: AKy350ayrTsvtlAAFfOg8cjTTHmozDv/W1G5Xdj4/KDCqTRQbIaTgwziHTwR1N7y+xoV20+oLWHkl9tcwSkUqi7kkm8=
X-Received: by 2002:a0d:ffc5:0:b0:54f:adff:bd7a with SMTP id
 p188-20020a0dffc5000000b0054fadffbd7amr12719301ywf.8.1682432769812; Tue, 25
 Apr 2023 07:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230425091532.8086-1-dev@loewen-email.de>
In-Reply-To: <20230425091532.8086-1-dev@loewen-email.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 25 Apr 2023 07:25:58 -0700
Message-ID: <CANx9H-Cb894ioJArCqsSXeskgc=GsxbB6VCHoZ+Lkq0T-VEnZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3targetconfig.bbclass: Extend PYTHONPATH
 instead of overwriting
To: dev@loewen-email.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009a6dd105fa29e7d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 14:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180387

--0000000000009a6dd105fa29e7d0
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 25, 2023 at 2:15 AM <dev@loewen-email.de> wrote:

> From: Johannes Schrimpf <dev@loewen-email.de>
>
> [YOCTO #15108] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15108
>
> Since the latest change,


We should mention the commit where the change was made:
https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/python3targetconfig.bbclass?id=c9617c03bceee54dc540318cada392799b137bd5

the PYTHONPATH is overwritten instead of extended.
> This leads to changed behavior and build errors of recipes where the
> PYTHONPATH
> is set before setup_target_config is run.
>
> Signed-off-by: Johannes Schrimpf <dev@loewen-email.de>
> ---
>  meta/classes-recipe/python3targetconfig.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/python3targetconfig.bbclass
> b/meta/classes-recipe/python3targetconfig.bbclass
> index 22305fe176..08bc619398 100644
> --- a/meta/classes-recipe/python3targetconfig.bbclass
> +++ b/meta/classes-recipe/python3targetconfig.bbclass
> @@ -12,7 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
>
>  setup_target_config() {
>          export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> -        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata
> +        export
> PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
>          export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
>  }
>
> --
> 2.37.1 (Apple Git-137.1)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180375):
> https://lists.openembedded.org/g/openembedded-core/message/180375
> Mute This Topic: https://lists.openembedded.org/mt/98489203/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009a6dd105fa29e7d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 25, 2023 at 2:15 AM &lt;<a href=3D"mailto:dev@l=
oewen-email.de">dev@loewen-email.de</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
">From: Johannes Schrimpf &lt;<a href=3D"mailto:dev@loewen-email.de" target=
=3D"_blank">dev@loewen-email.de</a>&gt;<br>
<br>
[YOCTO #15108] -- <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D15108" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D15108</a><br>
<br>
Since the latest change,</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">We should mention the commit where the change was made:</div><div=
 dir=3D"auto"><div><a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/meta/classes-recipe/python3targetconfig.bbclass?id=3Dc9617c03bceee=
54dc540318cada392799b137bd5">https://git.openembedded.org/openembedded-core=
/commit/meta/classes-recipe/python3targetconfig.bbclass?id=3Dc9617c03bceee5=
4dc540318cada392799b137bd5</a></div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"=
> the PYTHONPATH is overwritten instead of extended.<br>
This leads to changed behavior and build errors of recipes where the PYTHON=
PATH<br>
is set before setup_target_config is run.<br>
<br>
Signed-off-by: Johannes Schrimpf &lt;<a href=3D"mailto:dev@loewen-email.de"=
 target=3D"_blank">dev@loewen-email.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/python3targetconfig.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes=
-recipe/python3targetconfig.bbclass<br>
index 22305fe176..08bc619398 100644<br>
--- a/meta/classes-recipe/python3targetconfig.bbclass<br>
+++ b/meta/classes-recipe/python3targetconfig.bbclass<br>
@@ -12,7 +12,7 @@ DEPENDS:append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<b=
r>
<br>
=C2=A0setup_target_config() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export _PYTHON_SYSCONFIGDATA_NAME=3D&quot=
;_sysconfigdata&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export PYTHONPATH=3D${STAGING_LIBDIR}/python-s=
ysconfigdata<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export PYTHONPATH=3D${STAGING_LIBDIR}/python-s=
ysconfigdata:$PYTHONPATH<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export PATH=3D${STAGING_EXECPREFIXDIR}/py=
thon-target-config/:$PATH<br>
=C2=A0}<br>
<br>
-- <br>
2.37.1 (Apple Git-137.1)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180375): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180375" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180375</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98489203/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98489203/924729</a><br>
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

--0000000000009a6dd105fa29e7d0--

