Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F34C73FFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 22:30:11 +0000 (UTC)
Received: by wizk4 with SMTP id k4so173800561wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=a63trg5mDSxZkGynFV0YeHbEpUM5OqnOw326NIGc5Ss=;
	b=TgWubzMXY9nZ9kl/sZBNVzaftYF6cfPgjcdYOknynOacNhUfkeiT4l33Nw7jU/I3eO
	/NIqD+NEY6T7awy9qX2qC7UmQP3UPL4R6mXhVZr4OtbV6M/GV9zWsMzjYxDJ/0Wx7GBL
	ar2c78tu1b2A6KggZfp1yiF/REBxiZ3FKIcA0ts1WgQu/k/+CPgKLhrixV99sGLiu8NL
	Oo6QoCVOmwweVPq6k5ieprj3sD3nqce/cq+A2k2EI30mNXRddiguHqNLF6dWcSpY3wqo
	6RhYk/gQAbdcS2mHDWFTwmPZ1qchdGVjVCmzSWyB4GtCzkM71YtMj5509mR0yH4s+QOM
	U+XQ==
X-Received: by 10.194.171.1 with SMTP id aq1mr2953886wjc.38.1431469812805;
	Tue, 12 May 2015 15:30:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	j12sm29795841wjn.48.2015.05.12.15.30.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 15:30:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 May 2015 00:30:17 +0200
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20150512223017.GG2714@jama>
References: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>
	<62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.4.2 to 3.4.3
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
X-List-Received-Date: Tue, 12 May 2015 22:30:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 03:09:50PM +0000, Alejandro Hernandez wrote:
> Modifies:
> python3-native_3.4.2.bb -> python3-native_3.4.3.bb: Updates checksums, LI=
CENSE did not change,
> dates were updated.
> python3_3.4.2.bb -> python3_3.4.3.bb: Updates checksums, LICENSE did not =
change,
> dates were updated.
> generate-manifest-3.4.py: fixes asyncio and net-tools.
> python-3.4-manifest.inc: fixes asyncio and net-tools.
> This upgrade contains a fix for CVE-2014-9365.

There is still that textrel issue I've reported earlier:
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-audio/usr/lib/python=
3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textr=
el]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-codecs/usr/lib/pytho=
n3.4/lib-dynload/_codecs_cn.cpython-34m.so' has relocations in .text [textr=
el]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-core/usr/lib/python3=
=2E4/lib-dynload/binascii.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-crypt/usr/lib/python=
3.4/lib-dynload/_sha256.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-ctypes/usr/lib/pytho=
n3.4/lib-dynload/_ctypes.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-curses/usr/lib/pytho=
n3.4/lib-dynload/_curses.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-elementtree/usr/lib/=
python3.4/lib-dynload/_elementtree.cpython-34m.so' has relocations in .text=
 [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-fcntl/usr/lib/python=
3.4/lib-dynload/fcntl.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-gdbm/usr/lib/python3=
=2E4/lib-dynload/_gdbm.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-io/usr/lib/python3.4=
/lib-dynload/_socket.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-json/usr/lib/python3=
=2E4/lib-dynload/_json.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-lang/usr/lib/python3=
=2E4/lib-dynload/_bisect.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-math/usr/lib/python3=
=2E4/lib-dynload/cmath.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-mmap/usr/lib/python3=
=2E4/lib-dynload/mmap.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-multiprocessing/usr/=
lib/python3.4/lib-dynload/_multiprocessing.cpython-34m.so' has relocations =
in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-profile/usr/lib/pyth=
on3.4/lib-dynload/_lsprof.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-readline/usr/lib/pyt=
hon3.4/lib-dynload/readline.cpython-34m.so' has relocations in .text [textr=
el]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-resource/usr/lib/pyt=
hon3.4/lib-dynload/resource.cpython-34m.so' has relocations in .text [textr=
el]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-syslog/usr/lib/pytho=
n3.4/lib-dynload/syslog.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-textutils/usr/lib/py=
thon3.4/lib-dynload/_csv.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-unixadmin/usr/lib/py=
thon3.4/lib-dynload/grp.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-xml/usr/lib/python3.=
4/lib-dynload/pyexpat.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-misc/usr/lib/python3=
=2E4/lib-dynload/_bz2.cpython-34m.so' has relocations in .text [textrel]

IIRC you've already sent some patch to fix it, do you know what's the statu=
s of it, if it was applied or not (why?)?

Thanks

>=20
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-3.4-manifest.inc         | 12 ++++++=
++----
>  .../{python3-native_3.4.2.bb =3D> python3-native_3.4.3.bb}     |  7 +++-=
---
>  .../python/{python3_3.4.2.bb =3D> python3_3.4.3.bb}            |  6 +++-=
--
>  scripts/contrib/python/generate-manifest-3.4.py              |  5 ++++-
>  4 files changed, 18 insertions(+), 12 deletions(-)
>  rename meta/recipes-devtools/python/{python3-native_3.4.2.bb =3D> python=
3-native_3.4.3.bb} (89%)
>  rename meta/recipes-devtools/python/{python3_3.4.2.bb =3D> python3_3.4.3=
=2Ebb} (97%)
>=20
> diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/=
recipes-devtools/python/python-3.4-manifest.inc
> index f051373..28885a9 100644
> --- a/meta/recipes-devtools/python/python-3.4-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
> @@ -5,14 +5,18 @@
> =20
>  =20
> =20
> -PROVIDES+=3D"${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-com=
pression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${=
PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distuti=
ls-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-=
gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json =
${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${P=
N}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pick=
le ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-read=
line ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd=
 ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-s=
yslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkin=
ter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
> +PROVIDES+=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-com=
pile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${P=
N}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils=
 ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN=
}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-=
io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime =
${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numb=
ers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}=
-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-she=
ll ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subp=
rocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-thread=
ing ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
> =20
> -PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile =
${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-da=
tetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-stat=
icdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcn=
tl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${=
PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}=
-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers $=
{PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re $=
{PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${=
PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subproces=
s ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading $=
{PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-mo=
dules"
> +PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs =
${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-c=
urses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-=
distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-e=
mail ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importl=
ib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${=
PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver $=
{PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-py=
doc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser =
${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold $=
{PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${P=
N}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-x=
mlrpc ${PN}-modules"
> =20
>  SUMMARY_${PN}-2to3=3D"Python automated Python 2 to 3 code translator"
>  RDEPENDS_${PN}-2to3=3D"${PN}-core"
>  FILES_${PN}-2to3=3D"${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
> =20
> +SUMMARY_${PN}-asyncio=3D"Python Asynchronous I/O, event loop, coroutines=
 and tasks"
> +RDEPENDS_${PN}-asyncio=3D"${PN}-core"
> +FILES_${PN}-asyncio=3D"${libdir}/python3.4/asyncio "
> +
>  SUMMARY_${PN}-audio=3D"Python Audio Handling"
>  RDEPENDS_${PN}-audio=3D"${PN}-core"
>  FILES_${PN}-audio=3D"${libdir}/python3.4/wave.* ${libdir}/python3.4/chun=
k.* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiode=
v.*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/aud=
iodev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir=
}/python3.4/toaiff.* "
> @@ -147,7 +151,7 @@ FILES_${PN}-multiprocessing=3D"${libdir}/python3.4/li=
b-dynload/_multiprocessing.*.
> =20
>  SUMMARY_${PN}-netclient=3D"Python Internet Protocol clients"
>  RDEPENDS_${PN}-netclient=3D"${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-=
io ${PN}-lang ${PN}-logging ${PN}-mime"
> -FILES_${PN}-netclient=3D"${libdir}/python3.4/*Cookie*.* ${libdir}/python=
3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* $=
{libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3=
=2E4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.=
* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/pyth=
on3.4/telnetlib.* ${libdir}/python3.4/urllib.* ${libdir}/python3.4/urllib2.=
* ${libdir}/python3.4/urlparse.* ${libdir}/python3.4/uuid.* ${libdir}/pytho=
n3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
> +FILES_${PN}-netclient=3D"${libdir}/python3.4/*Cookie*.* ${libdir}/python=
3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* $=
{libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3=
=2E4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.=
* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/pyth=
on3.4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${l=
ibdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
> =20
>  SUMMARY_${PN}-netserver=3D"Python Internet Protocol servers"
>  RDEPENDS_${PN}-netserver=3D"${PN}-core ${PN}-netclient"
> @@ -262,7 +266,7 @@ RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml ${PN}-n=
etserver ${PN}-lang"
>  FILES_${PN}-xmlrpc=3D"${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.=
4/SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/pyth=
on3.4/xmlrpc "
> =20
>  SUMMARY_${PN}-modules=3D"All Python modules"
> -RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-comp=
ile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN=
}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doct=
est ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-i=
dle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-loggin=
g ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN=
}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-=
pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN=
}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sq=
lite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${=
PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN=
}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
> +RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-cod=
ecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${P=
N}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distut=
ils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN=
}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lan=
g ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multip=
rocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-=
pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN=
}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sq=
lite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${P=
N}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}=
-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
>  ALLOW_EMPTY_${PN}-modules =3D "1"
> =20
> =20
> diff --git a/meta/recipes-devtools/python/python3-native_3.4.2.bb b/meta/=
recipes-devtools/python/python3-native_3.4.3.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python3-native_3.4.2.bb
> rename to meta/recipes-devtools/python/python3-native_3.4.3.bb
> index 463957f..464ff05 100644
> --- a/meta/recipes-devtools/python/python3-native_3.4.2.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
> @@ -26,12 +26,11 @@ file://makerace.patch \
>  ${DISTRO_SRC_URI} \
>  file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>  file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -file://pip_build_directory_unclean.patch \
>  "
> -SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
> -SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827=
e0f970dcf04b2def"
> +SRC_URI[md5sum] =3D "7d092d1bba6e17f0d9bd21b49e441dd5"
> +SRC_URI[sha256sum] =3D "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d39=
9ec06b043ea996b8"
> =20
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed=
72f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddd98d01d471fac8d8dbdd975229db=
a03"
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> diff --git a/meta/recipes-devtools/python/python3_3.4.2.bb b/meta/recipes=
-devtools/python/python3_3.4.3.bb
> similarity index 97%
> rename from meta/recipes-devtools/python/python3_3.4.2.bb
> rename to meta/recipes-devtools/python/python3_3.4.3.bb
> index 0350de6..bee9e6f 100644
> --- a/meta/recipes-devtools/python/python3_3.4.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.4.3.bb
> @@ -38,10 +38,10 @@ SRC_URI +=3D "\
>              file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>              file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>             "
> -SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
> -SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827=
e0f970dcf04b2def"
> +SRC_URI[md5sum] =3D "7d092d1bba6e17f0d9bd21b49e441dd5"
> +SRC_URI[sha256sum] =3D "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d39=
9ec06b043ea996b8"
> =20
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed=
72f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddd98d01d471fac8d8dbdd975229db=
a03"
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/co=
ntrib/python/generate-manifest-3.4.py
> index 5335308..84da574 100755
> --- a/scripts/contrib/python/generate-manifest-3.4.py
> +++ b/scripts/contrib/python/generate-manifest-3.4.py
> @@ -208,6 +208,9 @@ if __name__ =3D=3D "__main__":
>      m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
>      "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/au=
dioop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
> =20
> +    m.addPackage( "${PN}-asyncio", "Python Asynchronous I/O, event loop,=
 coroutines and tasks", "${PN}-core",
> +    "asyncio" )
> +
>      m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n suppo=
rt", "${PN}-core ${PN}-lang",
>      "codecs.* encodings gettext.* locale.* lib-dynload/_locale.*.so lib-=
dynload/_codecs* lib-dynload/_multibytecodec.*.so lib-dynload/unicodedata.*=
=2Eso stringprep.* xdrlib.*" )
> =20
> @@ -305,7 +308,7 @@ if __name__ =3D=3D "__main__":
> =20
>      m.addPackage( "${PN}-netclient", "Python Internet Protocol clients",=
 "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging $=
{PN}-mime",
>      "*Cookie*.* " +
> -    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetype=
s.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* =
uuid.* rfc822.* mimetools.*" )
> +    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetype=
s.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimeto=
ols.*" )
> =20
>      m.addPackage( "${PN}-netserver", "Python Internet Protocol servers",=
 "${PN}-core ${PN}-netclient",
>      "cgi.* *HTTPServer.* SocketServer.*" )
> --=20
> 1.8.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

