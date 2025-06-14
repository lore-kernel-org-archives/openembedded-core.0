Return-Path: <paulrajsandeep30@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C669C7114A
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 20:39:29 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.17044.1749933567603565720
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 13:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWER1JS3;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: paulrajsandeep30@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so6202741a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749933566; x=1750538366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0OdKhcdX/Ld6/B+nz9FudFYRAeeXiuopDkfggmHtu4c=;
        b=cWER1JS3uKPJmm57QQuRIFVZFO9TdrnCMh1h0foe6aqj3rSQWJI83fxU+2Cm/O+Ujn
         SMaWG84P7nOIeTjS/SXfmssnJO/e+1Ehg2oqxXu9Z23aJj+U4ZV7iP9DnJt4RG2wDj7m
         Wtu6lKpTWx6xA6NQ0+9QzMnVVYfZXU0mxBnQOc1qcirVgEBHfK+f0XIDGnlTiMgHu/Zk
         7S9QPlISewSNaM7W3qsQ3GQiMmfDpwB4J/eHutA7EGfSNkGpxdL9kIMTMYvMebJITY6s
         93Wgts2+fY72dQUJI74GhGw1q4yR8lpLUsGoKbl2pXslkFBhQUudkvxUIAQVRuSxBEuz
         7YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749933566; x=1750538366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OdKhcdX/Ld6/B+nz9FudFYRAeeXiuopDkfggmHtu4c=;
        b=Cj/ma5bh2NCBM4Xc0yVuSv48jDr/JEHtk8CyfzDk4qEyumoSWdoBW95/3WPepJ8CON
         hd29p0bMXL7bg5xALTrL96JoOwh5dMN/zQRS0f7Lra9c7Rv98E7MSkkloC4CitZuhMD1
         1+q+rAOGcgoRgCEp4W/60HRdud70UpKEKRBLPg/eabMkGOFVfvjiYaKu3LhOJTmFkQ9e
         zTi8oPBwah7aGiHR1DFvOpH06qydGD2bOqmSK78JgwcLMyYN7p4FOgLOOXTZFViIpXdq
         qAkVLASTF/btq71VeXTfAdcGzCvVD/rUtxLEgX31cBHH+zIj5j5odnexs3QGjEh1z18u
         J8gQ==
X-Gm-Message-State: AOJu0YzZ29MnAjX4mKn1SNW0CCIgueAJzAyvvGfwQ/7eiBU902XeXcDq
	HFSAxqTPHycWWmO/azPLMaI4PEkM7wVkkVNwk3e8Ry9yItROSWVmJ28/iBwvApu/S1XjuydLbjF
	4/1oNfz1xrcFe8w5sKnpcxak+e1qqOD4/Pg==
X-Gm-Gg: ASbGncsvhyrzkkqhW6oLz58IiMDTi5ylh2CARrp2U/R9eHPW9aKeP+G8ZWUBw1t1aL6
	HKmmbWtaPZJSRLD0r8t3/wDyoq9s90us877mbh1795W4zTAcKfUbSjRrU7IIngdyx54TvvK1msf
	e6Hq4em1n5dBEkIZylRlYlprvgSAaZ/firQAmLzEaFxaQ=
X-Google-Smtp-Source: AGHT+IGu93GP+KkLLxC94zvvxmBww60zajR1g64jAao9oosD/cWo320pRgX+YtiZmsHlHY1U0QKpiPD5ZTdhV3sU8Ec=
X-Received: by 2002:a17:907:e8d:b0:ade:42a7:dad2 with SMTP id
 a640c23a62f3a-adfad5c7513mr353525966b.33.1749933565415; Sat, 14 Jun 2025
 13:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250614203340.11007-1-setairidis@gmail.com>
In-Reply-To: <20250614203340.11007-1-setairidis@gmail.com>
From: Sandeep Paulraj <paulrajsandeep30@gmail.com>
Date: Sat, 14 Jun 2025 13:39:13 -0700
X-Gm-Features: AX0GCFtQt35YLwti3jJLtXjiob1iqRNtsRA1aD8Lm2QhjoSRDc2MUmoABt22kUc
Message-ID: <CAA7AJv7S7ZuAaAoBZJDut33U4Q1FvkCODZ0V+VUYGu=_LuaWfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Rename systemd_v255.21 to systemd_255.21
To: setairidis@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c13bc06378e28a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 20:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218643

--0000000000008c13bc06378e28a4
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 14, 2025, 1:33 PM Savvas Etairidis via lists.openembedded.org
<setairidis=gmail.com@lists.openembedded.org> wrote:

> Pumped PE property to two, since this is not a version bump
> but a rename. The recipe was accidentally renamed with a 'v'
> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>
> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> ---
>  .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb}
> (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb
> b/meta/recipes-core/systemd/systemd_255.21.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_v255.21.bb
> rename to meta/recipes-core/systemd/systemd_255.21.bb
> index bb9dc3da33..aee677bc87 100644
> --- a/meta/recipes-core/systemd/systemd_v255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -2,7 +2,7 @@ require systemd.inc
>
>  PROVIDES = "udev"
>
> -PE = "1"
> +PE = "2"
>
>  DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218642):
> https://lists.openembedded.org/g/openembedded-core/message/218642
> Mute This Topic: https://lists.openembedded.org/mt/113646285/4454772
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> paulrajsandeep30@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008c13bc06378e28a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 14, 2025, 1:33 PM Savva=
s Etairidis via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;setairidis=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Pumped PE property to two, since this is not a version bum=
p<br>
but a rename. The recipe was accidentally renamed with a &#39;v&#39;<br>
prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.<br>
<br>
Signed-off-by: Savvas Etairidis &lt;<a href=3D"mailto:setairidis@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">setairidis@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../systemd/{<a href=3D"http://systemd_v255.21.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">systemd_v255.21.bb</a> =3D&gt; <a href=3D"htt=
p://systemd_255.21.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">syst=
emd_255.21.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_v255.21.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_v255.21.bb</a> =
=3D&gt; <a href=3D"http://systemd_255.21.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">systemd_255.21.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_v255.21.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_v255.21.bb</a> b/=
meta/recipes-core/systemd/<a href=3D"http://systemd_255.21.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">systemd_255.21.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_v255.21.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_v255.21.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_255.21.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd_255.21.bb</a><br>
index bb9dc3da33..aee677bc87 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_v255.21.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">systemd_v255.21.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_255.21.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">systemd_255.21.bb</a><br>
@@ -2,7 +2,7 @@ require systemd.inc<br>
<br>
=C2=A0PROVIDES =3D &quot;udev&quot;<br>
<br>
-PE =3D &quot;1&quot;<br>
+PE =3D &quot;2&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;gperf-native libcap util-linux python3-jinja2-nativ=
e&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218642): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218642" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/218642</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113646285/445=
4772" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/113646285/4454772</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:paulrajsandeep3=
0@gmail.com" target=3D"_blank" rel=3D"noreferrer">paulrajsandeep30@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008c13bc06378e28a4--

