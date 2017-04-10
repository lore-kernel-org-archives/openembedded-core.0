Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 82BD872F9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 08:08:30 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id l201so32120201ybf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lh6gMrFMkmAkXAyHXyE8RIjON/Jcbi7fevn+iFTLN6U=;
	b=YinXpmQJoa3q0NNfphnGkgXGB7ypduPEe3i0f7FPnVVR8csPrDm3YzFvECc0w9ohp+
	z/i8ZDn8qRLpjDWV9g66Njc2HiF9K3cxtr5HdHGzS7KUxY/lRLer5G2waqqtCVQ9iS8H
	5mwhEzKAaRXPS0S+G4i6yIRVqHdUeqakCP5B24H8vyi52B3zmAlOkNpGo8YbOEfsUgRJ
	jW92g2hySYYWnRpcjBHWS/ijb14MnxmBC+Ji8hiUGJC6i3l30K2ivrQ9CCfZAsmlFFHL
	XD+lhaN/u8iHmZOR08fz91oIl2ce3+IXL2fQH1+vtxXQv1Ht9J0sEzMKB24ToLLK5c0/
	YO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lh6gMrFMkmAkXAyHXyE8RIjON/Jcbi7fevn+iFTLN6U=;
	b=g0XGc16+0/amrKsbOAIhop/NfMC7xXCFjOI3KgoySH8WYLNCqJ8MEfQvW9UnM+gXU2
	wTb3iInLjoYS/E5MP90t4bVk0vOlxsFL2hlcXKF3uw16SFdCKlgWgdLHqShQVESqbkkp
	WBFyY2pvKMyzFCjddYbGqqnbNEBKnt1JI2AVZERUDpZ/0cR6qXIkfLFBoXhaESjunTZl
	oJyINMAxHS39BsNJCSdfd/9pSBYpMU6oSTWL4AjgV27QEHz50HMzHTzxaThyL8XXPMAz
	GoyOJoss/cBnPthoSIjYfoAhto0/Si5AlCQHolncwCGkfX3MS1yhyx3yjqMjHE1jYOLE
	YSBw==
X-Gm-Message-State: AFeK/H1nATT/HQL+DL+8X3ibbWnDSpw4AGFETSJRb2YEB695nVElD7e+f4Z96LcaTbcDyXwGdrdKT2HBHDJ6HGlK
X-Received: by 10.129.116.213 with SMTP id p204mr37988483ywc.151.1491811711837;
	Mon, 10 Apr 2017 01:08:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 10 Apr 2017 01:08:01 -0700 (PDT)
In-Reply-To: <1491808224-142978-1-git-send-email-li.zhou@windriver.com>
References: <1491808224-142978-1-git-send-email-li.zhou@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 10 Apr 2017 11:08:01 +0300
Message-ID: <CAHiDW_HBcmoztK4s-+mALN_kKnEidWmpsRSZiCDdhoihAa+0sg@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python2/3: Move config/Makefile from core package to dev package
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
X-List-Received-Date: Mon, 10 Apr 2017 08:08:31 -0000
Content-Type: multipart/alternative; boundary=001a1147f5c027fe2f054ccb7bd9

--001a1147f5c027fe2f054ccb7bd9
Content-Type: text/plain; charset=UTF-8

On 10 April 2017 at 10:10, Li Zhou <li.zhou@windriver.com> wrote:

> Move config/Makefile in libdir from core package to dev package for
> python, because it is only needed in development process.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/python/python-2.7-manifest.inc | 4 ++--
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
>

These are generated files (see comments in the beginning of the files). You
should modify the generators, run them to re-generate these files, and then
send all the changes.

Thanks,
  Jussi



>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc
> b/meta/recipes-devtools/python/python-2.7-manifest.inc
> index 413405a..7ed254b 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -46,7 +46,7 @@ FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.*
> "
>
>  SUMMARY_${PN}-core="Python interpreter and core modules"
>  RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
> -FILES_${PN}-core="${libdir}/python2.7/__future__.*
> ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
> ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
> ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.*
> ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.*
> ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.*
> ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.*
> ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.*
> ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.*
> ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.*
> ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so
> ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so
> ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.*
> ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.*
> ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.*
> ${libdir}/python2.7/con
>  fig/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h
> ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
> +FILES_${PN}-core="${libdir}/python2.7/__future__.*
> ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
> ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
> ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.*
> ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.*
> ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.*
> ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.*
> ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.*
> ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.*
> ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.*
> ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so
> ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so
> ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.*
> ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.*
> ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.*
> ${includedir}/python${P
>  YTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py
> "
>
>  SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
>  RDEPENDS_${PN}-crypt="${PN}-core"
> @@ -74,7 +74,7 @@ FILES_${PN}-debugger="${libdir}/python2.7/bdb.*
> ${libdir}/python2.7/pdb.* "
>
>  SUMMARY_${PN}-dev="Python development package"
>  RDEPENDS_${PN}-dev="${PN}-core"
> -FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la
> ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
> ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
> +FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la
> ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
> ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
> ${libdir}/python2.7/config/Makefile "
>
>  SUMMARY_${PN}-difflib="Python helpers for computing deltas between
> objects"
>  RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 55bcc4b..b78158e 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -38,7 +38,7 @@ FILES_${PN}-compression="${libdir}/python3.5/gzip.*
> ${libdir}/python3.5/__pycach
>
>  SUMMARY_${PN}-core="Python interpreter and core modules"
>  RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs
> ${PN}-io ${PN}-math"
> -FILES_${PN}-core="${libdir}/python3.5/__future__.*
> ${libdir}/python3.5/__pycache__/__future__.*
> ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.*
> ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.*
> ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.*
> ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.*
> ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.*
> ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.*
> ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.*
> ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.*
> ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.*
> ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.*
> ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.*
> ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.*
> ${libdir}/python3.5/struct.* ${libdir}/python
>  3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
> ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.*
> ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.*
> ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.*
> ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.*
> ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.*
> ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so
> ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so
> ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-
> dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so
> ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so
> ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-
> dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.*
> ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.*
> ${libdir}/python3.5/__p
>  ycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.*
> ${libdir}/python3.5/__pycache__/_weakrefset.*
> ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.*
> ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.*
> ${libdir}/python3.5/config/Makefile ${libdir}/python3.5/config/Makefile/__pycache__
> ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections
> ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.*
> ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py
> "
> +FILES_${PN}-core="${libdir}/python3.5/__future__.*
> ${libdir}/python3.5/__pycache__/__future__.*
> ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.*
> ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.*
> ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.*
> ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.*
> ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.*
> ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.*
> ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.*
> ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.*
> ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.*
> ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.*
> ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.*
> ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.*
> ${libdir}/python3.5/struct.* ${libdir}/python
>  3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
> ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.*
> ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.*
> ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.*
> ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.*
> ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.*
> ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so
> ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so
> ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-
> dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so
> ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so
> ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-
> dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.*
> ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.*
> ${libdir}/python3.5/__p
>  ycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.*
> ${libdir}/python3.5/__pycache__/_weakrefset.*
> ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.*
> ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.*
> ${libdir}/python3.5/config/Makefile/__pycache__
> ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections
> ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.*
> ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py
> "
>
>  SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
>  RDEPENDS_${PN}-crypt="${PN}-core"
> @@ -66,7 +66,7 @@ FILES_${PN}-debugger="${libdir}/python3.5/bdb.*
> ${libdir}/python3.5/__pycache__/
>
>  SUMMARY_${PN}-dev="Python development package"
>  RDEPENDS_${PN}-dev="${PN}-core"
> -FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la
> ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
> ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
> +FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la
> ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
> ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
> ${libdir}/python3.5/config/Makefile "
>
>  SUMMARY_${PN}-difflib="Python helpers for computing deltas between
> objects"
>  RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147f5c027fe2f054ccb7bd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 April 2017 at 10:10, Li Zhou <span dir=3D"ltr">&lt;<a href=3D"mailto:li.z=
hou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Move config/Makefile in libdir from=
 core package to dev package for<br>
python, because it is only needed in development process.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-2.7-manifest.inc | 4 ++--<br=
>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 4 ++--<br=
></blockquote><div><br></div><div>These are generated files (see comments i=
n the beginning of the files). You should modify the generators, run them t=
o re-generate these files, and then send all the changes.<br></div><div><br=
></div><div>Thanks,</div><div>=C2=A0 Jussi</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc b/me=
ta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
index 413405a..7ed254b 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
@@ -46,7 +46,7 @@ FILES_${PN}-contextlib=3D&quot;${<wbr>libdir}/python${PYT=
HON_MAJMIN}<wbr>/contextlib.* &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&quot;<=
br>
=C2=A0RDEPENDS_${PN}-core=3D&quot;${PN}-<wbr>lang ${PN}-re&quot;<br>
-FILES_${PN}-core=3D&quot;${libdir}/<wbr>python2.7/__future__.* ${libdir}/p=
ython2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${li=
bdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/<=
wbr>ConfigParser.* ${libdir}/python2.7/<wbr>genericpath.* ${libdir}/python2=
.7/getopt.* ${libdir}/python2.7/linecache.<wbr>* ${libdir}/python2.7/new.* =
${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.<wbr>* ${libdir}/pyt=
hon2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* $=
{libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.=
7/UserList.* ${libdir}/python2.7/<wbr>UserString.* ${libdir}/python2.7/lib-=
<wbr>dynload/binascii.so ${libdir}/python2.7/lib-<wbr>dynload/_struct.so ${=
libdir}/python2.7/lib-<wbr>dynload/time.so ${libdir}/python2.7/lib-<wbr>dyn=
load/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform=
.* ${bindir}/python* ${libdir}/python2.7/_<wbr>weakrefset.* ${libdir}/pytho=
n2.7/sysconfig.<wbr>* ${libdir}/python2.7/_<wbr>sysconfigdata.* ${libdir}/p=
ython2.7/con<br>
=C2=A0fig/Makefile ${includedir}/python${PYTHON_<wbr>MAJMIN}/pyconfig*.h ${=
libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py &quot;<br>
+FILES_${PN}-core=3D&quot;${libdir}/<wbr>python2.7/__future__.* ${libdir}/p=
ython2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${li=
bdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/<=
wbr>ConfigParser.* ${libdir}/python2.7/<wbr>genericpath.* ${libdir}/python2=
.7/getopt.* ${libdir}/python2.7/linecache.<wbr>* ${libdir}/python2.7/new.* =
${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.<wbr>* ${libdir}/pyt=
hon2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* $=
{libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.=
7/UserList.* ${libdir}/python2.7/<wbr>UserString.* ${libdir}/python2.7/lib-=
<wbr>dynload/binascii.so ${libdir}/python2.7/lib-<wbr>dynload/_struct.so ${=
libdir}/python2.7/lib-<wbr>dynload/time.so ${libdir}/python2.7/lib-<wbr>dyn=
load/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform=
.* ${bindir}/python* ${libdir}/python2.7/_<wbr>weakrefset.* ${libdir}/pytho=
n2.7/sysconfig.<wbr>* ${libdir}/python2.7/_<wbr>sysconfigdata.* ${includedi=
r}/python${P<br>
=C2=A0YTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitec=
ustomize.py &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-crypt=3D&quot;Python basic cryptographic and hashing su=
pport&quot;<br>
=C2=A0RDEPENDS_${PN}-crypt=3D&quot;${PN}-<wbr>core&quot;<br>
@@ -74,7 +74,7 @@ FILES_${PN}-debugger=3D&quot;${<wbr>libdir}/python2.7/bdb=
.* ${libdir}/python2.7/pdb.* &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-dev=3D&quot;Python development package&quot;<br>
=C2=A0RDEPENDS_${PN}-dev=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-dev=3D&quot;${<wbr>includedir} ${libdir}/lib*${SOLIBSDEV} ${li=
bdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig &quot;<br>
+FILES_${PN}-dev=3D&quot;${<wbr>includedir} ${libdir}/lib*${SOLIBSDEV} ${li=
bdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/pyt=
hon2.7/config/<wbr>Makefile &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-difflib=3D&quot;Python helpers for computing deltas bet=
ween objects&quot;<br>
=C2=A0RDEPENDS_${PN}-difflib=3D&quot;${PN}-<wbr>lang ${PN}-re&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc b/me=
ta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
index 55bcc4b..b78158e 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
@@ -38,7 +38,7 @@ FILES_${PN}-compression=3D&quot;${<wbr>libdir}/python3.5/=
gzip.* ${libdir}/python3.5/__pycach<br>
<br>
=C2=A0SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&quot;<=
br>
=C2=A0RDEPENDS_${PN}-core=3D&quot;${PN}-<wbr>lang ${PN}-re ${PN}-reprlib ${=
PN}-codecs ${PN}-io ${PN}-math&quot;<br>
-FILES_${PN}-core=3D&quot;${libdir}/<wbr>python3.5/__future__.* ${libdir}/p=
ython3.5/__pycache_<wbr>_/__future__.* ${libdir}/python3.5/_abcoll.* ${libd=
ir}/python3.5/__pycache_<wbr>_/_abcoll.* ${libdir}/python3.5/abc.* ${libdir=
}/python3.5/__pycache_<wbr>_/abc.* ${libdir}/python3.5/ast.* ${libdir}/pyth=
on3.5/__pycache_<wbr>_/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5=
/__pycache_<wbr>_/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/=
__pycache_<wbr>_/copyreg.* ${libdir}/python3.5/<wbr>configparser.* ${libdir=
}/python3.5/__pycache_<wbr>_/configparser.* ${libdir}/python3.5/<wbr>generi=
cpath.* ${libdir}/python3.5/__pycache_<wbr>_/genericpath.* ${libdir}/python=
3.5/getopt.* ${libdir}/python3.5/__pycache_<wbr>_/getopt.* ${libdir}/python=
3.5/linecache.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/linecache.* ${lib=
dir}/python3.5/new.* ${libdir}/python3.5/__pycache_<wbr>_/new.* ${libdir}/p=
ython3.5/os.* ${libdir}/python3.5/__pycache_<wbr>_/os.* ${libdir}/python3.5=
/posixpath.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/posixpath.* ${libdir=
}/python3.5/struct.* ${libdir}/python<br>
=C2=A03.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/warnings.* ${libdir}/python3.5/site.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/site.* ${libdir}/python3.5/stat.* ${libdir}/python3=
.5/__pycache_<wbr>_/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3=
.5/__pycache_<wbr>_/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/UserList.* ${libdir}/python3.5/<wbr>UserString.* ${=
libdir}/python3.5/__pycache_<wbr>_/UserString.* ${libdir}/python3.5/lib-<wb=
r>dynload/binascii.*.so ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/bi=
nascii.*<wbr>.so ${libdir}/python3.5/lib-<wbr>dynload/_struct.*.so ${libdir=
}/python3.5/lib-<wbr>dynload/__pycache__/_struct.*.<wbr>so ${libdir}/python=
3.5/lib-<wbr>dynload/time.*.so ${libdir}/python3.5/lib-<wbr>dynload/__pycac=
he__/time.*.so ${libdir}/python3.5/lib-<wbr>dynload/xreadlines.*.so ${libdi=
r}/python3.5/lib-<wbr>dynload/__pycache__/<wbr>xreadlines.*.so ${libdir}/py=
thon3.5/types.* ${libdir}/python3.5/__pycache_<wbr>_/types.* ${libdir}/pyth=
on3.5/platform.* ${libdir}/python3.5/__p<br>
=C2=A0ycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_<wbr>weakr=
efset.* ${libdir}/python3.5/__pycache_<wbr>_/_weakrefset.* ${libdir}/python=
3.5/sysconfig.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/sysconfig.* ${lib=
dir}/python3.5/_<wbr>sysconfigdata.* ${libdir}/python3.5/__pycache_<wbr>_/_=
sysconfigdata.* ${libdir}/python3.5/config/<wbr>Makefile ${libdir}/python3.=
5/config/<wbr>Makefile/__pycache__ ${includedir}/python${PYTHON_<wbr>BINABI=
}/pyconfig*.h ${libdir}/python${PYTHON_<wbr>MAJMIN}/collections ${libdir}/p=
ython${PYTHON_<wbr>MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_<wbr=
>MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomiz=
e.py &quot;<br>
+FILES_${PN}-core=3D&quot;${libdir}/<wbr>python3.5/__future__.* ${libdir}/p=
ython3.5/__pycache_<wbr>_/__future__.* ${libdir}/python3.5/_abcoll.* ${libd=
ir}/python3.5/__pycache_<wbr>_/_abcoll.* ${libdir}/python3.5/abc.* ${libdir=
}/python3.5/__pycache_<wbr>_/abc.* ${libdir}/python3.5/ast.* ${libdir}/pyth=
on3.5/__pycache_<wbr>_/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5=
/__pycache_<wbr>_/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/=
__pycache_<wbr>_/copyreg.* ${libdir}/python3.5/<wbr>configparser.* ${libdir=
}/python3.5/__pycache_<wbr>_/configparser.* ${libdir}/python3.5/<wbr>generi=
cpath.* ${libdir}/python3.5/__pycache_<wbr>_/genericpath.* ${libdir}/python=
3.5/getopt.* ${libdir}/python3.5/__pycache_<wbr>_/getopt.* ${libdir}/python=
3.5/linecache.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/linecache.* ${lib=
dir}/python3.5/new.* ${libdir}/python3.5/__pycache_<wbr>_/new.* ${libdir}/p=
ython3.5/os.* ${libdir}/python3.5/__pycache_<wbr>_/os.* ${libdir}/python3.5=
/posixpath.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/posixpath.* ${libdir=
}/python3.5/struct.* ${libdir}/python<br>
=C2=A03.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/warnings.* ${libdir}/python3.5/site.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/site.* ${libdir}/python3.5/stat.* ${libdir}/python3=
.5/__pycache_<wbr>_/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3=
.5/__pycache_<wbr>_/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/pyt=
hon3.5/__pycache_<wbr>_/UserList.* ${libdir}/python3.5/<wbr>UserString.* ${=
libdir}/python3.5/__pycache_<wbr>_/UserString.* ${libdir}/python3.5/lib-<wb=
r>dynload/binascii.*.so ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/bi=
nascii.*<wbr>.so ${libdir}/python3.5/lib-<wbr>dynload/_struct.*.so ${libdir=
}/python3.5/lib-<wbr>dynload/__pycache__/_struct.*.<wbr>so ${libdir}/python=
3.5/lib-<wbr>dynload/time.*.so ${libdir}/python3.5/lib-<wbr>dynload/__pycac=
he__/time.*.so ${libdir}/python3.5/lib-<wbr>dynload/xreadlines.*.so ${libdi=
r}/python3.5/lib-<wbr>dynload/__pycache__/<wbr>xreadlines.*.so ${libdir}/py=
thon3.5/types.* ${libdir}/python3.5/__pycache_<wbr>_/types.* ${libdir}/pyth=
on3.5/platform.* ${libdir}/python3.5/__p<br>
=C2=A0ycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_<wbr>weakr=
efset.* ${libdir}/python3.5/__pycache_<wbr>_/_weakrefset.* ${libdir}/python=
3.5/sysconfig.<wbr>* ${libdir}/python3.5/__pycache_<wbr>_/sysconfig.* ${lib=
dir}/python3.5/_<wbr>sysconfigdata.* ${libdir}/python3.5/__pycache_<wbr>_/_=
sysconfigdata.* ${libdir}/python3.5/config/<wbr>Makefile/__pycache__ ${incl=
udedir}/python${PYTHON_<wbr>BINABI}/pyconfig*.h ${libdir}/python${PYTHON_<w=
br>MAJMIN}/collections ${libdir}/python${PYTHON_<wbr>MAJMIN}/_collections_a=
bc.* ${libdir}/python${PYTHON_<wbr>MAJMIN}/_sitebuiltins.* ${libdir}/python=
${PYTHON_<wbr>MAJMIN}/sitecustomize.py &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-crypt=3D&quot;Python basic cryptographic and hashing su=
pport&quot;<br>
=C2=A0RDEPENDS_${PN}-crypt=3D&quot;${PN}-<wbr>core&quot;<br>
@@ -66,7 +66,7 @@ FILES_${PN}-debugger=3D&quot;${<wbr>libdir}/python3.5/bdb=
.* ${libdir}/python3.5/__pycache_<wbr>_/<br>
<br>
=C2=A0SUMMARY_${PN}-dev=3D&quot;Python development package&quot;<br>
=C2=A0RDEPENDS_${PN}-dev=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-dev=3D&quot;${<wbr>includedir} ${libdir}/lib*${SOLIBSDEV} ${li=
bdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig &quot;<br>
+FILES_${PN}-dev=3D&quot;${<wbr>includedir} ${libdir}/lib*${SOLIBSDEV} ${li=
bdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/pyt=
hon3.5/config/<wbr>Makefile &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-difflib=3D&quot;Python helpers for computing deltas bet=
ween objects&quot;<br>
=C2=A0RDEPENDS_${PN}-difflib=3D&quot;${PN}-<wbr>lang ${PN}-re&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1147f5c027fe2f054ccb7bd9--
