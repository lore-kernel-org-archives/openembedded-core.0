Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADC5C352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 10:04:33 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.7487.1669802671630677181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 02:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kbq+0C9u;
 spf=pass (domain: mvista.com, ip: 209.85.160.53, mailfrom: pdoshi@mvista.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-142b72a728fso20350034fac.9
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 02:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tXvWAVqfSAxk8aOMeWfvW/jSWvOYhHqOjjzhw1ztQzQ=;
        b=Kbq+0C9uvMhUzHyvy9WHCN+1ybVLOoBJUyme0a/RlkJRGklrN35HYrsmICJCBe9dJt
         Ww4kYJSAe+OGg5M/6wweciF1oqzXqCn+g7BLO7Wvdb0yFCppunkB7LodJGlCSzimyZJE
         zHAxwOcn0wVWr4Gha1jNLAp4axLRiQLO1H6nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXvWAVqfSAxk8aOMeWfvW/jSWvOYhHqOjjzhw1ztQzQ=;
        b=yTqFuf40XFJKNBC+8AkxLj65k9Htj1iVIVGv6Tm3ioQnM0FRnTbnoeHOUhzgQR8Oj6
         JY69d7voDSgZ1H0kBzOX0DVX+Ue8+UDKCxYy/v9hXX/3cs/WG0QOtA7DqT/CUV8w7PM8
         M2VuwftJdbdnkSB3upp8l12ozTOkKJTw3LHQb+y5jPA06jMert7V4wZtPY/xX4MM/vwM
         aU1U79SMN/AHybRJpG/egUMf4dGt4dsGv8aan4DOVeoujFh/FbwGYDSqcr6FLm8dV3RY
         ZSdFRPLrZ/Z4DenqbRXkxPczxKYIAxNd0bZVzlTMsDRD7f5GCcTjZd5lRDfFCppw7YwL
         77ag==
X-Gm-Message-State: ANoB5pm8dKK60/9uX542PagghiVvxuyF9R6nHhWK6CLrnhhcR6WawYAu
	tgYKCE7wnBjwf8goMJfIHCVFJYjJKx29gULSi/atRA==
X-Google-Smtp-Source: AA0mqf4iYf5KxXkqyIj4Ow+A7HKgUOaLJtPw/CEe3deN1FoCiLT0CyQSNnSxh+6uKRV3JD7QzFCL/vSQezHyLU/BkhM=
X-Received: by 2002:a05:6870:3d91:b0:132:f85d:8750 with SMTP id
 lm17-20020a0568703d9100b00132f85d8750mr36257132oab.95.1669802670568; Wed, 30
 Nov 2022 02:04:30 -0800 (PST)
MIME-Version: 1.0
References: <1727C313B44B44FD.25789@lists.openembedded.org>
In-Reply-To: <1727C313B44B44FD.25789@lists.openembedded.org>
From: Priyal Doshi <pdoshi@mvista.com>
Date: Wed, 30 Nov 2022 15:34:14 +0530
Message-ID: <CALeStTBzvhzNqJZWCUeL+1Y1y4cj8qAb98vz5nxKzAArT2B5tA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] tzdata: update to 2022f
To: pdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000064c2505eead3bb7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 10:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174000

--000000000000064c2505eead3bb7
Content-Type: text/plain; charset="UTF-8"

Hi,

Any update for this patch?

On Tue, Nov 15, 2022 at 6:21 PM pdoshi via lists.openembedded.org <pdoshi=
mvista.com@lists.openembedded.org> wrote:

> From: Priyal Doshi <pdoshi@mvista.com>
>
> Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc
> b/meta/recipes-extended/timezone/timezone.inc
> index d3c78e9..c4cdb77 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION = "base"
>  LICENSE = "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>
> -PV = "2022d"
> +PV = "2022f"
>
>  SRC_URI ="
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode
> \
>
> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata
> \
> @@ -14,6 +14,6 @@ SRC_URI ="
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
>
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>
> -SRC_URI[tzcode.sha256sum] =
> "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
> -SRC_URI[tzdata.sha256sum] =
> "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
> +SRC_URI[tzcode.sha256sum] =
> "e4543e90f84f91fa82809ea98930052fdbc13880c8a623ee3a4eaa42f8a64c15"
> +SRC_URI[tzdata.sha256sum] =
> "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
>
> --
> 2.7.4
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173278):
> https://lists.openembedded.org/g/openembedded-core/message/173278
> Mute This Topic: https://lists.openembedded.org/mt/95041812/7286089
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> pdoshi@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000064c2505eead3bb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Any update for this patc=
h?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Nov 15, 2022 at 6:21 PM pdoshi via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;pdoshi=3D<a href=3D"ma=
ilto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Priyal Doshi &lt;<a href=3D"mailto:pdoshi@mvista.com" target=3D"_blank"=
>pdoshi@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Priyal Doshi &lt;<a href=3D"mailto:pdoshi@mvista.com" target=
=3D"_blank">pdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/timezone/timezone.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-ext=
ended/timezone/timezone.inc<br>
index d3c78e9..c4cdb77 100644<br>
--- a/meta/recipes-extended/timezone/timezone.inc<br>
+++ b/meta/recipes-extended/timezone/timezone.inc<br>
@@ -6,7 +6,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0LICENSE =3D &quot;PD &amp; BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc679c9d6b02bc2757b3ea=
f8f53c43fba&quot;<br>
<br>
-PV =3D &quot;2022d&quot;<br>
+PV =3D &quot;2022f&quot;<br>
<br>
=C2=A0SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zones/repositor=
y/releases/tzcode$%7BPV%7D.tar.gz;name=3Dtzcode" rel=3D"noreferrer" target=
=3D"_blank">http://www.iana.org/time-zones/repository/releases/tzcode${PV}.=
tar.gz;name=3Dtzcode</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.iana.org/ti=
me-zones/repository/releases/tzdata$%7BPV%7D.tar.gz;name=3Dtzdata" rel=3D"n=
oreferrer" target=3D"_blank">http://www.iana.org/time-zones/repository/rele=
ases/tzdata${PV}.tar.gz;name=3Dtzdata</a> \<br>
@@ -14,6 +14,6 @@ SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zon=
es/repository/releases/tzcode$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D=
"_blank">http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar=
.gz</a><br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.iana.org/time-zone=
s" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-zones</a>&=
quot;<br>
<br>
-SRC_URI[tzcode.sha256sum] =3D &quot;d644ba0f938899374ea8cb554e35fb4afa0f7b=
d7b716c61777cd00500b8759e0&quot;<br>
-SRC_URI[tzdata.sha256sum] =3D &quot;6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90=
da1abcd82c9abcf2dc4f321de0&quot;<br>
+SRC_URI[tzcode.sha256sum] =3D &quot;e4543e90f84f91fa82809ea98930052fdbc138=
80c8a623ee3a4eaa42f8a64c15&quot;<br>
+SRC_URI[tzdata.sha256sum] =3D &quot;9990d71f675d212567b931fe8aae1cab7027f8=
9fefb8a79d808a6933a67af000&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173278): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173278" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173278</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95041812/7286=
089" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95041812/7286089</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:pdoshi@mvista.com" target=
=3D"_blank">pdoshi@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000064c2505eead3bb7--

