Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA5A78545
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 14:41:38 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id x13so2233905iti.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IZy+Sau/xnR2/isb6zg3CozKB4CIHU5pyXLnYfKSliU=;
	b=pNKsM+N1h7JCZx0yTMTDkWy7FeKkcshFXXyuwXG+zHBD7U4hipzR0VemZ3SaLp92ie
	+CKyuIwEbeAOMcAqDC6udH3d4Bl4Cu8RPZ+F5bMb4Nt6iRNccJ0oa/4zl+h4DyQFC9Sd
	pkjPzU7cgmnaDR6Lqgl61PgHCEw79XdY2PKSHrvsy3mrz/T1pqb8OX/RGFCru/R6dfo2
	1kAPWYKy18nFLGB9Oa5TYCTeoRu3v2Rm08ni2H7pN5mScUe40bp/+spxsvVaLiVP9f9D
	9IBnXP/TV8XAnYDSXWzcDiHEtl97wNnfZdLdvmqzyBZpnzIW//C0ILNyLT4+yxZyCcqE
	IdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IZy+Sau/xnR2/isb6zg3CozKB4CIHU5pyXLnYfKSliU=;
	b=DaHtT0as5UE36B4jWgT84unlvTsJeJAluredZMLT3yLeSAHfRq7bxDy0UjIbUvT6hC
	vzHjKjqBETDX/vbynq4iLXa7E8uLu+hpQYxOyVCvXoJB5MBGifcMFaDBClJ0d5vdflzH
	KpeMBIm9rNlQQZ9+pq+U2BLMeunitt752257sAX98mjNfJm9vPPfrJaNTSqETQdYj0gp
	18yfvOJy/D50A4Jc1c+ThGGXeLqIOQhmvDFX0wUJ6+0jHf2znzFSBqpjptKfKVO5n1s+
	WQq6P7/A2Y7xr8p3mapSijw4W/rhPIBHaDusNrNZSSKETd7858CgFjZpP11TQZS183zN
	1guQ==
X-Gm-Message-State: AJaThX68SCORCNYqXDoND+lG5vHW9FkuZWDoQhRj610lhfwtzE+QiqJT
	06qSgBg2XP//kXLokshUlffw9kmjbYfdDQk0q33npw==
X-Google-Smtp-Source: AGs4zMYAoH75xS3M+6vcPa7eLpeIu5jzklygHyduJdzizNH4KVIr+PtqEfAmVV4OVGzkbJpIQiP1iCmiHs1idZL60yk=
X-Received: by 10.36.172.31 with SMTP id s31mr2213259ite.124.1511275299540;
	Tue, 21 Nov 2017 06:41:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 06:41:19 -0800 (PST)
In-Reply-To: <a5f87758e9ee7ea1eee0f3c546bd1ee39456886f.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
	<a5f87758e9ee7ea1eee0f3c546bd1ee39456886f.1511222485.git.akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 14:41:19 +0000
Message-ID: <CAJTo0LYzRMj=74=Sub4w=O7SXbmF4r00OOMuhqB3CnTTGt=cew@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Nov 2017 14:41:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c1fc0f8632d75055e7f332d"

--94eb2c1fc0f8632d75055e7f332d
Content-Type: text/plain; charset="UTF-8"

As with the last time this upgrade was done, the multilib_header inherit
can be removed now.

Ross

On 21 November 2017 at 00:07, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
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
>  meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} | 12
> ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (89%)
>
> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
> b/meta/recipes-support/curl/curl_7.56.1.bb
> similarity index 89%
> rename from meta/recipes-support/curl/curl_7.54.1.bb
> rename to meta/recipes-support/curl/curl_7.56.1.bb
> index 58f0531..2891a4b 100644
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
> @@ -22,8 +18,8 @@ SRC_URI_append_class-target = " \
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
>  inherit autotools pkgconfig binconfig multilib_header
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

--94eb2c1fc0f8632d75055e7f332d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As with the last time this upgrade was done, the multilib_=
header inherit can be removed now.<div><br></div><div>Ross</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 November 2017 at=
 00:07, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gma=
il.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Armin Kuster &lt;<a href=3D"mailto:akuste=
r@mvista.com">akuster@mvista.com</a>&gt;<br>
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
=C2=A0meta/recipes-support/curl/{<a href=3D"http://curl_7.54.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">cur<wbr>l_7.54.1.bb</a> =3D&gt; <a href=3D"htt=
p://curl_7.56.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.56.1.bb</a>=
} | 12 ++----------<br>
=C2=A01 file changed, 2 insertions(+), 10 deletions(-)<br>
=C2=A0rename meta/recipes-support/curl/{<a href=3D"http://curl_7.54.1.bb" r=
el=3D"noreferrer" target=3D"_blank">cur<wbr>l_7.54.1.bb</a> =3D&gt; <a href=
=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.56.1=
.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.56.1.bb" rel=3D"noreferrer" target=3D"=
_blank">cu<wbr>rl_7.56.1.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.54.1.bb</a><br>
rename to meta/recipes-support/curl/<a href=3D"http://curl_7.56.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.56.1.bb</a><br>
index 58f0531..2891a4b 100644<br>
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
@@ -22,8 +18,8 @@ SRC_URI_append_class-target =3D &quot; \<br>
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
=C2=A0inherit autotools pkgconfig binconfig multilib_header<br>
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

--94eb2c1fc0f8632d75055e7f332d--
