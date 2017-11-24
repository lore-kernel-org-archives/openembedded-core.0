Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id EEF5C71C9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 12:50:02 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id z74so29488042iof.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wMxBEPKyiQEpGOyedVCuNiiHV9uMySoaG7oswgD5mbQ=;
	b=EHsLzCMn78NH3k892Hn2Ajhpk5P1Vy2x7fD1PFW92+Ul6yYklHjTyAmcC1mYs2yd1Y
	wmfdQgc0ilbGBSIrgNEVY6Yg4FoWLvIE+bA3mDimFmMX5cH7KGKzTvjjA2wfFDz+mvSE
	ddN4VZkr6t6s8Q3C2eJP44mNcCbdj2s81xq4FkA/2V1Fh7Z/xJY1KakFQ0O3FbZkHYtC
	Oq25cNlL2TEdjnst+rEiisfW4XibKBjnqEdDmtm1467kEHQAaFV0T8hoQ7DDi/1gEAS7
	T1Hv95p8wKE04VwFlO3pdY4yhbEkV/0d3HJxkT44mXwU6Di87E2d8bxXox3dEnVYqAtb
	esfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wMxBEPKyiQEpGOyedVCuNiiHV9uMySoaG7oswgD5mbQ=;
	b=g+wvvNFD4QwOiZSVF85x+N2UYhKPNv2BK6VVYHkNG1eJ7WxLkTGWywxFIuZwr7cFdW
	xymjec8CPbmhTBYz6s/ChYs6xm3Nr1ywzatmwkfGdCHNFL+G/9CkKzzBphCS92dqOpO3
	A9ErrXKjXmEM338wEIvGW7hvuMIEVSBnq36/9y8WQgbh+K+WlmM1AVt4viJ7PhiScYYF
	aqdidag9Q07B2PRayP1RPicJ3lYdA10wcZGySndMBEm5qAzKVblIHYmz2tQlNqBsKnYq
	2MlbpYLcUU4lRz1GkRNOdS+mRrrx/4F04EMf/JCi6Ie8bFE12/pZeY7dIIdjjGmVUt4t
	pGqg==
X-Gm-Message-State: AJaThX4cwI30oPWTgJRhQmcVKtp2JqL48Jw6nQRUaw8bDFyYiuAh6Ei6
	xXdXSpuy4K70ekNPZL+jrGk2+Jxv5Ebsbk4rm/6JNA==
X-Google-Smtp-Source: AGs4zMYTnvDM+eINkzSMVmFtdQwGz7LGP66EEo9dVbQG5sE43hsJmmTAq46FfyrpL1V+GafynNa1Yft0TFyToSN1rOI=
X-Received: by 10.107.146.195 with SMTP id u186mr31530880iod.37.1511527803982; 
	Fri, 24 Nov 2017 04:50:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 04:49:43 -0800 (PST)
In-Reply-To: <a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 12:49:43 +0000
Message-ID: <CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] curl: update to 7.56.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Nov 2017 12:50:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b2d33394055eb9fd67"

--94eb2c0553b2d33394055eb9fd67
Content-Type: text/plain; charset="UTF-8"

Now I remember why this was rejected last time: it breaks dnf in musl (
https://autobuilder.yocto.io/builders/nightly-musl/builds/616).

Ross

On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> v2] - remove inherit
>
> curlbuild.h removed from sources
>
> includes:
> CVE-2017-1000257
>
> removed patches for the following cve fixs:
> CVE-2017-1000254
> CVE-2017-1000101
> CVE-2017-1000100
> CVE-2017-1000099
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}                | 14
> +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (87%)
>
> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
> b/meta/recipes-support/curl/curl_7.56.1.bb
> similarity index 87%
> rename from meta/recipes-support/curl/curl_7.54.1.bb
> rename to meta/recipes-support/curl/curl_7.56.1.bb
> index 58f0531..830f350 100644
> --- a/meta/recipes-support/curl/curl_7.54.1.bb
> +++ b/meta/recipes-support/curl/curl_7.56.1.bb
> @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=
> 3a34942f4ae3fbf1a303160714e66
>
>  SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
> -           file://CVE-2017-1000099.patch \
> -           file://CVE-2017-1000100.patch \
> -           file://CVE-2017-1000101.patch \
> -           file://CVE-2017-1000254.patch \
>  "
>
>  SRC_URI_append_class-target = " \
> @@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
>  #
>  SRC_URI += " file://configure_ac.patch"
>
> -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
> -SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770
> 046249263c491fcae48df0e1a3ca8f25a0"
> +SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
> +SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e469
> 0150780884d90244ba0fe3e74a778b5f90"
>
>  CVE_PRODUCT = "libcurl"
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
> gnutls proxy threaded-resolver zlib"
>  PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
> @@ -64,10 +60,6 @@ EXTRA_OECONF = " \
>      --without-libpsl \
>  "
>
> -do_install_append() {
> -       oe_multilib_header curl/curlbuild.h
> -}
> -
>  do_install_append_class-target() {
>         # cleanup buildpaths from curl-config
>         sed -i \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0553b2d33394055eb9fd67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now I remember why this was rejected last time: it breaks =
dnf in musl (<a href=3D"https://autobuilder.yocto.io/builders/nightly-musl/=
builds/616">https://autobuilder.yocto.io/builders/nightly-musl/builds/616</=
a>).<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 21 November 2017 at 20:01, Armin Kuster <span dir=
=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akus=
ter808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvista.c=
om</a>&gt;<br>
<br>
v2] - remove inherit<br>
<br>
curlbuild.h removed from sources<br>
<br>
includes:<br>
CVE-2017-1000257<br>
<br>
removed patches for the following cve fixs:<br>
CVE-2017-1000254<br>
CVE-2017-1000101<br>
CVE-2017-1000100<br>
CVE-2017-1000099<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../curl/{<a href=3D"http://curl_7.54.1.bb" rel=3D"noreferrer" target=
=3D"_blank">curl_7.54.1.bb</a> =3D&gt; <a href=3D"http://curl_7.56.1.bb" re=
l=3D"noreferrer" target=3D"_blank">curl_7.56.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++-----------<br>
=C2=A01 file changed, 3 insertions(+), 11 deletions(-)<br>
=C2=A0rename meta/recipes-support/curl/{<a href=3D"http://curl_7.54.1.bb" r=
el=3D"noreferrer" target=3D"_blank">cur<wbr>l_7.54.1.bb</a> =3D&gt; <a href=
=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.56.1=
.bb</a>} (87%)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" target=3D"=
_blank">cu<wbr>rl_7.56.1.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.54.1.bb</a><br>
rename to meta/recipes-support/curl/<a href=3D"http://curl_7.56.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.56.1.bb</a><br>
index 58f0531..830f350 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.56.1.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.56.1.bb</a><br>
@@ -7,10 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;beginline=3D8;<w=
br>md5=3D<wbr>3a34942f4ae3fbf1a303160714e66<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://curl.haxx.se/download/curl-${PV}.=
tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://curl.haxx.se/download/=
<wbr>curl-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-replace-krb5-<wbr>con=
fig-with-pkg-config.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000099.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000100.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000101.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000254.patch \<b=
r>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_class-target =3D &quot; \<br>
@@ -22,11 +18,11 @@ SRC_URI_append_class-target =3D &quot; \<br>
=C2=A0#<br>
=C2=A0SRC_URI +=3D &quot; file://configure_ac.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>6b6eb722f512e7a24855ff084f54fe<wbr>55&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>fdfc4df2d001ee0c44ec071186e770<wbr>04624=
9263c491fcae48df0e1a3ca8f<wbr>25a0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>428de25834ef8c04076906d6d5c049<wbr>8e&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>2594670367875e7d87b0f129b5e469<wbr>01507=
80884d90244ba0fe3e74a778b<wbr>5f90&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;libcurl&quot;<br>
-inherit autotools pkgconfig binconfig multilib_header<br>
+inherit autotools pkgconfig binconfig<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURE=
S&#39;, &#39;ipv6&#39;, d)} gnutls proxy threaded-resolver zlib&quot;<br>
=C2=A0PACKAGECONFIG_class-native =3D &quot;ipv6 proxy ssl threaded-resolver=
 zlib&quot;<br>
@@ -64,10 +60,6 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--without-libpsl \<br>
=C2=A0&quot;<br>
<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curl/curlbuild.h<br>
-}<br>
-<br>
=C2=A0do_install_append_class-<wbr>target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0553b2d33394055eb9fd67--
