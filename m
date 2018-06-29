Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAC37544A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 15:13:31 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id c15-v6so10289677otl.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h+HPZcQ4xzxHD/qaTLPpH03MWpX0TBuPJ/Z4hUInqkQ=;
	b=HgtiOSnPYlWlT78u6zgHh9lHsUJVrTiL84RorHMzm6GQubrJx/K5xwuM0+fsopjEpp
	M4NDXBOdNtqqw9EEnT2UwDP7cB6pxUyQYYHvGEBJDytHnyHQNdUtz6ULCH9B82Vi0tlc
	jEdp7dbQ/7sjQT0FYzPc7ZPokeG7FpkjrGiflMqIG3EJe1fcrsOQwwu6TAc5tSXMZ1HR
	fya8DApEnMjPAWNiC8CiNlWcRaeYXWyBX7gC8Y7ZwvABzQ1+HXBrrM+V9nbAhfvf/zMR
	zCVa8UTQj8EAvWTLQYRvN3FnQwOBWUgdhO2Sp0LcbfUbD13LG90Are3qLlOOp3wEWddJ
	ks5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h+HPZcQ4xzxHD/qaTLPpH03MWpX0TBuPJ/Z4hUInqkQ=;
	b=MW5QgT1fLPnr4wL5u9HK+LayTH3ZuZOGcVm/JzMLtZbUg0QGZvP+/Z8KvPUJECSYHr
	ZutXstJfJT2aEphSoZujaH+EUWaPIs3PYpRWWOVWTqaVz6TYNwh7KNT/nGGB1P4n13KE
	c0cPVBOpdxnidMsxaT6+ht1u8nkscx99jYCD/py7cXcqTJGjZoWLPhwi275mTKoQ7u50
	kCd+KbR4qogZKHZdp5XGzMyWiqlilicmXvONPJfInYqfYiakSEZlBFPAPgLzn+q5SbOV
	iRzJFOxTcZ3va9zQ6Jqyqr1ViXuA8HlO67Nsz7tm+9SvSAa7mlnJrOU0JXhXrf4p/FAw
	Yefw==
X-Gm-Message-State: APt69E0dO/t2T1ZouzxOtDjMO+rOB/90H7uU+LeybdFup4KJ2d6fHQqJ
	UkIXRcs5oAH0rCKpb1LZSxA18BAr3md4sSqmML8=
X-Google-Smtp-Source: AAOMgpfnuadBJ245KXzH0SD67N3zXf+tWqvoHZX0c/5AGsPKqPGVVvm9zqshrZzUZYncjkPQoUNel45sVwcMMHlOsOs=
X-Received: by 2002:a9d:2f27:: with SMTP id
	h36-v6mr1946750otb.71.1530285212200; 
	Fri, 29 Jun 2018 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <1529865828-13206-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1529865828-13206-1-git-send-email-akuster808@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 29 Jun 2018 08:13:21 -0700
Message-ID: <CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: update 4.4.1
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
X-List-Received-Date: Fri, 29 Jun 2018 15:13:31 -0000
Content-Type: multipart/alternative; boundary="0000000000007a7805056fc94afc"

--0000000000007a7805056fc94afc
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster <akuster808@gmail.com> wrote:

> include several CVE fixes.
> CVE: CVE-2018-5733
> CVE: CVE-2018-5732
>
> LIC_CHKSUM_FILE updated to SPFX format
>
> https://kb.isc.org/article/AA-01571
>
> remove several patches now included in update.
> Shared libarary support is now enabled in configure+lt, use it
> and revert to autotools-brokensep
> Refresh patches
>
> alings support with bind 9.11.x
>
> add libxml2 support to configure.ac+lt
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-connectivity/dhcp/dhcp.inc            |  19 +-
>  ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-
>  .../dhcp/dhcp/0003-link-with-lcrypto.patch         |  13 +-
>  .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    | 109 +++++------
>  .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-
>  ...re-argument-to-make-the-libxml2-dependenc.patch |  40 +++-
>  .../dhcp/dhcp/0010-build-shared-libs.patch         | 208
> ---------------------
>  ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------
>  ...correct-the-intention-for-xml2-lib-search.patch |  13 +-
>  .../dhcp/dhcp/CVE-2017-3144.patch                  |  74 --------
>  .../dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}          |  12 +-
>  11 files changed, 120 insertions(+), 475 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
>  delete mode 100644
> meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
>  rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}
> (65%)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
> b/meta/recipes-connectivity/dhcp/dhcp.inc
> index e943707..2eb3513 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -8,7 +8,7 @@ easier to administer devices."
>  HOMEPAGE = "http://www.isc.org/"
>
>  LICENSE = "ISC"
> -LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
> +LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
>
>  DEPENDS = "openssl bind"
>
> @@ -24,7 +24,7 @@ SRC_URI = "
> http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
>  UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>
> -inherit autotools systemd useradd update-rc.d
> +inherit autotools-brokensep systemd useradd update-rc.d
>
>  USERADD_PACKAGES = "${PN}-server"
>  USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir
> /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
> @@ -48,11 +48,21 @@ EXTRA_OECONF =
> "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
>
>  --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
>
>  --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
>
>  --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
> -                --with-libbind=${STAGING_LIBDIR}/ \
>                  --enable-paranoia --disable-static \
>                  --with-randomdev=/dev/random \
> +                --with-libbind=${STAGING_DIR_HOST}/usr \
> +               --enable-libtool \
>                 "
>
> +#Enable shared libs per dhcp README
> +do_configure () {
> +       cd ${S}
> +       cp configure.ac+lt configure.ac
> +        autoreconf -i
> +       ./configure  ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +       automake
>

1. Why run automake when autoreconf already runs automake?
2. Why override do_configure and reproduce what's already in
autotools-brokensep rather than doing the cp in a do_configure_prepend?
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000007a7805056fc94afc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun=
, Jun 24, 2018 at 11:43 AM Armin Kuster &lt;<a href=3D"mailto:akuster808@gm=
ail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">include several CVE fixes.<br>
CVE: CVE-2018-5733<br>
CVE: CVE-2018-5732<br>
<br>
LIC_CHKSUM_FILE updated to SPFX format<br>
<br>
<a href=3D"https://kb.isc.org/article/AA-01571" rel=3D"noreferrer" target=
=3D"_blank">https://kb.isc.org/article/AA-01571</a><br>
<br>
remove several patches now included in update.<br>
Shared libarary support is now enabled in configure+lt, use it<br>
and revert to autotools-brokensep<br>
Refresh patches<br>
<br>
alings support with bind 9.11.x<br>
<br>
add libxml2 support to <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>+lt<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/dhcp/dhcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 19 +-<br>
=C2=A0...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |=C2=A0 13 +-<br>
=C2=A0.../dhcp/dhcp/0003-link-with-lcrypto.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 13 +-<br>
=C2=A0.../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch=C2=A0 =C2=A0 | 109 ++=
+++------<br>
=C2=A0.../dhcp/0006-site.h-enable-gentle-shutdown.patch=C2=A0 |=C2=A0 13 +-=
<br>
=C2=A0...re-argument-to-make-the-libxml2-dependenc.patch |=C2=A0 40 +++-<br=
>
=C2=A0.../dhcp/dhcp/0010-build-shared-libs.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 208 ---------------------<br>
=C2=A0...all-to-isc_app_ctxstart-to-not-get-signal.patch |=C2=A0 81 -------=
-<br>
=C2=A0...correct-the-intention-for-xml2-lib-search.patch |=C2=A0 13 +-<br>
=C2=A0.../dhcp/dhcp/CVE-2017-3144.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74 --------<br>
=C2=A0.../dhcp/{<a href=3D"http://dhcp_4.3.6.bb" rel=3D"noreferrer" target=
=3D"_blank">dhcp_4.3.6.bb</a> =3D&gt; <a href=3D"http://dhcp_4.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">dhcp_4.4.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A011 files changed, 120 insertions(+), 475 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0010-build-sha=
red-libs.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the=
-call-to-isc_app_ctxstart-to-not-get-signal.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.=
patch<br>
=C2=A0rename meta/recipes-connectivity/dhcp/{<a href=3D"http://dhcp_4.3.6.b=
b" rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a> =3D&gt; <a href=
=3D"http://dhcp_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">dhcp_4.4.1.b=
b</a>} (65%)<br>
<br>
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connect=
ivity/dhcp/dhcp.inc<br>
index e943707..2eb3513 100644<br>
--- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
@@ -8,7 +8,7 @@ easier to administer devices.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.isc.org/" rel=3D"noreferrer"=
 target=3D"_blank">http://www.isc.org/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;ISC&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;md5=3Dc5c64d696107=
f84b56fe337d14da1753&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;md5=3D004a4db50a1e=
20972e924a8618747c01&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl bind&quot;<br>
<br>
@@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.org/isc/dhcp/=
$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz</a> \<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.isc.org/isc/dhcp/" =
rel=3D"noreferrer" target=3D"_blank">ftp://ftp.isc.org/isc/dhcp/</a>&quot;<=
br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/&quot=
;<br>
<br>
-inherit autotools systemd useradd update-rc.d<br>
+inherit autotools-brokensep systemd useradd update-rc.d<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}-server&quot;<br>
=C2=A0USERADD_PARAM_${PN}-server =3D &quot;--system --no-create-home --home=
-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}&quot;<br>
@@ -48,11 +48,21 @@ EXTRA_OECONF =3D &quot;--with-srv-lease-file=3D${locals=
tatedir}/lib/dhcp/dhcpd.leases \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-srv6-l=
ease-file=3D${localstatedir}/lib/dhcp/dhcpd6.leases \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-cli-le=
ase-file=3D${localstatedir}/lib/dhcp/dhclient.leases \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-cli6-l=
ease-file=3D${localstatedir}/lib/dhcp/dhclient6.leases \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libbind=3D$=
{STAGING_LIBDIR}/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-para=
noia --disable-static \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-random=
dev=3D/dev/random \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-libbind=3D$=
{STAGING_DIR_HOST}/usr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-libtool \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+#Enable shared libs per dhcp README<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a>+lt <a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoreconf -i<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure=C2=A0 ${CONFIGUREOPTS} ${EXTRA_OECO=
NF}=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0automake<br></blockquote><div><br></div><div>1.=
 Why run automake when autoreconf already runs automake?</div><div>2. Why o=
verride do_configure and reproduce what&#39;s already in autotools-brokense=
p rather than doing the cp in a do_configure_prepend?<br clear=3D"all"></di=
v></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson=
<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus=
<br>Senior Software Engineer, Mentor Graphics</div></div></div></div></div>

--0000000000007a7805056fc94afc--
