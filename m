Return-Path: <lukas.woodtli@husqvarnagroup.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341D6C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:12:32 +0000 (UTC)
Subject: Re: [PATCH v2] python3-cython: upgrade 0.29.36 -> 3.0.5
To: openembedded-core@lists.openembedded.org
From: lukas.woodtli@husqvarnagroup.com
X-Originating-Location: Zurich, CH (217.162.244.238)
X-Originating-Platform: Linux Firefox 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Nov 2023 01:12:29 -0800
References: <20231120215820.1475322-1-tgamblin@baylibre.com>
In-Reply-To: <20231120215820.1475322-1-tgamblin@baylibre.com>
Message-ID: <23680.1701335549279273629@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5exfrKlGGnBR0txy6NG8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191483

--5exfrKlGGnBR0txy6NG8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for that patch!

We are very much interested in having a recent cython version in the openem=
bedded-core layer.
How about update to cython 3.0.6 which was just released on Nov 23?

See also remarks about=C2=A0LIC_FILES_CHKSUM and SRC_URI[sha256sum] (in the=
 quoted patches at the bottom of the mail).

Regards,
Lukas

On Mon, Nov 20, 2023 at 10:58 PM, Trevor Gamblin wrote:

>=20
> License-Update: Update license link to use https
>=20
> cython 3.0.x attempts to remain compatible with 0.29.x but still makes
> some major changes (in addition to fixing old issues). For a complete
> overview it's best to view the CHANGES.rst doc rather than including
> them here: https://github.com/cython/cython/blob/master/CHANGES.rst.
>=20
> Note that more source files were added to cython_fix_sources to avoid
> the following:
>=20
> |WARNING: python3-cython-3.0.5-r0 do_package_qa: QA Issue: File
> /usr/src/debug/python3-cython/3.0.5-r0/Cython/Utils.c in package
> python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/StringIOTree.c in
> package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Parsing.c in
> package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Code.c in
> package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Machines.c in
> package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/DFA.c in package
> python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Transitions.c in
> package python3-cython-src contains reference to TMPDIR [buildpaths]
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 rebases the patch to apply on latest master. There was a previous
> improvement made to the python3-cython recipe that was merged first.
>=20
> meta/recipes-devtools/python/python-cython.inc | 4 ++--
> ...python3-cython_0.29.36.bb =3D> python3-cython_3.0.5.bb} | 9 ++++++++-
> 2 files changed, 10 insertions(+), 3 deletions(-)
> rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb =3D>
> python3-cython_3.0.5.bb} (72%)
>=20
> diff --git a/meta/recipes-devtools/python/python-cython.inc
> b/meta/recipes-devtools/python/python-cython.inc
> index 6aec6b012f1..e757e3f7c87 100644
> --- a/meta/recipes-devtools/python/python-cython.inc
> +++ b/meta/recipes-devtools/python/python-cython.inc
> @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice,
> high-level, easy-to-use world
> and the messy, low-level world of C."
> SECTION =3D "devel/python"
> LICENSE =3D "Apache-2.0"

LIC_FILES_CHKSUM should be moved into the `bb` file as it changes when the =
cython version changes.

>=20
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De23fadd6ceef8c618fc1c65191d846fa"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62bc9f69c"
>=20
> PYPI_PACKAGE =3D "Cython"
> BBCLASSEXTEND =3D "native nativesdk"

SRC_URI[sha256sum]: Same as LIC_FILES_CHKSUM (should be moved into the `bb`=
 file)
>=20
>=20
> -SRC_URI[sha256sum] =3D
> "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> +SRC_URI[sha256sum] =3D
> "39318348db488a2f24e7c84e08bdc82f2624853c0fea8b475ea0b70b27176492"
> UPSTREAM_CHECK_REGEX =3D "Cython-(?P<pver>.*)\.tar"
>=20
> inherit pypi
> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
> b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
> similarity index 72%
> rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> rename to meta/recipes-devtools/python/python3-cython_3.0.5.bb
> index 07638d7ad78..342c0f8f3fe 100644
> --- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
> +++ b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
> @@ -20,14 +20,21 @@ do_install:append() {
> PACKAGESPLITFUNCS =3D+ "cython_fix_sources"
>=20
> cython_fix_sources () {
> - for f in ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
> + for f in ${PKGD}${TARGET_DBSRC_DIR}/Cython/Compiler/Code.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FusedNode.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Parsing.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Scanning.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Visitor.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Actions.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/DFA.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Machines.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Scanners.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Transitions.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Runtime/refnanny.c \
> ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/StringIOTree.c \
> + ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Utils.c \
> ${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
> if [ -e $f ]; then
> sed -i -e 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
> --
> 2.42.0

--5exfrKlGGnBR0txy6NG8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for that patch!<br /><br />We are very much interested in having =
a recent cython version in the openembedded-core layer.<br />How about upda=
te to cython 3.0.6 which was just released on Nov 23?<br /><br />See also r=
emarks about&nbsp;LIC_FILES_CHKSUM and SRC_URI[sha256sum] (in the quoted pa=
tches <span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span =
class=3D"ryNqvb">at the bottom of the mail).<br /><br />Regards,<br />Lukas=
</span></span></span><br /><br /><br />On Mon, Nov 20, 2023 at 10:58 PM, Tr=
evor Gamblin wrote:<br />
<blockquote>License-Update: Update license link to use https<br /><br />cyt=
hon 3.0.x attempts to remain compatible with 0.29.x but still makes<br />so=
me major changes (in addition to fixing old issues). For a complete<br />ov=
erview it's best to view the CHANGES.rst doc rather than including<br />the=
m here: <a href=3D"https://github.com/cython/cython/blob/master/CHANGES.rst=
" target=3D"_blank" rel=3D"noopener">https://github.com/cython/cython/blob/=
master/CHANGES.rst</a>.<br /><br />Note that more source files were added t=
o cython_fix_sources to avoid<br />the following:<br /><br />|WARNING: pyth=
on3-cython-3.0.5-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cy=
thon/3.0.5-r0/Cython/Utils.c in package python3-cython-src contains referen=
ce to TMPDIR<br />|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Strin=
gIOTree.c in package python3-cython-src contains reference to TMPDIR<br />|=
File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Parsing.c in pa=
ckage python3-cython-src contains reference to TMPDIR<br />|File /usr/src/d=
ebug/python3-cython/3.0.5-r0/Cython/Compiler/Code.c in package python3-cyth=
on-src contains reference to TMPDIR<br />|File /usr/src/debug/python3-cytho=
n/3.0.5-r0/Cython/Plex/Machines.c in package python3-cython-src contains re=
ference to TMPDIR<br />|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/=
Plex/DFA.c in package python3-cython-src contains reference to TMPDIR<br />=
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Transitions.c in p=
ackage python3-cython-src contains reference to TMPDIR [buildpaths]<br /><b=
r />Signed-off-by: Trevor Gamblin &lt;tgamblin@baylibre.com&gt;<br />---<br=
 />v2 rebases the patch to apply on latest master. There was a previous<br =
/>improvement made to the python3-cython recipe that was merged first.<br /=
><br />meta/recipes-devtools/python/python-cython.inc | 4 ++--<br />...pyth=
on3-cython_0.29.36.bb =3D&gt; python3-cython_3.0.5.bb} | 9 ++++++++-<br />2=
 files changed, 10 insertions(+), 3 deletions(-)<br />rename meta/recipes-d=
evtools/python/{python3-cython_0.29.36.bb =3D&gt; python3-cython_3.0.5.bb} =
(72%)<br /><br />diff --git a/meta/recipes-devtools/python/python-cython.in=
c b/meta/recipes-devtools/python/python-cython.inc<br />index 6aec6b012f1..=
e757e3f7c87 100644<br />--- a/meta/recipes-devtools/python/python-cython.in=
c<br />+++ b/meta/recipes-devtools/python/python-cython.inc<br />@@ -5,11 +=
5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-=
to-use world<br />and the messy, low-level world of C."<br />SECTION =3D "d=
evel/python"<br />LICENSE =3D "Apache-2.0"</blockquote>
LIC_FILES_CHKSUM should be moved into the `bb` file as it changes when the =
cython version changes.<br />
<blockquote>-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De23fadd6ceef8c6=
18fc1c65191d846fa"<br />+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c=
3ee8961575861fa86c7e62bc9f69c"<br /><br />PYPI_PACKAGE =3D "Cython"<br />BB=
CLASSEXTEND =3D "native nativesdk"</blockquote>
SRC_URI[sha256sum]: Same as LIC_FILES_CHKSUM (should be moved into the `bb`=
 file)
<blockquote>-SRC_URI[sha256sum] =3D "41c0cfd2d754e383c9eeb95effc9aa4ab847d0=
c9747077ddd7c0dcb68c3bc01f"<br />+SRC_URI[sha256sum] =3D "39318348db488a2f2=
4e7c84e08bdc82f2624853c0fea8b475ea0b70b27176492"<br />UPSTREAM_CHECK_REGEX =
=3D "Cython-(?P&lt;pver&gt;.*)\.tar"<br /><br />inherit pypi<br />diff --gi=
t a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-d=
evtools/python/python3-cython_3.0.5.bb<br />similarity index 72%<br />renam=
e from meta/recipes-devtools/python/python3-cython_0.29.36.bb<br />rename t=
o meta/recipes-devtools/python/python3-cython_3.0.5.bb<br />index 07638d7ad=
78..342c0f8f3fe 100644<br />--- a/meta/recipes-devtools/python/python3-cyth=
on_0.29.36.bb<br />+++ b/meta/recipes-devtools/python/python3-cython_3.0.5.=
bb<br />@@ -20,14 +20,21 @@ do_install:append() {<br />PACKAGESPLITFUNCS =
=3D+ "cython_fix_sources"<br /><br />cython_fix_sources () {<br />- for f i=
n ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \<br />+ for f =
in ${PKGD}${TARGET_DBSRC_DIR}/Cython/Compiler/Code.c \<br />+ ${PKGD}${TARG=
ET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \<br />${PKGD}${TARGET_DBGSRC_=
DIR}/Cython/Compiler/FusedNode.c \<br />+ ${PKGD}${TARGET_DBGSRC_DIR}/Cytho=
n/Compiler/Parsing.c \<br />${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Sca=
nning.c \<br />${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Visitor.c \<br /=
>${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Actions.c \<br />+ ${PKGD}${TARGET=
_DBGSRC_DIR}/Cython/Plex/DFA.c \<br />+ ${PKGD}${TARGET_DBGSRC_DIR}/Cython/=
Plex/Machines.c \<br />${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Scanners.c \=
<br />+ ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Transitions.c \<br />${PKGD=
}${TARGET_DBGSRC_DIR}/Cython/Runtime/refnanny.c \<br />${PKGD}${TARGET_DBGS=
RC_DIR}/Cython/Tempita/_tempita.c \<br />+ ${PKGD}${TARGET_DBGSRC_DIR}/Cyth=
on/StringIOTree.c \<br />+ ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Utils.c \<br =
/>${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do<br /=
>if [ -e $f ]; then<br />sed -i -e 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGS=
RC_DIR}#g' $f<br />-- <br />2.42.0</blockquote>

--5exfrKlGGnBR0txy6NG8--

