Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB91CCFA0D
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 02:54:12 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6402.1762397648779678859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 18:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEh1JKh1;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63f97c4eccaso550488d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 18:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762397648; x=1763002448; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1RfCSJNa54pWe1mJHsFO+qqNJ8Nh1T8vI4s0I/viBNE=;
        b=MEh1JKh1dIhSj8t6VfnhCGz2afMXiYl02I+cXkeLPkyOK6xMLCd6IUvRC83dlcbHFa
         Ua7hJgbyazLrfzwUeEiLZfblT9KTEfy5CrMKWI8IvT4P8r8ZJuajF3yGIHdw/o8Sw0PZ
         tKifzLuzQZvxkGEnfkvDBi6WMDZiWEsxx7NkeSahx3yD6D/bWNpmcNhNKKXx1/TY0YrF
         0W0uW5mKI0V/SKd/qC7DVEUNhK507jycYlGftynpzud1k5r3JPUf/Ex51kbE+4vL8gKQ
         Cb8Bu0utp+vx9uGv4aXgU2BZxsLxtWrkqm8Xarjj+s9oNHQZgeA9RbUyaa+wn1fVO4fO
         tzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762397648; x=1763002448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RfCSJNa54pWe1mJHsFO+qqNJ8Nh1T8vI4s0I/viBNE=;
        b=MJ5JRSY24IATRi32oLfheNifHShAQx+nQJcPATP3amy4jySauQPjW/ShVklSNJLguP
         RRXIMQlhjYOYTwkuTBa9ukhdvPkfBHwyGVzWyWSyy2xLLj+fi2zK0wxN8gmTlxuBI1y2
         Z5e+656zutaE2NUN4e1oPt0h529qMPpPJ6OUuGWciDXw7DwjVlEuLMkEgEAXaLlNcyHA
         xGSOmhK6+FqCSqg2ccs315Jtaa+YjkwOJrRBvgQTuYCaL1mD1cUSet/L0pYeR2ljX3+h
         yjb9Pk9lsFBeheUotn99HxXOBEUlejyvfYPJsPOAvnGigbbwxWOMDJmQgUI6l185Iv65
         W6sA==
X-Gm-Message-State: AOJu0YykIRfDUcs/Ds7OJMB26l3yuNewUZIaW4HVOUjlPXkk/A6WOVpD
	Vodr4Ed6f6tGyyp9QBLi6S0nzjzIqIiIE61SXq7Q+iof7GH03Ec4z6xvNP4HZt3zJ2bLYP4l2Fn
	4571nFvxKqE14s3zo1nUZXL5tRtXplYk=
X-Gm-Gg: ASbGncs7ykDLrhnl7fLfXlD+1QM7jkWnaSyR97AR/RNhtDyTzEM7ULaV6TAAUYtRCfc
	5vDBqkO6ts8QiUXYDSlKAMtg681RbhoOsmHOZo1lqUVTNznZp4b5HvUStgOhXPOo26AankwmNi8
	OuXnNk1sx23Qt2zk0xXoOVqjG/lVlbmT55JTOBhAMb/0rvboE08bXWAZ3SH/tryUK4og9W7ge3N
	s0QnvYX5/zeFTqMxhl9PjLo8zLasVPkrWgePHz9pxgkP696PyIZg2vpcnwTxmOe7Fj2Ew7k9mlK
	2CUMW212ts47mZqd+laNYJg7qXrNwAOGTVfZ6tHyD3Hs2Q5yDxxEtOYh/mDQjDpi5upQP1Q=
X-Google-Smtp-Source: AGHT+IGQ43D6KC4ITpfA79wGb7MtVZgdOqygAEAB8YWDTQJXg1IDvQD6jfVJiA2mDxQin2dlZi2GOXK79LfpXZ1czCM=
X-Received: by 2002:a05:690e:419c:b0:63f:b23c:275d with SMTP id
 956f58d0204a3-63fd3551d11mr4414456d50.43.1762397647754; Wed, 05 Nov 2025
 18:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20251105234712.446-1-wangmy@fujitsu.com> <20251105234712.446-28-wangmy@fujitsu.com>
In-Reply-To: <20251105234712.446-28-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Nov 2025 18:53:41 -0800
X-Gm-Features: AWmQ_bnUHjIn7Eg0ye_uW49YZ9xKakKGknX0Yg9FjMqo0ulDnlQeoQmja0pi0K0
Message-ID: <CAMKF1spFG32A+qspX=jxAXPr3cgK1CepExW-SkhN=r56NAMuZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 28/29] libedit: upgrade 20250104-3.1 -> 20251016-3.1
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bf57d50642e42dbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 02:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225962

--000000000000bf57d50642e42dbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 3:48=E2=80=AFPM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{libedit_20250104-3.1.bb =3D> libedit_20251016-3.1.bb}       | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-devtools/libedit/{libedit_20250104-3.1.bb =3D>
> libedit_20251016-3.1.bb} (87%)
>
> diff --git a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
> b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
> similarity index 87%
> rename from meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
> rename to meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
> index cad24d8d65..39dbf432b6 100644
> --- a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
> +++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
> @@ -13,13 +13,12 @@ inherit autotools
>  SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz \
>             file://stdc-predef.patch \
>            "
> -SRC_URI[sha256sum] =3D
> "23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac"
> +SRC_URI[sha256sum] =3D
> "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
>
>  # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
>  CACHED_CONFIGUREVARS +=3D "ac_cv_path_NROFF=3D/bin/false"
>
>  # remove at next version upgrade or when output changes
> -PR =3D "r1"
>  HASHEQUIV_HASH_VERSION .=3D ".1"
>

Drop all the three lines above.


>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225958):
> https://lists.openembedded.org/g/openembedded-core/message/225958
> Mute This Topic: https://lists.openembedded.org/mt/116144938/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bf57d50642e42dbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, =
2025 at 3:48=E2=80=AFPM wangmy via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lis=
ts.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.co=
m</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://libedit_20250104-3.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libedit_20250104-3.1.bb</a> =3D&gt; <a href=3D"http://libed=
it_20251016-3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20251016-3=
.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/libedit/{<a href=3D"http://libedit_20250=
104-3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20250104-3.1.bb</a=
> =3D&gt; <a href=3D"http://libedit_20251016-3.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libedit_20251016-3.1.bb</a>} (87%)<br>
<br>
diff --git a/meta/recipes-devtools/libedit/<a href=3D"http://libedit_202501=
04-3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20250104-3.1.bb</a>=
 b/meta/recipes-devtools/libedit/<a href=3D"http://libedit_20251016-3.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libedit_20251016-3.1.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-devtools/libedit/<a href=3D"http://libedit_2025010=
4-3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20250104-3.1.bb</a><=
br>
rename to meta/recipes-devtools/libedit/<a href=3D"http://libedit_20251016-=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20251016-3.1.bb</a><br=
>
index cad24d8d65..39dbf432b6 100644<br>
--- a/meta/recipes-devtools/libedit/<a href=3D"http://libedit_20250104-3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libedit_20250104-3.1.bb</a><br>
+++ b/meta/recipes-devtools/libedit/<a href=3D"http://libedit_20251016-3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libedit_20251016-3.1.bb</a><br>
@@ -13,13 +13,12 @@ inherit autotools<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.thrysoee.dk/editline/$%7BBP%7=
D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.thrysoee.dk/editl=
ine/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://stdc-predef.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;23792701694550a53720630cd1cd6167101b5773adddc=
b4104f7345b73a568ac&quot;<br>
+SRC_URI[sha256sum] =3D &quot;21362b00653bbfc1c71f71a7578da66b5b5203559d431=
34d2dd7719e313ce041&quot;<br>
<br>
=C2=A0# configure hardcodes /usr/bin search path bypassing HOSTTOOLS<br>
=C2=A0CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_NROFF=3D/bin/false&quot;<b=
r>
<br>
=C2=A0# remove at next version upgrade or when output changes<br>
-PR =3D &quot;r1&quot;<br>
=C2=A0HASHEQUIV_HASH_VERSION .=3D &quot;.1&quot;<br></blockquote><div><br><=
/div><div>Drop all the three lines above.=C2=A0</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225958): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225958" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225958</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116144938/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116144938/1997914</a><br>
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

--000000000000bf57d50642e42dbf--

