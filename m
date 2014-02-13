Return-Path: <raj.khem@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 427266E79B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:26:21 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id m5so2091709qaj.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rKLQ5oOm32Ja1UMBTs0bazhQl7V86njhFYdqvNOe6m8=;
	b=tDKT2QTYRQ+wGtMganB9gc48ehQgHejwQRMOG+/lXYkSagnNMf+6CpnJyVP2IbKqww
	HqDjEyI2nZPlzkzXPSCsdbbvd7FQSESoD3niQxXurYjXl8igSM4WXMvy64jJZOIgxe/X
	jLYpO/PJbDXQ836+eNnwCiHW5O3BlVQj56Gx25FKzfvxhkORIlmbGw9IquTZVmmSyP1N
	zlEum775DBF0V8vXuUXEyr6Zy/6GwwfMyG2bFVJlguLeRgWpKc9/LYSLF3yJK4vQ+oHs
	QxUPzB9EC4ps53HLZtQivcep6urg7vziIfIo7LkKP/95I9N9RKPnZ0byfEYUSafoV53E
	t1zQ==
MIME-Version: 1.0
X-Received: by 10.224.151.147 with SMTP id c19mr73498055qaw.86.1392261981629; 
	Wed, 12 Feb 2014 19:26:21 -0800 (PST)
Received: by 10.96.20.39 with HTTP; Wed, 12 Feb 2014 19:26:21 -0800 (PST)
Received: by 10.96.20.39 with HTTP; Wed, 12 Feb 2014 19:26:21 -0800 (PST)
In-Reply-To: <44d5a04a1b2ed639f0f65a05418a63d4cfe7b6d5.1392259689.git.hongxu.jia@windriver.com>
References: <cover.1392259689.git.hongxu.jia@windriver.com>
	<44d5a04a1b2ed639f0f65a05418a63d4cfe7b6d5.1392259689.git.hongxu.jia@windriver.com>
Date: Wed, 12 Feb 2014 19:26:21 -0800
Message-ID: <CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 2/2] socat: enable ptest
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
X-List-Received-Date: Thu, 13 Feb 2014 03:26:22 -0000
Content-Type: multipart/alternative; boundary=089e0153673edb16a404f24140f8

--089e0153673edb16a404f24140f8
Content-Type: text/plain; charset=UTF-8

-Khem
On Feb 12, 2014 6:57 PM, "Hongxu Jia" <hongxu.jia@windriver.com> wrote:
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-connectivity/socat/socat/run-ptest  |  5 +++++
>  meta/recipes-connectivity/socat/socat_1.7.2.3.bb | 12 ++++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/socat/socat/run-ptest
>
> diff --git a/meta/recipes-connectivity/socat/socat/run-ptest
b/meta/recipes-connectivity/socat/socat/run-ptest
> new file mode 100644
> index 0000000..1fffab1
> --- /dev/null
> +++ b/meta/recipes-connectivity/socat/socat/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/bash

is bash really needed ?
> +
> +export SOCAT="/usr/bin/socat"
> +
> +./test.sh
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.3.bbb/meta/recipes-connectivity/socat/
socat_1.7.2.3.bb
> index 99060b1..2e763bb 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
> @@ -7,6 +7,8 @@ SECTION = "console/network"
>
>  DEPENDS = "openssl readline"
>
> +RDEPENDS_${PN}-ptest += "bash"
> +
>  LICENSE = "GPL-2.0+-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
>
 file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
> @@ -14,7 +16,9 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=18810669f13b87348459e611d31ab760 \
>
>  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2\
>             file://compile.patch \
> -           file://fix-xxx_SHIFT-autoheader.patch"
> +           file://fix-xxx_SHIFT-autoheader.patch \
> +           file://run-ptest \
> +"
>
>  SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
>  SRC_URI[sha256sum] =
"0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
> @@ -27,7 +31,7 @@ EXTRA_OECONF += "ac_cv_have_z_modifier=yes
sc_cv_sys_crdly_shift=9 \
>          ac_cv_ispeed_offset=13 \
>  "
>
> -inherit autotools
> +inherit autotools ptest
>
>  do_configure_prepend() {
>      sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
> @@ -38,3 +42,7 @@ do_install_prepend () {
>      mkdir -p ${D}${bindir}
>      install -d ${D}${bindir} ${D}${mandir}/man1
>  }
> +
> +do_install_ptest() {
> +    cp -r ${S}/*.sh ${D}${PTEST_PATH}
> +}
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e0153673edb16a404f24140f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">-Khem<br>
On Feb 12, 2014 6:57 PM, &quot;Hongxu Jia&quot; &lt;<a href=3D"mailto:hongx=
u.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.c=
om">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-connectivity/socat/socat/run-ptest =C2=A0| =C2=A05 =
+++++<br>
&gt; =C2=A0meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.2.3.=
bb">socat_1.7.2.3.bb</a> | 12 ++++++++++--<br>
&gt; =C2=A02 files changed, 15 insertions(+), 2 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/socat/socat/run-pte=
st<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/socat/socat/run-ptest b/meta/re=
cipes-connectivity/socat/socat/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1fffab1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/socat/socat/run-ptest<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +#!/bin/bash</p>
<p dir=3D"ltr">is bash really needed ?<br>
&gt; +<br>
&gt; +export SOCAT=3D&quot;/usr/bin/socat&quot;<br>
&gt; +<br>
&gt; +./test.sh<br>
&gt; diff --git a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1=
.7.2.3.bb">socat_1.7.2.3.bb</a> b/meta/recipes-connectivity/socat/<a href=
=3D"http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a><br>
&gt; index 99060b1..2e763bb 100644<br>
&gt; --- a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.2.3.=
bb">socat_1.7.2.3.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.7.2.3.=
bb">socat_1.7.2.3.bb</a><br>
&gt; @@ -7,6 +7,8 @@ SECTION =3D &quot;console/network&quot;<br>
&gt;<br>
&gt; =C2=A0DEPENDS =3D &quot;openssl readline&quot;<br>
&gt;<br>
&gt; +RDEPENDS_${PN}-ptest +=3D &quot;bash&quot;<br>
&gt; +<br>
&gt; =C2=A0LICENSE =3D &quot;GPL-2.0+-with-OpenSSL-exception&quot;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D18810669f13b8734=
8459e611d31ab760 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://README;beginline=3D252;endline=3D282;md5=3D79246f11a1db0b6ccec=
54d1fb711c01e&quot;<br>
&gt; @@ -14,7 +16,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1881=
0669f13b87348459e611d31ab760 \<br>
&gt;<br>
&gt; =C2=A0SRC_URI =3D &quot;<a href=3D"http://www.dest-unreach.org/socat/d=
ownload/socat-${PV}.tar.bz2">http://www.dest-unreach.org/socat/download/soc=
at-${PV}.tar.bz2</a> \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://compile.patch \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-xxx_SHIFT-autoheader.p=
atch&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-xxx_SHIFT-autoheader.p=
atch \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;75008d8baf7c6c9e27aa7afb34a622de&quot;=
<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D &quot;0598ac54af7b138cda9e3c141bcf0cc63ee=
b2ab31f468a772dc3f7eb3896aad0&quot;<br>
&gt; @@ -27,7 +31,7 @@ EXTRA_OECONF +=3D &quot;ac_cv_have_z_modifier=3Dyes =
sc_cv_sys_crdly_shift=3D9 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_ispeed_offset=3D13 \<br>
&gt; =C2=A0&quot;<br>
&gt;<br>
&gt; -inherit autotools<br>
&gt; +inherit autotools ptest<br>
&gt;<br>
&gt; =C2=A0do_configure_prepend() {<br>
&gt; =C2=A0 =C2=A0 =C2=A0sed &#39;/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DE=
FINE(OSPEED_OFFSET,\<br>
&gt; @@ -38,3 +42,7 @@ do_install_prepend () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${bindir}<br>
&gt; =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir} ${D}${mandir}/man1<br>
&gt; =C2=A0}<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; + =C2=A0 =C2=A0cp -r ${S}/*.sh ${D}${PTEST_PATH}<br>
&gt; +}<br>
&gt; --<br>
&gt; 1.8.1.2<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--089e0153673edb16a404f24140f8--
