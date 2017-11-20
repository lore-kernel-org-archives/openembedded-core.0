Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3300F785CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 23:36:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 15:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="4588786"
Received: from ttorling-mac01.jf.intel.com ([10.24.15.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2017 15:36:02 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <e0a3d0a0c3dbadf7417fd7a869ad89d38419d3b6.1511179969.git.markus.lehtonen@linux.intel.com>
Date: Mon, 20 Nov 2017 15:36:03 -0800
Message-Id: <72AF555C-6900-4B55-BFC1-BD8B5BD147AB@linux.intel.com>
References: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
	<cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<cover.1511179969.git.markus.lehtonen@linux.intel.com>
	<e0a3d0a0c3dbadf7417fd7a869ad89d38419d3b6.1511179969.git.markus.lehtonen@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 14/15] python3: add python3-tools subpackage
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
X-List-Received-Date: Mon, 20 Nov 2017 23:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The top of the manifest file says that it is auto generated [1], this =
change must also be done in =
scripts/contrib/python/generate-manifest-3.5.py [2]:

[1] =
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/p=
ython/python-3.5-manifest.inc#n1
[2] =
http://git.openembedded.org/openembedded-core/tree/scripts/contrib/python/=
generate-manifest-3.5.py

Nacked-by: Tim Orling <timothy.t.orling@linux.intel.com>

> On Nov 20, 2017, at 4:15 AM, Markus Lehtonen =
<markus.lehtonen@linux.intel.com> wrote:
>=20
> Useful in developing Python, e.g. in benchmarking.
>=20
> [YOCTO #9338]
>=20
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
> meta/recipes-devtools/python/python-3.5-manifest.inc | 8 +++++---
> meta/recipes-devtools/python/python3_3.5.3.bb        | 5 +++++
> 2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc =
b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 067f6c58c5..3107d48f7e 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -4,9 +4,9 @@
>=20
>=20
>=20
> -PROVIDES+=3D"${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev =
${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html =
${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang =
${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors =
${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests =
${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests =
${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing =
${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
> +PROVIDES+=3D"${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio =
${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt =
${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger =
${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev =
${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html =
${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang =
${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap =
${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers =
${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc =
${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors =
${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests =
${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests =
${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing =
${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-tools "
>=20
> -PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio =
${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core =
${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db =
${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev =
${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl =
${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io =
${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime =
${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver =
${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile =
${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource =
${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 =
${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog =
${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter =
${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc =
${PN}-modules"
> +PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio =
${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core =
${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db =
${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev =
${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl =
${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io =
${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime =
${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver =
${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile =
${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource =
${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 =
${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog =
${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter =
${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc =
${PN}-modules ${PN}-tools"
>=20
> SUMMARY_${PN}-2to3=3D"Python automated Python 2 to 3 code translator"
> RDEPENDS_${PN}-2to3=3D"${PN}-core"
> @@ -280,4 +280,6 @@ SUMMARY_${PN}-modules=3D"All Python modules"
> RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-argparse ${PN}-asyncio =
${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core =
${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db =
${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email =
${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image =
${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging =
${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing =
${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil =
${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline =
${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal =
${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold =
${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils =
${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest =
${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
> ALLOW_EMPTY_${PN}-modules =3D "1"
>=20
> -
> +SUMMARY_${PN}-tools=3D"Useful scripts from Python"
> +RDEPENDS_${PN}-tools=3D"${PN}-modules"
> +FILES_${PN}-tools=3D"${docdir}/${PN}/Tools"
> diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb =
b/meta/recipes-devtools/python/python3_3.5.3.bb
> index 16097e4236..7746ffe3b1 100644
> --- a/meta/recipes-devtools/python/python3_3.5.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.3.bb
> @@ -196,6 +196,11 @@ do_install() {
> 	fi
>=20
> 	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +
> +    # Install tools
> +    install -d -m 755 ${D}/${docdir}/${PN}
> +    cp -r ${S}/Tools ${D}/${docdir}/${PN}/
> +    find ${D}/${docdir}/${PN}/ -name Makefile -delete
> }
>=20
> do_install_append_class-nativesdk () {
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


