Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A807FC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 18:32:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.1477.1645900352451228512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ln/yYBms;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id r13so17064739ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7R9ciSh0YrlOu5U9+CI4FADoJvsNJ43MuZrDY0vMlIc=;
        b=ln/yYBmsW888pczD4DjIynah79qTa/wd8swg3jH/mCbJ5xu8Xd4y08BTsIzN9K3DgF
         dluxOsK07kxcIssWShklUsC+CoTxMpSjWKuza4l9d52TmAxlKMtnc6QNm0jYRqkvl/t8
         n3yytBPt+JS794JoP5hE3bgHmt/E3lVWAyfIam/DibEoHfUfMTrbSzDdd59k9Fej/ch8
         XOMgIT4LhUoEuDH1RoSuWRmX+wizkJPf+KIg2NsTtx7SvMq22OH9Zs0aGXwK2CgH27kO
         RMxuiZrqJtbjBaFV/sdBlWj9TDw8ea78QaWiGy3u/JjxFFj53N4k/ZYbClKq9+ACL6S1
         smeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7R9ciSh0YrlOu5U9+CI4FADoJvsNJ43MuZrDY0vMlIc=;
        b=Mu+sXvGvskeGfcF2xE8hWfqqtn7EN/MV3Wu/BatBHqOmmWhdcFxshHFSJK0U7IrIl2
         CWDfmL+6QGS2ljo8d8mQLgUw3P3EKkk/q0Z83Y/Fccet90JveHLE0wTTON+PF6mU+Ha1
         khawpsDoTygUR/2HY0ftkV8vkYq5aG4cySXCLeim6H4p+5sTMPA7KO2My3H67q/CAHjQ
         O1FCwiOmEZbyiFPmCiW7SgfKSNdh09TLbDmDkyq7dInWBF6s/6qtkjUujDl8ZtIus8me
         61RQM49UExSnCDeMmI+UtSqZeAnXHQskWJwgcYvXtmM8bj0RW5oCrVmopyI1kckhd1QE
         VJiw==
X-Gm-Message-State: AOAM533pBs1vVCaPMSvUBGlPwPcsGdhtJ62zTqM6nkmpmBxqAnVn0kXZ
	6tx8xNvhnwlYkRHWIgj6KbN0UhdgvfRchsd5cPU=
X-Google-Smtp-Source: 
 ABdhPJyPWq81yyra7oWI48gveiQHabUys71WKVwr3vAy53mqhdBy+OwOy8o6DNd6B8QaZCVmOJ4geu7M/hOI0HavWDM=
X-Received: by 2002:a17:906:3adb:b0:6b7:876c:d11b with SMTP id
 z27-20020a1709063adb00b006b7876cd11bmr10419750ejd.250.1645900350788; Sat, 26
 Feb 2022 10:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Feb 2022 10:32:19 -0800
Message-ID: 
 <CANx9H-BwS13bDRBE09S+swbn-tBcZm6JHt-vWmV2boqCbh6LdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: Use BPN instead of PN to
 construct PYPI_PACKAGE default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be991205d8f009a9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 18:32:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162428

--000000000000be991205d8f009a9
Content-Type: text/plain; charset="UTF-8"

Thank you.

On Sat, Feb 26, 2022 at 12:21 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This fixes the name for native and nativesdk recipes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/pip_install_wheel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> index 9f9feda6ee0..5b7e5cd7064 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -2,7 +2,7 @@ DEPENDS:append = " python3-pip-native"
>
>  def guess_pip_install_package_name(d):
>      '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')
> +    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
>
>  PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
>  PIP_INSTALL_DIST_PATH ?= "${B}/dist"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162423):
> https://lists.openembedded.org/g/openembedded-core/message/162423
> Mute This Topic: https://lists.openembedded.org/mt/89406689/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000be991205d8f009a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 26, 2022 at 12:21 AM Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This fixes the name for native and nativesdk recipes.=
<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/pip_install_wheel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass<br>
index 9f9feda6ee0..5b7e5cd7064 100644<br>
--- a/meta/classes/pip_install_wheel.bbclass<br>
+++ b/meta/classes/pip_install_wheel.bbclass<br>
@@ -2,7 +2,7 @@ DEPENDS:append =3D &quot; python3-pip-native&quot;<br>
<br>
=C2=A0def guess_pip_install_package_name(d):<br>
=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<a href=3D"https://www.python.org/dev/pe=
ps/pep-0491/#escaping-and-unicode&#39;" rel=3D"noreferrer" target=3D"_blank=
">https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode&#39;</a>&#=
39;&#39;<br>
-=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or d.getVar(&#39;PN=
&#39;)).replace(&#39;-&#39;, &#39;_&#39;)<br>
+=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or d.getVar(&#39;BP=
N&#39;)).replace(&#39;-&#39;, &#39;_&#39;)<br>
<br>
=C2=A0PIP_INSTALL_PACKAGE ?=3D &quot;${@guess_pip_install_package_name(d)}&=
quot;<br>
=C2=A0PIP_INSTALL_DIST_PATH ?=3D &quot;${B}/dist&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162423): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162423" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162423</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89406689/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89406689/924729</a><br>
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

--000000000000be991205d8f009a9--

