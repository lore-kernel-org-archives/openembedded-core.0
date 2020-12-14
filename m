Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.32948.1607942381081148981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=riujqj/K;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id r24so8698858vsg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3M7Q/bBzjSCusiVZ4mStk7/UgYG02402dkArppDT8HM=;
        b=riujqj/KQSIbELVS0PpN5vsOVllXfyDxyTmlmWMMSnmNGp4IbGTBETRFwe4j3vSQxl
         rDEKiLciV7hXgKcaGz2kxFs0aOUlQbswnkwJv1bEHbfPyvwvpLw84rhZl94QK9X+aat1
         DsozQ9M3AeRpfBpblrJLWKTycSBBKHnIMEBlgMn4/QoNq7y7CfjbCwAiLxXnSTXo1w04
         C2aLX3o0K6qOzXI1lpA5Q7rZ0KlGdgji4DIDo9RfsJQu5fBlCvnVtXK/g+lIO2jCkyFl
         PAq9jYZD2g+frTAwiALVF5TD5yLMBk00/rw8p5jCV88N/aPEYcdZBWMLYE2o/ikKnySA
         IwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3M7Q/bBzjSCusiVZ4mStk7/UgYG02402dkArppDT8HM=;
        b=qL/rKND7aBvglsBKzIbBS5eCb53iqd3JPWVY6cddOgD4vMhUWT5fZz67JwiW0CRSxx
         HovHrZ4CSxJ0WHKhdWxwOS6YnpP0gilucptNfdiboqR8E9jMACTvW3N9pFq9u+3bpQ4E
         qotC1+oNevSHV1OJas5T2z/u1ahlPid+XtpSiyyZBbgILGCS7rcGaDV5E+RrnST6oui+
         z8+O/J7bK23kDI81nkh+5zkKEfHnYW2yIZkLuI62/OomU/FIExdMPinmmHxVJZZURf4J
         8e21TaCq4EOXvOBXv2yFjjRe+Eh1qByNOrCi+7l+YKOhc/7ryPV3nBXyaBzDT+ZKLquR
         UEkw==
X-Gm-Message-State: AOAM530sbIpKRfL8t+IdrIShXmRQQiXZcGZihfL/f7KvLhgn+SIJy/AM
	UXeJhvgl167sRU472A5xoPDtb0xoXdmnk1gu3qA=
X-Google-Smtp-Source: ABdhPJxmDD4+MJPiYfc4i1hobKTMI8tveHGPA550rNMMdgfTxBQl8qY+rwXOUD9P2YJWSENUHL5vj7Qxzz8yA5FU7no=
X-Received: by 2002:a05:6102:319b:: with SMTP id c27mr22925833vsh.20.1607942380305;
 Mon, 14 Dec 2020 02:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20201214103248.2227-1-outbackdingo@gmail.com>
In-Reply-To: <20201214103248.2227-1-outbackdingo@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 14 Dec 2020 11:39:29 +0100
Message-ID: <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
To: Outback Dingo <outbackdingo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065c06705b66a42ec"

--00000000000065c06705b66a42ec
Content-Type: text/plain; charset="UTF-8"

Sorry, but you need to explain why the file from from ebtables (an optional
package from a 3rd party layer) takes precedence over file from netbase
(which is a core item).

Alex

On Mon, 14 Dec 2020 at 11:33, Outback Dingo <outbackdingo@gmail.com> wrote:

> ---
>  meta/recipes-core/netbase/netbase_6.2.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/netbase/netbase_6.2.bb
> b/meta/recipes-core/netbase/netbase_6.2.bb
> index a54d2e7764..262b2cf1bc 100644
> --- a/meta/recipes-core/netbase/netbase_6.2.bb
> +++ b/meta/recipes-core/netbase/netbase_6.2.bb
> @@ -19,5 +19,4 @@ do_install () {
>         install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
>         install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
>         install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
> -       install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
>  }
> --
> 2.20.1
>
>
> 
>
>

--00000000000065c06705b66a42ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, but you need to explain why the file from from=
 ebtables (an optional package from a 3rd party layer) takes precedence ove=
r file from netbase (which is a core item).</div><div><br></div><div>Alex<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, 14 Dec 2020 at 11:33, Outback Dingo &lt;<a href=3D"mailto:o=
utbackdingo@gmail.com">outbackdingo@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0meta/recipes-core/netbase/<a href=3D"http://netbase_6.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">netbase_6.2.bb</a> | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/netbase/<a href=3D"http://netbase_6.2.bb" r=
el=3D"noreferrer" target=3D"_blank">netbase_6.2.bb</a> b/meta/recipes-core/=
netbase/<a href=3D"http://netbase_6.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">netbase_6.2.bb</a><br>
index a54d2e7764..262b2cf1bc 100644<br>
--- a/meta/recipes-core/netbase/<a href=3D"http://netbase_6.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">netbase_6.2.bb</a><br>
+++ b/meta/recipes-core/netbase/<a href=3D"http://netbase_6.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">netbase_6.2.bb</a><br>
@@ -19,5 +19,4 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}=
/rpc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/protocols ${D}${sysco=
nfdir}/protocols<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/services ${D}${syscon=
fdir}/services<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/etc/ethertypes ${D}${sysc=
onfdir}/ethertypes<br>
=C2=A0}<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000065c06705b66a42ec--
