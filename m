Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web09.169.1629477274422092696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rMPkldl7;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id j16so1753371uag.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ol9Rz29wRn5NSZOXzPkL05yJzsnq61IN4yHR4AQEonQ=;
        b=rMPkldl71g6f7Gc0021+A05v1T4qoOkKLIao8a0uniZWw0WaiOV3l/RGV71+W/4vFc
         vCuRCI66BnONc+Q3pPgIwFJ2CnOIRafYlqLa7k20AMxTNsqafDK7ZRZ3nYSEtmgcSyWc
         3vxMVl+XH3qN2g5jwBdfKBtDuGGwk2qn7K9MFmujFPxTaWLsP0BKAH1+75WcUvavR5Hi
         8HIdGlWy/9m8zq42OXUlxTQzrpWMlJ25ulM0jt3vmV1JKXzYz/htkH72PgucFVXj/1HC
         teogKbO8+3jEHC/x141BaCaKQmOWXKikv0lBpuHZ2OEF8hlnx8weNWTiQv4Wx79QyeJT
         5+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ol9Rz29wRn5NSZOXzPkL05yJzsnq61IN4yHR4AQEonQ=;
        b=Ey/T0baYOLXC4bPgr8YHX32Has8h5DTG1ZbbPExnqTeTiThcehPaQj1/FNC0EKSvq+
         5EoBFGBqaEcsmIC1qepg+1M4R+iJR8ZLmvoflCKXLT5TysvQ7tQTNk6k9UQIGOwGtNC9
         rmSgwQKS4yQoaQEYXXGIi0sixvfX6+EPyuY1y+wd/nP4n3Xku4cOSe2UOZVyD6f+XqMD
         EKRGRji1a3685Q6maCri17PsoJ2f37S7UwgURlbuO9XzAVI2h6En6yn0WRBHemXsDKAM
         arvofrYTEH21jYmqgkhSzYM86phjABLHmCegpfGGTs1npXvEMP9zU/ksbQl8wjapvJ7y
         3lvg==
X-Gm-Message-State: AOAM530LHZE9fDF7u/Y+5atjzqXcSQDB+rBE3nUQh/P5KpENWqqMtz/f
	xAjEc9XZZ49tThW4BgQQUf1BT8J3IQEGnKny/xQ=
X-Google-Smtp-Source: ABdhPJyFWkCsKwUtUXFtSCEh+0al38gb8WXucEJ9ebMaEktUwXSAeTQ2VLtckKnxZirng2lXJLaU+wKOPclvV10Snhw=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr16170545uan.93.1629477273484;
 Fri, 20 Aug 2021 09:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210820153947.8838-1-sakib.sajal@windriver.com>
In-Reply-To: <20210820153947.8838-1-sakib.sajal@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 20 Aug 2021 18:34:21 +0200
Message-ID: <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] go: upgrade 1.16.5 -> 1.16.7
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000e3ff405ca003e08"

--0000000000000e3ff405ca003e08
Content-Type: text/plain; charset="UTF-8"

Maybe we should go straight to 1.17?

Alex

On Fri, 20 Aug 2021 at 17:39, Sakib Sajal <sakib.sajal@windriver.com> wrote:

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc}     | 4 ++--
>  ...{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} | 4 ++--
>  ...o-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} | 0
>  .../go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb}             | 0
>  .../go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb}       | 0
>  .../go/{go-native_1.16.5.bb => go-native_1.16.7.bb}           | 0
>  .../go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb}         | 0
>  meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb}       | 0
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc} (89%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb =>
> go-binary-native_1.16.7.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb =>
> go-cross-canadian_1.16.7.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb =>
> go-crosssdk_1.16.7.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.5.bb =>
> go-native_1.16.7.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb =>
> go-runtime_1.16.7.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
> b/meta/recipes-devtools/go/go-1.16.7.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.16.5.inc
> rename to meta/recipes-devtools/go/go-1.16.7.inc
> index b693315917..ed2d94671b 100644
> --- a/meta/recipes-devtools/go/go-1.16.5.inc
> +++ b/meta/recipes-devtools/go/go-1.16.7.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.16"
> -PV = "1.16.5"
> +PV = "1.16.7"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -18,4 +18,4 @@ SRC_URI += "\
>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>
>  file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
>  "
> -SRC_URI[main.sha256sum] =
> "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> +SRC_URI[main.sha256sum] =
> "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.16.7.bb
> index b3e2b6a60e..cb54c2868e 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>
>  SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> -SRC_URI[go_linux_amd64.sha256sum] =
> "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> -SRC_URI[go_linux_arm64.sha256sum] =
> "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> +SRC_URI[go_linux_amd64.sha256sum] =
> "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
> +SRC_URI[go_linux_arm64.sha256sum] =
> "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross_1.16.7.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-native_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-native_1.16.7.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
> b/meta/recipes-devtools/go/go-runtime_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> rename to meta/recipes-devtools/go/go-runtime_1.16.7.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
> b/meta/recipes-devtools/go/go_1.16.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.5.bb
> rename to meta/recipes-devtools/go/go_1.16.7.bb
> --
> 2.32.0
>
>
> 
>
>

--0000000000000e3ff405ca003e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Maybe we should go straight to 1.17?</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, 20 Aug 2021 at 17:39, Sakib Sajal &lt;<a hre=
f=3D"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-=
by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com" target=3D"=
_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/{go-1.16.5.inc =3D&gt; go-1.16.7.inc}=C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0...{<a href=3D"http://go-binary-native_1.16.5.bb" rel=3D"noreferrer" =
target=3D"_blank">go-binary-native_1.16.5.bb</a> =3D&gt; <a href=3D"http://=
go-binary-native_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-=
native_1.16.7.bb</a>} | 4 ++--<br>
=C2=A0...<a href=3D"http://o-cross-canadian_1.16.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">o-cross-canadian_1.16.5.bb</a> =3D&gt; <a href=3D"http://g=
o-cross-canadian_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-c=
anadian_1.16.7.bb</a>} | 0<br>
=C2=A0.../go/{<a href=3D"http://go-cross_1.16.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross_1.1=
6.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.7.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-crosssdk_1.16.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-crosssdk_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cro=
sssdk_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.7.bb=
</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-native_1.16.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-native_=
1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.7.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-runtime_1.16.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-runtime_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-runti=
me_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.7.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-devtools/go/{<a href=3D"http://go_1.16.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http://go_1.1=
6.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.16.7.bb</a>}=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 0<br>
=C2=A08 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16.5.inc =3D&gt; go-1.16.7.inc}=
 (89%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</=
a> =3D&gt; <a href=3D"http://go-binary-native_1.16.7.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-binary-native_1.16.7.bb</a>} (83%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb=
</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.16.7.bb" rel=3D"noreferr=
er" target=3D"_blank">go-cross-canadian_1.16.7.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a hr=
ef=3D"http://go-cross_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cr=
oss_1.16.7.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.16.5=
.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> =3D&gt;=
 <a href=3D"http://go-crosssdk_1.16.7.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-crosssdk_1.16.7.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a =
href=3D"http://go-native_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go=
-native_1.16.7.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.16.5.=
bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> =3D&gt; <=
a href=3D"http://go-runtime_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-runtime_1.16.7.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.16.5.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http:=
//go_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.16.7.bb</a>} (100=
%)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools=
/go/go-1.16.7.inc<br>
similarity index 89%<br>
rename from meta/recipes-devtools/go/go-1.16.5.inc<br>
rename to meta/recipes-devtools/go/go-1.16.7.inc<br>
index b693315917..ed2d94671b 100644<br>
--- a/meta/recipes-devtools/go/go-1.16.5.inc<br>
+++ b/meta/recipes-devtools/go/go-1.16.7.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0require go-common.inc<br>
<br>
=C2=A0GO_BASEVERSION =3D &quot;1.16&quot;<br>
-PV =3D &quot;1.16.5&quot;<br>
+PV =3D &quot;1.16.7&quot;<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSIO=
N}:&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7=
b4e0dd74707&quot;<br>
@@ -18,4 +18,4 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-abso=
lute.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-encoding-xml-handle-leading-trailing-or-dou=
ble-colon.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa=
51945851325eebc17f50ba80&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;1a9f2894d3d878729f7045072f30becebe243524=
cf2fce4e0a7b248b1e0654ac&quot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a=
> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16.7.bb" =
rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.7.bb</a><br>
similarity index 83%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a>=
<br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16.=
7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.7.bb</a><b=
r>
index b3e2b6a60e..cb54c2868e 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16.7.bb=
" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.7.bb</a><br>
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b=
26d2c5e4e7b4e0dd74707&quot;<br>
=C2=A0PROVIDES =3D &quot;go-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7=
BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%7D" r=
el=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.${BUIL=
D_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br>
-SRC_URI[go_linux_amd64.sha256sum] =3D &quot;b12c23023b68de22f74c0524f10b75=
3e7b08b1504cb7e417eccebdd3fae49061&quot;<br>
-SRC_URI[go_linux_arm64.sha256sum] =3D &quot;d5446b46ef6f36fdffa852f73dfbbe=
78c1ddf010b99fa4964944b9ae8b4d6799&quot;<br>
+SRC_URI[go_linux_amd64.sha256sum] =3D &quot;7fe7a73f55ba3e2285da36f8b085e5=
c0159e9564ef5f63ee0ed6b818ade8ef04&quot;<br>
+SRC_URI[go_linux_arm64.sha256sum] =3D &quot;63d6b53ecbd2b05c1f0e9903c92042=
663f2f68afdbb67f4d0d12700156869bac&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&q=
uot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.16.7.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb</=
a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.16=
.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.7.bb</a>=
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> b/meta/recipes=
-devtools/go/<a href=3D"http://go-cross_1.16.7.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-cross_1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.5.bb" =
rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.7.bb" re=
l=3D"noreferrer" target=3D"_blank">go-cross_1.16.7.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.5.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> b/meta/r=
ecipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.7.bb" rel=3D"noreferr=
er" target=3D"_blank">go-crosssdk_1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.7.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go-native_1.16.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-native_1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.7.bb" r=
el=3D"noreferrer" target=3D"_blank">go-native_1.16.7.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> b/meta/rec=
ipes-devtools/go/<a href=3D"http://go-runtime_1.16.7.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-runtime_1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16.7.bb" =
rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.7.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> b/meta/recipes-devtools/=
go/<a href=3D"http://go_1.16.7.bb" rel=3D"noreferrer" target=3D"_blank">go_=
1.16.7.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" rel=3D=
"noreferrer" target=3D"_blank">go_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.16.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">go_1.16.7.bb</a><br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000e3ff405ca003e08--
