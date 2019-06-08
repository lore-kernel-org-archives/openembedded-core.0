Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 662F57E47C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 00:56:46 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id i21so5373532ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fkW4X28wwX/x5gTSgczvxUmH5XxSYwaMi7vkKgmhS4w=;
	b=PrGia+kWnf9kcHJAwbUWZ4R+sxMuJ6oDkbaZ2aTaCSs1GUlkvtf29dJOZdF4x4l1MM
	BAH67Gpe24hTnOhD/NbviHBvCrDp6v4Hk3BG9d+vkGrzH1HuQM/QTvgx88pBg3qP9nhc
	VJi8yNO5wV+qoxq6iOOAeEobf1ACUjL6x8AGCKmah3XnwWB+H5b8IsQE1YFQVywJqJGd
	bsFLIMFoYN+DOpncvwUCsUhgd86YRmRqtdksYFVFLAlZivGSUv7GGk71rCRsXJJM5C4Q
	h1WMIdNL9IoUaR09Zlg+leMNRGyBOF7sS4gATZKhIKpbTdHfRzSRW+ZQJ9JTSt8jmAka
	G0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fkW4X28wwX/x5gTSgczvxUmH5XxSYwaMi7vkKgmhS4w=;
	b=cB3PaaejxuN0/dVvbcoNy3MpVelhzbmsTVuXKDtADW/9R7fz4jNsuofgyg+07ajDv4
	Vw7o12mrI89CsXZxUvcyx71FptCoT/wu39rh3GKou5p6kJW3j35VCVSLbIG+YQf+1yMy
	9fxA5WyRLadPZhvPgG08LQ8075cWfzgrLUqONEimF4ig8HkgGqB+zy3dbu1zQbtNpB4+
	J8uEFU+Oi37I2CZVmKOkcle+9GI0orm9eWU0/c+xaOaAqVfoT48lP0O2JvQPHw5VlBNl
	FwpHO9+WpiOfxwkZyPmDYdAa5sOajA/Z6UkEJRtzmt5GRvTWZvVaq8TMXn6Ei+hn+3tm
	HA8A==
X-Gm-Message-State: APjAAAWzOFYCKnjr1mGbBZhIXolA+rdU4H5StrHR+LSbRuMzZ8De7PdD
	OYOhCpu4Vzfp0BcInwi1Cmj2I5Tdb9I9xeQR/mU8dVAA
X-Google-Smtp-Source: APXvYqyJMkhqQXizqZTj4Si7NpgcH0zRq+Mjo+zZPQXEe8iW0tRl+EbTSjhmaAOAgqRVdKe02wHyHfTRhw1h0KncmdY=
X-Received: by 2002:a02:a493:: with SMTP id d19mr34066855jam.22.1559955407251; 
	Fri, 07 Jun 2019 17:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<7adf2becf20aa4ef98cadca5fed36553f8e4664d.1559950879.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <7adf2becf20aa4ef98cadca5fed36553f8e4664d.1559950879.git.timothy.t.orling@linux.intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 17:56:35 -0700
Message-ID: <CANx9H-CoPHJQVPFGVxBfZ9WogByz5Cy-PGEXYRGWXLy77XhpBQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] python3-scons-{native}: add recipe for v3.0.5
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
X-List-Received-Date: Sat, 08 Jun 2019 00:56:46 -0000
Content-Type: multipart/alternative; boundary="000000000000ea2c43058ac56b40"

--000000000000ea2c43058ac56b40
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 7, 2019 at 4:49 PM Tim Orling <timothy.t.orling@linux.intel.com>
wrote:

> SCons has supported python 3 since v3.0.0
> https://scons.org/tag/releases.html
>
> Fix shebangs in scripts
>
> [YOCTO #13381]
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 ++
>  .../python/python3-scons-native_3.0.5.bb      |  8 +++++
>  .../python/python3-scons_3.0.5.bb             | 29 +++++++++++++++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/
> python3-scons-native_3.0.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-scons_3.0.5.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index d6f66510e3..6ddf9f5fc7 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -604,6 +604,8 @@ RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <
> derek@asterius.io>"
>  RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
>  RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io
> >"
>  RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io
> >"
> +RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> +RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling
> <timothy.t.orling@linux.intel.como>"


Grr. Typo.


>  RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <
> derek@asterius.io>"
>  RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
>  RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
> diff --git a/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
> b/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
> new file mode 100644
> index 0000000000..5cd5956625
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
> @@ -0,0 +1,8 @@
> +require python3-scons_${PV}.bb
> +inherit native python3native
> +DEPENDS = "python3-native"
> +RDEPENDS_${PN} = ""
> +
> +do_install_append() {
> +    create_wrapper ${D}${bindir}/scons
> SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
> PYTHONNOUSERSITE='1'
> +}
> diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> new file mode 100644
> index 0000000000..91e4a945e3
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Software Construction tool (make/autotools replacement)"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> +SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
> +SRC_URI[sha256sum] =
> "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
> +
> +S = "${WORKDIR}/scons-${PV}"
> +
> +UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +inherit setuptools3
> +
> +do_install_prepend() {
> +    sed -i -e "s:/usr/bin/env python:/usr/bin/env python3:g" ${S}/script/*
> +}
> +
> +RDEPENDS_${PN} = "\
> +  python3-core \
> +  python3-fcntl \
> +  python3-io \
> +  python3-json \
> +  python3-shell \
> +  python3-pickle \
> +  python3-pprint \
> +  "
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ea2c43058ac56b40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 7, 2019 at 4:49 PM Tim Orling &lt;<a href=3D"ma=
ilto:timothy.t.orling@linux.intel.com">timothy.t.orling@linux.intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">SCons has supported pyt=
hon 3 since v3.0.0<br>
<a href=3D"https://scons.org/tag/releases.html" rel=3D"noreferrer" target=
=3D"_blank">https://scons.org/tag/releases.html</a><br>
<br>
Fix shebangs in scripts<br>
<br>
[YOCTO #13381]<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.inte=
l.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-scons-native_3.0.5.bb" rel=3D"no=
referrer" target=3D"_blank">python3-scons-native_3.0.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-scons_3.0.5.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-scons_3.0.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 29 +++++++++++++++++++<br>
=C2=A03 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-scons-native_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-sc=
ons-native_3.0.5.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-scons_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0=
.5.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index d6f66510e3..6ddf9f5fc7 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -604,6 +604,8 @@ RECIPE_MAINTAINER_pn-python3-pip =3D &quot;Derek Straka=
 &lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.=
io</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-pycairo =3D &quot;Derek Straka &lt;<a hr=
ef=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;=
&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-pygments =3D &quot;Derek Straka &lt;<a h=
ref=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-pygobject =3D &quot;Derek Straka &lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;&quot;<br>
+RECIPE_MAINTAINER_pn-python3-scons =3D &quot;Tim Orling &lt;<a href=3D"mai=
lto:timothy.t.orling@linux.intel.com" target=3D"_blank">timothy.t.orling@li=
nux.intel.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-python3-scons-native =3D &quot;Tim Orling &lt;timothy=
.t.orling@linux.intel.como&gt;&quot;</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Grr. Typo.</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
=C2=A0RECIPE_MAINTAINER_pn-python3-setuptools =3D &quot;Derek Straka &lt;<a=
 href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-six =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-smmap =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-scons-n=
ative_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_3=
.0.5.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-scons-=
native_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_=
3.0.5.bb</a><br>
new file mode 100644<br>
index 0000000000..5cd5956625<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons-native_3=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_3.0.5.bb=
</a><br>
@@ -0,0 +1,8 @@<br>
+require python3-scons_${PV}.bb<br>
+inherit native python3native<br>
+DEPENDS =3D &quot;python3-native&quot;<br>
+RDEPENDS_${PN} =3D &quot;&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR=3D&#39;${ST=
AGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}&#39; PYTHONNOUSERSITE=3D&#39;1&#=
39;<br>
+}<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a><br>
new file mode 100644<br>
index 0000000000..91e4a945e3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a><br>
@@ -0,0 +1,29 @@<br>
+SUMMARY =3D &quot;Software Construction tool (make/autotools replacement)&=
quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D37bb53a08e6beaea0c90e7=
821d731284&quot;<br>
+<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz&quot;<br>
+SRC_URI[md5sum] =3D &quot;9f9c163e8bd48cf8cd92f03e85ca6395&quot;<br>
+SRC_URI[sha256sum] =3D &quot;df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c=
848958ba4befb73c73e&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/scons-${PV}&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://scons.org/pages/download.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://scons.org/pages/download.ht=
ml</a>&quot;<br>
+UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;<br>
+<br>
+inherit setuptools3<br>
+<br>
+do_install_prepend() {<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s:/usr/bin/env python:/usr/bin/env python3:g=
&quot; ${S}/script/*<br>
+}<br>
+<br>
+RDEPENDS_${PN} =3D &quot;\<br>
+=C2=A0 python3-core \<br>
+=C2=A0 python3-fcntl \<br>
+=C2=A0 python3-io \<br>
+=C2=A0 python3-json \<br>
+=C2=A0 python3-shell \<br>
+=C2=A0 python3-pickle \<br>
+=C2=A0 python3-pprint \<br>
+=C2=A0 &quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000ea2c43058ac56b40--
