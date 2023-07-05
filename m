Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BC8EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 07:45:14 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.11760.1688543107484916444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 00:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YfCTO1NA;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-579e212668fso6319397b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 00:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688543106; x=1691135106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/YBBqSDcWRDx5YEwGGSxcqG5asjrjQ+pKXyoN+gpXo=;
        b=YfCTO1NAj9Kwkde5NzJlS6QEmau657V8YF8OGLT1r7SQGPHfbeIeHFdnpeSWQ+LRrz
         bZ7LULYaNVXwWt9+qK+e0QAuRNQuYvRZuwGhklrlz1ic8Cqg+82hPfvh7769lFSeVj9o
         eHJ4ifiq2R1gi6uFs+4tL4zl1QBM8qEqruR5mrljM5A01GI/GQMeYxj6c5WDK7dX7WOa
         BEIkgmJyQd4KpbV+yJE6tt4gByBWk4MfG5eY0PvxHp81GPpQj8pkwjG5Z0mVyL660fSF
         fCgOBMMO166zPmIQeBWVuzDsf7FfcDrBd1frhp4+TVa58jxoUfdpho879aXRz9oLZ0sn
         qxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543106; x=1691135106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/YBBqSDcWRDx5YEwGGSxcqG5asjrjQ+pKXyoN+gpXo=;
        b=i/TDv+nCdfnLqBu9TbOuNgxjkGqo5DC7f75GWBeu8z4VqK/dkTN1maVT1KFQFZILio
         rGer0Rsv/wDx6SXNxZ56wPsONcBBtS4182eJAwGs9j8fSw1i/uY4alhvS+EBFnCHTQdy
         NcLXTbZOxaTh9yIdzUiuhKx9ink8IoJMl8kudTGKgz7qY5XLkZBtDmiJM+z/w0h72Upv
         88oVbR39LixXgG/21Fr6g5jWGefxH4nH2McHu5PNdDE/MZxui4qjIrL/A8GFEGx1p5NV
         aGMQOprgGyTNoZ2a+5qMdNzjTvDhwuHQwzLog3zLXQu1jyGQObCo0oxjiIjqJ5I50/Zo
         7OiQ==
X-Gm-Message-State: ABy/qLb5ptdCwmIkiSAmCiYgQToWMjLlWjkYQezT5anS/VZ3IvdPB/uA
	4ifzin0JH1XdEJJYn77l8VcN4HQCSN/BaXP7REk=
X-Google-Smtp-Source: APBJJlH3rkViwMVftnwkCsWch1FQKK8jNH8DIJvppblw1hMz9RyiMYWBvwz1jZQCqnSUqVPrvXGkeaeCkrgxlpXHN9Y=
X-Received: by 2002:a81:6cd6:0:b0:56d:538b:2db5 with SMTP id
 h205-20020a816cd6000000b0056d538b2db5mr1035512ywc.5.1688543106273; Wed, 05
 Jul 2023 00:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230704200907.20403-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20230704200907.20403-1-sudipm.mukherjee@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 5 Jul 2023 09:44:54 +0200
Message-ID: <CANx9H-AHG59Fw4s5zQ-2yJRksJszGwdZghznqsjYyxjXnMAiEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: upgrade to 2.15.1
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009964f05ffb89405"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 07:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183876

--00000000000009964f05ffb89405
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee <sudipm.mukherjee@gmail.com>
wrote:

> Upstream has removed setup.py and started using pyproject.toml
>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  ...ython3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb =>
> python3-pygments_2.15.1.bb} (76%)
>
> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> similarity index 76%
> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> index 16769e9263..7e3b286f41 100644
> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
>
>  inherit setuptools3


 instead of setuptools3, inherit python_setuptools_build_meta
Look at the build.backend variable in pyproject.toml for hints
https://github.com/pygments/pygments/blob/master/pyproject.toml#L4

>
> -SRC_URI[sha256sum] =
> "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
> +SRC_URI[sha256sum] =
> "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
>
>  DEPENDS += "\
>              ${PYTHON_PN} \
> @@ -15,5 +15,9 @@ PYPI_PACKAGE = "Pygments"
>
>  inherit pypi
>
> +do_compile () {
> +    python_pep517_do_compile
> +}
> +

inheriting the proper class will do this

>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183871):
> https://lists.openembedded.org/g/openembedded-core/message/183871
> Mute This Topic: https://lists.openembedded.org/mt/99953624/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000009964f05ffb89405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee =
&lt;<a href=3D"mailto:sudipm.mukherjee@gmail.com">sudipm.mukherjee@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">Upstream has removed setup.py an=
d started using pyproject.toml<br>
<br>
Signed-off-by: Sudip Mukherjee &lt;<a href=3D"mailto:sudipm.mukherjee@gmail=
.com" target=3D"_blank">sudipm.mukherjee@gmail.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ython3-pygments_2.14.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ython3-pygments_2.14.0.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-pygments_2.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygme=
nts_2.15.1.bb</a>} | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pygmen=
ts_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.14.0.=
bb</a> =3D&gt; <a href=3D"http://python3-pygments_2.15.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pygments_2.15.1.bb</a>} (76%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pygment=
s_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.14.0.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.1=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.15.1.bb</a>=
<br>
similarity index 76%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pygments=
_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.14.0.bb=
</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2=
.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.15.1.bb</=
a><br>
index 16769e9263..7e3b286f41 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.14.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.14.0.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.15.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.15.1.bb</a><b=
r>
@@ -5,7 +5,7 @@ LICENSE =3D &quot;BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D36a13c90514e2899f1eba=
7f41c3ee592&quot;<br>
<br>
=C2=A0inherit setuptools3</blockquote><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)" dir=3D"auto"></blockquote><div dir=3D"auto">=C2=A0instead of setupt=
ools3, inherit python_setuptools_build_meta</div><div dir=3D"auto">Look at =
the build.backend variable in pyproject.toml for hints<br><div dir=3D"auto"=
><a href=3D"https://github.com/pygments/pygments/blob/master/pyproject.toml=
#L4">https://github.com/pygments/pygments/blob/master/pyproject.toml#L4</a>=
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)" dir=3D"auto"><br>
-SRC_URI[sha256sum] =3D &quot;b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93=
c078f094ddc476ae297&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8ace4d3c1dd481894b2005f560ead0f9f19ee64fe9833=
66be1a21e171d12775c&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN} \<br>
@@ -15,5 +15,9 @@ PYPI_PACKAGE =3D &quot;Pygments&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
+do_compile () {<br>
+=C2=A0 =C2=A0 python_pep517_do_compile<br>
+}<br>
+</blockquote><div dir=3D"auto">inheriting the proper class will do this=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)" dir=3D"auto"><br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183871): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183871" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99953624/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
99953624/924729</a><br>
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

--00000000000009964f05ffb89405--

