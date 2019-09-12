Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E74E7D1E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 10:06:46 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id k12so7774515uan.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IDnuTPXcPudqrSSKq938aWFJPIebOMgc+en8zccaChs=;
	b=rj20lKgQn0tNa8cnw9rUvssslRPrGAvJm8Eof3bRrp41JZA+1fqHaZvGiHARQCSphF
	ZleEvAiPZlziY0Izn1vwYsES/g4yRdKwuID2TWMityqbytBJLnlqGmMvoPKPp/S2Gqkj
	qLI+wUGAG+i824uTfFt/aQPif75MZIWNUyoxugDN/yLFgtU9FXru4kHQt4ufa3WtRbOe
	iWdK2GLktYVLzTxwGRJWW9H5LCDoPFc2G1lJwG/gUbH/bbRjSVWzuw+HPKqL2hNfH1/9
	ls9DBsjYhIE8wXACeLcSVQuDHHPrYlbvO5hdlX4E6iXUbM+Dufnr+7xUKj8PeO0w1vZR
	WEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IDnuTPXcPudqrSSKq938aWFJPIebOMgc+en8zccaChs=;
	b=hkENxGMsnQINlfkv8bnIswOIoopQ1azr83KBMwb0rzGAfFI3OssG8oayrGKnbO1mid
	ezr0RP30dT7qm/hEXRI1xaEbDCdQ23CzxZ/U0jVzYCcUjLAx4gV8S0+tWNO/8H5wo0BY
	nVZWd0a2gF/Z9QO7fQxwCdnRhcyIc/jtOJB5ThoBUqQW6Mrh534TfN+sCAgOnuFl9RKQ
	shTA96aqH7q1foyukvQZavDGGlRLEZHaFK5P7b4gxkX95MMw8m7o2gn/+HMOCZpwOLPd
	r+3waT7Bs0D04qc4iP2G7xDrBEkl8Yth51EQ/ygGdZWNeFcE5ah/pjvyCLFvY/tNtUpF
	0x8Q==
X-Gm-Message-State: APjAAAWwv6XJsCV1+pmY2UPjm8n/G65ummopIXv9vUok9JL4nHDV3bH0
	LWPg3FoBfGSvdhcN3gehEtNQLmEaxX2lu9XI9F0=
X-Google-Smtp-Source: APXvYqx84Tp1iRl3lM3pKDru7Say/QR+kDPCATStxoJgRI6J3wXegcXOB0fPdmBhimx0XXOXgxEHqaHBIBx+ZPObm4Q=
X-Received: by 2002:ab0:1d84:: with SMTP id l4mr15893988uak.22.1568282807172; 
	Thu, 12 Sep 2019 03:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <1568274731-47147-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1568274731-47147-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Sep 2019 12:06:36 +0200
Message-ID: <CANNYZj93eukF+HAgmiDbc2iTX=PDWup3o3JJGJuh8LNY4UZUZA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Thu, 12 Sep 2019 10:06:46 -0000
Content-Type: multipart/alternative; boundary="000000000000a104a50592584b3e"

--000000000000a104a50592584b3e
Content-Type: text/plain; charset="UTF-8"

Thanks, I think this looks more or less correct now.

Alex

On Thu, 12 Sep 2019 at 09:53, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> We need to configure rpm to use package architecture from yocto build
> system.
>
> Install rpmrc and rpm/platform to ${SDKTARGETSYSROOT} because config file
> in host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux
> will be covered by another ARCH which result in previous config settings
> inefficacy.
>
> To resolve it, put config file in target-sysroot like
> /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its
> own target-sysroot, config file will not be covered.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> index 063f4269a5..5634f6702f 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -102,6 +102,9 @@ do_install_append_class-native() {
>          done
>  }
>
> +REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${DISTRO}-${TARGET_OS}"
> +SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
> +
>  do_install_append_class-nativesdk() {
>          for tool in ${WRAPPER_TOOLS}; do
>                  create_wrapper ${D}$tool \
> @@ -112,6 +115,17 @@ do_install_append_class-nativesdk() {
>          done
>
>          rm -rf ${D}/var
> +        install -d ${D}/${SDKTARGETSYSROOT}/etc/rpm
> +
> +        cat >${D}/${SDKTARGETSYSROOT}/etc/rpmrc <<EOF
> +arch_compat: ${MACHINE_ARCH}: all any noarch ${PACKAGE_EXTRA_ARCHS}
> +EOF
> +
> +# Arch Info should be fixed as '-' is instead of '_'.
> +        sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
> +        cat >${D}/${SDKTARGETSYSROOT}/etc/rpm/platform <<EOF
> +${MACHINE_ARCH}-pc-linux
> +EOF
>  }
>
>  # Rpm's make install creates var/tmp which clashes with base-files
> packaging
> @@ -133,6 +147,8 @@ FILES_${PN} += "${libdir}/rpm-plugins/*.so \
>
>  FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
>                      "
> +FILES_${PN}_append_class-nativesdk += "${SDKTARGETSYSROOT}"
> +
>
>  PACKAGES += "python3-rpm"
>  PROVIDES += "python3-rpm"
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a104a50592584b3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I think this looks more or less correct now.<=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Sep 2019 at 09:53, Zheng =
Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.f=
ujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">We need to configure rpm to use package architecture from yocto =
build system.<br>
<br>
Install rpmrc and rpm/platform to ${SDKTARGETSYSROOT} because config file i=
n host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux will=
 be covered by another ARCH which result in previous config settings ineffi=
cacy.<br>
<br>
To resolve it, put config file in target-sysroot like /opt/poky/2.7+snapsho=
t/sysroots/core2-64-poky-linux. As each ARCH has its own target-sysroot, co=
nfig file will not be covered.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> b/meta/recipes-devt=
ools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">rpm_4.14.2.1.bb</a><br>
index 063f4269a5..5634f6702f 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
@@ -102,6 +102,9 @@ do_install_append_class-native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
+REAL_MULTIMACH_TARGET_SYS =3D &quot;${TUNE_PKGARCH}-${DISTRO}-${TARGET_OS}=
&quot;<br>
+SDKTARGETSYSROOT =3D &quot;${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS=
}&quot;<br>
+<br>
=C2=A0do_install_append_class-nativesdk() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tool in ${WRAPPER_TOOLS}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrappe=
r ${D}$tool \<br>
@@ -112,6 +115,17 @@ do_install_append_class-nativesdk() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/var<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${SDKTARGETSYSROOT}/etc/rpm<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt;${D}/${SDKTARGETSYSROOT}/etc/rpmrc &lt=
;&lt;EOF<br>
+arch_compat: ${MACHINE_ARCH}: all any noarch ${PACKAGE_EXTRA_ARCHS}<br>
+EOF<br>
+<br>
+# Arch Info should be fixed as &#39;-&#39; is instead of &#39;_&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/-/_/&#39; ${D}/${SDKTARGETSYSROO=
T}/etc/rpmrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt;${D}/${SDKTARGETSYSROOT}/etc/rpm/platf=
orm &lt;&lt;EOF<br>
+${MACHINE_ARCH}-pc-linux<br>
+EOF<br>
=C2=A0}<br>
<br>
=C2=A0# Rpm&#39;s make install creates var/tmp which clashes with base-file=
s packaging<br>
@@ -133,6 +147,8 @@ FILES_${PN} +=3D &quot;${libdir}/rpm-plugins/*.so \<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/rpm-plugins/*.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
+FILES_${PN}_append_class-nativesdk +=3D &quot;${SDKTARGETSYSROOT}&quot;<br=
>
+<br>
<br>
=C2=A0PACKAGES +=3D &quot;python3-rpm&quot;<br>
=C2=A0PROVIDES +=3D &quot;python3-rpm&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a104a50592584b3e--
