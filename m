Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id C5B0D767FE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 01:02:44 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so18239109pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Y9WJI6nIq+Dh9wFDtwlgDYMKoRP9Za4lk2c9PuaxUDU=;
	b=ampF3B4s1EpLo/O81ihzYEgPc4/CAJ13AwF/VvdAqVb8tSLZMVjjwloKE0mHLfZAH4
	yFuqToOB8Dzn3yEBNzU/zHwJ92sRR+TsvM9IUHgdn4C7OZZGvAJhKvpv/gLumwj7DVMK
	IyuMHhpb2I/5QVWONwj/YeC8cUoWQ4NtZlmCsQxi96hwqAq7A/AZPOeslhutiU/10k43
	QGBzz4TgF7WU8wrLah2HEr9el0UWr33Pd+S4ZacI68B0/6x/s+bH9ALzphxb+4sqTGAq
	fn4Yw91P3MYY+y/jxCiZThtFtTbT29g9RwgNd9KzEuWw17iosAtCqnkqz0XJ63lrksIk
	w2jA==
X-Received: by 10.70.103.70 with SMTP id fu6mr31065391pdb.22.1439082164667;
	Sat, 08 Aug 2015 18:02:44 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	xv1sm14818398pbb.25.2015.08.08.18.02.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 18:02:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1438095518-7513-3-git-send-email-dominic.sacre@gmx.de>
Date: Sat, 8 Aug 2015 18:02:39 -0700
Message-Id: <BC8B57D1-2220-435B-A2BA-6B0211E13907@gmail.com>
References: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
	<1438095518-7513-3-git-send-email-dominic.sacre@gmx.de>
To: =?utf-8?Q?Dominic_Sacr=C3=A9?= <dominic.sacre@gmx.de>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] python3: remove package python3-robotparser
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
X-List-Received-Date: Sun, 09 Aug 2015 01:02:45 -0000
X-Groupsio-MsgNum: 69163
Content-Type: multipart/signed;
	boundary="Apple-Mail=_72B46C9A-3321-44D1-911C-76F60BE089D2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_72B46C9A-3321-44D1-911C-76F60BE089D2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 28, 2015, at 7:58 AM, Dominic Sacr=C3=A9 <dominic.sacre@gmx.de> =
wrote:
>=20
> robotparser has been moved to urllib.robotparser in Python 3, and gets
> packaged as part of python3-netclient alongside the rest of urllib.
> This causes python3-modules to depend on an empty/missing
> python3-robotparser package.
>=20
> robotparser.py is relatively small and has no dependencies outside
> urllib, so it makes more sense to eliminate the python3-robotparser
> package than to alter the manifest for python3-netclient.
>=20
> Part of the fix for [YOCTO #8048].
>=20
> Signed-off-by: Dominic Sacr=C3=A9 <dominic.sacre@gmx.de>
> ---
> meta/recipes-devtools/python/python-3.4-manifest.inc | 10 +++-------
> scripts/contrib/python/generate-manifest-3.4.py      |  3 ---
> 2 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc =
b/meta/recipes-devtools/python/python-3.4-manifest.inc
> index 557acdf..77f0125 100644
> --- a/meta/recipes-devtools/python/python-3.4-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.4-manifest.inc

this file is auto generated. So did you regenerate it ?

> @@ -5,9 +5,9 @@
>=20
>=20
>=20
> -PROVIDES+=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs =
${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes =
${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev =
${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest =
${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html =
${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang =
${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser =
${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests =
${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests =
${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest =
${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
> +PROVIDES+=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs =
${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes =
${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev =
${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest =
${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html =
${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang =
${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell =
${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold =
${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils =
${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml =
${PN}-xmlrpc "
>=20
> -PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils =
${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm =
${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json =
${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser =
${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests =
${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests =
${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest =
${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
> +PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils =
${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm =
${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json =
${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell =
${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold =
${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils =
${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml =
${PN}-xmlrpc ${PN}-modules"
>=20
> SUMMARY_${PN}-2to3=3D"Python automated Python 2 to 3 code translator"
> RDEPENDS_${PN}-2to3=3D"${PN}-core"
> @@ -197,10 +197,6 @@ SUMMARY_${PN}-resource=3D"Python resource control =
interface"
> RDEPENDS_${PN}-resource=3D"${PN}-core"
> FILES_${PN}-resource=3D"${libdir}/python3.4/lib-dynload/resource.*.so =
"
>=20
> -SUMMARY_${PN}-robotparser=3D"Python robots.txt parser"
> -RDEPENDS_${PN}-robotparser=3D"${PN}-core ${PN}-netclient"
> -FILES_${PN}-robotparser=3D"${libdir}/python3.4/urllib/robotparser.* "
> -
> SUMMARY_${PN}-shell=3D"Python shell-like functionality"
> RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
> FILES_${PN}-shell=3D"${libdir}/python3.4/cmd.* =
${libdir}/python3.4/commands.* ${libdir}/python3.4/dircache.* =
${libdir}/python3.4/fnmatch.* ${libdir}/python3.4/glob.* =
${libdir}/python3.4/popen2.* ${libdir}/python3.4/shlex.* =
${libdir}/python3.4/shutil.* "
> @@ -266,7 +262,7 @@ RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml =
${PN}-netserver ${PN}-lang"
> FILES_${PN}-xmlrpc=3D"${libdir}/python3.4/xmlrpclib.* =
${libdir}/python3.4/SimpleXMLRPCServer.* =
${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/python3.4/xmlrpc "
>=20
> SUMMARY_${PN}-modules=3D"All Python modules"
> -RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree =
${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image =
${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging =
${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing =
${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil =
${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline =
${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd =
${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess =
${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading =
${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
> +RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree =
${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image =
${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging =
${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing =
${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil =
${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline =
${PN}-reprlib ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 =
${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog =
${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter =
${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
> ALLOW_EMPTY_${PN}-modules =3D "1"
>=20
>=20
> diff --git a/scripts/contrib/python/generate-manifest-3.4.py =
b/scripts/contrib/python/generate-manifest-3.4.py
> index 569fd3c..42c851c 100755
> --- a/scripts/contrib/python/generate-manifest-3.4.py
> +++ b/scripts/contrib/python/generate-manifest-3.4.py
> @@ -343,9 +343,6 @@ if __name__ =3D=3D "__main__":
>     m.addPackage( "${PN}-shell", "Python shell-like functionality", =
"${PN}-core ${PN}-re",
>     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* =
shutil.*" )
>=20
> -    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", =
"${PN}-core ${PN}-netclient",
> -    "urllib/robotparser.*")
> -
>     m.addPackage( "${PN}-subprocess", "Python subprocess support", =
"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
>     "subprocess.*" )
>=20
> --
> 2.4.6
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_72B46C9A-3321-44D1-911C-76F60BE089D2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGprIACgkQuwUzVZGdMxRcbQCdEy5wNP9o08rd/7BUV0IK7MB3
DBcAoI9D4ojiKGVl51uOpoCw5TdjNwCp
=SQ/S
-----END PGP SIGNATURE-----

--Apple-Mail=_72B46C9A-3321-44D1-911C-76F60BE089D2--
