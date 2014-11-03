Return-Path: <wrob311@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1434065DEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 23:59:19 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ex7so7979859wid.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 15:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:resent-from:resent-date:resent-message-id:resent-to:date
	:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8uff1F3rIh0hfEOGOjrhfU1WBI47N2cylcBEHqOUuzU=;
	b=FvXLND3t5xWhDTvsFG79AyLe1OtQgRxWUyeDkaHw2+SUmMpHYgDcCT9lza7A3pmut/
	zJOjnBVMxPhAst4+g5e733sbP0WtUiDBDgGk68WUlGnQWBztj2Qhee8MCjFAJHdrLSXF
	vDxfXSbDXAtFg6VIoHRxX642zMXtrFa9WJyeISEyNEaCKPXE3or/Cn9HNkOCs8PeThwm
	PORljmTXW1egN7GgALnzf3XdC+4QYN6do9BoNwXIs4nKxB48iGkPk1+QJ1yu4VkZyuee
	Hlr6dfzN00DV0lYro5W9hribV/iVOep9JpnrZTkmNYq2JXHjVBfrkhnJB6x5Oag0K0Ut
	OCQg==
X-Received: by 10.194.3.2 with SMTP id 2mr13784014wjy.89.1415059160032;
	Mon, 03 Nov 2014 15:59:20 -0800 (PST)
Received: from greymatter ([89.101.76.162]) by mx.google.com with ESMTPSA id
	ci9sm10366030wid.24.2014.11.03.15.59.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Nov 2014 15:59:19 -0800 (PST)
Sender: Artur Wroblewski <wrob311@gmail.com>
Received: (nullmailer pid 544 invoked by uid 1000);
	Mon, 03 Nov 2014 23:59:18 -0000
Resent-From: Artur Wroblewski <wrobell@pld-linux.org>
Resent-Date: Mon, 3 Nov 2014 23:59:18 +0000
Resent-Message-ID: <20141103235918.GD19739@greymatter>
Resent-To: openembedded-core@lists.openembedded.org
Date: Mon, 3 Nov 2014 23:51:57 +0000
From: Artur Wroblewski <wrobell@pld-linux.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141103235157.GC19739@greymatter>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: python 3.4.2 patch
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
X-List-Received-Date: Mon, 03 Nov 2014 23:59:30 -0000
X-Groupsio-MsgNum: 59179
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline

--mSxgbZZZvrAyzONB
Content-Type: multipart/mixed; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As advised at

    https://bugzilla.yoctoproject.org/show_bug.cgi?id=6857

I am attaching a patch to replace Python 3.3.x with Python 3.4.2. This also
fixes issue with missing basic Python 3.x modules, see

    https://bugzilla.yoctoproject.org/show_bug.cgi?id=6831

Build tested with git master:

    $ tar tvjf tmp/deploy/images/qemux86/core-image-minimal-qemux86.tar.bz2 | grep python3.4 | wc -l
    2028

Regards,

w


--GPJrCs/72TxItFYR
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="poky-python-3.4.2.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref=
-manual/ref-variables.xml
index b22c661..ab9ee13 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6953,7 +6953,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =3D=
 "${INC_PR}.3"
                     The OpenEmbedded build system uses the ABI to construc=
t
                     directory names used when installing the Python header=
s
                     and libraries in sysroot
-                    (e.g. <filename>.../python3.3m/...</filename>).
+                    (e.g. <filename>.../python3.4m/...</filename>).
                 </para>
=20
                 <para>
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3=
-base.bbclass
index d4d25dc..af3aa00 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,7 +1,7 @@
 DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACK=
AGES', True) =3D=3D '')]}"
 RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
=20
-PYTHON_BASEVERSION =3D "3.3"
+PYTHON_BASEVERSION =3D "3.4"
 PYTHON_ABI =3D "m"
=20
 inherit distutils-common-base python3native
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/dis=
tutils3-native-base.bbclass
index ed3fe54..1117101 100644
--- a/meta/classes/distutils3-native-base.bbclass
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION =3D "3.3"
+PYTHON_BASEVERSION =3D "3.4"
 PYTHON_ABI =3D "m"
=20
 inherit distutils-native-base
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3nativ=
e.bbclass
index f86374f..cf83017 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION =3D "3.3"
+PYTHON_BASEVERSION =3D "3.4"
=20
 inherit python-dir
=20
diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/re=
cipes-devtools/python/python-3.4-manifest.inc
index 46a2d44..d534c57 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -1,61 +1,69 @@
=20
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next tim=
e I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.3.py' Ve=
rsion 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.d=
e>
+# Generator: 'generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Mic=
hael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/pr=
ojects/python.spy
=20
 =20
=20
-PROVIDES+=3D"${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compr=
ession ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN=
}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils=
-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gd=
bm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${=
PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}=
-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle=
 ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readli=
ne ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 $=
{PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-term=
inal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unitte=
st ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compi=
le ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt ${PN}-ctypes $=
{PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib =
${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree $=
{PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-i=
o ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime $=
{PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbe=
rs ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-=
re ${PN}-readline ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN=
}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-termina=
l ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest =
${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
=20
-PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${=
PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-date=
time ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-static=
dev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl=
 ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN=
}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-m=
map ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${P=
N}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${P=
N}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-=
sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog $=
{PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${P=
N}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${=
PN}-compile ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt ${PN}=
-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}=
-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elem=
enttree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-imag=
e ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${P=
N}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${=
PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pyd=
oc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sql=
ite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN=
}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-=
unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
=20
 SUMMARY_${PN}-2to3=3D"Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3=3D"${PN}-core"
-FILES_${PN}-2to3=3D"${bindir}/2to3 ${libdir}/python3.3/lib2to3 "
+FILES_${PN}-2to3=3D"${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
+
+SUMMARY_${PN}-asyncio=3D"Python Asyncio Library"
+RDEPENDS_${PN}-asyncio=3D"${PN}-core"
+FILES_${PN}-asyncio=3D"${libdir}/python3.4/asyncio "
=20
 SUMMARY_${PN}-audio=3D"Python Audio Handling"
 RDEPENDS_${PN}-audio=3D"${PN}-core"
-FILES_${PN}-audio=3D"${libdir}/python3.3/wave.* ${libdir}/python3.3/chunk.=
* ${libdir}/python3.3/sndhdr.* ${libdir}/python3.3/lib-dynload/ossaudiodev.=
*.so ${libdir}/python3.3/lib-dynload/audioop.*.so ${libdir}/python3.3/audio=
dev.* ${libdir}/python3.3/sunaudio.* ${libdir}/python3.3/sunau.* ${libdir}/=
python3.3/toaiff.* "
+FILES_${PN}-audio=3D"${libdir}/python3.4/wave.* ${libdir}/python3.4/chunk.=
* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiodev.=
*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/audio=
dev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir}/=
python3.4/toaiff.* "
=20
 SUMMARY_${PN}-codecs=3D"Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs=3D"${PN}-core ${PN}-lang"
-FILES_${PN}-codecs=3D"${libdir}/python3.3/codecs.* ${libdir}/python3.3/enc=
odings ${libdir}/python3.3/gettext.* ${libdir}/python3.3/locale.* ${libdir}=
/python3.3/lib-dynload/_locale.*.so ${libdir}/python3.3/lib-dynload/_codecs=
* ${libdir}/python3.3/lib-dynload/_multibytecodec.*.so ${libdir}/python3.3/=
lib-dynload/unicodedata.*.so ${libdir}/python3.3/stringprep.* ${libdir}/pyt=
hon3.3/xdrlib.* "
+FILES_${PN}-codecs=3D"${libdir}/python3.4/codecs.* ${libdir}/python3.4/enc=
odings ${libdir}/python3.4/gettext.* ${libdir}/python3.4/locale.* ${libdir}=
/python3.4/lib-dynload/_locale.*.so ${libdir}/python3.4/lib-dynload/_codecs=
* ${libdir}/python3.4/lib-dynload/_multibytecodec.*.so ${libdir}/python3.4/=
lib-dynload/unicodedata.*.so ${libdir}/python3.4/stringprep.* ${libdir}/pyt=
hon3.4/xdrlib.* "
=20
 SUMMARY_${PN}-compile=3D"Python bytecode compilation support"
 RDEPENDS_${PN}-compile=3D"${PN}-core"
-FILES_${PN}-compile=3D"${libdir}/python3.3/py_compile.* ${libdir}/python3.=
3/compileall.* "
+FILES_${PN}-compile=3D"${libdir}/python3.4/py_compile.* ${libdir}/python3.=
4/compileall.* "
=20
 SUMMARY_${PN}-compression=3D"Python high-level compression support"
 RDEPENDS_${PN}-compression=3D"${PN}-core ${PN}-codecs"
-FILES_${PN}-compression=3D"${libdir}/python3.3/gzip.* ${libdir}/python3.3/=
zipfile.* ${libdir}/python3.3/tarfile.* ${libdir}/python3.3/lib-dynload/bz2=
.*.so "
+FILES_${PN}-compression=3D"${libdir}/python3.4/gzip.* ${libdir}/python3.4/=
zipfile.* ${libdir}/python3.4/tarfile.* ${libdir}/python3.4/lib-dynload/bz2=
.*.so "
+
+SUMMARY_${PN}-concurrent=3D"Launching parallel tasks"
+RDEPENDS_${PN}-concurrent=3D"${PN}-core"
+FILES_${PN}-concurrent=3D"${libdir}/python3.4/concurrent "
=20
 SUMMARY_${PN}-core=3D"Python interpreter and core modules"
 RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re"
-FILES_${PN}-core=3D"${libdir}/python3.3/__future__.* ${libdir}/python3.3/_=
abcoll.* ${libdir}/python3.3/abc.* ${libdir}/python3.3/copy.* ${libdir}/pyt=
hon3.3/copy_reg.* ${libdir}/python3.3/ConfigParser.* ${libdir}/python3.3/ge=
nericpath.* ${libdir}/python3.3/getopt.* ${libdir}/python3.3/linecache.* ${=
libdir}/python3.3/new.* ${libdir}/python3.3/os.* ${libdir}/python3.3/posixp=
ath.* ${libdir}/python3.3/struct.* ${libdir}/python3.3/warnings.* ${libdir}=
/python3.3/site.* ${libdir}/python3.3/stat.* ${libdir}/python3.3/UserDict.*=
 ${libdir}/python3.3/UserList.* ${libdir}/python3.3/UserString.* ${libdir}/=
python3.3/lib-dynload/binascii.*.so ${libdir}/python3.3/lib-dynload/_struct=
.*.so ${libdir}/python3.3/lib-dynload/time.*.so ${libdir}/python3.3/lib-dyn=
load/xreadlines.*.so ${libdir}/python3.3/types.* ${libdir}/python3.3/platfo=
rm.* ${bindir}/python* ${libdir}/python3.3/_weakrefset.* ${libdir}/python3.=
3/sysconfig.* ${libdir}/python3.3/config/Makefile ${includedir}/python${PYT=
HON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libd=
ir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core=3D"${libdir}/python3.4/__future__.* ${libdir}/python3.4/_=
abcoll.* ${libdir}/python3.4/_sitebuiltins.* ${libdir}/python3.4/_sysconfig=
data.* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/abc.* ${libdir=
}/python3.4/argparse.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyr=
eg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* $=
{libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/pytho=
n3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdi=
r}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/si=
te.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/py=
thon3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib=
-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdi=
r}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlin=
es.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir=
}/python* ${libdir}/python3.4/selectors.* ${libdir}/python3.4/sysconfig.* $=
{libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyc=
onfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYT=
HON_MAJMIN}/sitecustomize.py "
=20
 SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt=3D"${PN}-core"
-FILES_${PN}-crypt=3D"${libdir}/python3.3/hashlib.* ${libdir}/python3.3/md5=
.* ${libdir}/python3.3/sha.* ${libdir}/python3.3/lib-dynload/crypt.*.so ${l=
ibdir}/python3.3/lib-dynload/_hashlib.*.so ${libdir}/python3.3/lib-dynload/=
_sha256.*.so ${libdir}/python3.3/lib-dynload/_sha512.*.so "
+FILES_${PN}-crypt=3D"${libdir}/python3.4/hashlib.* ${libdir}/python3.4/md5=
.* ${libdir}/python3.4/sha.* ${libdir}/python3.4/lib-dynload/crypt.*.so ${l=
ibdir}/python3.4/lib-dynload/_hashlib.*.so ${libdir}/python3.4/lib-dynload/=
_sha256.*.so ${libdir}/python3.4/lib-dynload/_sha512.*.so "
=20
 SUMMARY_${PN}-ctypes=3D"Python C types support"
 RDEPENDS_${PN}-ctypes=3D"${PN}-core"
-FILES_${PN}-ctypes=3D"${libdir}/python3.3/ctypes ${libdir}/python3.3/lib-d=
ynload/_ctypes.*.so ${libdir}/python3.3/lib-dynload/_ctypes_test.*.so "
+FILES_${PN}-ctypes=3D"${libdir}/python3.4/ctypes ${libdir}/python3.4/lib-d=
ynload/_ctypes.*.so ${libdir}/python3.4/lib-dynload/_ctypes_test.*.so "
=20
 SUMMARY_${PN}-curses=3D"Python curses support"
 RDEPENDS_${PN}-curses=3D"${PN}-core"
-FILES_${PN}-curses=3D"${libdir}/python3.3/curses ${libdir}/python3.3/lib-d=
ynload/_curses.*.so ${libdir}/python3.3/lib-dynload/_curses_panel.*.so "
+FILES_${PN}-curses=3D"${libdir}/python3.4/curses ${libdir}/python3.4/lib-d=
ynload/_curses.*.so ${libdir}/python3.4/lib-dynload/_curses_panel.*.so "
=20
 SUMMARY_${PN}-datetime=3D"Python calendar and time support"
 RDEPENDS_${PN}-datetime=3D"${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime=3D"${libdir}/python3.3/_strptime.* ${libdir}/python3.=
3/calendar.* ${libdir}/python3.3/lib-dynload/datetime.*.so "
+FILES_${PN}-datetime=3D"${libdir}/python3.4/_strptime.* ${libdir}/python3.=
4/calendar.* ${libdir}/python3.4/datetime.* ${libdir}/python3.4/lib-dynload=
/_datetime.*.so "
=20
 SUMMARY_${PN}-db=3D"Python file-based database support"
 RDEPENDS_${PN}-db=3D"${PN}-core"
-FILES_${PN}-db=3D"${libdir}/python3.3/anydbm.* ${libdir}/python3.3/dumbdbm=
.* ${libdir}/python3.3/whichdb.* ${libdir}/python3.3/dbm ${libdir}/python3.=
3/lib-dynload/_dbm.*.so "
+FILES_${PN}-db=3D"${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbdbm=
.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python3.=
4/lib-dynload/_dbm.*.so "
=20
 SUMMARY_${PN}-debugger=3D"Python debugger"
 RDEPENDS_${PN}-debugger=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-s=
tringold ${PN}-shell ${PN}-pprint"
-FILES_${PN}-debugger=3D"${libdir}/python3.3/bdb.* ${libdir}/python3.3/pdb.=
* "
+FILES_${PN}-debugger=3D"${libdir}/python3.4/bdb.* ${libdir}/python3.4/pdb.=
* "
=20
 SUMMARY_${PN}-dev=3D"Python development package"
 RDEPENDS_${PN}-dev=3D"${PN}-core"
@@ -63,202 +71,194 @@ FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SOLI=
BSDEV} ${libdir}/*.la ${libdi
=20
 SUMMARY_${PN}-difflib=3D"Python helpers for computing deltas between objec=
ts"
 RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
-FILES_${PN}-difflib=3D"${libdir}/python3.3/difflib.* "
+FILES_${PN}-difflib=3D"${libdir}/python3.4/difflib.* "
=20
 SUMMARY_${PN}-distutils=3D"Python Distribution Utilities"
 RDEPENDS_${PN}-distutils=3D"${PN}-core"
-FILES_${PN}-distutils=3D"${libdir}/python3.3/config ${libdir}/python3.3/di=
stutils "
+FILES_${PN}-distutils=3D"${libdir}/python3.4/config ${libdir}/python3.4/di=
stutils "
=20
 SUMMARY_${PN}-distutils-staticdev=3D"Python distribution utilities (static=
 libraries)"
 RDEPENDS_${PN}-distutils-staticdev=3D"${PN}-distutils"
-FILES_${PN}-distutils-staticdev=3D"${libdir}/python3.3/config/lib*.a "
+FILES_${PN}-distutils-staticdev=3D"${libdir}/python3.4/config/lib*.a "
=20
 SUMMARY_${PN}-doctest=3D"Python framework for running examples in docstrin=
gs"
 RDEPENDS_${PN}-doctest=3D"${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-un=
ittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest=3D"${libdir}/python3.3/doctest.* "
+FILES_${PN}-doctest=3D"${libdir}/python3.4/doctest.* "
=20
 SUMMARY_${PN}-elementtree=3D"Python elementree"
 RDEPENDS_${PN}-elementtree=3D"${PN}-core"
-FILES_${PN}-elementtree=3D"${libdir}/python3.3/lib-dynload/_elementtree.*.=
so "
+FILES_${PN}-elementtree=3D"${libdir}/python3.4/lib-dynload/_elementtree.*.=
so "
=20
 SUMMARY_${PN}-email=3D"Python email support"
 RDEPENDS_${PN}-email=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audi=
o ${PN}-image ${PN}-netclient"
-FILES_${PN}-email=3D"${libdir}/python3.3/imaplib.* ${libdir}/python3.3/ema=
il "
+FILES_${PN}-email=3D"${libdir}/python3.4/imaplib.* ${libdir}/python3.4/ema=
il "
=20
 SUMMARY_${PN}-fcntl=3D"Python's fcntl interface"
 RDEPENDS_${PN}-fcntl=3D"${PN}-core"
-FILES_${PN}-fcntl=3D"${libdir}/python3.3/lib-dynload/fcntl.*.so "
+FILES_${PN}-fcntl=3D"${libdir}/python3.4/lib-dynload/fcntl.*.so "
=20
 SUMMARY_${PN}-gdbm=3D"Python GNU database support"
 RDEPENDS_${PN}-gdbm=3D"${PN}-core"
-FILES_${PN}-gdbm=3D"${libdir}/python3.3/lib-dynload/_gdbm.*.so "
+FILES_${PN}-gdbm=3D"${libdir}/python3.4/lib-dynload/_gdbm.*.so "
=20
 SUMMARY_${PN}-html=3D"Python HTML processing support"
 RDEPENDS_${PN}-html=3D"${PN}-core"
-FILES_${PN}-html=3D"${libdir}/python3.3/formatter.* ${libdir}/python3.3/ht=
mlentitydefs.* ${libdir}/python3.3/htmllib.* ${libdir}/python3.3/markupbase=
.* ${libdir}/python3.3/sgmllib.* ${libdir}/python3.3/HTMLParser.* "
+FILES_${PN}-html=3D"${libdir}/python3.4/formatter.* ${libdir}/python3.4/ht=
mlentitydefs.* ${libdir}/python3.4/htmllib.* ${libdir}/python3.4/markupbase=
.* ${libdir}/python3.4/sgmllib.* ${libdir}/python3.4/HTMLParser.* "
=20
 SUMMARY_${PN}-idle=3D"Python Integrated Development Environment"
 RDEPENDS_${PN}-idle=3D"${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python3.3/idlelib "
+FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python3.4/idlelib "
=20
 SUMMARY_${PN}-image=3D"Python graphical image handling"
 RDEPENDS_${PN}-image=3D"${PN}-core"
-FILES_${PN}-image=3D"${libdir}/python3.3/colorsys.* ${libdir}/python3.3/im=
ghdr.* ${libdir}/python3.3/lib-dynload/imageop.*.so ${libdir}/python3.3/lib=
-dynload/rgbimg.*.so "
-
-SUMMARY_${PN}-importlib=3D"Python import implementation library"
-RDEPENDS_${PN}-importlib=3D"${PN}-core"
-FILES_${PN}-importlib=3D"${libdir}/python3.3/importlib "
+FILES_${PN}-image=3D"${libdir}/python3.4/colorsys.* ${libdir}/python3.4/im=
ghdr.* ${libdir}/python3.4/lib-dynload/imageop.*.so ${libdir}/python3.4/lib=
-dynload/rgbimg.*.so "
=20
 SUMMARY_${PN}-io=3D"Python low-level I/O"
 RDEPENDS_${PN}-io=3D"${PN}-core ${PN}-math"
-FILES_${PN}-io=3D"${libdir}/python3.3/lib-dynload/_socket.*.so ${libdir}/p=
ython3.3/lib-dynload/_io.*.so ${libdir}/python3.3/lib-dynload/_ssl.*.so ${l=
ibdir}/python3.3/lib-dynload/select.*.so ${libdir}/python3.3/lib-dynload/te=
rmios.*.so ${libdir}/python3.3/lib-dynload/cStringIO.*.so ${libdir}/python3=
.3/pipes.* ${libdir}/python3.3/socket.* ${libdir}/python3.3/ssl.* ${libdir}=
/python3.3/tempfile.* ${libdir}/python3.3/StringIO.* ${libdir}/python3.3/io=
.* ${libdir}/python3.3/_pyio.* "
+FILES_${PN}-io=3D"${libdir}/python3.4/lib-dynload/_socket.*.so ${libdir}/p=
ython3.4/lib-dynload/_io.*.so ${libdir}/python3.4/lib-dynload/_ssl.*.so ${l=
ibdir}/python3.4/lib-dynload/select.*.so ${libdir}/python3.4/lib-dynload/te=
rmios.*.so ${libdir}/python3.4/lib-dynload/cStringIO.*.so ${libdir}/python3=
.4/pipes.* ${libdir}/python3.4/socket.* ${libdir}/python3.4/ssl.* ${libdir}=
/python3.4/tempfile.* ${libdir}/python3.4/StringIO.* ${libdir}/python3.4/io=
.* ${libdir}/python3.4/_pyio.* "
=20
 SUMMARY_${PN}-json=3D"Python JSON support"
 RDEPENDS_${PN}-json=3D"${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json=3D"${libdir}/python3.3/json ${libdir}/python3.3/lib-dynlo=
ad/_json.*.so "
+FILES_${PN}-json=3D"${libdir}/python3.4/json ${libdir}/python3.4/lib-dynlo=
ad/_json.*.so "
=20
 SUMMARY_${PN}-lang=3D"Python low-level language support"
 RDEPENDS_${PN}-lang=3D"${PN}-core"
-FILES_${PN}-lang=3D"${libdir}/python3.3/lib-dynload/_bisect.*.so ${libdir}=
/python3.3/lib-dynload/_collections.*.so ${libdir}/python3.3/lib-dynload/_h=
eapq.*.so ${libdir}/python3.3/lib-dynload/_weakref.*.so ${libdir}/python3.3=
/lib-dynload/_functools.*.so ${libdir}/python3.3/lib-dynload/array.*.so ${l=
ibdir}/python3.3/lib-dynload/itertools.*.so ${libdir}/python3.3/lib-dynload=
/operator.*.so ${libdir}/python3.3/lib-dynload/parser.*.so ${libdir}/python=
3.3/atexit.* ${libdir}/python3.3/bisect.* ${libdir}/python3.3/code.* ${libd=
ir}/python3.3/codeop.* ${libdir}/python3.3/collections.* ${libdir}/python3.=
3/dis.* ${libdir}/python3.3/functools.* ${libdir}/python3.3/heapq.* ${libdi=
r}/python3.3/inspect.* ${libdir}/python3.3/keyword.* ${libdir}/python3.3/op=
code.* ${libdir}/python3.3/symbol.* ${libdir}/python3.3/repr.* ${libdir}/py=
thon3.3/token.* ${libdir}/python3.3/tokenize.* ${libdir}/python3.3/tracebac=
k.* ${libdir}/python3.3/weakref.* "
+FILES_${PN}-lang=3D"${libdir}/python3.4/lib-dynload/array.*.so ${libdir}/p=
ython3.4/lib-dynload/_bisect.*.so ${libdir}/python3.4/lib-dynload/_bz2.*.so=
 ${libdir}/python3.4/lib-dynload/_collections.*.so ${libdir}/python3.4/lib-=
dynload/_crypt.*.so ${libdir}/python3.4/lib-dynload/_decimal.*.so ${libdir}=
/python3.4/lib-dynload/_functools.*.so ${libdir}/python3.4/lib-dynload/_hea=
pq.*.so ${libdir}/python3.4/lib-dynload/itertools.*.so ${libdir}/python3.4/=
lib-dynload/_lzma.*.so ${libdir}/python3.4/lib-dynload/_md5.*.so ${libdir}/=
python3.4/lib-dynload/_opcode.*.so ${libdir}/python3.4/lib-dynload/parser.*=
.so ${libdir}/python3.4/lib-dynload/_posixsubprocess.*.so ${libdir}/python3=
.4/lib-dynload/_sha1.*.so ${libdir}/python3.4/lib-dynload/spwd.*.so ${libdi=
r}/python3.4/lib-dynload/_testbuffer.*.so ${libdir}/python3.4/lib-dynload/_=
testcapi.*.so ${libdir}/python3.4/lib-dynload/_testimportmultiple.*.so ${li=
bdir}/python3.4/lib-dynload/_weakref.*.so ${libdir}/python3.4/lib-dynload/x=
xlimited.*.so ${libdir}/python3.4/lib-dynload/zlib.*.so ${libdir}/python3.4=
/__phello__.foo.* ${libdir}/python3.4/_bootlocale.* ${libdir}/python3.4/_co=
llections_abc.* ${libdir}/python3.4/_dummy_thread.* ${libdir}/python3.4/_ma=
rkupbase.* ${libdir}/python3.4/_osx_support.* ${libdir}/python3.4/aifc.* ${=
libdir}/python3.4/antigravity.* ${libdir}/python3.4/ast.* ${libdir}/python3=
.4/asynchat.* ${libdir}/python3.4/asyncore.* ${libdir}/python3.4/atexit.* $=
{libdir}/python3.4/binhex.* ${libdir}/python3.4/bisect.* ${libdir}/python3.=
4/bz2.* ${libdir}/python3.4/cgitb.* ${libdir}/python3.4/code.* ${libdir}/py=
thon3.4/codeop.* ${libdir}/python3.4/collections.* ${libdir}/python3.4/conf=
igparser.* ${libdir}/python3.4/contextlib.* ${libdir}/python3.4/crypt.* ${l=
ibdir}/python3.4/decimal.* ${libdir}/python3.4/dis.* ${libdir}/python3.4/en=
surepip ${libdir}/python3.4/enum.* ${libdir}/python3.4/filecmp.* ${libdir}/=
python3.4/fileinput.* ${libdir}/python3.4/fractions.* ${libdir}/python3.4/f=
unctools.* ${libdir}/python3.4/heapq.* ${libdir}/python3.4/html ${libdir}/p=
ython3.4/http ${libdir}/python3.4/imp.* ${libdir}/python3.4/importlib ${lib=
dir}/python3.4/inspect.* ${libdir}/python3.4/ipaddress.* ${libdir}/python3.=
4/keyword.* ${libdir}/python3.4/lzma.* ${libdir}/python3.4/macpath.* ${libd=
ir}/python3.4/macurl2path.* ${libdir}/python3.4/mailcap.* ${libdir}/python3=
.4/modulefinder.* ${libdir}/python3.4/netrc.* ${libdir}/python3.4/ntpath.* =
${libdir}/python3.4/nturl2path.* ${libdir}/python3.4/opcode.* ${libdir}/pyt=
hon3.4/operator.* ${libdir}/python3.4/pathlib.* ${libdir}/python3.4/plat-li=
nux ${libdir}/python3.4/plistlib.* ${libdir}/python3.4/pyclbr.* ${libdir}/p=
ython3.4/queue.* ${libdir}/python3.4/reprlib.* ${libdir}/python3.4/runpy.* =
${libdir}/python3.4/sched.* ${libdir}/python3.4/socketserver.* ${libdir}/py=
thon3.4/statistics.* ${libdir}/python3.4/symbol.* ${libdir}/python3.4/symta=
ble.* ${libdir}/python3.4/tabnanny.* ${libdir}/python3.4/this.* ${libdir}/p=
ython3.4/timeit.* ${libdir}/python3.4/token.* ${libdir}/python3.4/tokenize.=
* ${libdir}/python3.4/trace.* ${libdir}/python3.4/traceback.* ${libdir}/pyt=
hon3.4/tracemalloc.* ${libdir}/python3.4/turtle.* ${libdir}/python3.4/turtl=
edemo ${libdir}/python3.4/venv ${libdir}/python3.4/weakref.* ${libdir}/pyth=
on3.4/webbrowser.* ${libdir}/python3.4/wsgiref "
=20
 SUMMARY_${PN}-logging=3D"Python logging support"
 RDEPENDS_${PN}-logging=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN=
}-stringold"
-FILES_${PN}-logging=3D"${libdir}/python3.3/logging "
+FILES_${PN}-logging=3D"${libdir}/python3.4/logging "
=20
 SUMMARY_${PN}-mailbox=3D"Python mailbox format support"
 RDEPENDS_${PN}-mailbox=3D"${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox=3D"${libdir}/python3.3/mailbox.* "
+FILES_${PN}-mailbox=3D"${libdir}/python3.4/mailbox.* "
=20
 SUMMARY_${PN}-math=3D"Python math support"
 RDEPENDS_${PN}-math=3D"${PN}-core"
-FILES_${PN}-math=3D"${libdir}/python3.3/lib-dynload/cmath.*.so ${libdir}/p=
ython3.3/lib-dynload/math.*.so ${libdir}/python3.3/lib-dynload/_random.*.so=
 ${libdir}/python3.3/random.* ${libdir}/python3.3/sets.* "
+FILES_${PN}-math=3D"${libdir}/python3.4/lib-dynload/cmath.*.so ${libdir}/p=
ython3.4/lib-dynload/math.*.so ${libdir}/python3.4/lib-dynload/_random.*.so=
 ${libdir}/python3.4/random.* ${libdir}/python3.4/sets.* "
=20
 SUMMARY_${PN}-mime=3D"Python MIME handling APIs"
 RDEPENDS_${PN}-mime=3D"${PN}-core ${PN}-io"
-FILES_${PN}-mime=3D"${libdir}/python3.3/mimetools.* ${libdir}/python3.3/uu=
.* ${libdir}/python3.3/quopri.* ${libdir}/python3.3/rfc822.* ${libdir}/pyth=
on3.3/MimeWriter.* "
+FILES_${PN}-mime=3D"${libdir}/python3.4/mimetools.* ${libdir}/python3.4/uu=
.* ${libdir}/python3.4/quopri.* ${libdir}/python3.4/rfc822.* ${libdir}/pyth=
on3.4/MimeWriter.* "
=20
 SUMMARY_${PN}-mmap=3D"Python memory-mapped file support"
 RDEPENDS_${PN}-mmap=3D"${PN}-core ${PN}-io"
-FILES_${PN}-mmap=3D"${libdir}/python3.3/lib-dynload/mmap.*.so "
+FILES_${PN}-mmap=3D"${libdir}/python3.4/lib-dynload/mmap.*.so "
=20
 SUMMARY_${PN}-multiprocessing=3D"Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-pic=
kle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing=3D"${libdir}/python3.3/lib-dynload/_multiproce=
ssing.*.so ${libdir}/python3.3/multiprocessing "
+FILES_${PN}-multiprocessing=3D"${libdir}/python3.4/lib-dynload/_multiproce=
ssing.*.so ${libdir}/python3.4/multiprocessing "
=20
 SUMMARY_${PN}-netclient=3D"Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient=3D"${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io=
 ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient=3D"${libdir}/python3.3/*Cookie*.* ${libdir}/python3.=
3/base64.* ${libdir}/python3.3/cookielib.* ${libdir}/python3.3/ftplib.* ${l=
ibdir}/python3.3/gopherlib.* ${libdir}/python3.3/hmac.* ${libdir}/python3.3=
/httplib.* ${libdir}/python3.3/mimetypes.* ${libdir}/python3.3/nntplib.* ${=
libdir}/python3.3/poplib.* ${libdir}/python3.3/smtplib.* ${libdir}/python3.=
3/telnetlib.* ${libdir}/python3.3/urllib.* ${libdir}/python3.3/urllib2.* ${=
libdir}/python3.3/urlparse.* ${libdir}/python3.3/uuid.* ${libdir}/python3.3=
/rfc822.* ${libdir}/python3.3/mimetools.* "
+FILES_${PN}-netclient=3D"${libdir}/python3.4/*Cookie*.* ${libdir}/python3.=
4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${l=
ibdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4=
/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${=
libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.=
4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${libdi=
r}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
=20
 SUMMARY_${PN}-netserver=3D"Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver=3D"${PN}-core ${PN}-netclient"
-FILES_${PN}-netserver=3D"${libdir}/python3.3/cgi.* ${libdir}/python3.3/*HT=
TPServer.* ${libdir}/python3.3/SocketServer.* "
+FILES_${PN}-netserver=3D"${libdir}/python3.4/cgi.* ${libdir}/python3.4/*HT=
TPServer.* ${libdir}/python3.4/SocketServer.* "
=20
 SUMMARY_${PN}-numbers=3D"Python number APIs"
 RDEPENDS_${PN}-numbers=3D"${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers=3D"${libdir}/python3.3/decimal.* ${libdir}/python3.3/n=
umbers.* "
+FILES_${PN}-numbers=3D"${libdir}/python3.4/numbers.* "
=20
 SUMMARY_${PN}-pickle=3D"Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle=3D"${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle=3D"${libdir}/python3.3/pickle.* ${libdir}/python3.3/she=
lve.* ${libdir}/python3.3/lib-dynload/cPickle.*.so ${libdir}/python3.3/pick=
letools.* "
+FILES_${PN}-pickle=3D"${libdir}/python3.4/_compat_pickle.* ${libdir}/pytho=
n3.4/pickle.* ${libdir}/python3.4/shelve.* ${libdir}/python3.4/lib-dynload/=
_pickle.*.so ${libdir}/python3.4/pickletools.* "
=20
 SUMMARY_${PN}-pkgutil=3D"Python package extension utility support"
 RDEPENDS_${PN}-pkgutil=3D"${PN}-core"
-FILES_${PN}-pkgutil=3D"${libdir}/python3.3/pkgutil.* "
+FILES_${PN}-pkgutil=3D"${libdir}/python3.4/pkgutil.* "
=20
 SUMMARY_${PN}-pprint=3D"Python pretty-print support"
 RDEPENDS_${PN}-pprint=3D"${PN}-core ${PN}-io"
-FILES_${PN}-pprint=3D"${libdir}/python3.3/pprint.* "
+FILES_${PN}-pprint=3D"${libdir}/python3.4/pprint.* "
=20
 SUMMARY_${PN}-profile=3D"Python basic performance profiling support"
 RDEPENDS_${PN}-profile=3D"${PN}-core ${PN}-textutils"
-FILES_${PN}-profile=3D"${libdir}/python3.3/profile.* ${libdir}/python3.3/p=
stats.* ${libdir}/python3.3/cProfile.* ${libdir}/python3.3/lib-dynload/_lsp=
rof.*.so "
+FILES_${PN}-profile=3D"${libdir}/python3.4/profile.* ${libdir}/python3.4/p=
stats.* ${libdir}/python3.4/cProfile.* ${libdir}/python3.4/lib-dynload/_lsp=
rof.*.so "
=20
 SUMMARY_${PN}-pydoc=3D"Python interactive help support"
 RDEPENDS_${PN}-pydoc=3D"${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc=3D"${bindir}/pydoc ${libdir}/python3.3/pydoc.* ${libdir}=
/python3.3/pydoc_data "
+FILES_${PN}-pydoc=3D"${bindir}/pydoc ${libdir}/python3.4/pydoc.* ${libdir}=
/python3.4/pydoc_data "
=20
 SUMMARY_${PN}-re=3D"Python Regular Expression APIs"
 RDEPENDS_${PN}-re=3D"${PN}-core"
-FILES_${PN}-re=3D"${libdir}/python3.3/re.* ${libdir}/python3.3/sre.* ${lib=
dir}/python3.3/sre_compile.* ${libdir}/python3.3/sre_constants* ${libdir}/p=
ython3.3/sre_parse.* "
+FILES_${PN}-re=3D"${libdir}/python3.4/re.* ${libdir}/python3.4/sre.* ${lib=
dir}/python3.4/sre_compile.* ${libdir}/python3.4/sre_constants* ${libdir}/p=
ython3.4/sre_parse.* "
=20
 SUMMARY_${PN}-readline=3D"Python readline support"
 RDEPENDS_${PN}-readline=3D"${PN}-core"
-FILES_${PN}-readline=3D"${libdir}/python3.3/lib-dynload/readline.*.so ${li=
bdir}/python3.3/rlcompleter.* "
+FILES_${PN}-readline=3D"${libdir}/python3.4/lib-dynload/readline.*.so ${li=
bdir}/python3.4/rlcompleter.* "
=20
 SUMMARY_${PN}-resource=3D"Python resource control interface"
 RDEPENDS_${PN}-resource=3D"${PN}-core"
-FILES_${PN}-resource=3D"${libdir}/python3.3/lib-dynload/resource.*.so "
-
-SUMMARY_${PN}-robotparser=3D"Python robots.txt parser"
-RDEPENDS_${PN}-robotparser=3D"${PN}-core ${PN}-netclient"
-FILES_${PN}-robotparser=3D"${libdir}/python3.3/urllib/robotparser.* "
+FILES_${PN}-resource=3D"${libdir}/python3.4/lib-dynload/resource.*.so "
=20
 SUMMARY_${PN}-shell=3D"Python shell-like functionality"
 RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
-FILES_${PN}-shell=3D"${libdir}/python3.3/cmd.* ${libdir}/python3.3/command=
s.* ${libdir}/python3.3/dircache.* ${libdir}/python3.3/fnmatch.* ${libdir}/=
python3.3/glob.* ${libdir}/python3.3/popen2.* ${libdir}/python3.3/shlex.* $=
{libdir}/python3.3/shutil.* "
+FILES_${PN}-shell=3D"${libdir}/python3.4/cmd.* ${libdir}/python3.4/command=
s.* ${libdir}/python3.4/dircache.* ${libdir}/python3.4/fnmatch.* ${libdir}/=
python3.4/glob.* ${libdir}/python3.4/popen2.* ${libdir}/python3.4/shlex.* $=
{libdir}/python3.4/shutil.* "
=20
 SUMMARY_${PN}-smtpd=3D"Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd=3D"${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd=3D"${bindir}/smtpd.* ${libdir}/python3.3/smtpd.* "
+FILES_${PN}-smtpd=3D"${bindir}/smtpd.* ${libdir}/python3.4/smtpd.* "
=20
 SUMMARY_${PN}-sqlite3=3D"Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3=3D"${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt=
 ${PN}-io ${PN}-threading"
-FILES_${PN}-sqlite3=3D"${libdir}/python3.3/lib-dynload/_sqlite3.*.so ${lib=
dir}/python3.3/sqlite3/dbapi2.* ${libdir}/python3.3/sqlite3/__init__.* ${li=
bdir}/python3.3/sqlite3/dump.* "
+FILES_${PN}-sqlite3=3D"${libdir}/python3.4/lib-dynload/_sqlite3.*.so ${lib=
dir}/python3.4/sqlite3/dbapi2.* ${libdir}/python3.4/sqlite3/__init__.* ${li=
bdir}/python3.4/sqlite3/dump.* "
=20
 SUMMARY_${PN}-sqlite3-tests=3D"Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests=3D"${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests=3D"${libdir}/python3.3/sqlite3/test "
+FILES_${PN}-sqlite3-tests=3D"${libdir}/python3.4/sqlite3/test "
=20
 SUMMARY_${PN}-stringold=3D"Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold=3D"${PN}-core ${PN}-re"
-FILES_${PN}-stringold=3D"${libdir}/python3.3/lib-dynload/strop.*.so ${libd=
ir}/python3.3/string.* ${libdir}/python3.3/stringold.* "
+FILES_${PN}-stringold=3D"${libdir}/python3.4/lib-dynload/strop.*.so ${libd=
ir}/python3.4/string.* ${libdir}/python3.4/stringold.* "
=20
 SUMMARY_${PN}-subprocess=3D"Python subprocess support"
 RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN=
}-pickle"
-FILES_${PN}-subprocess=3D"${libdir}/python3.3/subprocess.* "
+FILES_${PN}-subprocess=3D"${libdir}/python3.4/subprocess.* "
=20
 SUMMARY_${PN}-syslog=3D"Python syslog interface"
 RDEPENDS_${PN}-syslog=3D"${PN}-core"
-FILES_${PN}-syslog=3D"${libdir}/python3.3/lib-dynload/syslog.*.so "
+FILES_${PN}-syslog=3D"${libdir}/python3.4/lib-dynload/syslog.*.so "
=20
 SUMMARY_${PN}-terminal=3D"Python terminal controlling support"
 RDEPENDS_${PN}-terminal=3D"${PN}-core ${PN}-io"
-FILES_${PN}-terminal=3D"${libdir}/python3.3/pty.* ${libdir}/python3.3/tty.=
* "
+FILES_${PN}-terminal=3D"${libdir}/python3.4/pty.* ${libdir}/python3.4/tty.=
* "
=20
 SUMMARY_${PN}-tests=3D"Python tests"
 RDEPENDS_${PN}-tests=3D"${PN}-core"
-FILES_${PN}-tests=3D"${libdir}/python3.3/test "
+FILES_${PN}-tests=3D"${libdir}/python3.4/test "
=20
 SUMMARY_${PN}-textutils=3D"Python option parsing, text wrapping and CSV su=
pport"
 RDEPENDS_${PN}-textutils=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils=3D"${libdir}/python3.3/lib-dynload/_csv.*.so ${libdi=
r}/python3.3/csv.* ${libdir}/python3.3/optparse.* ${libdir}/python3.3/textw=
rap.* "
+FILES_${PN}-textutils=3D"${libdir}/python3.4/lib-dynload/_csv.*.so ${libdi=
r}/python3.4/csv.* ${libdir}/python3.4/optparse.* ${libdir}/python3.4/textw=
rap.* "
=20
 SUMMARY_${PN}-threading=3D"Python threading & synchronization support"
 RDEPENDS_${PN}-threading=3D"${PN}-core ${PN}-lang"
-FILES_${PN}-threading=3D"${libdir}/python3.3/_threading_local.* ${libdir}/=
python3.3/dummy_thread.* ${libdir}/python3.3/dummy_threading.* ${libdir}/py=
thon3.3/mutex.* ${libdir}/python3.3/threading.* ${libdir}/python3.3/Queue.*=
 "
+FILES_${PN}-threading=3D"${libdir}/python3.4/_threading_local.* ${libdir}/=
python3.4/dummy_thread.* ${libdir}/python3.4/dummy_threading.* ${libdir}/py=
thon3.4/mutex.* ${libdir}/python3.4/threading.* ${libdir}/python3.4/Queue.*=
 "
=20
 SUMMARY_${PN}-tkinter=3D"Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter=3D"${PN}-core"
-FILES_${PN}-tkinter=3D"${libdir}/python3.3/lib-dynload/_tkinter.*.so ${lib=
dir}/python3.3/lib-tk ${libdir}/python3.3/tkinter "
+FILES_${PN}-tkinter=3D"${libdir}/python3.4/lib-dynload/_tkinter.*.so ${lib=
dir}/python3.4/lib-tk ${libdir}/python3.4/tkinter "
=20
 SUMMARY_${PN}-unittest=3D"Python unit testing framework"
 RDEPENDS_${PN}-unittest=3D"${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io =
${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest=3D"${libdir}/python3.3/unittest/ "
+FILES_${PN}-unittest=3D"${libdir}/python3.4/unittest/ "
=20
 SUMMARY_${PN}-unixadmin=3D"Python Unix administration support"
 RDEPENDS_${PN}-unixadmin=3D"${PN}-core"
-FILES_${PN}-unixadmin=3D"${libdir}/python3.3/lib-dynload/nis.*.so ${libdir=
}/python3.3/lib-dynload/grp.*.so ${libdir}/python3.3/lib-dynload/pwd.*.so $=
{libdir}/python3.3/getpass.* "
+FILES_${PN}-unixadmin=3D"${libdir}/python3.4/lib-dynload/nis.*.so ${libdir=
}/python3.4/lib-dynload/grp.*.so ${libdir}/python3.4/lib-dynload/pwd.*.so $=
{libdir}/python3.4/getpass.* "
=20
 SUMMARY_${PN}-xml=3D"Python basic XML support"
 RDEPENDS_${PN}-xml=3D"${PN}-core ${PN}-elementtree ${PN}-re"
-FILES_${PN}-xml=3D"${libdir}/python3.3/lib-dynload/pyexpat.*.so ${libdir}/=
python3.3/xml ${libdir}/python3.3/xmllib.* "
+FILES_${PN}-xml=3D"${libdir}/python3.4/lib-dynload/pyexpat.*.so ${libdir}/=
python3.4/xml ${libdir}/python3.4/xmllib.* "
=20
 SUMMARY_${PN}-xmlrpc=3D"Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc=3D"${libdir}/python3.3/xmlrpclib.* ${libdir}/python3.3/=
SimpleXMLRPCServer.* ${libdir}/python3.3/DocXMLRPCServer.* ${libdir}/python=
3.3/xmlrpc "
+FILES_${PN}-xmlrpc=3D"${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.4/=
SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/python=
3.4/xmlrpc "
=20
 SUMMARY_${PN}-modules=3D"All Python modules"
-RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compil=
e ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-=
datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctes=
t ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idl=
e ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging =
${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-=
netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pp=
rint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}=
-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN=
}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-=
textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN=
}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codec=
s ${PN}-compile ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt $=
{PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-diffl=
ib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl =
${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang=
 ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multipr=
ocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-p=
kgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}=
-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-s=
tringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-tex=
tutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-x=
ml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules =3D "1"
=20
=20
diff --git a/meta/recipes-devtools/python/python3-native_3.4.2.bb b/meta/re=
cipes-devtools/python/python3-native_3.4.2.bb
index 9ae2a0b..9f124a4 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
@@ -1,37 +1,29 @@
 require recipes-devtools/python/python.inc
=20
 PR =3D "${INC_PR}.0"
-PYTHON_MAJMIN =3D "3.3"
+PYTHON_MAJMIN =3D "3.4"
 DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase =3D ""
-SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://000-cross-compile.patch \
-file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
-file://python-3.3-multilib.patch \
-file://03-fix-tkinter-detection.patch \
-file://avoid_warning_about_tkinter.patch \
-file://06-ctypes-libffi-fix-configure.patch \
-file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://host_include_contamination.patch \
+file://avoid-ncursesw-include-path.patch \
+file://python-3.4-multilib.patch \
+file://06-ctypes-libffi-fix-configure.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
-file://fix-ast.h-dependency.patch \
 file://makerace.patch \
-${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
+file://03-fix-tkinter-detection.patch \
+file://python-debug.patch \
 "
-SRC_URI[md5sum] =3D "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] =3D "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbc=
ddf47df84d8dcb"
+SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0=
f970dcf04b2def"
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4eaea08eaaf6875189b0c49f26fa200=
5"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed72=
f"
=20
 S =3D "${WORKDIR}/Python-${PV}"
=20
@@ -40,6 +32,8 @@ DEPENDS =3D "openssl-native bzip2-replacement-native zlib=
-native readline-native s
=20
 inherit native
=20
+CONFIGUREOPTS +=3D " --without-pydebug --without-ensurepip"
+
 RPROVIDES +=3D "python3-distutils-native python3-compression-native python=
3-textutils-native python3-core-native"
=20
 EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN}"
@@ -57,7 +51,7 @@ EXTRA_OEMAKE =3D '\
 # No ctypes option for python 3
 PYTHONLSBOPTS =3D ""
=20
-do_configure_prepend() {
+do_configure_append() {
 	autoreconf --verbose --install --force --exclude=3Dautopoint Modules/_cty=
pes/libffi || bbnote "_ctypes failed to autoreconf"
 }
=20
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-in=
side-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils=
-prefix-is-inside-staging-area.patch
index c5846a5..3cba081 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch
@@ -1,14 +1,6 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# The proper prefix is inside our staging area.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Signed-off-by: Phil Blundell <philb@gnu.org>
-# Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: Python-3.3.2/Lib/distutils/sysconfig.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.76974=
9805 -0700
-+++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.545767248 =
-0700
+diff -Nur Python-3.4.2.orig/Lib/distutils/sysconfig.py Python-3.4.2/Lib/di=
stutils/sysconfig.py
+--- Python-3.4.2.orig/Lib/distutils/sysconfig.py	2014-10-08 09:18:12.00000=
0000 +0100
++++ Python-3.4.2/Lib/distutils/sysconfig.py	2014-10-23 12:26:27.409663674 =
+0100
 @@ -16,10 +16,11 @@
  from .errors import DistutilsPlatformError
 =20
@@ -36,7 +28,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name =3D=3D "posix":
          if python_build:
-@@ -136,6 +139,12 @@
+@@ -134,6 +137,12 @@
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -49,7 +41,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
      if prefix is None:
          if standard_lib:
              prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -144,7 +153,7 @@
+@@ -142,7 +151,7 @@
 =20
      if os.name =3D=3D "posix":
          libpython =3D os.path.join(prefix,
@@ -58,16 +50,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-@@ -249,7 +258,7 @@
-     else:
-         # The name of the config.h file changed in 2.2
-         config_h =3D 'pyconfig.h'
--    return os.path.join(inc_dir, config_h)
-+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"=
), os.getenv("HOST_SYS") )
-=20
-=20
- def get_makefile_filename():
-@@ -258,7 +267,7 @@
+@@ -251,7 +260,7 @@
          return os.path.join(_sys_home or project_base, "Makefile")
      lib_dir =3D get_python_lib(plat_specific=3D0, standard_lib=3D1)
      config_file =3D 'config-{}{}'.format(get_python_version(), build_flag=
s)
diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-pa=
th.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path=
.patch
index 054a131..cf3a0da 100644
--- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patc=
h
+++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patc=
h
@@ -1,29 +1,11 @@
-We should make sure that sysroot is used by gcc instead of assuming
-hardcoded locations for include paths
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-:
-Index: Python-3.3.3/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.3.orig/configure.ac	2014-01-29 19:00:15.245312752 -0800
-+++ Python-3.3.3/configure.ac	2014-01-29 23:27:22.938526262 -0800
-@@ -1548,7 +1548,7 @@
- # checks for header files
- AC_HEADER_STDC
- ac_save_cppflags=3D"$CPPFLAGS"
--CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
-+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
- AC_CHECK_HEADERS(asm/types.h conio.h curses.h direct.h dlfcn.h errno.h \
- fcntl.h grp.h \
- ieeefp.h io.h langinfo.h libintl.h ncurses.h process.h pthread.h \
-@@ -4308,7 +4308,7 @@
- fi
+--- Python-3.4.2/configure.ac.orig	2014-10-17 21:58:13.967488345 +0100
++++ Python-3.4.2/configure.ac	2014-10-17 21:59:01.231689639 +0100
+@@ -4399,7 +4399,7 @@
 =20
+ # first curses header check
  ac_save_cppflags=3D"$CPPFLAGS"
 -CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
 +CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
- # On HP/UX 11.0, mvwdelch is a block with a return statement
- AC_MSG_CHECKING(whether mvwdelch is an expression)
- AC_CACHE_VAL(ac_cv_mvwdelch_is_expression,
+=20
+ AC_CHECK_HEADERS(curses.h ncurses.h)
+=20
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
index d8a6892..62d7de1 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -11,8 +11,6 @@ The easiest way to avoid this is to list the dependencies=
 explictly.
=20
 RP 28/2/2014
=20
-Upstream-Status: Pending
-
 Index: Python-3.3.3/Makefile.pre.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- Python-3.3.3.orig/Makefile.pre.in	2014-02-27 14:04:38.268339533 +0000
diff --git a/meta/recipes-devtools/python/python3/python-3.4-multilib.patch=
 b/meta/recipes-devtools/python/python3/python-3.4-multilib.patch
index 7d66a0e..0a5bff7 100644
--- a/meta/recipes-devtools/python/python3/python-3.4-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.4-multilib.patch
@@ -1,14 +1,52 @@
-get the sys.lib from python itself and do not use hardcoded value of 'lib'
-
--Khem
-
-Upstream-Status: Pending
-
-Index: Python-3.3.2/Include/pythonrun.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0=
700
-+++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
-@@ -181,6 +181,8 @@
+diff -Nur Python-3.4.2.orig/configure.ac Python-3.4.2/configure.ac
+--- Python-3.4.2.orig/configure.ac	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/configure.ac	2014-10-18 00:01:31.206664762 +0100
+@@ -791,6 +791,41 @@
+ MULTIARCH=3D$($CC --print-multiarch 2>/dev/null)
+ AC_SUBST(MULTIARCH)
+=20
++AC_SUBST(ARCH)
++AC_MSG_CHECKING(ARCH)
++ARCH=3D`uname -m`
++case $ARCH in
++i?86) ARCH=3Di386;;
++esac
++AC_MSG_RESULT($ARCH)
++
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++case $ac_sys_system in
++Linux*)
++  # Test if the compiler is 64bit
++  echo 'int i;' > conftest.$ac_ext
++  python_cv_cc_64bit_output=3Dno
++  if AC_TRY_EVAL(ac_compile); then
++    case `/usr/bin/file conftest.$ac_objext` in
++    *"ELF 64"*)
++      python_cv_cc_64bit_output=3Dyes
++      ;;
++    esac
++  fi
++  rm -rf conftest*
++  ;;
++esac
++
++case $ARCH:$python_cv_cc_64bit_output in
++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
++  LIB=3D"lib64"
++  ;;
++*:*)
++  LIB=3D"lib"
++  ;;
++esac
++AC_MSG_RESULT($LIB)
+=20
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+diff -Nur Python-3.4.2.orig/Include/pythonrun.h Python-3.4.2/Include/pytho=
nrun.h
+--- Python-3.4.2.orig/Include/pythonrun.h	2014-10-08 09:18:11.000000000 +0=
100
++++ Python-3.4.2/Include/pythonrun.h	2014-10-18 00:01:31.206664762 +0100
+@@ -220,6 +220,8 @@
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
  PyAPI_FUNC(const char *) Py_GetPlatform(void);
@@ -17,20 +55,19 @@ Index: Python-3.3.2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-3.3.2/Lib/distutils/command/install.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:54=
.000000000 -0700
-+++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.0998=
77246 -0700
-@@ -25,6 +25,8 @@
-     from site import USER_SITE
-     HAS_USER_SITE =3D True
+diff -Nur Python-3.4.2.orig/Lib/distutils/command/install.py Python-3.4.2/=
Lib/distutils/command/install.py
+--- Python-3.4.2.orig/Lib/distutils/command/install.py	2014-10-08 09:18:12=
.000000000 +0100
++++ Python-3.4.2/Lib/distutils/command/install.py	2014-10-18 00:01:31.2066=
64762 +0100
+@@ -19,6 +19,8 @@
+ from site import USER_SITE
+ HAS_USER_SITE =3D True
 =20
 +libname =3D sys.lib
 +
- if sys.version < "2.2":
-     WINDOWS_SCHEME =3D {
-         'purelib': '$base',
-@@ -45,7 +47,7 @@
+ WINDOWS_SCHEME =3D {
+     'purelib': '$base/Lib/site-packages',
+     'platlib': '$base/Lib/site-packages',
+@@ -30,7 +32,7 @@
  INSTALL_SCHEMES =3D {
      'unix_prefix': {
          'purelib': '$base/lib/python$py_version_short/site-packages',
@@ -39,11 +76,10 @@ Index: Python-3.3.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_=
name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.3.2/Lib/pydoc.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
-@@ -372,7 +372,7 @@
+diff -Nur Python-3.4.2.orig/Lib/pydoc.py Python-3.4.2/Lib/pydoc.py
+--- Python-3.4.2.orig/Lib/pydoc.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/pydoc.py	2014-10-18 00:01:31.206664762 +0100
+@@ -394,7 +394,7 @@
 =20
          docloc =3D os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
 =20
@@ -52,14 +88,13 @@ Index: Python-3.3.2/Lib/pydoc.py
                                 "python%d.%d" %  sys.version_info[:2])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-3.3.2/Lib/site.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/site.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/site.py	2013-07-27 16:19:54.103877246 -0700
-@@ -303,13 +303,19 @@
-         if sys.platform in ('os2emx', 'riscos'):
-             sitepackages.append(os.path.join(prefix, "Lib", "site-package=
s"))
-         elif os.sep =3D=3D '/':
+diff -Nur Python-3.4.2.orig/Lib/site.py Python-3.4.2/Lib/site.py
+--- Python-3.4.2.orig/Lib/site.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/site.py	2014-10-18 00:01:31.209998157 +0100
+@@ -304,13 +304,19 @@
+         seen.add(prefix)
+=20
+         if os.sep =3D=3D '/':
 -            sitepackages.append(os.path.join(prefix, "lib",
 +            sitepackages.append(os.path.join(prefix, sys.lib,
                                          "python" + sys.version[:3],
@@ -79,10 +114,54 @@ Index: Python-3.3.2/Lib/site.py
          if sys.platform =3D=3D "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-3.3.2/Lib/trace.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
-+++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
+diff -Nur Python-3.4.2.orig/Lib/sysconfig.py Python-3.4.2/Lib/sysconfig.py
+--- Python-3.4.2.orig/Lib/sysconfig.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/sysconfig.py	2014-10-18 00:01:31.209998157 +0100
+@@ -20,10 +20,10 @@
+=20
+ _INSTALL_SCHEMES =3D {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}'=
,
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages=
',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-=
packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}'=
,
+         'platinclude':
+@@ -32,10 +32,10 @@
+         'data': '{base}',
+         },
+     'posix_home': {
+-        'stdlib': '{installed_base}/lib/python',
+-        'platstdlib': '{base}/lib/python',
++        'stdlib': '{installed_base}/'+sys.lib+'/python',
++        'platstdlib': '{base}/'+sys.lib+'/python',
+         'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
++        'platlib': '{base}/'+sys.lib+'/python',
+         'include': '{installed_base}/include/python',
+         'platinclude': '{installed_base}/include/python',
+         'scripts': '{base}/bin',
+@@ -61,10 +61,10 @@
+         'data': '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{userbase}/lib/python{py_version_short}/site-packages=
',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages=
',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-=
packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data': '{userbase}',
+diff -Nur Python-3.4.2.orig/Lib/trace.py Python-3.4.2/Lib/trace.py
+--- Python-3.4.2.orig/Lib/trace.py	2014-10-08 09:18:14.000000000 +0100
++++ Python-3.4.2/Lib/trace.py	2014-10-18 00:01:31.209998157 +0100
 @@ -751,10 +751,10 @@
                  # should I also call expanduser? (after all, could use $H=
OME)
 =20
@@ -96,11 +175,10 @@ Index: Python-3.3.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s =3D os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.3.2/Makefile.pre.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
-+++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
-@@ -96,6 +96,8 @@
+diff -Nur Python-3.4.2.orig/Makefile.pre.in Python-3.4.2/Makefile.pre.in
+--- Python-3.4.2.orig/Makefile.pre.in	2014-10-08 09:18:14.000000000 +0100
++++ Python-3.4.2/Makefile.pre.in	2014-10-18 00:01:31.209998157 +0100
+@@ -101,6 +101,8 @@
 =20
  # Machine-dependent subdirectories
  MACHDEP=3D	@MACHDEP@
@@ -109,7 +187,7 @@ Index: Python-3.3.2/Makefile.pre.in
 =20
  # Multiarch directory (may be empty)
  MULTIARCH=3D	@MULTIARCH@
-@@ -115,7 +117,7 @@
+@@ -120,7 +122,7 @@
  MANDIR=3D		@mandir@
  INCLUDEDIR=3D	@includedir@
  CONFINCLUDEDIR=3D	$(exec_prefix)/include
@@ -118,7 +196,7 @@ Index: Python-3.3.2/Makefile.pre.in
  ABIFLAGS=3D	@ABIFLAGS@
 =20
  # Detailed destination directories
-@@ -635,6 +637,7 @@
+@@ -710,6 +712,7 @@
  		-DEXEC_PREFIX=3D'"$(exec_prefix)"' \
  		-DVERSION=3D'"$(VERSION)"' \
  		-DVPATH=3D'"$(VPATH)"' \
@@ -126,7 +204,7 @@ Index: Python-3.3.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
 =20
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -701,7 +704,7 @@
+@@ -778,7 +781,7 @@
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
 =20
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -135,11 +213,10 @@ Index: Python-3.3.2/Makefile.pre.in
 =20
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/import=
dl.c
-Index: Python-3.3.2/Modules/getpath.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -070=
0
-+++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
-@@ -121,9 +121,11 @@
+diff -Nur Python-3.4.2.orig/Modules/getpath.c Python-3.4.2/Modules/getpath=
.c
+--- Python-3.4.2.orig/Modules/getpath.c	2014-10-08 09:18:15.000000000 +010=
0
++++ Python-3.4.2/Modules/getpath.c	2014-10-18 00:02:54.224855977 +0100
+@@ -117,9 +117,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
 =20
@@ -153,19 +230,17 @@ Index: Python-3.3.2/Modules/getpath.c
  #endif
 =20
  #ifndef LANDMARK
-@@ -135,7 +137,7 @@
+@@ -130,6 +132,7 @@
+ static wchar_t exec_prefix[MAXPATHLEN+1];
  static wchar_t progpath[MAXPATHLEN+1];
  static wchar_t *module_search_path =3D NULL;
- static int module_search_path_malloced =3D 0;
--static wchar_t *lib_python =3D L"lib/python" VERSION;
 +static wchar_t *lib_python =3D L"" LIB_PYTHON;
 =20
  static void
  reduce(wchar_t *dir)
-Index: Python-3.3.2/Python/getplatform.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000 -=
0700
-+++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
+diff -Nur Python-3.4.2.orig/Python/getplatform.c Python-3.4.2/Python/getpl=
atform.c
+--- Python-3.4.2.orig/Python/getplatform.c	2014-10-08 09:18:16.000000000 +=
0100
++++ Python-3.4.2/Python/getplatform.c	2014-10-18 00:01:31.213331551 +0100
 @@ -10,3 +10,23 @@
  {
  	return PLATFORM;
@@ -190,11 +265,10 @@ Index: Python-3.3.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.3.2/Python/sysmodule.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -07=
00
-+++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
-@@ -1612,6 +1612,10 @@
+diff -Nur Python-3.4.2.orig/Python/sysmodule.c Python-3.4.2/Python/sysmodu=
le.c
+--- Python-3.4.2.orig/Python/sysmodule.c	2014-10-08 09:18:16.000000000 +01=
00
++++ Python-3.4.2/Python/sysmodule.c	2014-10-18 00:01:31.213331551 +0100
+@@ -1697,6 +1697,10 @@
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -205,11 +279,10 @@ Index: Python-3.3.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.3.2/setup.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
-+++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
-@@ -439,7 +439,7 @@
+diff -Nur Python-3.4.2.orig/setup.py Python-3.4.2/setup.py
+--- Python-3.4.2.orig/setup.py	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/setup.py	2014-10-18 00:01:31.213331551 +0100
+@@ -451,7 +451,7 @@
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -218,7 +291,7 @@ Index: Python-3.3.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/inclu=
de')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -497,8 +497,7 @@
+@@ -508,8 +508,7 @@
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs =3D self.compiler.library_dirs + [
@@ -228,7 +301,7 @@ Index: Python-3.3.2/setup.py
                  ]
              inc_dirs =3D self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -675,11 +674,11 @@
+@@ -730,11 +729,11 @@
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -242,95 +315,3 @@ Index: Python-3.3.2/setup.py
                                     extra_link_args=3Dreadline_extra_link_=
args,
                                     libraries=3Dreadline_libs) )
          else:
-Index: Python-3.3.2/Lib/sysconfig.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
-@@ -21,10 +21,10 @@
-=20
- _INSTALL_SCHEMES =3D {
-     'posix_prefix': {
--        'stdlib': '{installed_base}/lib/python{py_version_short}',
--        'platstdlib': '{platbase}/lib/python{py_version_short}',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}'=
,
-+        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages=
',
-+        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-=
packages',
-         'include':
-             '{installed_base}/include/python{py_version_short}{abiflags}'=
,
-         'platinclude':
-@@ -33,10 +33,10 @@
-         'data': '{base}',
-         },
-     'posix_home': {
--        'stdlib': '{installed_base}/lib/python',
--        'platstdlib': '{base}/lib/python',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python',
-+        'platstdlib': '{base}/'+sys.lib+'/python',
-         'purelib': '{base}/lib/python',
--        'platlib': '{base}/lib/python',
-+        'platlib': '{base}/'+sys.lib+'/python',
-         'include': '{installed_base}/include/python',
-         'platinclude': '{installed_base}/include/python',
-         'scripts': '{base}/bin',
-@@ -81,10 +81,10 @@
-         'data': '{userbase}',
-         },
-     'posix_user': {
--        'stdlib': '{userbase}/lib/python{py_version_short}',
--        'platstdlib': '{userbase}/lib/python{py_version_short}',
-+        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{userbase}/lib/python{py_version_short}/site-packages=
',
--        'platlib': '{userbase}/lib/python{py_version_short}/site-packages=
',
-+        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-=
packages',
-         'include': '{userbase}/include/python{py_version_short}',
-         'scripts': '{userbase}/bin',
-         'data': '{userbase}',
-Index: Python-3.3.2/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
-@@ -769,6 +769,41 @@
- MULTIARCH=3D$($CC --print-multiarch 2>/dev/null)
- AC_SUBST(MULTIARCH)
-=20
-+AC_SUBST(ARCH)
-+AC_MSG_CHECKING(ARCH)
-+ARCH=3D`uname -m`
-+case $ARCH in
-+i?86) ARCH=3Di386;;
-+esac
-+AC_MSG_RESULT($ARCH)
-+
-+AC_SUBST(LIB)
-+AC_MSG_CHECKING(LIB)
-+case $ac_sys_system in
-+Linux*)
-+  # Test if the compiler is 64bit
-+  echo 'int i;' > conftest.$ac_ext
-+  python_cv_cc_64bit_output=3Dno
-+  if AC_TRY_EVAL(ac_compile); then
-+    case `/usr/bin/file conftest.$ac_objext` in
-+    *"ELF 64"*)
-+      python_cv_cc_64bit_output=3Dyes
-+      ;;
-+    esac
-+  fi
-+  rm -rf conftest*
-+  ;;
-+esac
-+
-+case $ARCH:$python_cv_cc_64bit_output in
-+ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
-+  LIB=3D"lib64"
-+  ;;
-+*:*)
-+  LIB=3D"lib"
-+  ;;
-+esac
-+AC_MSG_RESULT($LIB)
-=20
- AC_SUBST(LIBRARY)
- AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/met=
a/recipes-devtools/python/python3/unixccompiler.patch
index 7b90f13..b2229b4 100644
--- a/meta/recipes-devtools/python/python3/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -13,13 +13,11 @@ Index: Python-3.3.2/Lib/distutils/unixccompiler.py
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- Python-3.3.2.orig/Lib/distutils/unixccompiler.py	2013-05-15 09:32:54.0=
00000000 -0700
 +++ Python-3.3.2/Lib/distutils/unixccompiler.py	2013-08-01 00:58:18.629056=
286 -0700
-@@ -202,7 +202,9 @@
+@@ -202,7 +202,7 @@
      # ccompiler.py.
 =20
      def library_dir_option(self, dir):
 -        return "-L" + dir
-+        if dir.startswith("."):
-+            return "-L" + dir
 +        return "-L=3D" + dir
 =20
      def _is_gcc(self, compiler_name):
diff --git a/meta/recipes-devtools/python/python3_3.4.2.bb b/meta/recipes-d=
evtools/python/python3_3.4.2.bb
index a1cb120..000f601 100644
--- a/meta/recipes-devtools/python/python3_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3_3.4.2.bb
@@ -2,52 +2,38 @@ require recipes-devtools/python/python.inc
=20
 DEPENDS =3D "python3-native libffi bzip2 db gdbm openssl readline sqlite3 =
zlib virtual/libintl xz"
 PR =3D "${INC_PR}.0"
-PYTHON_MAJMIN =3D "3.3"
+PYTHON_MAJMIN =3D "3.4"
 PYTHON_BINABI=3D "${PYTHON_MAJMIN}m"
 DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase =3D ""
-SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://000-cross-compile.patch \
-file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://fix-ast.h-dependency.patch \
+file://host_include_contamination.patch \
+file://avoid-ncursesw-include-path.patch \
+file://python-3.4-multilib.patch \
+file://06-ctypes-libffi-fix-configure.patch \
+file://sysroot-include-headers.patch \
+file://unixccompiler.patch \
 file://makerace.patch \
+file://03-fix-tkinter-detection.patch \
+file://python-debug.patch \
 ${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
 "
=20
-SRC_URI +=3D "\
-            file://03-fix-tkinter-detection.patch \
-            file://04-default-is-optimized.patch \
-            file://avoid_warning_about_tkinter.patch \
-            file://06-ctypes-libffi-fix-configure.patch \
-            file://remove_sqlite_rpath.patch \
-            file://cgi_py.patch \
-            file://host_include_contamination.patch \
-            file://python-3.3-multilib.patch \
-            file://shutil-follow-symlink-fix.patch \
-            file://sysroot-include-headers.patch \
-            file://unixccompiler.patch \
-            file://avoid-ncursesw-include-path.patch \
-           "
-SRC_URI[md5sum] =3D "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] =3D "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbc=
ddf47df84d8dcb"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4eaea08eaaf6875189b0c49f26fa200=
5"
+SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0=
f970dcf04b2def"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed72=
f"
=20
 S =3D "${WORKDIR}/Python-${PV}"
=20
 inherit autotools multilib_header python3native pkgconfig
=20
-CONFIGUREOPTS +=3D " --with-system-ffi "
+CONFIGUREOPTS +=3D " --with-system-ffi --without-pydebug --without-ensurep=
ip"
=20
 CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
                 ac_cv_have_lchflags=3Dno \
@@ -56,12 +42,6 @@ CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
                 ac_cv_file__dev_ptmx=3Dyes \
                 ac_cv_file__dev_ptc=3Dno \
 "
-# The 3 lines below are copied from the libffi recipe, ctypes ships its ow=
n copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
-TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
-TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
-EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
=20
 # No ctypes option for python 3
 PYTHONLSBOPTS =3D ""
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/cont=
rib/python/generate-manifest-3.4.py
index 288def2..9855c5b 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
=20
-VERSION =3D "3.3.3"
+VERSION =3D "3.4.2"
=20
 __author__ =3D "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ =3D "20140131"
@@ -167,14 +167,15 @@ if __name__ =3D=3D "__main__":
     #
=20
     m.addPackage( "${PN}-core", "Python interpreter and core modules", "${=
PN}-lang ${PN}-re",
-    "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
+    "__future__.* _abcoll.* _sitebuiltins.* _sysconfigdata.* " +
+    "_weakrefset.* abc.* argparse.* copy.* copyreg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*=
.so " +
     "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  +=
=20
-    "_weakrefset.* sysconfig.* config/Makefile " +
+    "selectors.* sysconfig.* config/Makefile " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
@@ -203,6 +204,8 @@ if __name__ =3D=3D "__main__":
     m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "$=
{PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
     "${bindir}/smtpd.* smtpd.*" )
=20
+    m.addPackage( "${PN}-asyncio", "Python Asyncio Library", "${PN}-core",=
 "asyncio" )
+
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/audi=
oop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
=20
@@ -215,6 +218,9 @@ if __name__ =3D=3D "__main__":
     m.addPackage( "${PN}-compression", "Python high-level compression supp=
ort", "${PN}-core ${PN}-codecs",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
=20
+    m.addPackage( "${PN}-concurrent", "Launching parallel tasks", "${PN}-c=
ore",
+    "concurrent" )
+
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing s=
upport", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.s=
o lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
=20
@@ -228,7 +234,7 @@ if __name__ =3D=3D "__main__":
     "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # di=
rectory + low level module
=20
     m.addPackage( "${PN}-datetime", "Python calendar and time support", "$=
{PN}-core ${PN}-codecs",
-    "_strptime.* calendar.* lib-dynload/datetime.*.so" )
+    "_strptime.* calendar.* datetime.* lib-dynload/_datetime.*.so" )
=20
     m.addPackage( "${PN}-db", "Python file-based database support", "${PN}=
-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
@@ -261,9 +267,6 @@ if __name__ =3D=3D "__main__":
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-c=
ore",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLPar=
ser.* " )
=20
-    m.addPackage( "${PN}-importlib", "Python import implementation library=
", "${PN}-core",
-    "importlib" )
-
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core=
",
     "lib-dynload/_gdbm.*.so" )
=20
@@ -277,11 +280,30 @@ if __name__ =3D=3D "__main__":
     m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-m=
ath ${PN}-re",
     "json lib-dynload/_json.*.so" ) # package
=20
-    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN=
}-core",
-    "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_h=
eapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
-    "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operato=
r.*.so lib-dynload/parser.*.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* hea=
pq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
-    "tokenize.* traceback.* weakref.*" )
+    m.addPackage(
+        "${PN}-lang", "Python low-level language support", "${PN}-core",
+        """
+        lib-dynload/array.*.so lib-dynload/_bisect.*.so lib-dynload/_bz2.*=
.so
+        lib-dynload/_collections.*.so lib-dynload/_crypt.*.so
+        lib-dynload/_decimal.*.so lib-dynload/_functools.*.so
+        lib-dynload/_heapq.*.so lib-dynload/itertools.*.so lib-dynload/_lz=
ma.*.so
+        lib-dynload/_md5.*.so lib-dynload/_opcode.*.so lib-dynload/parser.=
*.so
+        lib-dynload/_posixsubprocess.*.so lib-dynload/_sha1.*.so
+        lib-dynload/spwd.*.so lib-dynload/_testbuffer.*.so
+        lib-dynload/_testcapi.*.so lib-dynload/_testimportmultiple.*.so
+        lib-dynload/_weakref.*.so lib-dynload/xxlimited.*.so lib-dynload/z=
lib.*.so
+        __phello__.foo.* _bootlocale.* _collections_abc.* _dummy_thread.*
+        _markupbase.* _osx_support.* aifc.* antigravity.* ast.* asynchat.*
+        asyncore.* atexit.* binhex.* bisect.* bz2.* cgitb.* code.* codeop.=
*
+        collections.* configparser.* contextlib.* crypt.* decimal.* dis.* =
ensurepip
+        enum.* filecmp.* fileinput.* fractions.* functools.* heapq.* html
+        http imp.* importlib inspect.* ipaddress.* keyword.* lzma.* macpat=
h.*
+        macurl2path.* mailcap.* modulefinder.* netrc.* ntpath.* nturl2path=
.*
+        opcode.* operator.* pathlib.* plat-linux plistlib.* pyclbr.* queue=
.*
+        reprlib.* runpy.* sched.* socketserver.* statistics.* symbol.* sym=
table.*
+        tabnanny.* this.* timeit.* token.* tokenize.* trace.* traceback.*
+        tracemalloc.* turtle.* turtledemo venv weakref.* webbrowser.* wsgi=
ref
+    """)
=20
     m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core $=
{PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
@@ -303,16 +325,15 @@ if __name__ =3D=3D "__main__":
=20
     m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "=
${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${P=
N}-mime",
     "*Cookie*.* " +
-    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.=
* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uu=
id.* rfc822.* mimetools.*" )
+    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.=
* nntplib.* poplib.* smtplib.* telnetlib.* urllib uuid.* rfc822.* mimetools=
.*" )
=20
     m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "=
${PN}-core ${PN}-netclient",
     "cgi.* *HTTPServer.* SocketServer.*" )
=20
-    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}=
-lang ${PN}-re",
-    "decimal.* numbers.*" )
+    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}=
-lang ${PN}-re", "numbers.*" )
=20
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence suppor=
t", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
+    "_compat_pickle.* pickle.* shelve.* lib-dynload/_pickle.*.so pickletoo=
ls.*" )
=20
     m.addPackage( "${PN}-pkgutil", "Python package extension utility suppo=
rt", "${PN}-core",
     "pkgutil.*")
@@ -335,9 +356,6 @@ if __name__ =3D=3D "__main__":
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}=
-core ${PN}-re",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.=
*" )
=20
-    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-=
core ${PN}-netclient",
-    "urllib/robotparser.*")
-
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-=
core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
=20

--GPJrCs/72TxItFYR--

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iD4DBQBUWBUdeoHfxSJPi+gRAmH4AJwK5+rzde8rw6QmA2b3/We4HNMNygCVEaOe
7+pYH2aIPIaP++u2Pe8d6A==
=rYVs
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
