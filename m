Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6315E7839A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 14:12:37 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id i38so5363214iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nm81NqQnZFg1btCi5yL0gvq8TSBWyEWgAaqmqNWR/JI=;
	b=093AZAMDhPKw7JcnYOEvHe1Kfvn0lcP+nDLPUP+FlKdds1mBacEhIQVHWO9W/Lx9+c
	cKKO0y5R9B3gZXqHkjZdokltMUPXSgI8DOB0gXFZFrbLBRLYqyKrWlSqUDMwYzWJOrvn
	Mh2hBaCE8gTinN0aDFCAYsyZTMvJha39z6+/PjH/4XVCZmmGiO7nShWKbCp3vGVA4O2F
	DlUUiD2IiuIiHkWVCvmhBNi3B/VoyCpwxluv6IW0OLtKNLJvR4RC4TGitb9vIddTdcU8
	5FIGODehDw1vuPMVE0MfXePTwGhYTIQN1uXgjW3ehBKNswuKHRnbsipSP4W/xDqVC04r
	1NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nm81NqQnZFg1btCi5yL0gvq8TSBWyEWgAaqmqNWR/JI=;
	b=O9lona5EKP31I1xnLRwqZdEjqRMrgBRbh3VRBzxcErbNoKC3EQLK6sWLxpIu5BwsNa
	3BG5caOlwtanT0pjAFABSiNIedt6JsYSUrYg9xcGgFqh+Vwbqc+I93YkTpjBH66wdx2D
	E3qU4eU110cViWyQWfRXGP66/rUo6apSz78U9sFGZMUyueZ5jAKzNkRmR6HiSlYLeCR5
	YSN4RqlrElhcNxtb6KMVjx1MYt4KrfgPiHunNKq3N4BRoNMSWogrAfpjcfDIPLrHEDx9
	yOD90WBQa6DajG/Uzw+fzXNBa2eJ+0yQY0UvjRGBtbk4odG+fOcqqFIEjbcBpxMgulhx
	JObA==
X-Gm-Message-State: AJaThX7R1ajzFUMklEdGNPaiIuQrLIUML1HWFmdywp09GlF/52ymxtUH
	CBSI30Oo4PdS+qG9dBSnH64MTf3HPjM/iwDbHyFjkw==
X-Google-Smtp-Source: AGs4zMaDAYm9lP0LTOwZwiET0zfjxHrkyCdpGEYp6OGDA6ErvpcOKk+C0VyBD28JE7weoBwXvgxYR1jyEM2Wywsmsr0=
X-Received: by 10.107.146.195 with SMTP id u186mr434337iod.37.1510841557347;
	Thu, 16 Nov 2017 06:12:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 06:12:16 -0800 (PST)
In-Reply-To: <1510577232-30262-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1510577232-30262-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 14:12:16 +0000
Message-ID: <CAJTo0LYLikoD3neBfrLfO28EyMicNiUR_gAjdRHnA28bWk0HvA@mail.gmail.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] curl: upgrade to 7.56.1
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
X-List-Received-Date: Thu, 16 Nov 2017 14:12:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b256cddc055e1a361a"

--94eb2c0553b256cddc055e1a361a
Content-Type: text/plain; charset="UTF-8"

This upgrade is causing dnf to crash with musl, as Python3 is segfaulting
in gnutls (via curl).  Reverting this upgrade fixes the problem.

Ross

On 13 November 2017 at 12:47, Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com> wrote:

> Upgarded curl to version 7.56.1. Removed few patches fixing CVEs, since
> those fixes are included in the this release.
>
> Also removed installation of 'curl/curlbuild.h', which has been removed
> in v7.55.0:
> http://daniel.haxx.se/blog/2017/06/15/target-independent-libcurl-headers
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
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

--94eb2c0553b256cddc055e1a361a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This upgrade is causing dnf to crash with musl, as Python3=
 is segfaulting in gnutls (via curl).=C2=A0 Reverting this upgrade fixes th=
e problem.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 13 November 2017 at 12:47, Oleksandr Kravch=
uk <span dir=3D"ltr">&lt;<a href=3D"mailto:oleksandr.kravchuk@pelagicore.co=
m" target=3D"_blank">oleksandr.kravchuk@pelagicore.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Upgarded curl to version 7.56.1. Remove=
d few patches fixing CVEs, since<br>
those fixes are included in the this release.<br>
<br>
Also removed installation of &#39;curl/curlbuild.h&#39;, which has been rem=
oved<br>
in v7.55.0:<br>
<a href=3D"http://daniel.haxx.se/blog/2017/06/15/target-independent-libcurl=
-headers" rel=3D"noreferrer" target=3D"_blank">http://daniel.haxx.se/blog/<=
wbr>2017/06/15/target-independent-<wbr>libcurl-headers</a><br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:oleksandr.kravchuk@=
pelagicore.com">oleksandr.kravchuk@<wbr>pelagicore.com</a>&gt;<br>
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

--94eb2c0553b256cddc055e1a361a--
