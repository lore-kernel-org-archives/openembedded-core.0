Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1B8277D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:25:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3A9PZST025695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 02:25:35 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 02:25:34 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1491808224-142978-1-git-send-email-li.zhou@windriver.com>
	<CAHiDW_HBcmoztK4s-+mALN_kKnEidWmpsRSZiCDdhoihAa+0sg@mail.gmail.com>
From: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <c2d859ac-be14-3464-2df2-090f72a02b76@windriver.com>
Date: Mon, 10 Apr 2017 17:25:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HBcmoztK4s-+mALN_kKnEidWmpsRSZiCDdhoihAa+0sg@mail.gmail.com>
Subject: [PATCH V2] python2/3: Move config/Makefile from core package to dev package
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
X-List-Received-Date: Mon, 10 Apr 2017 09:25:34 -0000
X-Groupsio-MsgNum: 96035
Content-Type: multipart/mixed; boundary="------------9634A1BC9C51588B3064B34A"

--------------9634A1BC9C51588B3064B34A
Content-Type: multipart/alternative;
	boundary="------------95D4AD040705972A1DB6C5F1"

--------------95D4AD040705972A1DB6C5F1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

         Here is the 2nd version for this patch. Still send it in an 
accessory.

         @Jussi: Thank you for the reminding.


On 04/10/2017 04:08 PM, Jussi Kukkonen wrote:
> On 10 April 2017 at 10:10, Li Zhou <li.zhou@windriver.com 
> <mailto:li.zhou@windriver.com>> wrote:
>
>     Move config/Makefile in libdir from core package to dev package for
>     python, because it is only needed in development process.
>
>     Signed-off-by: Li Zhou <li.zhou@windriver.com
>     <mailto:li.zhou@windriver.com>>
>     ---
>      meta/recipes-devtools/python/python-2.7-manifest.inc | 4 ++--
>      meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
>
>
> These are generated files (see comments in the beginning of the 
> files). You should modify the generators, run them to re-generate 
> these files, and then send all the changes.
>
> Thanks,
>   Jussi
>
>      2 files changed, 4 insertions(+), 4 deletions(-)
>
>     diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc
>     b/meta/recipes-devtools/python/python-2.7-manifest.inc
>     index 413405a..7ed254b 100644
>     --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
>     +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
>     @@ -46,7 +46,7 @@
>     FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.*
>     "
>
>      SUMMARY_${PN}-core="Python interpreter and core modules"
>      RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
>     -FILES_${PN}-core="${libdir}/python2.7/__future__.*
>     ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
>     ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
>     ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.*
>     ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.*
>     ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.*
>     ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.*
>     ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.*
>     ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.*
>     ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.*
>     ${libdir}/python2.7/UserString.*
>     ${libdir}/python2.7/lib-dynload/binascii.so
>     ${libdir}/python2.7/lib-dynload/_struct.so
>     ${libdir}/python2.7/lib-dynload/time.so
>     ${libdir}/python2.7/lib-dynload/xreadlines.so
>     ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.*
>     ${bindir}/python* ${libdir}/python2.7/_weakrefset.*
>     ${libdir}/python2.7/sysconfig.*
>     ${libdir}/python2.7/_sysconfigdata.* ${libdir}/python2.7/con
>      fig/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h
>     ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>     +FILES_${PN}-core="${libdir}/python2.7/__future__.*
>     ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
>     ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
>     ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.*
>     ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.*
>     ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.*
>     ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.*
>     ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.*
>     ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.*
>     ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.*
>     ${libdir}/python2.7/UserString.*
>     ${libdir}/python2.7/lib-dynload/binascii.so
>     ${libdir}/python2.7/lib-dynload/_struct.so
>     ${libdir}/python2.7/lib-dynload/time.so
>     ${libdir}/python2.7/lib-dynload/xreadlines.so
>     ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.*
>     ${bindir}/python* ${libdir}/python2.7/_weakrefset.*
>     ${libdir}/python2.7/sysconfig.*
>     ${libdir}/python2.7/_sysconfigdata.* ${includedir}/python${P
>      YTHON_MAJMIN}/pyconfig*.h
>     ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>
>      SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
>      RDEPENDS_${PN}-crypt="${PN}-core"
>     @@ -74,7 +74,7 @@ FILES_${PN}-debugger="${libdir}/python2.7/bdb.*
>     ${libdir}/python2.7/pdb.* "
>
>      SUMMARY_${PN}-dev="Python development package"
>      RDEPENDS_${PN}-dev="${PN}-core"
>     -FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV}
>     ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig
>     ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal
>     ${datadir}/pkgconfig "
>     +FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV}
>     ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig
>     ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal
>     ${datadir}/pkgconfig ${libdir}/python2.7/config/Makefile "
>
>      SUMMARY_${PN}-difflib="Python helpers for computing deltas
>     between objects"
>      RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
>     diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
>     b/meta/recipes-devtools/python/python-3.5-manifest.inc
>     index 55bcc4b..b78158e 100644
>     --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
>     +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
>     @@ -38,7 +38,7 @@
>     FILES_${PN}-compression="${libdir}/python3.5/gzip.*
>     ${libdir}/python3.5/__pycach
>
>      SUMMARY_${PN}-core="Python interpreter and core modules"
>      RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib
>     ${PN}-codecs ${PN}-io ${PN}-math"
>     -FILES_${PN}-core="${libdir}/python3.5/__future__.*
>     ${libdir}/python3.5/__pycache__/__future__.*
>     ${libdir}/python3.5/_abcoll.*
>     ${libdir}/python3.5/__pycache__/_abcoll.*
>     ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.*
>     ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.*
>     ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.*
>     ${libdir}/python3.5/copyreg.*
>     ${libdir}/python3.5/__pycache__/copyreg.*
>     ${libdir}/python3.5/configparser.*
>     ${libdir}/python3.5/__pycache__/configparser.*
>     ${libdir}/python3.5/genericpath.*
>     ${libdir}/python3.5/__pycache__/genericpath.*
>     ${libdir}/python3.5/getopt.*
>     ${libdir}/python3.5/__pycache__/getopt.*
>     ${libdir}/python3.5/linecache.*
>     ${libdir}/python3.5/__pycache__/linecache.*
>     ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.*
>     ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.*
>     ${libdir}/python3.5/posixpath.*
>     ${libdir}/python3.5/__pycache__/posixpath.*
>     ${libdir}/python3.5/struct.* ${libdir}/python
>      3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
>     ${libdir}/python3.5/__pycache__/warnings.*
>     ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.*
>     ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.*
>     ${libdir}/python3.5/UserDict.*
>     ${libdir}/python3.5/__pycache__/UserDict.*
>     ${libdir}/python3.5/UserList.*
>     ${libdir}/python3.5/__pycache__/UserList.*
>     ${libdir}/python3.5/UserString.*
>     ${libdir}/python3.5/__pycache__/UserString.*
>     ${libdir}/python3.5/lib-dynload/binascii.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so
>     ${libdir}/python3.5/lib-dynload/_struct.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so
>     ${libdir}/python3.5/lib-dynload/time.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so
>     ${libdir}/python3.5/lib-dynload/xreadlines.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so
>     ${libdir}/python3.5/types.*
>     ${libdir}/python3.5/__pycache__/types.*
>     ${libdir}/python3.5/platform.* ${libdir}/python3.5/__p
>      ycache__/platform.* ${bindir}/python*
>     ${libdir}/python3.5/_weakrefset.*
>     ${libdir}/python3.5/__pycache__/_weakrefset.*
>     ${libdir}/python3.5/sysconfig.*
>     ${libdir}/python3.5/__pycache__/sysconfig.*
>     ${libdir}/python3.5/_sysconfigdata.*
>     ${libdir}/python3.5/__pycache__/_sysconfigdata.*
>     ${libdir}/python3.5/config/Makefile
>     ${libdir}/python3.5/config/Makefile/__pycache__
>     ${includedir}/python${PYTHON_BINABI}/pyconfig*.h
>     ${libdir}/python${PYTHON_MAJMIN}/collections
>     ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.*
>     ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.*
>     ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>     +FILES_${PN}-core="${libdir}/python3.5/__future__.*
>     ${libdir}/python3.5/__pycache__/__future__.*
>     ${libdir}/python3.5/_abcoll.*
>     ${libdir}/python3.5/__pycache__/_abcoll.*
>     ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.*
>     ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.*
>     ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.*
>     ${libdir}/python3.5/copyreg.*
>     ${libdir}/python3.5/__pycache__/copyreg.*
>     ${libdir}/python3.5/configparser.*
>     ${libdir}/python3.5/__pycache__/configparser.*
>     ${libdir}/python3.5/genericpath.*
>     ${libdir}/python3.5/__pycache__/genericpath.*
>     ${libdir}/python3.5/getopt.*
>     ${libdir}/python3.5/__pycache__/getopt.*
>     ${libdir}/python3.5/linecache.*
>     ${libdir}/python3.5/__pycache__/linecache.*
>     ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.*
>     ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.*
>     ${libdir}/python3.5/posixpath.*
>     ${libdir}/python3.5/__pycache__/posixpath.*
>     ${libdir}/python3.5/struct.* ${libdir}/python
>      3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
>     ${libdir}/python3.5/__pycache__/warnings.*
>     ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.*
>     ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.*
>     ${libdir}/python3.5/UserDict.*
>     ${libdir}/python3.5/__pycache__/UserDict.*
>     ${libdir}/python3.5/UserList.*
>     ${libdir}/python3.5/__pycache__/UserList.*
>     ${libdir}/python3.5/UserString.*
>     ${libdir}/python3.5/__pycache__/UserString.*
>     ${libdir}/python3.5/lib-dynload/binascii.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so
>     ${libdir}/python3.5/lib-dynload/_struct.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so
>     ${libdir}/python3.5/lib-dynload/time.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so
>     ${libdir}/python3.5/lib-dynload/xreadlines.*.so
>     ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so
>     ${libdir}/python3.5/types.*
>     ${libdir}/python3.5/__pycache__/types.*
>     ${libdir}/python3.5/platform.* ${libdir}/python3.5/__p
>      ycache__/platform.* ${bindir}/python*
>     ${libdir}/python3.5/_weakrefset.*
>     ${libdir}/python3.5/__pycache__/_weakrefset.*
>     ${libdir}/python3.5/sysconfig.*
>     ${libdir}/python3.5/__pycache__/sysconfig.*
>     ${libdir}/python3.5/_sysconfigdata.*
>     ${libdir}/python3.5/__pycache__/_sysconfigdata.*
>     ${libdir}/python3.5/config/Makefile/__pycache__
>     ${includedir}/python${PYTHON_BINABI}/pyconfig*.h
>     ${libdir}/python${PYTHON_MAJMIN}/collections
>     ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.*
>     ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.*
>     ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>
>      SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
>      RDEPENDS_${PN}-crypt="${PN}-core"
>     @@ -66,7 +66,7 @@ FILES_${PN}-debugger="${libdir}/python3.5/bdb.*
>     ${libdir}/python3.5/__pycache__/
>
>      SUMMARY_${PN}-dev="Python development package"
>      RDEPENDS_${PN}-dev="${PN}-core"
>     -FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV}
>     ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig
>     ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal
>     ${datadir}/pkgconfig "
>     +FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV}
>     ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig
>     ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal
>     ${datadir}/pkgconfig ${libdir}/python3.5/config/Makefile "
>
>      SUMMARY_${PN}-difflib="Python helpers for computing deltas
>     between objects"
>      RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------95D4AD040705972A1DB6C5F1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>        Here is the 2nd version for this patch. Still send it in
      an accessory.</p>
    <p>        @Jussi: Thank you for the reminding.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 04/10/2017 04:08 PM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_HBcmoztK4s-+mALN_kKnEidWmpsRSZiCDdhoihAa+0sg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 10 April 2017 at 10:10, Li Zhou <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:li.zhou@windriver.com" target="_blank">li.zhou@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Move
              config/Makefile in libdir from core package to dev package
              for<br>
              python, because it is only needed in development process.<br>
              <br>
              Signed-off-by: Li Zhou &lt;<a moz-do-not-send="true"
                href="mailto:li.zhou@windriver.com">li.zhou@windriver.com</a>&gt;<br>
              ---<br>
               meta/recipes-devtools/python/<wbr>python-2.7-manifest.inc
              | 4 ++--<br>
               meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc
              | 4 ++--<br>
            </blockquote>
            <div><br>
            </div>
            <div>These are generated files (see comments in the
              beginning of the files). You should modify the generators,
              run them to re-generate these files, and then send all the
              changes.<br>
            </div>
            <div><br>
            </div>
            <div>Thanks,</div>
            <div>  Jussi</div>
            <div><br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
               2 files changed, 4 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc
              b/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
              index 413405a..7ed254b 100644<br>
              --- a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
              +++ b/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
              @@ -46,7 +46,7 @@ FILES_${PN}-contextlib="${<wbr>libdir}/python${PYTHON_MAJMIN}<wbr>/contextlib.*
              "<br>
              <br>
               SUMMARY_${PN}-core="Python interpreter and core modules"<br>
               RDEPENDS_${PN}-core="${PN}-<wbr>lang ${PN}-re"<br>
              -FILES_${PN}-core="${libdir}/<wbr>python2.7/__future__.*
              ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
              ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
              ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/<wbr>ConfigParser.*
              ${libdir}/python2.7/<wbr>genericpath.*
              ${libdir}/python2.7/getopt.*
              ${libdir}/python2.7/linecache.<wbr>*
              ${libdir}/python2.7/new.* ${libdir}/python2.7/os.*
              ${libdir}/python2.7/posixpath.<wbr>*
              ${libdir}/python2.7/struct.*
              ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.*
              ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.*
              ${libdir}/python2.7/UserList.* ${libdir}/python2.7/<wbr>UserString.*
              ${libdir}/python2.7/lib-<wbr>dynload/binascii.so
              ${libdir}/python2.7/lib-<wbr>dynload/_struct.so
              ${libdir}/python2.7/lib-<wbr>dynload/time.so
              ${libdir}/python2.7/lib-<wbr>dynload/xreadlines.so
              ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.*
              ${bindir}/python* ${libdir}/python2.7/_<wbr>weakrefset.*
              ${libdir}/python2.7/sysconfig.<wbr>* ${libdir}/python2.7/_<wbr>sysconfigdata.*
              ${libdir}/python2.7/con<br>
               fig/Makefile ${includedir}/python${PYTHON_<wbr>MAJMIN}/pyconfig*.h
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py "<br>
              +FILES_${PN}-core="${libdir}/<wbr>python2.7/__future__.*
              ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.*
              ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.*
              ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/<wbr>ConfigParser.*
              ${libdir}/python2.7/<wbr>genericpath.*
              ${libdir}/python2.7/getopt.*
              ${libdir}/python2.7/linecache.<wbr>*
              ${libdir}/python2.7/new.* ${libdir}/python2.7/os.*
              ${libdir}/python2.7/posixpath.<wbr>*
              ${libdir}/python2.7/struct.*
              ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.*
              ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.*
              ${libdir}/python2.7/UserList.* ${libdir}/python2.7/<wbr>UserString.*
              ${libdir}/python2.7/lib-<wbr>dynload/binascii.so
              ${libdir}/python2.7/lib-<wbr>dynload/_struct.so
              ${libdir}/python2.7/lib-<wbr>dynload/time.so
              ${libdir}/python2.7/lib-<wbr>dynload/xreadlines.so
              ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.*
              ${bindir}/python* ${libdir}/python2.7/_<wbr>weakrefset.*
              ${libdir}/python2.7/sysconfig.<wbr>* ${libdir}/python2.7/_<wbr>sysconfigdata.*
              ${includedir}/python${P<br>
               YTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py
              "<br>
              <br>
               SUMMARY_${PN}-crypt="Python basic cryptographic and
              hashing support"<br>
               RDEPENDS_${PN}-crypt="${PN}-<wbr>core"<br>
              @@ -74,7 +74,7 @@ FILES_${PN}-debugger="${<wbr>libdir}/python2.7/bdb.*
              ${libdir}/python2.7/pdb.* "<br>
              <br>
               SUMMARY_${PN}-dev="Python development package"<br>
               RDEPENDS_${PN}-dev="${PN}-<wbr>core"<br>
              -FILES_${PN}-dev="${<wbr>includedir}
              ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a
              ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
              ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
              "<br>
              +FILES_${PN}-dev="${<wbr>includedir}
              ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a
              ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
              ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
              ${libdir}/python2.7/config/<wbr>Makefile "<br>
              <br>
               SUMMARY_${PN}-difflib="Python helpers for computing
              deltas between objects"<br>
               RDEPENDS_${PN}-difflib="${PN}-<wbr>lang ${PN}-re"<br>
              diff --git a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc
              b/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
              index 55bcc4b..b78158e 100644<br>
              --- a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
              +++ b/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
              @@ -38,7 +38,7 @@ FILES_${PN}-compression="${<wbr>libdir}/python3.5/gzip.*
              ${libdir}/python3.5/__pycach<br>
              <br>
               SUMMARY_${PN}-core="Python interpreter and core modules"<br>
               RDEPENDS_${PN}-core="${PN}-<wbr>lang ${PN}-re
              ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"<br>
              -FILES_${PN}-core="${libdir}/<wbr>python3.5/__future__.*
              ${libdir}/python3.5/__pycache_<wbr>_/__future__.*
              ${libdir}/python3.5/_abcoll.*
              ${libdir}/python3.5/__pycache_<wbr>_/_abcoll.*
              ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache_<wbr>_/abc.*
              ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache_<wbr>_/ast.*
              ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache_<wbr>_/copy.*
              ${libdir}/python3.5/copyreg.*
              ${libdir}/python3.5/__pycache_<wbr>_/copyreg.*
              ${libdir}/python3.5/<wbr>configparser.*
              ${libdir}/python3.5/__pycache_<wbr>_/configparser.*
              ${libdir}/python3.5/<wbr>genericpath.*
              ${libdir}/python3.5/__pycache_<wbr>_/genericpath.*
              ${libdir}/python3.5/getopt.*
              ${libdir}/python3.5/__pycache_<wbr>_/getopt.*
              ${libdir}/python3.5/linecache.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/linecache.*
              ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache_<wbr>_/new.*
              ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache_<wbr>_/os.*
              ${libdir}/python3.5/posixpath.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/posixpath.*
              ${libdir}/python3.5/struct.* ${libdir}/python<br>
               3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
              ${libdir}/python3.5/__pycache_<wbr>_/warnings.*
              ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache_<wbr>_/site.*
              ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache_<wbr>_/stat.*
              ${libdir}/python3.5/UserDict.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserDict.*
              ${libdir}/python3.5/UserList.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserList.*
              ${libdir}/python3.5/<wbr>UserString.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserString.*
              ${libdir}/python3.5/lib-<wbr>dynload/binascii.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/binascii.*<wbr>.so
              ${libdir}/python3.5/lib-<wbr>dynload/_struct.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/_struct.*.<wbr>so
              ${libdir}/python3.5/lib-<wbr>dynload/time.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/time.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/xreadlines.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/<wbr>xreadlines.*.so
              ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache_<wbr>_/types.*
              ${libdir}/python3.5/platform.* ${libdir}/python3.5/__p<br>
               ycache__/platform.* ${bindir}/python*
              ${libdir}/python3.5/_<wbr>weakrefset.*
              ${libdir}/python3.5/__pycache_<wbr>_/_weakrefset.*
              ${libdir}/python3.5/sysconfig.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/sysconfig.*
              ${libdir}/python3.5/_<wbr>sysconfigdata.*
              ${libdir}/python3.5/__pycache_<wbr>_/_sysconfigdata.*
              ${libdir}/python3.5/config/<wbr>Makefile
              ${libdir}/python3.5/config/<wbr>Makefile/__pycache__
              ${includedir}/python${PYTHON_<wbr>BINABI}/pyconfig*.h
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/collections
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/_collections_abc.*
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/_sitebuiltins.*
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py "<br>
              +FILES_${PN}-core="${libdir}/<wbr>python3.5/__future__.*
              ${libdir}/python3.5/__pycache_<wbr>_/__future__.*
              ${libdir}/python3.5/_abcoll.*
              ${libdir}/python3.5/__pycache_<wbr>_/_abcoll.*
              ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache_<wbr>_/abc.*
              ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache_<wbr>_/ast.*
              ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache_<wbr>_/copy.*
              ${libdir}/python3.5/copyreg.*
              ${libdir}/python3.5/__pycache_<wbr>_/copyreg.*
              ${libdir}/python3.5/<wbr>configparser.*
              ${libdir}/python3.5/__pycache_<wbr>_/configparser.*
              ${libdir}/python3.5/<wbr>genericpath.*
              ${libdir}/python3.5/__pycache_<wbr>_/genericpath.*
              ${libdir}/python3.5/getopt.*
              ${libdir}/python3.5/__pycache_<wbr>_/getopt.*
              ${libdir}/python3.5/linecache.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/linecache.*
              ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache_<wbr>_/new.*
              ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache_<wbr>_/os.*
              ${libdir}/python3.5/posixpath.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/posixpath.*
              ${libdir}/python3.5/struct.* ${libdir}/python<br>
               3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.*
              ${libdir}/python3.5/__pycache_<wbr>_/warnings.*
              ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache_<wbr>_/site.*
              ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache_<wbr>_/stat.*
              ${libdir}/python3.5/UserDict.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserDict.*
              ${libdir}/python3.5/UserList.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserList.*
              ${libdir}/python3.5/<wbr>UserString.*
              ${libdir}/python3.5/__pycache_<wbr>_/UserString.*
              ${libdir}/python3.5/lib-<wbr>dynload/binascii.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/binascii.*<wbr>.so
              ${libdir}/python3.5/lib-<wbr>dynload/_struct.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/_struct.*.<wbr>so
              ${libdir}/python3.5/lib-<wbr>dynload/time.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/time.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/xreadlines.*.so
              ${libdir}/python3.5/lib-<wbr>dynload/__pycache__/<wbr>xreadlines.*.so
              ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache_<wbr>_/types.*
              ${libdir}/python3.5/platform.* ${libdir}/python3.5/__p<br>
               ycache__/platform.* ${bindir}/python*
              ${libdir}/python3.5/_<wbr>weakrefset.*
              ${libdir}/python3.5/__pycache_<wbr>_/_weakrefset.*
              ${libdir}/python3.5/sysconfig.<wbr>*
              ${libdir}/python3.5/__pycache_<wbr>_/sysconfig.*
              ${libdir}/python3.5/_<wbr>sysconfigdata.*
              ${libdir}/python3.5/__pycache_<wbr>_/_sysconfigdata.*
              ${libdir}/python3.5/config/<wbr>Makefile/__pycache__
              ${includedir}/python${PYTHON_<wbr>BINABI}/pyconfig*.h
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/collections
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/_collections_abc.*
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/_sitebuiltins.*
              ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py "<br>
              <br>
               SUMMARY_${PN}-crypt="Python basic cryptographic and
              hashing support"<br>
               RDEPENDS_${PN}-crypt="${PN}-<wbr>core"<br>
              @@ -66,7 +66,7 @@ FILES_${PN}-debugger="${<wbr>libdir}/python3.5/bdb.*
              ${libdir}/python3.5/__pycache_<wbr>_/<br>
              <br>
               SUMMARY_${PN}-dev="Python development package"<br>
               RDEPENDS_${PN}-dev="${PN}-<wbr>core"<br>
              -FILES_${PN}-dev="${<wbr>includedir}
              ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a
              ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
              ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
              "<br>
              +FILES_${PN}-dev="${<wbr>includedir}
              ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a
              ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a
              ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig
              ${libdir}/python3.5/config/<wbr>Makefile "<br>
              <br>
               SUMMARY_${PN}-difflib="Python helpers for computing
              deltas between objects"<br>
               RDEPENDS_${PN}-difflib="${PN}-<wbr>lang ${PN}-re"<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------95D4AD040705972A1DB6C5F1--

--------------9634A1BC9C51588B3064B34A
Content-Type: text/x-diff;
	name="0001-python2-3-Move-config-Makefile-from-core-package-to-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0001-python2-3-Move-config-Makefile-from-core-package-to-.pa";
	filename*1="tch"

From d8cd3fdc1ecace00d1de113ee0f3cd1901538c05 Mon Sep 17 00:00:00 2001
From: Li Zhou <li.zhou@windriver.com>
Date: Mon, 10 Apr 2017 02:08:19 -0700
Subject: [PATCH] python2/3: Move config/Makefile from core package to dev
 package

Move config/Makefile in libdir from core package to dev package for
python, because it is only needed in development process.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 4 ++--
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 scripts/contrib/python/generate-manifest-2.7.py      | 5 +++--
 scripts/contrib/python/generate-manifest-3.5.py      | 5 +++--
 4 files changed, 10 insertions(+), 8 deletions(-)

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
index 55bcc4b6da..be61519053 100644
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
nfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/pytho=
n${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections=
_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${P=
YTHON_MAJMIN}/sitecustomize.py "
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
fig/Makefile ${libdir}/python3.5/config/Makefile/__pycache__ "
=20
 SUMMARY_${PN}-difflib=3D"Python helpers for computing deltas between objec=
ts"
 RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/cont=
rib/python/generate-manifest-2.7.py
index 5504b62271..8c3655d395 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -193,7 +193,7 @@ if __name__ =3D=3D "__main__":
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " =
+
     "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  +
-    "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
+    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
=20
@@ -207,7 +207,8 @@ if __name__ =3D=3D "__main__":
     "${base_libdir}/*.a " +
     "${base_libdir}/*.o " +
     "${datadir}/aclocal " +
-    "${datadir}/pkgconfig " )
+    "${datadir}/pkgconfig " +
+    "config/Makefile ")
=20
     m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code trans=
lator", "${PN}-core",
     "${bindir}/2to3 lib2to3" ) # package
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/cont=
rib/python/generate-manifest-3.5.py
index 386bdfcefd..5725c6da59 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -206,7 +206,7 @@ if __name__ =3D=3D "__main__":
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*=
.so " +
     "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  +=
=20
-    "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
+    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
     "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
@@ -223,7 +223,8 @@ if __name__ =3D=3D "__main__":
     "${base_libdir}/*.a " +
     "${base_libdir}/*.o " +
     "${datadir}/aclocal " +
-    "${datadir}/pkgconfig " )
+    "${datadir}/pkgconfig " +
+    "config/Makefile ")
=20
     m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code trans=
lator", "${PN}-core",
     "lib2to3" ) # package
--=20
2.11.0


--------------9634A1BC9C51588B3064B34A--
