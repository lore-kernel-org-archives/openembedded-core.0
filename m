Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1DBC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 01:26:32 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web09.3505.1634174791538293743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 18:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5/wPlQ3;
 spf=pass (domain: gmail.com, ip: 209.85.166.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id x1so1742320ilv.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Z6j6TRxhLE0SvabaRvfLgoNJjQpRZlpozro7SocAiA=;
        b=F5/wPlQ36bbxW61cENApBzLQDWB+nPP7KmWzDzdzmWwbQhO/jAsq4ls5/qtwA75XWR
         S9okSXbYir8/Hj5xpFeIrf82UT+NnC7WsgY/nxCEgadldnCeUspWy8ZsmPdsGI7bdUv4
         sxRO8T3RuQJo0VZ7baQiQNrWnlsgBuqwmAg3DRvoUryZW36pokvNU4d0a7si5SmWPjBB
         FwI0OOaGUn1G0BXPa7bbjZx1kaFj/8UjoslCi77pIhA9hQHuyvGLJnErBrl9x34oJE8/
         Ddq/ECEWp+6qocyafft3k4EQYpKJ/ssPnQxs5/U5R4Kr/aiQ+CA9ZCbQ029/EUyJq4s3
         8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Z6j6TRxhLE0SvabaRvfLgoNJjQpRZlpozro7SocAiA=;
        b=5ngRMSBadOYPvADxgz1osiaryO2/Rms5hfhr599XEtwfa3/4lBATpP+P9LCHQqnX61
         xDYQMVcw9rYQMMgbIUXq5+qm5Qw54Hy/HLTzqiL8IOicoZaZywXaM4qDVJqbk9I6IJGU
         f9MZuerg4psy25N0qd4oTP6eC8A3CG60cBSWmqumdKyzU5JWhpCqhcwSjElydlf4/3L7
         eB+Yn4zfcM0/FVi4EuKgjy4+CJaztTSS5+Ay/EHyr4JVV5gH0MPU99dI3W2SYR+55uh8
         TSY33OIWowk4OAdQgMoHCYvgO7c3FFyhc8sWw6VzzDIzzmkOfGe8jzY4s9bp9BKjUzZK
         0IKQ==
X-Gm-Message-State: AOAM530/r3JdWML2A8jc2dddLzM/LQsQw1QFreKfU2Cbt0ejQXCYr4a5
	hzUHcN04rmghBkq8c8PoIIueKXvC29CQTsUSXic=
X-Google-Smtp-Source: 
 ABdhPJx6YNuzbHjzBm5wNWweb0M4gYEEmcDXHbPeV3Cgo9o9MPD4r1djxUv+MyIPudSyaMTME4fTuSSFyiE51EpQD/k=
X-Received: by 2002:a92:1e11:: with SMTP id e17mr199265ile.196.1634174790848;
 Wed, 13 Oct 2021 18:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <1634206964-7722-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1634206964-7722-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 13 Oct 2021 18:26:20 -0700
Message-ID: 
 <CANx9H-Ctq0z6jZdPd02vFGOkKK+bBtiLYKSxMKzRYyv=EvkDhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-zipp: upgrade 3.5.0 -> 3.6.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e8d3f305ce45f7f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 01:26:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156928

--000000000000e8d3f305ce45f7f3
Content-Type: text/plain; charset="UTF-8"

Already sent a patch:
https://lists.openembedded.org/g/openembedded-core/message/156855


On Wed, Oct 13, 2021 at 6:23 PM zhengruoqin <zhengrq.fnst@fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../python/{python3-zipp_3.5.0.bb => python3-zipp_3.6.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-zipp_3.5.0.bb =>
> python3-zipp_3.6.0.bb} (84%)
>
> diff --git a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
> b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/python/python3-zipp_3.5.0.bb
> rename to meta/recipes-devtools/python/python3-zipp_3.6.0.bb
> index d6f4676542..c98bc7a3a4 100644
> --- a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>
> -SRC_URI[sha256sum] =
> "f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c4f9a645f91d579bf0c4"
> +SRC_URI[sha256sum] =
> "71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832"
>
>  DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156926):
> https://lists.openembedded.org/g/openembedded-core/message/156926
> Mute This Topic: https://lists.openembedded.org/mt/86303273/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e8d3f305ce45f7f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Already sent a patch:</div><div dir=3D"auto"><div><a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/156855">http=
s://lists.openembedded.org/g/openembedded-core/message/156855</a></div><br>=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Oct 13, 2021 at 6:23 PM zhengruoqin &lt;<a href=3D"mailto:zhen=
grq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailt=
o:zhengrq.fnst@fujitsu.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&=
gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-zipp_3.5.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-zipp_3.5.0.bb</a> =3D&gt; <a href=3D"http://py=
thon3-zipp_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.6.=
0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-zipp_3=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.5.0.bb</a> =3D=
&gt; <a href=3D"http://python3-zipp_3.6.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-zipp_3.6.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.5.0.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-zipp_3.6.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.5=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.5.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.6.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.6.0.bb</a><br>
index d6f4676542..c98bc7a3a4 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.5.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.6.0.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/jaraco/zip=
p" rel=3D"noreferrer" target=3D"_blank">https://github.com/jaraco/zipp</a>&=
quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7a7126e068206290f3fe9=
f8d6c713ea6&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c=
4f9a645f91d579bf0c4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;71c644c5369f4a6e07636f0aa966270449561fcea2e3d=
6747b8d23efaa9d7832&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${PYTHON_PN}-setuptools-scm-native&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156926): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156926" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156926</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86303273/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
86303273/924729</a><br>
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

--000000000000e8d3f305ce45f7f3--

