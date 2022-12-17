Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F27C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:28:10 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.5512.1671276481360041357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J1wN3T84;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1443a16b71cso6249808fac.13
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N56VWEifjmdSVTXUON5+Yc5QQeESw4kJUKCg0TBdSTk=;
        b=J1wN3T84yjAqdPqrdZayuAVd8PxAHG3L3Twu0XSe2txLZzMyAQ0X0ga+K/oFJt0Ika
         qAHp5/5scF00afm54Kkd7cG6VB9P6YmD4UhExVnYGUdsfJzhMvyrFZhGN7yKX+F6L2uU
         eHu4MnMqkoeCBwlJgfhGkqw7e6v5XeICl9Eec8Gk9AJ3vZ9N+xThnxs/YXv5VlZB0thL
         h7WOEeQvG6n1osyNerXT7Wo42rzRQwTKq0CKOQ+mnJHHvMvqifj3rtqzRw2GLrS9fzUY
         gAPGBIQwCsBqkYJaRmowlafBLdmfZElssXqp8XYwgCsaU7fdqOtxLn9fk7nClahrkThz
         J64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N56VWEifjmdSVTXUON5+Yc5QQeESw4kJUKCg0TBdSTk=;
        b=mALZ0QryPp5Rxr9GVzj3c/458NeFC7S9EN6yOgfe6gn57X4OUIPx3b+Cf2HYzdpOLu
         bQ6yUT2dJonbmDvwlxrQNtZdhq7K1xszLDC/WGco4nl7bhKDfAXxeGlis/bqwRoEgUQ0
         yOEXK7kxl5uuqfGkt+n0bGvb3stbqsQMI3cbSoRPKML+gxb2cDzMI+RDsv4uOj7yCyvk
         cmaIm1/Tq+n39zh6KGq5dCpAFUJKssPhb6jF3CDejCV1MFl9+MOw5h3rYfghReGuyzgQ
         kANOsEgEHEFbCdHReDBEeDk1LbQZCab5SmJpj4FO9ksy8N7L1211JLpece/9dem8Md+X
         iqRg==
X-Gm-Message-State: AFqh2kq97/Nfl2tScC9hR2Z5LVAhecwzkzdF2louycGH+XPFxgs6Z4+T
	4jrs2H1RfbiZgWZQ6rfQsJPmr8KQEBx+ersZg3tJG3Eg
X-Google-Smtp-Source: AMrXdXtw9kskGGAkqfMdcDFF9r/05Nhgdt1s5wugkLt5nvv/6NggORCiT59+eOqY3hBMmSAkGagy/dFSHcx6rXNlkME=
X-Received: by 2002:a05:6870:9d88:b0:144:ae94:6dd1 with SMTP id
 pv8-20020a0568709d8800b00144ae946dd1mr1207804oab.236.1671276480357; Sat, 17
 Dec 2022 03:28:00 -0800 (PST)
MIME-Version: 1.0
References: <173135C5CA37888A.22470@lists.openembedded.org>
In-Reply-To: <173135C5CA37888A.22470@lists.openembedded.org>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Sat, 17 Dec 2022 16:57:48 +0530
Message-ID: <CACpMEhN6D0bdzZL0b2ghX3zhyUgYG4gFGMHvjuQt7q2sVTaJ2Q@mail.gmail.com>
Subject: Re: [OE-Core][master][PATCH] curl: Correct LICENSE from
 MIT-open-group to curl
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eee94505f0046044"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174776

--000000000000eee94505f0046044
Content-Type: text/plain; charset="UTF-8"

ping

On Fri, 16 Dec, 2022, 1:04 pm Ranjitsinh Rathod via lists.openembedded.org,
<ranjitsinhrathod1991=gmail.com@lists.openembedded.org> wrote:

> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> LICENSE for curl is set to MIT-open-group which is wrong and proper
> license is 'curl'
>
> I check below link and the line "Curl and libcurl are licensed under
> the license below, which is inspired by MIT/X, but not identical." says
> that the license is identical to MIT but actual license is identical
> from the file "meta/files/common-licenses/curl"
> Link: https://curl.se/docs/copyright.html
>
> Also, I do not find the MIT-open-group license text in the entire
> source-code
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-support/curl/curl_7.86.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb
> b/meta/recipes-support/curl/curl_7.86.0.bb
> index ec8ce9fd28..f5e3e7235d 100644
> --- a/meta/recipes-support/curl/curl_7.86.0.bb
> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> @@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads,
> and more!"
>  HOMEPAGE = "https://curl.se/"
>  BUGTRACKER = "https://github.com/curl/curl/issues"
>  SECTION = "console/network"
> -LICENSE = "MIT-open-group"
> +LICENSE = "curl"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
>
>  SRC_URI = " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174731):
> https://lists.openembedded.org/g/openembedded-core/message/174731
> Mute This Topic: https://lists.openembedded.org/mt/95705818/6360406
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000eee94505f0046044
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, 16 Dec, 2022, 1:04 pm Ranjitsinh Rathod via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>, &lt;ra=
njitsinhrathod1991=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@=
kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</=
a>&gt;<br>
<br>
LICENSE for curl is set to MIT-open-group which is wrong and proper<br>
license is &#39;curl&#39;<br>
<br>
I check below link and the line &quot;Curl and libcurl are licensed under<b=
r>
the license below, which is inspired by MIT/X, but not identical.&quot; say=
s<br>
that the license is identical to MIT but actual license is identical<br>
from the file &quot;meta/files/common-licenses/curl&quot;<br>
Link: <a href=3D"https://curl.se/docs/copyright.html" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://curl.se/docs/copyright.html</a><br>
<br>
Also, I do not find the MIT-open-group license text in the entire<br>
source-code<br>
<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>=
&gt;<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.86.0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">curl_7.86.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.86.0.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">curl_7.86.0.bb</a> b/meta/rec=
ipes-support/curl/<a href=3D"http://curl_7.86.0.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">curl_7.86.0.bb</a><br>
index ec8ce9fd28..f5e3e7235d 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.86.0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">curl_7.86.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.86.0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">curl_7.86.0.bb</a><br>
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and=
 more!&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://curl.se/" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://curl.se/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/curl/curl/issues" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/curl/cur=
l/issues</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
-LICENSE =3D &quot;MIT-open-group&quot;<br>
+LICENSE =3D &quot;curl&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D190c51487259708330337=
1684954f238&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174731): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174731" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/174731</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95705818/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/95705818/6360406</a><br>
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
</blockquote></div>

--000000000000eee94505f0046044--

