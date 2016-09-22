Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D14660765
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 15:33:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n24so3953901pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Y1+Hu5dETfQSFEx4O8JrUnjvHr95NPmpN311/YKEc9s=;
	b=vTJ3rGOOFmSodeB50zaz3yLOlvXIRQa9rxZp7NSme2VNP7bGANhsmmZH0zG7+MWKPL
	u69+++oWmn9wAfyrvL5o9Id919NyH+sEP/UMWAORqaIpNVB7rp7a2BzaKhWWTIITkjh1
	X+8r7KEY6PEbvsQwxP77m96WPeUCo09ZuAkV/YpIPfJcWIrPkG6QlZLYQSLpk106vT5j
	dvug+EtrAqbLjTxL9OEGH09L22WP48XvbbjuEG6RLwhC7EjMJa7IKN4lGWGrNB4ucLMA
	kHdiGeA4mfggoioUYGcvrm8Wt9LVH4uMv/dgWlCTSigi/tFSiSA/7Jna1kaBC+LXXsGa
	Cdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Y1+Hu5dETfQSFEx4O8JrUnjvHr95NPmpN311/YKEc9s=;
	b=UVpN41f6asV5r3XiYXGa7BOxhVcgeAlcrB3iHNV2wp+ebqLq2t/vQWkWfRdZXujror
	A8bPjq/6208Pynts0mL+6efNglMNmEFubPjjg76CPTCavFm9HbiYgbNi1zCX3jxGnP7/
	FsiQiRJ6zGnWZ4AcaAUOvdGKjjSASLxck51VjEW2iso8fDp9uGw2ZJ2Uo5KHQzoY6Glx
	LhXTNiHIIhruzcTgBZOECg504BmsJE/6P6E+C8ak9c4P7w0rWGraUP5WrKvFcpmshS5v
	OwKYk+ca+8d6Tfvp5qIo/5dTGV5W4FFWlG4mxEfUNZ1dN/wFaXCWayevmL4zJK8Q7u8w
	zx+Q==
X-Gm-Message-State: AE9vXwNEuEuxwuoS2O0Z3BJJ2k3hRwn+ODmMxS7QTiq/UgcWUFIR3MW7xLsKiFwNewhLnw==
X-Received: by 10.98.197.1 with SMTP id j1mr4366786pfg.77.1474558395996;
	Thu, 22 Sep 2016 08:33:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c1fa:d80c:b211:8746?
	([2601:202:4001:9ea0:c1fa:d80c:b211:8746])
	by smtp.gmail.com with ESMTPSA id t5sm5054353pfi.26.2016.09.22.08.33.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 08:33:14 -0700 (PDT)
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
Date: Thu, 22 Sep 2016 08:33:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
Cc: akuster@mvista.com
Subject: Re: [PATCH] [krogoth] Fixes several python3 dependencies
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
X-List-Received-Date: Thu, 22 Sep 2016 15:33:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Alejandro,


On 09/21/2016 02:10 PM, Alejandro Hernandez wrote:
> This patch adds the packages python3-signal, python3-enum and python3-s=
electors,
> while it also fixes python3-subprocess, this fixes the installation of =
python3-modules

I can not get this to apply to my krogoth-next nor krogoth in Poky. Can=20
you double check and let me know if I am doing something wrong or need=20
any dependency changes?

error pw is showing is:
fatal: patch fragment without header at line 29: @@ -89,6 +89,10 @@=20
SUMMARY_${PN}-email=3D"Python email support"

- armin

> [YOCTO #10276]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com=
>
> ---
>   meta/recipes-devtools/python/python-3.5-manifest.inc | 18 +++++++++++=
++++---
>   scripts/contrib/python/generate-manifest-3.5.py      | 11 ++++++++++-=

>   2 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/met=
a/recipes-devtools/python/python-3.5-manifest.inc
> index bce9ce1..0ad9186 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -1,6 +1,6 @@
>  =20
>   # WARNING: This file is AUTO GENERATED: Manual edits will be lost nex=
t time I regenerate the file.
> -# Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py=
' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-m=
edia.de>
> +# Generator: './generate-manifest-3.5.py' Version 20140131 (C) 2002-20=
10 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
>   # Visit the Python for Embedded Systems Site =3D> http://www.Vanille.=
de/projects/python.spy
>  =20
>   =20
> @@ -39,7 +39,7 @@ FILES_${PN}-compression=3D"${libdir}/python3.5/gzip.*=
 ${libdir}/python3.5/zipfile.
>  =20
>   SUMMARY_${PN}-core=3D"Python interpreter and core modules"
>   RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs=
 ${PN}-io ${PN}-math"
> -FILES_${PN}-core=3D"${libdir}/python3.5/__future__.* ${libdir}/python3=
=2E5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libd=
ir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/co=
nfigparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt=
=2E* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/=
python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct=
=2E* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/=
python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserL=
ist.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/bi=
nascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python=
3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so=
 ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/pyt=
hon* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${=
libdir}/python3.5/_sysconfigdata.* ${libdir}/python
>   3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h =
${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJ=
MIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* =
${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
> +FILES_${PN}-core=3D"${libdir}/python3.5/__future__.* ${libdir}/python3=
=2E5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libd=
ir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/Co=
nfigParser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt=
=2E* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/=
python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct=
=2E* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/=
python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserL=
ist.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/bi=
nascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python=
3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so=
 ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/pyt=
hon* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${=
libdir}/python3.5/_sysconfigdata.* ${libdir}/python
>   3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h =
${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJ=
MIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* =
${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>  =20
>   SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support=
"
>   RDEPENDS_${PN}-crypt=3D"${PN}-core"
> @@ -89,6 +89,10 @@ SUMMARY_${PN}-email=3D"Python email support"
>   RDEPENDS_${PN}-email=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}=
-audio ${PN}-image ${PN}-netclient"
>   FILES_${PN}-email=3D"${libdir}/python3.5/imaplib.* ${libdir}/python3.=
5/email "
>  =20
> +SUMMARY_${PN}-enum=3D"Python support for enumerations"
> +RDEPENDS_${PN}-enum=3D"${PN}-core"
> +FILES_${PN}-enum=3D"${libdir}/python3.5/enum.* "
> +
>   SUMMARY_${PN}-fcntl=3D"Python's fcntl interface"
>   RDEPENDS_${PN}-fcntl=3D"${PN}-core"
>   FILES_${PN}-fcntl=3D"${libdir}/python3.5/lib-dynload/fcntl.*.so "
> @@ -197,10 +201,18 @@ SUMMARY_${PN}-resource=3D"Python resource control=
 interface"
>   RDEPENDS_${PN}-resource=3D"${PN}-core"
>   FILES_${PN}-resource=3D"${libdir}/python3.5/lib-dynload/resource.*.so=
 "
>  =20
> +SUMMARY_${PN}-selectors=3D"Python High-level I/O multiplexing"
> +RDEPENDS_${PN}-selectors=3D"${PN}-core"
> +FILES_${PN}-selectors=3D"${libdir}/python3.5/selectors.* "
> +
>   SUMMARY_${PN}-shell=3D"Python shell-like functionality"
>   RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
>   FILES_${PN}-shell=3D"${libdir}/python3.5/cmd.* ${libdir}/python3.5/co=
mmands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${l=
ibdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/=
shlex.* ${libdir}/python3.5/shutil.* "
>  =20
> +SUMMARY_${PN}-signal=3D"Python set handlers for asynchronous events su=
pport"
> +RDEPENDS_${PN}-signal=3D"${PN}-core"
> +FILES_${PN}-signal=3D"${libdir}/python3.5/signal.* "
> +
>   SUMMARY_${PN}-smtpd=3D"Python Simple Mail Transport Daemon"
>   RDEPENDS_${PN}-smtpd=3D"${PN}-core ${PN}-netserver ${PN}-email ${PN}-=
mime"
>   FILES_${PN}-smtpd=3D"${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* "
> @@ -218,7 +230,7 @@ RDEPENDS_${PN}-stringold=3D"${PN}-core ${PN}-re"
>   FILES_${PN}-stringold=3D"${libdir}/python3.5/lib-dynload/strop.*.so $=
{libdir}/python3.5/string.* ${libdir}/python3.5/stringold.* "
>  =20
>   SUMMARY_${PN}-subprocess=3D"Python subprocess support"
> -RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl =
${PN}-pickle"
> +RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl =
${PN}-pickle ${PN}-signal ${PN}-selectors"
>   FILES_${PN}-subprocess=3D"${libdir}/python3.5/subprocess.* "
>  =20
>   SUMMARY_${PN}-syslog=3D"Python syslog interface"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/=
contrib/python/generate-manifest-3.5.py
> index b90a84f..eac493a 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -259,6 +259,9 @@ if __name__ =3D=3D "__main__":
>       m.addPackage( "${PN}-email", "Python email support", "${PN}-core =
${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
>       "imaplib.* email" ) # package
>  =20
> +    m.addPackage( "${PN}-enum", "Python support for enumerations", "${=
PN}-core",
> +    "enum.*" )
> +
>       m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-c=
ore",
>       "lib-dynload/fcntl.*.so" )
>  =20
> @@ -339,12 +342,18 @@ if __name__ =3D=3D "__main__":
>       m.addPackage( "${PN}-resource", "Python resource control interfac=
e", "${PN}-core",
>       "lib-dynload/resource.*.so" )
>  =20
> +    m.addPackage( "${PN}-selectors", "Python High-level I/O multiplexi=
ng", "${PN}-core",
> +    "selectors.*" )
> +
>       m.addPackage( "${PN}-shell", "Python shell-like functionality", "=
${PN}-core ${PN}-re",
>       "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* sh=
util.*" )
>  =20
> -    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${=
PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
> +    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${=
PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-se=
lectors",
>       "subprocess.*" )
>  =20
> +    m.addPackage( "${PN}-signal", "Python set handlers for asynchronou=
s events support", "${PN}-core",
> +    "signal.*" )
> +
>       m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support",=
 "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threadi=
ng",
>       "lib-dynload/_sqlite3.*.so sqlite3/dbapi2.* sqlite3/__init__.* sq=
lite3/dump.*" )
>  =20



