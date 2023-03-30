Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFEFC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:16:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.41868.1680218181219957109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=JGz828aY;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v1so20685702wrv.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680218179; x=1682810179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1gpZ+NtydbKoDyTELr01E3wSJSKcGhj6vwFuy27gWg=;
        b=JGz828aYIpV35ymOOP93Qar0q/iHXyHY9uMClnGimYDGQ6NZasZZcN1sm+Pz2idjVR
         cB9Wx26T2vXjXKgCrPQirNEy3THK7ItDDC7DG6shWKHOM9zJUxSEO5IoRyCNOvPPKSnl
         YS7oJuidi6yPvoEhpL1HsIIBmKBuyjw2+Yj+/YlDHUx8Y8q76N2Woii64EvK4ehuqfYs
         2c7cnswuk2K1fII4a+kSEpomnOx0tqTj9F1bGs8ptbMzJ6nEEkaHDDz7OzyeitSW061b
         Ivc1+4McSxEYr/lXy7ao0BEcBD4J+z5k8coxa15xderPtqpsUC+3iUygeCkw2LdwFi9n
         HmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218179; x=1682810179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1gpZ+NtydbKoDyTELr01E3wSJSKcGhj6vwFuy27gWg=;
        b=c62ACAgwCeuby9rj/Ry5GqFVUmFXs1ybnWadmQ+ovT12gWbMve+85N86IOu/4XdhEt
         kPnjTF0Lql9mYWJQPK5gYHS4o5zo3tXWu7NlAdNWPeNVbTO9Wn+0Uks8YODLKKYZ+9Pb
         ZWbUOH8Z0Ik3t7whS1P7UtQ/08oEN8bpxg7A7hrDnKFah7YI8Dp7llwaHAva/Y2ua6LF
         pcb9kDauCsnM1NGgmlO4r9RJ2ExGBc3IhspsO0yPLycEbTAK0GRkkxA7mB8ERuK+fkvF
         8PLrVgzxDuncPYMia20nxapyxciP3z+zx/Ihnfa/515/eBK7wRmSN88DncJcx5JP8r2C
         fGPQ==
X-Gm-Message-State: AAQBX9cYTyM4AmvJ6L6N5HKvy8anLhzuK251135JC2vmUTx/Q+bS2BCW
	fHFFkEXFcxrEy9CGrEqqvrOXJU6YIl9xtZy7pqo=
X-Google-Smtp-Source: AKy350YvGKH1m/4fcQix2A6H/rE60GOGTV4oMPM51ri/BjsKRV6Rbe2Hy6eFZKI1WONIx637USJYyg1oVOruS77x32k=
X-Received: by 2002:a5d:5142:0:b0:2e4:cbfe:da51 with SMTP id
 u2-20020a5d5142000000b002e4cbfeda51mr772781wrt.1.1680218179242; Thu, 30 Mar
 2023 16:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230330224404.51167-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230330224404.51167-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 Mar 2023 01:16:03 +0200
Message-ID: <CA+chaQfbGEFeADX9oxo34RCL8Ffb7QXOHpvN6g6aNxv26nW+Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/loader: Ensure module names don't contain
 uppercase characters
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b810c305f826472a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179376

--000000000000b810c305f826472a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've similar one locally, but this one works for me as well.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Fri, Mar 31, 2023 at 12:44=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Python modules aren't supposed to have uppercase characters in their name=
s
> according to python conventions. We have regexs in the code which work
> on that assumption too. Rather than showing errors under some filtering
> situations, make it clear and error if a problematic name is seen.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/core/loader.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
> index f25b5970e93..d12d5a055cc 100644
> --- a/meta/lib/oeqa/core/loader.py
> +++ b/meta/lib/oeqa/core/loader.py
> @@ -316,6 +316,9 @@ class OETestLoader(unittest.TestLoader):
>                                    module_name_small in self.modules) \
>                                 else False
>
> +        if any(c.isupper() for c in module.__name__):
> +            raise SystemExit("Module '%s' contains uppercase characters
> and this isn't supported. Please fix the module name." % module.__name__)
> +
>          return (load_module, load_underscore)
>
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179375):
> https://lists.openembedded.org/g/openembedded-core/message/179375
> Mute This Topic: https://lists.openembedded.org/mt/97962405/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b810c305f826472a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve similar one locally, but this one works for me as=
 well.<div><br></div><div>Acked-by: Martin Jansa &lt;<a href=3D"mailto:Mart=
in.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 31, 202=
3 at 12:44=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Python modules aren&#=
39;t supposed to have uppercase characters in their names<br>
according to python conventions. We have regexs in the code which work<br>
on that assumption too. Rather than showing errors under some filtering<br>
situations, make it clear and error if a problematic name is seen.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oeqa/core/loader.py | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py<br=
>
index f25b5970e93..d12d5a055cc 100644<br>
--- a/meta/lib/oeqa/core/loader.py<br>
+++ b/meta/lib/oeqa/core/loader.py<br>
@@ -316,6 +316,9 @@ class OETestLoader(unittest.TestLoader):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module_name_small in se=
lf.modules) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else False<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if any(c.isupper() for c in module.__name__):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise SystemExit(&quot;Module &#=
39;%s&#39; contains uppercase characters and this isn&#39;t supported. Plea=
se fix the module name.&quot; % module.__name__)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (load_module, load_underscore)<br>
<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179375): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179375" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179375</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97962405/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97962405/3617156</a><br>
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

--000000000000b810c305f826472a--

