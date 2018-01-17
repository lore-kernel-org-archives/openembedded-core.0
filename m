Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAD978624
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 23:39:54 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id d1so6548659uak.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4XSpBIIkIbij179hB6NbSgsZAb8i3byGu+qnXm5KB48=;
	b=UggmXsgi9EJ2QHSSSbWiBeQrn2FiwBEnAyWkbLb7gJ85p5QZmJhDlR9npXa6Bwdjtf
	kUYks7Hs0hf4IZb4mV//Ifyr0CVWS7b2XSrxxtv5lKJY3oa8PUbmiHhnUr5fbdgfDiHz
	71yd8Z14nZfkHWcM3a8n+dgS3nkZ0dJnecqV+7gRSDBLA1REzAmX4DHPiHhDY5Dn4lmu
	Iengur1bEzHw/W+VlKdwN4u9INAg0dtfoQVi+4dFX0yJ7GVj3Rs/GWsoD4mWMjwOOyaa
	J/xcyPoqHtuzAT8oC8ggrigLig+1A2RiBVZCWGv//IRbcqtdE5lk3huCSWNY2SrXoHhn
	Tv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4XSpBIIkIbij179hB6NbSgsZAb8i3byGu+qnXm5KB48=;
	b=dwCuzoVtqvzESkW2u1a1BBK6eJ1p58ysyQJ0pAyxrJSdnniivKkhc20M03NtBn9Vi8
	/4/bkxcUlCbrqTLRXHx1l5gVqGdFyaY3+NZ9qQly8jZfZ7nWIA1XwQfffOgZtYlu8Egz
	hnsEZfrbs8NB6aizR01s1yt2zqpMebTHNed63R+hX7U5QvPtE44neTzO/w2SNtvtdVUn
	xV/q5PVtyfGppaNgO2PF+Cc4ICVWz773xJ0VDuhLgq/DFJwD3s00fYfsCfNrBb0K6Zp6
	Lu5FuZJZ4FnV53k+jjZB/fhrVGmPs54UmiAF5WfobSO1U8xtYGzP7yA4tiPFU2N3jmBB
	JI1Q==
X-Gm-Message-State: AKwxyte32fTZnuw3cpHIWLukFQxdWQJNfhsTDRShMbNxg8Bq186gsfMn
	0JDM49dZAd46YD3/oNcUPbyjqnKw9gOgf6P2DIk=
X-Google-Smtp-Source: ACJfBouzvvnJZWwVHvpmS1lFuIaFch0ekMHpd0Dc8CKiryooXFlV2DY1sLQtbx8uBN/6OyFKqd8xqbE0uWEmInwl2QE=
X-Received: by 10.176.17.203 with SMTP id q11mr3531474uac.41.1516232396027;
	Wed, 17 Jan 2018 15:39:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.130.195 with HTTP; Wed, 17 Jan 2018 15:39:55 -0800 (PST)
In-Reply-To: <1513211210-73090-1-git-send-email-changhyeok.bae@gmail.com>
References: <1513211210-73090-1-git-send-email-changhyeok.bae@gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Thu, 18 Jan 2018 08:39:55 +0900
Message-ID: <CACrLJgDmgiMp5QWTRkmKGEPjyLxJTtpDojV6KAS-F3Q-GuU2Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: 4.13.0 -> 4.14.1
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
X-List-Received-Date: Wed, 17 Jan 2018 23:39:55 -0000
Content-Type: multipart/alternative; boundary="f403045d85ee5cbdfe0563015d11"

--f403045d85ee5cbdfe0563015d11
Content-Type: text/plain; charset="UTF-8"

ping. Do you have any problem to merge this change?

Thanks
Changhyeok

2017-12-14 9:26 GMT+09:00 Changhyeok Bae <changhyeok.bae@gmail.com>:

> - This release features JSON output for many commands and greater
>   support of offloading to hardware.
>
> - Config is changed to config.mk
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc                   | 2 +-
>  .../iproute2/0001-libc-compat.h-add-musl-workaround.patch         | 8
> ++++----
>  .../iproute2/{iproute2_4.13.0.bb => iproute2_4.14.1.bb}           | 4
> ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2_4.13.0.bb =>
> iproute2_4.14.1.bb} (75%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index a578eb3..b404eed 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -21,7 +21,7 @@ EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR}
> DOCDIR=${docdir}/ipr
>  do_configure_append () {
>      sh configure ${STAGING_INCDIR}
>      # Explicitly disable ATM support
> -    sed -i -e '/TC_CONFIG_ATM/d' Config
> +    sed -i -e '/TC_CONFIG_ATM/d' config.mk
>  }
>
>  do_install () {
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-
> compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/
> iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> index 3d324c9..50c4bfb 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-
> compat.h-add-musl-workaround.patch
> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-
> compat.h-add-musl-workaround.patch
> @@ -15,13 +15,13 @@ https://git.buildroot.net/buildroot/tree/package/
> iproute2/0001-Add-the-musl-work
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  Signed-off-by: Maxin B. John <maxin.john@intel.com>
>  ---
> - include/linux/libc-compat.h | 4 +++-
> + include/uapi/linux/libc-compat.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> -diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h
> +diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-
> compat.h
>  index f38571d..30f0b67 100644
> ---- a/include/linux/libc-compat.h
> -+++ b/include/linux/libc-compat.h
> +--- a/include/uapi/linux/libc-compat.h
> ++++ b/include/uapi/linux/libc-compat.h
>  @@ -49,10 +49,12 @@
>   #define _LIBC_COMPAT_H
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
> b/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
> similarity index 75%
> rename from meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
> index 32bf0d5..81e2e4a 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
> @@ -7,8 +7,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz
> \
>             file://0001-ip-Remove-unneed-header.patch \
>            "
>
> -SRC_URI[md5sum] = "69dc9e3ece3296890278f0de478330c8"
> -SRC_URI[sha256sum] = "9cfb81edf8c8509e03daa77cf62aea
> d01c4a827132f6c506578f94cc19415c50"
> +SRC_URI[md5sum] = "1075423d7029e02a8f23ed4f42b7e372"
> +SRC_URI[sha256sum] = "d43ac068afcc350a448f4581b6e292
> 331ef7e4e7aa746e34981582d5fdb10067"
>
>  # CFLAGS are computed in Makefile and reference CCOPTS
>  #
> --
> 2.7.4
>
>


-- 
Thanks
Changhyeok

--f403045d85ee5cbdfe0563015d11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping. Do you have any problem to merge this change?<div><b=
r></div><div>Thanks</div><div>Changhyeok</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">2017-12-14 9:26 GMT+09:00 Changhyeok Bae=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=
=3D"_blank">changhyeok.bae@gmail.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">- This release features JSON output for many commands and gre=
ater<br>
=C2=A0 support of offloading to hardware.<br>
<br>
- Config is changed to <a href=3D"http://config.mk" rel=3D"noreferrer" targ=
et=3D"_blank">config.mk</a><br>
<br>
Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.co=
m">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/<wbr>iproute2/iproute2.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../iproute2/0001-libc-compat.<wbr>h-add-musl-workaround.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++----<br>
=C2=A0.../iproute2/{<a href=3D"http://iproute2_4.13.0.bb" rel=3D"noreferrer=
" target=3D"_blank">iproute2_4.13.0.<wbr>bb</a> =3D&gt; <a href=3D"http://i=
proute2_4.14.1.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.14.1.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A03 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/<wbr>iproute2/{<a href=3D"http://ipr=
oute2_4.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.13.0.bb</a=
> =3D&gt; <a href=3D"http://iproute2_4.14.1.bb" rel=3D"noreferrer" target=
=3D"_blank">iproute2_4.14.1.bb</a>} (75%)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>iproute2/iproute2.inc b/meta/re=
cipes-connectivity/<wbr>iproute2/iproute2.inc<br>
index a578eb3..b404eed 100644<br>
--- a/meta/recipes-connectivity/<wbr>iproute2/iproute2.inc<br>
+++ b/meta/recipes-connectivity/<wbr>iproute2/iproute2.inc<br>
@@ -21,7 +21,7 @@ EXTRA_OEMAKE =3D &quot;CC=3D&#39;${CC}&#39; KERNEL_INCLUD=
E=3D${STAGING_<wbr>INCDIR} DOCDIR=3D${docdir}/ipr<br>
=C2=A0do_configure_append () {<br>
=C2=A0 =C2=A0 =C2=A0sh configure ${STAGING_INCDIR}<br>
=C2=A0 =C2=A0 =C2=A0# Explicitly disable ATM support<br>
-=C2=A0 =C2=A0 sed -i -e &#39;/TC_CONFIG_ATM/d&#39; Config<br>
+=C2=A0 =C2=A0 sed -i -e &#39;/TC_CONFIG_ATM/d&#39; <a href=3D"http://confi=
g.mk" rel=3D"noreferrer" target=3D"_blank">config.mk</a><br>
=C2=A0}<br>
<br>
=C2=A0do_install () {<br>
diff --git a/meta/recipes-connectivity/<wbr>iproute2/iproute2/0001-libc-<wb=
r>compat.h-add-musl-workaround.<wbr>patch b/meta/recipes-connectivity/<wbr>=
iproute2/iproute2/0001-libc-<wbr>compat.h-add-musl-workaround.<wbr>patch<br=
>
index 3d324c9..50c4bfb 100644<br>
--- a/meta/recipes-connectivity/<wbr>iproute2/iproute2/0001-libc-<wbr>compa=
t.h-add-musl-workaround.<wbr>patch<br>
+++ b/meta/recipes-connectivity/<wbr>iproute2/iproute2/0001-libc-<wbr>compa=
t.h-add-musl-workaround.<wbr>patch<br>
@@ -15,13 +15,13 @@ <a href=3D"https://git.buildroot.net/buildroot/tree/pac=
kage/iproute2/0001-Add-the-musl-work" rel=3D"noreferrer" target=3D"_blank">=
https://git.buildroot.net/<wbr>buildroot/tree/package/<wbr>iproute2/0001-Ad=
d-the-musl-<wbr>work</a><br>
=C2=A0Signed-off-by: Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">=
baruch@tkos.co.il</a>&gt;<br>
=C2=A0Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.c=
om">maxin.john@intel.com</a>&gt;<br>
=C2=A0---<br>
- include/linux/libc-compat.h | 4 +++-<br>
+ include/uapi/linux/libc-<wbr>compat.h | 4 +++-<br>
=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
-diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h<br>
+diff --git a/include/uapi/linux/libc-<wbr>compat.h b/include/uapi/linux/li=
bc-<wbr>compat.h<br>
=C2=A0index f38571d..30f0b67 100644<br>
---- a/include/linux/libc-compat.h<br>
-+++ b/include/linux/libc-compat.h<br>
+--- a/include/uapi/linux/libc-<wbr>compat.h<br>
++++ b/include/uapi/linux/libc-<wbr>compat.h<br>
=C2=A0@@ -49,10 +49,12 @@<br>
=C2=A0 #define _LIBC_COMPAT_H<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://ipro=
ute2_4.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.13.0.bb</a>=
 b/meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://iproute2_4.14.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.14.1.bb</a><br>
similarity index 75%<br>
rename from meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://iprou=
te2_4.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.13.0.bb</a><=
br>
rename to meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://iproute=
2_4.14.1.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.14.1.bb</a><br=
>
index 32bf0d5..81e2e4a 100644<br>
--- a/meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://iproute2_4.=
13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.13.0.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>iproute2/<a href=3D"http://iproute2_4.=
14.1.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.14.1.bb</a><br>
@@ -7,8 +7,8 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<wbr>utils/net/=
${BPN}/${BP}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ip-Remove-unneed-<wbr=
>header.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>69dc9e3ece3296890278f0de478330<wbr>c8&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>9cfb81edf8c8509e03daa77cf62aea<wbr>d01c4=
a827132f6c506578f94cc1941<wbr>5c50&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>1075423d7029e02a8f23ed4f42b7e3<wbr>72&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d43ac068afcc350a448f4581b6e292<wbr>331ef=
7e4e7aa746e34981582d5fdb1<wbr>0067&quot;<br>
<br>
=C2=A0# CFLAGS are computed in Makefile and reference CCOPTS<br>
=C2=A0#<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr">Thanks<div>Changhyeok</div></div></div>
</div>

--f403045d85ee5cbdfe0563015d11--
