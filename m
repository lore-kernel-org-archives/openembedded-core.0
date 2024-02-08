Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9E8C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 04:00:43 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.10628.1707364833580712668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 20:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNW6JPSi;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-604819d544cso15004017b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 20:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707364833; x=1707969633; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yOitn15mTemjAqZ38M4DocSyXrSCYvwyjLsmHLslR/Q=;
        b=RNW6JPSiv/yxVNs3QJfnfdoSrvTHiGX2GmAP1DZJat4M3qto4/yRGW9t1R3cN6eGYY
         o4f0vpLGEHjIendAGWCn3VB0cMs16NCGHVKcpfn6snZvH5Cgvc6fctvOy6BDW/Wj80rT
         yoevlVB2PvLCe5ZDuZCb6ciBwzltdkdyNbSF3QyP8uec+NCpBvPmmfq9+II9h7k4hhyk
         r94mZjOslZ9AzQmsnCdZ1uheKdkBbfn3YMaYiZRws3SsNp8pSIhe6p68NxkR9B/fef9H
         Yc+kKqj1w+au0wZqKhzfDFbLGbC0XXbXACwxDgluF1MXHf44Qty+lHrAdgNCsgBYGAQ4
         0+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707364833; x=1707969633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOitn15mTemjAqZ38M4DocSyXrSCYvwyjLsmHLslR/Q=;
        b=lSLp/KxiL06Pm7gn7FhZ3UvNrHEUmzHMiPur0Yq83x0sNyEg15VosMyrCcLaUdT1MY
         Wkf2GNuUpxMgAklD6mC9RJPIGErMHXC0A+rFKvUpAFnsig/C2/+shJ4429LutQ5Z55W3
         FoPqGS3sgzi14KszmK09o+yw+DNKctILo2IRfAQngWXHMTPzsXceH6SNDRFA5a26LYSE
         FKIrXncxXxribzrkXrK+NNY257djjfAPNfmdouC2HE87rZLMDDy8PIrHKwOCOt2gXISO
         RVOtbat8Nh3ZUFThKSrwrgQ6GeSrBX4rDMk07d7ShEPhUxD2s1XAOmNVZew0mW4Y0xGE
         x+tA==
X-Gm-Message-State: AOJu0YwsmbvG8DukgKwLGIwzzMBeIKRJ5fMV9gYWRSVOf1bQmz6wFkj7
	V61GpyPbiqJLZeqddfRNRFW/o5JibCkIMKLOhUFOVIPiBYq0MGQMW9CjicHeEETEpVld677XWSM
	HoaGBprBviGAxpm/vfeS8NWt6Jv0NFR6+
X-Google-Smtp-Source: AGHT+IF8kR3M2vM0nAcANgav2f25kiAIEQXlFjFuPWoJdAXk4mI5WCAlqbPHI8vqih5llda121/XM2np8xFw3ns/w7Y=
X-Received: by 2002:a05:6902:218f:b0:dc6:a8c6:c9e5 with SMTP id
 dl15-20020a056902218f00b00dc6a8c6c9e5mr8849723ybb.26.1707364832541; Wed, 07
 Feb 2024 20:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20240207165219.825246-1-vikas.katariya@arm.com> <20240207165219.825246-2-vikas.katariya@arm.com>
In-Reply-To: <20240207165219.825246-2-vikas.katariya@arm.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 7 Feb 2024 20:00:21 -0800
Message-ID: <CANx9H-BnSFGhJLCWgof7mCLfTPMBWn9rdVRYb2vtuoTnmAWc-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
To: vikas.katariya@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005880ff0610d6daca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 04:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195099

--0000000000005880ff0610d6daca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 8:52=E2=80=AFAM <vikas.katariya@arm.com> wrote:

> From: Vikas Katariya <vikas.katariya@arm.com>
>
> Python3 module netrc is required by bmap-tools (v3.7), therefore add
> `python3-misc` as runtime dependency.


https://github.com/search?q=3Drepo%3Aintel%2Fbmap-tools%20netrc&type=3Dcode

We could arguably create a python3-netrc sub package to minimize the added
files.

>
> Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> index 9bbd7d51c8..ffb6ccfe99 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> @@ -24,7 +24,7 @@ PV =3D "${BASEVER}+git"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  # Need df from coreutils
> -RDEPENDS:${PN} =3D "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl python3-six coreutils"
> +RDEPENDS:${PN} =3D "python3-core python3-compression python3-misc
> python3-mmap python3-setuptools python3-fcntl python3-six coreutils"
>
>  inherit setuptools3
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195074):
> https://lists.openembedded.org/g/openembedded-core/message/195074
> Mute This Topic: https://lists.openembedded.org/mt/104222189/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005880ff0610d6daca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 7, 2024 at 8:52=E2=80=AFAM &lt;<a href=3D"mailt=
o:vikas.katariya@arm.com">vikas.katariya@arm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">From: Vikas Katariya &lt;<a href=3D"mailto:vikas.katariya@ar=
m.com" target=3D"_blank">vikas.katariya@arm.com</a>&gt;<br>
<br>
Python3 module netrc is required by bmap-tools (v3.7), therefore add<br>
`python3-misc` as runtime dependency.</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div><a href=3D"https://github.com/search?q=3Drepo%3Ai=
ntel%2Fbmap-tools%20netrc&amp;type=3Dcode">https://github.com/search?q=3Dre=
po%3Aintel%2Fbmap-tools%20netrc&amp;type=3Dcode</a></div><br></div><div dir=
=3D"auto">We could arguably create a python3-netrc sub package to minimize =
the added files.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)"><br>
Signed-off-by: Vikas Katariya &lt;<a href=3D"mailto:vikas.katariya@arm.com"=
 target=3D"_blank">vikas.katariya@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a> b/meta/re=
cipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">bmap-tools_git.bb</a><br>
index 9bbd7d51c8..ffb6ccfe99 100644<br>
--- a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a><br>
+++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a><br>
@@ -24,7 +24,7 @@ PV =3D &quot;${BASEVER}+git&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
=C2=A0# Need df from coreutils<br>
-RDEPENDS:${PN} =3D &quot;python3-core python3-compression python3-mmap pyt=
hon3-setuptools python3-fcntl python3-six coreutils&quot;<br>
+RDEPENDS:${PN} =3D &quot;python3-core python3-compression python3-misc pyt=
hon3-mmap python3-setuptools python3-fcntl python3-six coreutils&quot;<br>
<br>
=C2=A0inherit setuptools3<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195074): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195074" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195074</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104222189/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104222189/924729</a><br>
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

--0000000000005880ff0610d6daca--

