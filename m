Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.5895.1610010501318473142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f82ZMZUc;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p2so2034008uac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 01:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LD6jGzJgj6WolZp+2o2zxqnMBRGml4hMGAvrosbC3wQ=;
        b=f82ZMZUcLdRk4SBK3Zx1c1p1Gk84c4/WXNc3oK/iwUebggu+V7rOJ14l/EUGmvGjvB
         Pt7GcxVo5eRlJ78oyLHXmZoFvCD1XW3YTfIHwVzUzK1jau/upl0ECjn9nGL0E2+Ex/NU
         PX06qP0SvscJM3rGpfrOEMdBMpd+XE5Ple01G1fdRN99qPniSSxVv/zCDx1G+QeSbJzt
         FDhqrMlS4tzdf3E4GhVo+bNpb0P/exJwjJ0v4KqtvwgCMviekfeCix5XLcRVv204rOY/
         Kp7+BcBlplPGGDGd1uWcSfON00AHbiFjkVYKbJ6YA7MJLM5jsAc2HwdJhQMomZiBMevO
         RQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LD6jGzJgj6WolZp+2o2zxqnMBRGml4hMGAvrosbC3wQ=;
        b=KqSgAdue0WtJ5VJRAhvOF7/2fjKfNP/ur7uhakUaJqAJhv0sGHOQ4lF11jA+dQx+EO
         45CKa7X/9C3e/hMDphhGwrAocaR8TKGjafiHr/tLscgv/VBIl1YafHyipPRWRRQOQYOH
         q/MnHpP8gkgggez9L46bChqTzNPO1McU/osIQ2Hu3gLeTHnnAjCFvNLnIym3/3trSvNh
         jHHejSAf9AP5ogwMtFxeXYz8gtXTrBj6ky+w1vZWxp7rqfZu/ZFSAfDsknGjZ8JKUqdz
         8Lti+kHNsWscjfZUP6pGXopyxqDsq36cBLKgttuwU5NmJZja9WfKYCOAlyOy4FhhNe3a
         oVEQ==
X-Gm-Message-State: AOAM530Z3na/fRc41WXi2lt8SztNVWh/XBUaZBuUa0QLTn3l289xQW9B
	hi032CmACI0s+OOl2+tLJKPExr7GFm4XVTZkSZoD8Dkm
X-Google-Smtp-Source: ABdhPJzOg3Bq6D+Vz0eWQ5W2ZYyRFhYGaaKN5QgSRusOnj1srxCblLyvQ5sfNJTW76ePgmv6XU7LiM70wMPx7KP8Xr8=
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr6669713uaj.89.1610010500418;
 Thu, 07 Jan 2021 01:08:20 -0800 (PST)
MIME-Version: 1.0
References: <1610010261-4742-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1610010261-4742-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 7 Jan 2021 10:08:09 +0100
Message-ID: <CANNYZj_6=jt0JjCh7n9bqsn8A7GK=NBPeYLWiuZTPdGcyzUWfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nettle: upgrade 3.6 ->3.7
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6510805b84bc72c"

--000000000000f6510805b84bc72c
Content-Type: text/plain; charset="UTF-8"

Hello Wang,

a small suggestion: md5sums are no longer necessary or secure, so you can
remove them on version updates. 'devtool upgrade' already does this for you.

Alex

On Thu, 7 Jan 2021 at 10:05, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../Add-target-to-only-build-tests-not-run-them.patch         | 0
>  .../check-header-files-of-openssl-only-if-enable_.patch       | 0
>  .../nettle/{nettle-3.6 => nettle-3.7}/dlopen-test.patch       | 0
>  .../nettle/{nettle-3.6 => nettle-3.7}/run-ptest               | 0
>  meta/recipes-support/nettle/{nettle_3.6.bb => nettle_3.7.bb}  | 4 ++--
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/nettle/{nettle-3.6 =>
> nettle-3.7}/Add-target-to-only-build-tests-not-run-them.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.6 =>
> nettle-3.7}/check-header-files-of-openssl-only-if-enable_.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.6 =>
> nettle-3.7}/dlopen-test.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.6 => nettle-3.7}/run-ptest
> (100%)
>  rename meta/recipes-support/nettle/{nettle_3.6.bb => nettle_3.7.bb} (92%)
>
> diff --git
> a/meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
> b/meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch
> similarity index 100%
> rename from
> meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
> rename to
> meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch
> diff --git
> a/meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch
> b/meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch
> similarity index 100%
> rename from
> meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch
> rename to
> meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
> b/meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
> rename to meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.6/run-ptest
> b/meta/recipes-support/nettle/nettle-3.7/run-ptest
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.6/run-ptest
> rename to meta/recipes-support/nettle/nettle-3.7/run-ptest
> diff --git a/meta/recipes-support/nettle/nettle_3.6.bb
> b/meta/recipes-support/nettle/nettle_3.7.bb
> similarity index 92%
> rename from meta/recipes-support/nettle/nettle_3.6.bb
> rename to meta/recipes-support/nettle/nettle_3.7.bb
> index 7c1b1a2d5c..e10937b4f1 100644
> --- a/meta/recipes-support/nettle/nettle_3.6.bb
> +++ b/meta/recipes-support/nettle/nettle_3.7.bb
> @@ -23,8 +23,8 @@ SRC_URI_append_class-target = "\
>              file://dlopen-test.patch \
>              "
>
> -SRC_URI[md5sum] = "c45ee24ed7361dcda152a035d396fe8a"
> -SRC_URI[sha256sum] =
> "d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1"
> +SRC_URI[md5sum] = "568070f62fd14ca6b076ad583d84e9db"
> +SRC_URI[sha256sum] =
> "f001f64eb444bf13dd91bceccbc20acbc60c4311d6e2b20878452eb9a9cec75a"
>
>  UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
>
> --
> 2.25.1
>
>
>
>
> 
>
>

--000000000000f6510805b84bc72c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Wang,</div><div><br></div><div>a small suggesti=
on: md5sums are no longer necessary or secure, so you can remove them on ve=
rsion updates. &#39;devtool upgrade&#39; already does this for you.<br></di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Jan 2021 at 10:05, Wang Mingy=
u &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"=
_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../Add-target-to-only-build-tests-not-run-them.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../check-header-files-of-openssl-only-if-enable_.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 0<br>
=C2=A0.../nettle/{nettle-3.6 =3D&gt; nettle-3.7}/dlopen-test.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../nettle/{nettle-3.6 =3D&gt; nettle-3.7}/run-ptest=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-support/nettle/{<a href=3D"http://nettle_3.6.bb" rel=3D=
"noreferrer" target=3D"_blank">nettle_3.6.bb</a> =3D&gt; <a href=3D"http://=
nettle_3.7.bb" rel=3D"noreferrer" target=3D"_blank">nettle_3.7.bb</a>}=C2=
=A0 | 4 ++--<br>
=C2=A05 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/nettle/{nettle-3.6 =3D&gt; nettle-3.7}/A=
dd-target-to-only-build-tests-not-run-them.patch (100%)<br>
=C2=A0rename meta/recipes-support/nettle/{nettle-3.6 =3D&gt; nettle-3.7}/c=
heck-header-files-of-openssl-only-if-enable_.patch (100%)<br>
=C2=A0rename meta/recipes-support/nettle/{nettle-3.6 =3D&gt; nettle-3.7}/d=
lopen-test.patch (100%)<br>
=C2=A0rename meta/recipes-support/nettle/{nettle-3.6 =3D&gt; nettle-3.7}/r=
un-ptest (100%)<br>
=C2=A0rename meta/recipes-support/nettle/{<a href=3D"http://nettle_3.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">nettle_3.6.bb</a> =3D&gt; <a href=3D"=
http://nettle_3.7.bb" rel=3D"noreferrer" target=3D"_blank">nettle_3.7.bb</a=
>} (92%)<br>
<br>
diff --git a/meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-bui=
ld-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.7/Add-ta=
rget-to-only-build-tests-not-run-them.patch<br>
similarity index 100%<br>
rename from meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-buil=
d-tests-not-run-them.patch<br>
rename to meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-=
tests-not-run-them.patch<br>
diff --git a/meta/recipes-support/nettle/nettle-3.6/check-header-files-of-=
openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.7/chec=
k-header-files-of-openssl-only-if-enable_.patch<br>
similarity index 100%<br>
rename from meta/recipes-support/nettle/nettle-3.6/check-header-files-of-o=
penssl-only-if-enable_.patch<br>
rename to meta/recipes-support/nettle/nettle-3.7/check-header-files-of-ope=
nssl-only-if-enable_.patch<br>
diff --git a/meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch b/me=
ta/recipes-support/nettle/nettle-3.7/dlopen-test.patch<br>
similarity index 100%<br>
rename from meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch<br>
rename to meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch<br>
diff --git a/meta/recipes-support/nettle/nettle-3.6/run-ptest b/meta/recip=
es-support/nettle/nettle-3.7/run-ptest<br>
similarity index 100%<br>
rename from meta/recipes-support/nettle/nettle-3.6/run-ptest<br>
rename to meta/recipes-support/nettle/nettle-3.7/run-ptest<br>
diff --git a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.6.bb" =
rel=3D"noreferrer" target=3D"_blank">nettle_3.6.bb</a> b/meta/recipes-suppo=
rt/nettle/<a href=3D"http://nettle_3.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nettle_3.7.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-support/nettle/<a href=3D"http://nettle_3.6.bb" r=
el=3D"noreferrer" target=3D"_blank">nettle_3.6.bb</a><br>
rename to meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">nettle_3.7.bb</a><br>
index 7c1b1a2d5c..e10937b4f1 100644<br>
--- a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.6.bb" rel=3D"=
noreferrer" target=3D"_blank">nettle_3.6.bb</a><br>
+++ b/meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.bb" rel=3D"=
noreferrer" target=3D"_blank">nettle_3.7.bb</a><br>
@@ -23,8 +23,8 @@ SRC_URI_append_class-target =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dlopen-test.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c45ee24ed7361dcda152a035d396fe8a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3=
555922fe2f40f3d5e3f1&quot;<br>
+SRC_URI[md5sum] =3D &quot;568070f62fd14ca6b076ad583d84e9db&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f001f64eb444bf13dd91bceccbc20acbc60c4311d6e2=
b20878452eb9a9cec75a&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;nettle-(?P&lt;pver&gt;\d+(\.\d+)+)\.t=
ar&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f6510805b84bc72c--
