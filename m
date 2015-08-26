Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id F385471633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 01:51:27 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so51840600pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 18:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=fb6Ao3jFIg6nuxKX+xwAbWrxbrxFLUd40JATZ6/Ht/A=;
	b=TqJMtwcsTe7GKnPecgl4BScknJeTx0PAV3yJzhMwoWnsm7QsqbzcRcnLkYMGt5tDnK
	IehmWG21M1QNuw3RC+ARzdwg8/JRjUeQLHdjVDZu7cOQ5ssS7j8lXCp6tqdk1OX9hOzJ
	c8yX+Qla6EJuxm+8YBNx72/+JWHQunGm46G0StfkjG2VoctN4qQ07+2uihcBboQKr8Pm
	k/zXULc7yQTSrgtx3GrasooP/h/VmAL3i3OagLgTQ+llm4BaaXNK40CgSkr9TkbmOSmw
	xNTFTpwu3MLHdnOHtjia0/aPcgkR7k8nmQDv8JLRC1wpP7/7Sh9X3vGwuibIQ12uPS17
	5TWw==
X-Received: by 10.69.26.196 with SMTP id ja4mr62351236pbd.121.1440553887898;
	Tue, 25 Aug 2015 18:51:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:154a:7662:3b48:ac9?
	([2601:646:8601:4580:154a:7662:3b48:ac9])
	by smtp.gmail.com with ESMTPSA id
	ye2sm21230686pab.31.2015.08.25.18.51.27
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 18:51:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55DD1A7E.6080802@windriver.com>
Date: Tue, 25 Aug 2015 18:51:21 -0700
Message-Id: <D5BE9B70-DA12-4158-A179-7A5141AE4E11@gmail.com>
References: <1440553256-9914-1-git-send-email-raj.khem@gmail.com>
	<55DD1A7E.6080802@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 15/16] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Wed, 26 Aug 2015 01:51:28 -0000
X-Groupsio-MsgNum: 70043
Content-Type: multipart/signed;
	boundary="Apple-Mail=_77CE8A6F-9ADF-4248-B8B4-6757AE96EF0D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_77CE8A6F-9ADF-4248-B8B4-6757AE96EF0D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Aug 25, 2015, at 6:46 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 08/26/2015 09:40 AM, Khem Raj wrote:
>> setuptools the old king is ruling again, distribute fork has been =
merged
>> into setuptools starting 0.7x, so lets move to use it as well
>>=20
>> Remove licence ambiguity we need to say which verison of PSF and Zope =
license is in use
>>=20
>> Fixes [YOCTO #8201]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../python/python-distribute_0.6.32.bb             | 63 =
----------------------
>>  .../python/python-setuptools_18.2.bb               | 46 =
++++++++++++++++
>>  ...tuptools_15.2.bb =3D> python3-setuptools_18.2.bb} |  4 +-
>>  3 files changed, 48 insertions(+), 65 deletions(-)
>>  delete mode 100644 =
meta/recipes-devtools/python/python-distribute_0.6.32.bb
>>  create mode 100644 =
meta/recipes-devtools/python/python-setuptools_18.2.bb
>>  rename meta/recipes-devtools/python/{python3-setuptools_15.2.bb =3D> =
python3-setuptools_18.2.bb} (90%)
>>=20
>> diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb =
b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
>> deleted file mode 100644
>> index aa07633..0000000
>> --- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
>> +++ /dev/null
>> @@ -1,63 +0,0 @@
>> -SUMMARY =3D "Download, build, install, upgrade, and uninstall Python =
packages"
>> -HOMEPAGE =3D "http://packages.python.org/distribute"
>> -SECTION =3D "devel/python"
>> -LICENSE =3D "PSF"
>> -LIC_FILES_CHKSUM =3D =
"file://setup.py;beginline=3D234;endline=3D234;md5=3D26f6b02022b737126d3c8=
8838782dddb"
>> -
>> -SRCNAME =3D "distribute"
>> -PR =3D "ml5"
>> -DEPENDS +=3D "python"
>> -DEPENDS_class-native +=3D "python-native"
>> -
>> -SRC_URI =3D " \
>> -  =
http://pypi.python.org/packages/source/d/distribute/${SRCNAME}-${PV}.tar.g=
z \
>> -"
>> -SRC_URI[md5sum] =3D "acb7a2da81e3612bfb1608abe4f0e568"
>> -SRC_URI[sha256sum] =3D =
"8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
>> -
>> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> -
>> -#  http://python-distribute.org/distribute_setup.py
>> -
>> -# force the selection of python3
>> -#PYTHON_BASEVERSION =3D "3.3"
>> -#PYTHON_MAJMIN =3D "3.3"
>> -
>> -inherit distutils
>> -
>> -DISTUTILS_INSTALL_ARGS +=3D =
"--install-lib=3D${D}${libdir}/${PYTHON_DIR}/site-packages"
>> -
>> -do_install_prepend() {
>> -    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
>> -}
>> -
>> -#
>> -#  The installer puts the wrong path in the setuptools.pth file.  =
Correct it.
>> -#
>> -do_install_append() {
>> -    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
>> -    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > =
${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
>> -}
>> -
>> -do_install_append_class-nativesdk() {
>> -	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' =
${D}${PYTHON_SITEPACKAGES_DIR}/distribute-${PV}-py${PYTHON_BASEVERSION}.eg=
g/setuptools/tests/test_resources.py
>> -	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' =
${D}${bindir}/easy_install
>> -	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' =
${D}${bindir}/easy_install-${PYTHON_BASEVERSION}
>> -}
>> -
>> -RDEPENDS_${PN} =3D "\
>> -  python-distutils \
>> -  python-compression \
>> -"
>> -
>> -RDEPENDS_${PN}_class-target =3D "\
>> -  python-distutils \
>> -  python-compression \
>> -  python-netclient \
>> -  python-email \
>> -  python-shell \
>> -"
>> -
>> -RPROVIDES_${PN} +=3D "python-setuptools"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-devtools/python/python-setuptools_18.2.bb =
b/meta/recipes-devtools/python/python-setuptools_18.2.bb
>> new file mode 100644
>> index 0000000..1de2b2e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python-setuptools_18.2.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY =3D "Downloads, builds, installs, upgrades, and uninstalls =
Python packages"
>> +HOMEPAGE =3D "https://pypi.python.org/pypi/setuptools"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "Python-2.0 | ZPL-2.0"
>=20
> The license info inside the tarball doesn't declare which version of =
ZPL IIRC ?

however it says it follows OSI approved version thats what is depicted =
here, there is no general version of these licenses available.
like BSD without clause.

>=20
> // Robert
>=20
>> +LIC_FILES_CHKSUM =3D =
"file://setup.py;beginline=3D78;endline=3D78;md5=3D8a314270dd7a8dbca741775=
415f1716e"
>> +
>> +SRCNAME =3D "setuptools"
>> +
>> +PROVIDES =3D "python-distribute"
>> +
>> +DEPENDS +=3D "python"
>> +DEPENDS_class-native +=3D "python-native"
>> +
>> +inherit distutils
>> +
>> +SRC_URI =3D =
"https://pypi.python.org/packages/source/s/setuptools/setuptools-${PV}.tar=
.gz"
>> +SRC_URI[md5sum] =3D "52b4e48939ef311d7204f8fe940764f4"
>> +SRC_URI[sha256sum] =3D =
"0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
>> +
>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +
>> +DISTUTILS_INSTALL_ARGS +=3D =
"--install-lib=3D${D}${libdir}/${PYTHON_DIR}/site-packages"
>> +
>> +do_install_prepend() {
>> +    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
>> +}
>> +
>> +RDEPENDS_${PN} =3D "\
>> +  python-stringold \
>> +  python-email \
>> +  python-shell \
>> +  python-distutils \
>> +  python-compression \
>> +"
>> +
>> +RDEPENDS_${PN}_class-native =3D "\
>> +  python-distutils \
>> +  python-compression \
>> +"
>> +
>> +RREPLACES_${PN} =3D "python-distribute"
>> +RPROVIDES_${PN} =3D "python-distribute"
>> +RCONFLICTS_${PN} =3D "python-distribute"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-devtools/python/python3-setuptools_15.2.bb =
b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
>> similarity index 90%
>> rename from meta/recipes-devtools/python/python3-setuptools_15.2.bb
>> rename to meta/recipes-devtools/python/python3-setuptools_18.2.bb
>> index 97058c1..dc0ac80 100644
>> --- a/meta/recipes-devtools/python/python3-setuptools_15.2.bb
>> +++ b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
>> @@ -11,8 +11,8 @@ DEPENDS_class-native +=3D "python3-native"
>>  SRC_URI =3D " \
>>    =
http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.g=
z \
>>  "
>> -SRC_URI[md5sum] =3D "a9028a9794fc7ae02320d32e2d7e12ee"
>> -SRC_URI[sha256sum] =3D =
"381e78471fb0eff89c4b1a219e8739f48dd87c76ad2d3a790010ca3a62ee29a4"
>> +SRC_URI[md5sum] =3D "52b4e48939ef311d7204f8fe940764f4"
>> +SRC_URI[sha256sum] =3D =
"0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
>>=20
>>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>>=20
>>=20


--Apple-Mail=_77CE8A6F-9ADF-4248-B8B4-6757AE96EF0D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXdG54ACgkQuwUzVZGdMxRsQACggS7OR5qEb4BttAsGJeT6DMw7
Z5oAmwQg+pZY7b9/lf8joF/FtNnkEjMO
=TESd
-----END PGP SIGNATURE-----

--Apple-Mail=_77CE8A6F-9ADF-4248-B8B4-6757AE96EF0D--
