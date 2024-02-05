Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF0C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:50:57 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.66268.1707148254924842790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivZuWPCi;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60406da718aso45677557b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707148254; x=1707753054; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WcsdKUJuHpeXB6ajU7a815/XkmYC4NBiGJFHDf5rdu8=;
        b=ivZuWPCiZOVyZ6G8PjNeNgHzdKpxQL/a2Sfr+bdvivML4EO4Hfxm6JxUfDpDbCeLi1
         B+wP9c5tAlb8BmPI9KVmBHqnb4FZf3bUIb8SnjCxhcVByfSGK3Z0YVIoqt+zfMhNXH/3
         nJ97xNnY/R8XprH5069QXDcdZVG8DTx12mpGOfumdrXYkmA8gVSr7Dq5BJjCsWvs1LNr
         yDihd8hW+py2kbMVvlPUE1IzWnE0yzSS1BiWKr8sHt4wGWA3rzw6PJWQd6MGYZN8luUp
         aSqw2xFX7jfhQteZl4ylAsK+kuXIJRtjQGTVoakf55BDCOEDfXk+5biRcjnpjMAiX/nq
         XRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148254; x=1707753054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcsdKUJuHpeXB6ajU7a815/XkmYC4NBiGJFHDf5rdu8=;
        b=Pd4G7VA1QRZHhDCPJvNwOyGqtiClLo2okvBw5nywamJLAKK4a0KehLeZdqYY+dnTuo
         vcCuYkQAdin2Od0n601vcbkgUn5V/acaPNkK/7leMDWvajIAWdowgijFV2Ma2udlCrfi
         GM+Qg4Tmqr9N+KG0tD/94FSPhCDl7eFRUW/NZjYP76NAFydzNAWg0LYRQZNFp7W5SeG8
         fovXYFZZUjCsK+qBCVgJW+RPqlGPgFiZ2TJUrT9uI1pUOO2sFyswoqtJ5BTZ1iHmSEGT
         xHtNgAgD0wg1FMiUWnH5wK2vhQUlN+B+r+eVyH6WvD5LgR1SHBvUgBFDXVkbL2uNKP1d
         GvHQ==
X-Gm-Message-State: AOJu0Yx6hWYN/+K6+1CUIBr1s07146sM8Rq1ceLL0tckFH/2Ly+uEhPU
	DkEb2KPjTyWrDIMJ7P0PKFTJU1dWPb0LENdluor4IdLHTL16RrrGHKseVrLN7pY3uDXDbb9wEfO
	JuRbav34NtK0eQyKpvJ95MK4i++g=
X-Google-Smtp-Source: AGHT+IF22wZdgou/1sBBPo5pP9oEo6Y4ytNyl2Eq9WSWx+kAcsj7B1rxVxZk5JPYrRTbwo38dpNIDB/8HOOr5P0gemo=
X-Received: by 2002:a25:2e47:0:b0:dc5:f51e:6a60 with SMTP id
 b7-20020a252e47000000b00dc5f51e6a60mr8388729ybn.6.1707148253290; Mon, 05 Feb
 2024 07:50:53 -0800 (PST)
MIME-Version: 1.0
References: <1706833394-20114-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1706833394-20114-1-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 5 Feb 2024 07:50:42 -0800
Message-ID: <CANx9H-D7qLw1MmXD+wUFTNZJq+54e8jR0o=--SdLxwiJyP3UVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pytest: upgrade 7.4.4 -> 8.0.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003769ae0610a46d89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194951

--0000000000003769ae0610a46d89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is causing ptest failures in python3-attrs
https://autobuilder.yocto.io/pub/non-release/20240204-27/testresults/qemux8=
6-64-ptest/python3-attrs.log
https://github.com/python-attrs/attrs/issues/1233
https://github.com/python-attrs/attrs/actions/runs/7759031210/job/211621713=
67

On Thu, Feb 1, 2024 at 4:33=E2=80=AFPM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> #11842: Properly escape the reason of a skip mark when writing JUnit XML
> files.
> #11861: Avoid microsecond exceeds 1_000_000 when using log-date-format wi=
th
>  %f specifier, which might cause the test suite to crash.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pytest_7.4.4.bb =3D> python3-pytest_8.0.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-pytest_7.4.4.bb =3D>
> python3-pytest_8.0.0.bb} (93%)
>
> diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
> b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/python/python3-pytest_7.4.4.bb
> rename to meta/recipes-devtools/python/python3-pytest_8.0.0.bb
> index 18062c8fb8..994f6cbdaf 100644
> --- a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
> +++ b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "The pytest framework makes it easy to wr=
ite
> small tests, yet scal
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbd27e41b6550fe0fc45356d1d81ee=
37c"
>
> -SRC_URI[sha256sum] =3D
> "2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280"
> +SRC_URI[sha256sum] =3D
> "249b1b0864530ba251b7438274c4d251c58d868edaaec8762893ad4a0d71c36c"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194773):
> https://lists.openembedded.org/g/openembedded-core/message/194773
> Mute This Topic: https://lists.openembedded.org/mt/104110318/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003769ae0610a46d89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is causing ptest failures in python3-attrs</div>=
<div><a href=3D"https://autobuilder.yocto.io/pub/non-release/20240204-27/te=
stresults/qemux86-64-ptest/python3-attrs.log">https://autobuilder.yocto.io/=
pub/non-release/20240204-27/testresults/qemux86-64-ptest/python3-attrs.log<=
/a><br></div><div><a href=3D"https://github.com/python-attrs/attrs/issues/1=
233">https://github.com/python-attrs/attrs/issues/1233</a><br></div><div><a=
 href=3D"https://github.com/python-attrs/attrs/actions/runs/7759031210/job/=
21162171367">https://github.com/python-attrs/attrs/actions/runs/7759031210/=
job/21162171367</a><br></div><div><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 1, 2024 at 4:33=E2=80=AFPM wa=
ngmy via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujit=
su.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy=
@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
#11842: Properly escape the reason of a skip mark when writing JUnit XML fi=
les.<br>
#11861: Avoid microsecond exceeds 1_000_000 when using log-date-format with=
<br>
=C2=A0%f specifier, which might cause the test suite to crash.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-pytest_7.4.4.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pytest_7.4.4.bb</a> =3D&gt; <a href=3D"http:=
//python3-pytest_8.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyt=
est_8.0.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pytest=
_7.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.4.4.bb</a>=
 =3D&gt; <a href=3D"http://python3-pytest_8.0.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-pytest_8.0.0.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_=
7.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.4.4.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_8.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pytest_8.0.0.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7=
.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.4.4.bb</a><b=
r>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pytest_8.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_8.0.0.bb</a><br>
index 18062c8fb8..994f6cbdaf 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7.4.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.4.4.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_8.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_8.0.0.bb</a><br>
@@ -5,7 +5,7 @@ DESCRIPTION =3D &quot;The pytest framework makes it easy to=
 write small tests, yet scal<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbd27e41b6550fe0fc4535=
6d1d81ee37c&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc931074=
15332f50ce9e7994280&quot;<br>
+SRC_URI[sha256sum] =3D &quot;249b1b0864530ba251b7438274c4d251c58d868edaaec=
8762893ad4a0d71c36c&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194773): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194773" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194773</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104110318/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104110318/924729</a><br>
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

--0000000000003769ae0610a46d89--

