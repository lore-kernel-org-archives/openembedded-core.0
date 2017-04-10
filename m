Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6BE77A50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 07:50:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3A7o28f013136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 00:50:02 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 00:50:01 -0700
To: <openembedded-core@lists.openembedded.org>
From: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <6a2c84e8-b9b6-dd6e-8cc5-97fdd2ad5d89@windriver.com>
Date: Mon, 10 Apr 2017 15:49:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: [PATCH] python2/3: Move config/Makefile from core package to dev package
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
X-List-Received-Date: Mon, 10 Apr 2017 07:50:02 -0000
X-Groupsio-MsgNum: 96025
Content-Type: multipart/mixed; boundary="------------521585C68C8F58A470B95B49"

--------------521585C68C8F58A470B95B49
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
         Since my change involves the long line  in 
poky/meta/recipes-devtools/python/python-2.7-manifest.inc and 
python-3.5-manifest.inc, it can't pass the auto tests.
But I think my patch isn't needed to be changed. So send the patch again 
as an accessory.
         Thank you.

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------521585C68C8F58A470B95B49
Content-Type: text/x-diff;
	name="0001-python2-3-Move-config-Makefile-from-core-package-to-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0001-python2-3-Move-config-Makefile-from-core-package-to-.pa";
	filename*1="tch"

From 69243aaed16d4509047365f5953eb0508f4b223a Mon Sep 17 00:00:00 2001
From: Li Zhou <li.zhou@windriver.com>
Date: Sun, 9 Apr 2017 23:41:24 -0700
Subject: [PATCH] python2/3: Move config/Makefile from core package to dev
 package

Move config/Makefile in libdir from core package to dev package for
python, because it is only needed in development process.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 4 ++--
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/re=
cipes-devtools/python/python-2.7-manifest.inc
index 413405ae9a..7ed254bbd6 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -46,7 +46,7 @@ FILES_${PN}-contextlib=3D"${libdir}/python${PYTHON_MAJMIN=
}/contextlib.* "
=20
 SUMMARY_${PN}-core=3D"Python interpreter and core modules"
 RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re"
-FILES_${PN}-core=3D"${libdir}/python2.7/__future__.* ${libdir}/python2.7/_=
abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${libdir}/pyth=
on2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParse=
r.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir=
}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* =
${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/pyth=
on2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${li=
bdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2=
.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/pytho=
n2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdi=
r}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir=
}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* =
${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${libd=
ir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig=
*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core=3D"${libdir}/python2.7/__future__.* ${libdir}/python2.7/_=
abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${libdir}/pyth=
on2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParse=
r.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir=
}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* =
${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/pyth=
on2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${li=
bdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2=
.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/pytho=
n2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdi=
r}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir=
}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* =
${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${incl=
udedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}=
/sitecustomize.py "
=20
 SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt=3D"${PN}-core"
@@ -74,7 +74,7 @@ FILES_${PN}-debugger=3D"${libdir}/python2.7/bdb.* ${libdi=
r}/python2.7/pdb.* "
=20
 SUMMARY_${PN}-dev=3D"Python development package"
 RDEPENDS_${PN}-dev=3D"${PN}-core"
-FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la=
 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_=
libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
+FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la=
 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_=
libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python2.7/con=
fig/Makefile "
=20
 SUMMARY_${PN}-difflib=3D"Python helpers for computing deltas between objec=
ts"
 RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/re=
cipes-devtools/python/python-3.5-manifest.inc
index 55bcc4b6da..b78158ef00 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -38,7 +38,7 @@ FILES_${PN}-compression=3D"${libdir}/python3.5/gzip.* ${l=
ibdir}/python3.5/__pycach
=20
 SUMMARY_${PN}-core=3D"Python interpreter and core modules"
 RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN=
}-io ${PN}-math"
-FILES_${PN}-core=3D"${libdir}/python3.5/__future__.* ${libdir}/python3.5/_=
_pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/_=
_pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycach=
e__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* $=
{libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/=
python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/pyt=
hon3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libd=
ir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* $=
{libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libd=
ir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${lib=
dir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python=
3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath=
.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.*=
 ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${=
libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdi=
r}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python=
3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/_=
_pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__=
pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/_=
_pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${lib=
dir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/li=
b-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.=
*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynl=
oad/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so $=
{libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python=
3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/pla=
tform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libd=
ir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* $=
{libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* =
${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysco=
nfigdata.* ${libdir}/python3.5/config/Makefile ${libdir}/python3.5/config/M=
akefile/__pycache__ ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libd=
ir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_co=
llections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/=
python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core=3D"${libdir}/python3.5/__future__.* ${libdir}/python3.5/_=
_pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/_=
_pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycach=
e__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* $=
{libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/=
python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/pyt=
hon3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libd=
ir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* $=
{libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libd=
ir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${lib=
dir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python=
3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath=
.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.*=
 ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${=
libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdi=
r}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python=
3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/_=
_pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__=
pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/_=
_pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${lib=
dir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/li=
b-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.=
*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynl=
oad/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so $=
{libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python=
3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/pla=
tform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libd=
ir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* $=
{libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* =
${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysco=
nfigdata.* ${libdir}/python3.5/config/Makefile/__pycache__ ${includedir}/py=
thon${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collectio=
ns ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PY=
THON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize=
.py "
=20
 SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt=3D"${PN}-core"
@@ -66,7 +66,7 @@ FILES_${PN}-debugger=3D"${libdir}/python3.5/bdb.* ${libdi=
r}/python3.5/__pycache__/
=20
 SUMMARY_${PN}-dev=3D"Python development package"
 RDEPENDS_${PN}-dev=3D"${PN}-core"
-FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la=
 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_=
libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
+FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la=
 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_=
libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python3.5/con=
fig/Makefile "
=20
 SUMMARY_${PN}-difflib=3D"Python helpers for computing deltas between objec=
ts"
 RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
--=20
2.11.0


--------------521585C68C8F58A470B95B49--
