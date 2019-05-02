Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 09BB46B07E;
	Thu,  2 May 2019 13:49:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p21so2943735wmc.0;
	Thu, 02 May 2019 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aKdYcwuNL39Fh96hsMPKaS94g820k9c4budyqNLhJ1I=;
	b=kIjfjroIyCbfPu4C9Jc4W62B0FKlOdIFk7orDVU7Jub1eFEoX4MoNbduGIhzU4qUGi
	udo0jHTGElFLrrF1kaQSWUjAVBfjMR/ujMEgD1VUzzxVxn3fjn8YbtKEnUsRPBPWa20h
	LvJuRN2pEFbe04dy+0TOrwqAXiVFTxXHIrzk+7ohya1m440jIgUjutgrLnXlJpVhL82f
	sVEWVJFqoFF7e4ODxsmN2s7vubck9PNf3F+KjCIh9vCISwLgNlGpAZnUhEymOnHVOb6l
	M1SD6cDVC9vk06d3DH5m4DmLqGxRSePOsn34N2xzXDQBbMeN8VLCvYsGefmXny6UZDk+
	QeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aKdYcwuNL39Fh96hsMPKaS94g820k9c4budyqNLhJ1I=;
	b=X1bAW1BSN/3Cve6gfwTo5lc9+1/5z/CCYYWdDFJEvf/nTqwt+FWfz0xLsBfWy+vqB+
	HZYOCHJ5TO7Lwjr//w9AEYdD8tHInBUfeHzsZ7UV1TY7YHsD8dvlvxkEhq6hxpxr9XFE
	d5FCXCOrUu7/CdcPu1+++ed2ty/AqBlwiYajk5F58lvT9No3wjiZWy2XJsvfze1lQVLr
	zTz3QsxdZba7KrAptHCU1lv3akqbWbZowjs5ZnuDCfVxK0fASVovVzexYYgYdBySUoFe
	7k65ZC4AJIztd7+XFQGysEsazSKEfNfHRResxRC7f7LYZ0GESTg1xshG+tJoS/CQZ4Bz
	FY5w==
X-Gm-Message-State: APjAAAVXas1w9aVfI3xrC3BEoYNdKueZ7B8Zp9AKo83Y20So2ywnrvc/
	GlNabF742/l237Zydp3iKOw6kVW4LCV1Yd+SqSJlUL+S
X-Google-Smtp-Source: APXvYqwvgBpHpxcaGGRO123VvAJBo+Jc0i4GUMmQsesnZnV0XTwhXXufx4mKMCcn04TOMev2oQi+QlqJnzrB7g1mH8k=
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr2336471wmb.94.1556804996478; 
	Thu, 02 May 2019 06:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <155499283467.6906.16335063072407349482@git.openembedded.org>
	<20190411142717.1FC7E234873@git.openembedded.org>
In-Reply-To: <20190411142717.1FC7E234873@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 May 2019 15:49:58 +0200
Message-ID: <CA+chaQcFNPhWfdg-sJoPgaK-8DYhHe9imoKpefv+49ntLR33fQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 59/67: opkg: add ptest
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
X-List-Received-Date: Thu, 02 May 2019 13:49:56 -0000
Content-Type: multipart/alternative; boundary="000000000000ccbecb0587e7e8ed"

--000000000000ccbecb0587e7e8ed
Content-Type: text/plain; charset="UTF-8"

Hi,

there is small issue with this in cases where OPKGLIBDIR is set to /usr/lib.

Then all ptest files get packaged in libopkg instead of opkg-ptest and
correct QA error is triggered:
ERROR: QA Issue: /usr/lib/opkg/ptest/tests/opkgcl.py contained in package
libopkg requires /usr/bin/python3, but no providers found in
RDEPENDS_libopkg? [file-rdeps]

# $FILES_libopkg
#   set
/jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/
opkg_0.4.0.bb:62
#     "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
FILES_libopkg="/usr/lib/*.so.* /usr/lib/opkg/"

# $FILES_opkg-ptest [2 operations]
#   set
/jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:9
#     "${PTEST_PATH}"
#   rename from FILES_${PN}-ptest data.py:117 [expandKeys]
#     "${PTEST_PATH}"
# pre-expansion value:
#   "${PTEST_PATH}"
FILES_opkg-ptest="/usr/lib/opkg/ptest"

# $PACKAGES [4 operations]
#   set
/jenkins/mjansa/build-webos-master/oe-core/meta/conf/bitbake.conf:292
#     "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PACKAGE_BEFORE_PN} ${PN}"
#   set
/jenkins/mjansa/build-webos-master/oe-core/meta/conf/documentation.conf:314
#     [doc] "The list of packages to be created from the recipe."
#   prepend
/jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:20
#     "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
#   prepend
/jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/
opkg_0.4.0.bb:60
#     "libopkg"
# pre-expansion value:
#   "libopkg ${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '',
d)} ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PACKAGE_BEFORE_PN} ${PN}"
PACKAGES="libopkg opkg-ptest opkg-src opkg-dbg opkg-staticdev opkg-dev
opkg-doc opkg-locale  opkg"

The easiest fix should be to reorder PACKAGES (the _prepends) so that
${PN}-ptest is prepended later -> ends before libopkg).

I'll send patch shortly.

On Thu, Apr 11, 2019 at 4:27 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit cae2b2fb733bc62523ae75df2bc01096059d27b2
> Author: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> AuthorDate: Wed Apr 10 15:54:23 2019 -0500
>
>     opkg: add ptest
>
>     Install opkg test suite and run it as ptest.
>
>     Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...pkg-add-target-for-testsuite-installation.patch | 43
> ++++++++++++++++++++++
>  ...sue72.py-resolve-paths-before-comparision.patch | 31 ++++++++++++++++
>  meta/recipes-devtools/opkg/opkg/run-ptest          |  5 +++
>  meta/recipes-devtools/opkg/opkg_0.4.0.bb           |  6 ++-
>  4 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
> b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
> new file mode 100644
> index 0000000..951c186
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
> @@ -0,0 +1,43 @@
> +From 8fb0364bd0e19f35c20616dd1ab10aa00e08fa8f Mon Sep 17 00:00:00 2001
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Date: Wed, 10 Apr 2019 14:49:43 -0500
> +Subject: [PATCH] opkg: add target for testsuite installation
> +
> +- Add target to install testsuite
> +- Add override of opkg binary used during test via OPKG_PATH environment
> +variable.
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +---
> +Upstream-Status: Submitted
> +
> + Makefile.am  | 5 +++++
> + tests/cfg.py | 2 +-
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 90cfcae..1f6a784 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -18,3 +18,8 @@ run-tests:
> +       $(MAKE) -C tests DATADIR=@datadir@ SYSCONFDIR=@sysconfdir@
> VARDIR=@localstatedir@
> +
> + check: run-tests
> ++
> ++install-ptest:
> ++      cp -r $(srcdir)/tests $(DESTDIR)
> ++      cp Makefile $(DESTDIR)
> ++      sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
> +diff --git a/tests/cfg.py b/tests/cfg.py
> +index 4efaff6..ca59d03 100644
> +--- a/tests/cfg.py
> ++++ b/tests/cfg.py
> +@@ -2,4 +2,4 @@ import os
> +
> + opkdir = "/tmp/opk"
> + offline_root = "/tmp/opkg"
> +-opkgcl = os.path.realpath("../src/opkg")
> ++opkgcl = os.getenv('OPKG_PATH', os.path.realpath("../src/opkg"))
> +--
> +2.20.1
> +
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
> b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
> new file mode 100644
> index 0000000..75ecb5f
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
> @@ -0,0 +1,31 @@
> +From 5f005830eea7d03c02107a3a3fc58907b0a037bf Mon Sep 17 00:00:00 2001
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Date: Mon, 8 Apr 2019 11:14:56 -0500
> +Subject: [PATCH] regress/issue72.py: resolve paths before comparision
> +
> +In systems that have a volatile /tmp, the test incorrectly fails since
> +it doesn't resolve the real path in all cases.
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +---
> +Upstream-Status: Submitted
> +
> + tests/regress/issue72.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/regress/issue72.py b/tests/regress/issue72.py
> +index 1626877..2f24dec 100755
> +--- a/tests/regress/issue72.py
> ++++ b/tests/regress/issue72.py
> +@@ -56,7 +56,7 @@ if not os.path.lexists("{}/{}".format(cfg.offline_root,
> long_filename2)):
> +                               "not created.")
> +
> + linky = os.path.realpath("{}/{}".format(cfg.offline_root,
> long_filename2))
> +-linky_dst = "{}/{}".format(cfg.offline_root, long_filename)
> ++linky_dst = os.path.realpath("{}/{}".format(cfg.offline_root,
> long_filename))
> + if linky != linky_dst:
> +       opk.fail("symlink path truncated.")
> +
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
> b/meta/recipes-devtools/opkg/opkg/run-ptest
> new file mode 100644
> index 0000000..5fb7077
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +OPKG_PATH=$(which opkg)
> +
> +make OPKG_PATH=$OPKG_PATH run-tests
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> index a2329d3..20c2e0b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> @@ -15,12 +15,15 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>             file://0001-libopkg-add-add-ignore-recommends-option.patch \
> +
>  file://0001-regress-issue72.py-resolve-paths-before-comparision.patch \
> +           file://0001-opkg-add-target-for-testsuite-installation.patch \
> +           file://run-ptest \
>  "
>
>  SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
>  SRC_URI[sha256sum] =
> "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig systemd ptest
>
>  target_localstatedir := "${localstatedir}"
>  OPKGLIBDIR = "${target_localstatedir}/lib"
> @@ -49,6 +52,7 @@ do_install_append () {
>  RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config
> libarchive"
>  RDEPENDS_${PN}_class-native = ""
>  RDEPENDS_${PN}_class-nativesdk = ""
> +RDEPENDS_${PN}-ptest += "make binutils python3-core python3-compression"
>  RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
>  RCONFLICTS_${PN} = "opkg-collateral"
>  RPROVIDES_${PN} = "opkg-collateral"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--000000000000ccbecb0587e7e8ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>there is=
 small issue with this in cases where=C2=A0OPKGLIBDIR is set to /usr/lib.</=
div><div><br></div><div>Then all ptest files get packaged in libopkg instea=
d of opkg-ptest and correct QA error is triggered:</div><div>ERROR: QA Issu=
e: /usr/lib/opkg/ptest/tests/opkgcl.py contained in package libopkg require=
s /usr/bin/python3, but no providers found in RDEPENDS_libopkg? [file-rdeps=
]<br></div><div><br></div><div><div># $FILES_libopkg</div><div>#=C2=A0 =C2=
=A0set /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opk=
g/<a href=3D"http://opkg_0.4.0.bb:62">opkg_0.4.0.bb:62</a></div><div>#=C2=
=A0 =C2=A0 =C2=A0&quot;${libdir}/*.so.* ${OPKGLIBDIR}/opkg/&quot;</div><div=
>FILES_libopkg=3D&quot;/usr/lib/*.so.* /usr/lib/opkg/&quot;</div></div><div=
><br></div><div><div># $FILES_opkg-ptest [2 operations]</div><div>#=C2=A0 =
=C2=A0set /jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbc=
lass:9</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;${PTEST_PATH}&quot;</div><div>#=
=C2=A0 =C2=A0rename from FILES_${PN}-ptest data.py:117 [expandKeys]</div><d=
iv>#=C2=A0 =C2=A0 =C2=A0&quot;${PTEST_PATH}&quot;</div><div># pre-expansion=
 value:</div><div>#=C2=A0 =C2=A0&quot;${PTEST_PATH}&quot;</div><div>FILES_o=
pkg-ptest=3D&quot;/usr/lib/opkg/ptest&quot;</div></div><div><br></div><div>=
# $PACKAGES [4 operations]<br></div><div><div>#=C2=A0 =C2=A0set /jenkins/mj=
ansa/build-webos-master/oe-core/meta/conf/bitbake.conf:292</div><div>#=C2=
=A0 =C2=A0 =C2=A0&quot;${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-=
doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}&quot;</div><div>#=C2=A0 =C2=A0s=
et /jenkins/mjansa/build-webos-master/oe-core/meta/conf/documentation.conf:=
314</div><div>#=C2=A0 =C2=A0 =C2=A0[doc] &quot;The list of packages to be c=
reated from the recipe.&quot;</div><div>#=C2=A0 =C2=A0prepend /jenkins/mjan=
sa/build-webos-master/oe-core/meta/classes/ptest.bbclass:20</div><div>#=C2=
=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1=
&#39;, &#39;${PN}-ptest&#39;, &#39;&#39;, d)}&quot;</div><div>#=C2=A0 =C2=
=A0prepend /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools=
/opkg/<a href=3D"http://opkg_0.4.0.bb:60">opkg_0.4.0.bb:60</a></div><div>#=
=C2=A0 =C2=A0 =C2=A0&quot;libopkg&quot;</div><div># pre-expansion value:</d=
iv><div>#=C2=A0 =C2=A0&quot;libopkg ${@bb.utils.contains(&#39;PTEST_ENABLED=
&#39;, &#39;1&#39;, &#39;${PN}-ptest&#39;, &#39;&#39;, d)} ${PN}-src ${PN}-=
dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} $=
{PN}&quot;</div><div>PACKAGES=3D&quot;libopkg opkg-ptest opkg-src opkg-dbg =
opkg-staticdev opkg-dev opkg-doc opkg-locale=C2=A0 opkg&quot;</div></div><d=
iv><br></div><div>The easiest fix should be to reorder PACKAGES (the _prepe=
nds) so that ${PN}-ptest is prepended later -&gt; ends before libopkg).<br>=
</div><div><br></div><div>I&#39;ll send patch shortly.</div></div></div></d=
iv></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 11, 2019 at 4:27 PM &lt;<a href=3D"mailto:=
git@git.openembedded.org">git@git.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">This is an automated emai=
l from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit cae2b2fb733bc62523ae75df2bc01096059d27b2<br>
Author: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@=
ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
AuthorDate: Wed Apr 10 15:54:23 2019 -0500<br>
<br>
=C2=A0 =C2=A0 opkg: add ptest<br>
<br>
=C2=A0 =C2=A0 Install opkg test suite and run it as ptest.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:a=
lejandro.delcastillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com=
</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
---<br>
=C2=A0...pkg-add-target-for-testsuite-installation.patch | 43 +++++++++++++=
+++++++++<br>
=C2=A0...sue72.py-resolve-paths-before-comparision.patch | 31 +++++++++++++=
+++<br>
=C2=A0meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +++<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 ++-<br>
=C2=A04 files changed, 84 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-tests=
uite-installation.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-tar=
get-for-testsuite-installation.patch<br>
new file mode 100644<br>
index 0000000..951c186<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-in=
stallation.patch<br>
@@ -0,0 +1,43 @@<br>
+From 8fb0364bd0e19f35c20616dd1ab10aa00e08fa8f Mon Sep 17 00:00:00 2001<br>
+From: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@n=
i.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+Date: Wed, 10 Apr 2019 14:49:43 -0500<br>
+Subject: [PATCH] opkg: add target for testsuite installation<br>
+<br>
+- Add target to install testsuite<br>
+- Add override of opkg binary used during test via OPKG_PATH environment<b=
r>
+variable.<br>
+<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+---<br>
+Upstream-Status: Submitted<br>
+<br>
+ Makefile.am=C2=A0 | 5 +++++<br>
+ tests/cfg.py | 2 +-<br>
+ 2 files changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 90cfcae..1f6a784 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -18,3 +18,8 @@ run-tests:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C tests DATADIR=3D@datadir@ SYSCONFDIR=
=3D@sysconfdir@ VARDIR=3D@localstatedir@<br>
+ <br>
+ check: run-tests<br>
++<br>
++install-ptest:<br>
++=C2=A0 =C2=A0 =C2=A0 cp -r $(srcdir)/tests $(DESTDIR)<br>
++=C2=A0 =C2=A0 =C2=A0 cp Makefile $(DESTDIR)<br>
++=C2=A0 =C2=A0 =C2=A0 sed -e &#39;s/^Makefile/_Makefile/&#39; &lt; Makefil=
e &gt; $(DESTDIR)/Makefile<br>
+diff --git a/tests/cfg.py b/tests/cfg.py<br>
+index 4efaff6..ca59d03 100644<br>
+--- a/tests/cfg.py<br>
++++ b/tests/cfg.py<br>
+@@ -2,4 +2,4 @@ import os<br>
+ <br>
+ opkdir =3D &quot;/tmp/opk&quot;<br>
+ offline_root =3D &quot;/tmp/opkg&quot;<br>
+-opkgcl =3D os.path.realpath(&quot;../src/opkg&quot;)<br>
++opkgcl =3D os.getenv(&#39;OPKG_PATH&#39;, os.path.realpath(&quot;../src/o=
pkg&quot;))<br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolv=
e-paths-before-comparision.patch b/meta/recipes-devtools/opkg/opkg/0001-reg=
ress-issue72.py-resolve-paths-before-comparision.patch<br>
new file mode 100644<br>
index 0000000..75ecb5f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths=
-before-comparision.patch<br>
@@ -0,0 +1,31 @@<br>
+From 5f005830eea7d03c02107a3a3fc58907b0a037bf Mon Sep 17 00:00:00 2001<br>
+From: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@n=
i.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+Date: Mon, 8 Apr 2019 11:14:56 -0500<br>
+Subject: [PATCH] regress/issue72.py: resolve paths before comparision<br>
+<br>
+In systems that have a volatile /tmp, the test incorrectly fails since<br>
+it doesn&#39;t resolve the real path in all cases.<br>
+<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+---<br>
+Upstream-Status: Submitted<br>
+<br>
+ tests/regress/issue72.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/regress/issue72.py b/tests/regress/issue72.py<br>
+index 1626877..2f24dec 100755<br>
+--- a/tests/regress/issue72.py<br>
++++ b/tests/regress/issue72.py<br>
+@@ -56,7 +56,7 @@ if not os.path.lexists(&quot;{}/{}&quot;.format(cfg.offl=
ine_root, long_filename2)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;not created.&quot;)<br>
+ <br>
+ linky =3D os.path.realpath(&quot;{}/{}&quot;.format(cfg.offline_root, lon=
g_filename2))<br>
+-linky_dst =3D &quot;{}/{}&quot;.format(cfg.offline_root, long_filename)<b=
r>
++linky_dst =3D os.path.realpath(&quot;{}/{}&quot;.format(cfg.offline_root,=
 long_filename))<br>
+ if linky !=3D linky_dst:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0opk.fail(&quot;symlink path truncated.&quot;)<b=
r>
+ <br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devto=
ols/opkg/opkg/run-ptest<br>
new file mode 100644<br>
index 0000000..5fb7077<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
@@ -0,0 +1,5 @@<br>
+#!/bin/sh<br>
+<br>
+OPKG_PATH=3D$(which opkg)<br>
+<br>
+make OPKG_PATH=3D$OPKG_PATH run-tests<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.4.0.bb</a><br>
index a2329d3..20c2e0b 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
@@ -15,12 +15,15 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproj=
ect.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer"=
 target=3D"_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}=
-${PV}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libopkg-add-add-ignor=
e-recommends-option.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-issue72.py-re=
solve-paths-before-comparision.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg-add-target-for-t=
estsuite-installation.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;ae51d95fee599bb4dce08453529158f5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f6c00515d8a2ad8f6742a8e73830315d1983ed04=
59cba77c4d656cfc9e7fe6fe&quot;<br>
<br>
-inherit autotools pkgconfig systemd<br>
+inherit autotools pkgconfig systemd ptest<br>
<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR =3D &quot;${target_localstatedir}/lib&quot;<br>
@@ -49,6 +52,7 @@ do_install_append () {<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-=
arch-config libarchive&quot;<br>
=C2=A0RDEPENDS_${PN}_class-native =3D &quot;&quot;<br>
=C2=A0RDEPENDS_${PN}_class-nativesdk =3D &quot;&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make binutils python3-core python3-compres=
sion&quot;<br>
=C2=A0RREPLACES_${PN} =3D &quot;opkg-nogpg opkg-collateral&quot;<br>
=C2=A0RCONFLICTS_${PN} =3D &quot;opkg-collateral&quot;<br>
=C2=A0RPROVIDES_${PN} =3D &quot;opkg-collateral&quot;<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--000000000000ccbecb0587e7e8ed--
