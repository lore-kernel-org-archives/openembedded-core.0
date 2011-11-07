Received: from 12.mo3.mail-out.ovh.net ([188.165.41.191]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNLM6-0006ZG-FV
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 10:19:02 +0100
Received: from mail612.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 88012FF9C44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 09:42:31 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Nov 2011 10:36:39 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Nov 2011 10:36:37 +0200
Message-ID: <4EB79894.3050209@eukrea.com>
Date: Mon, 07 Nov 2011 09:36:36 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
	<4EA825F0.1030504@windriver.com> <4EA83ACB.4040001@intel.com>
	<4EB6EE8E.4000401@eukrea.com> <4EB7155A.1050808@intel.com>
In-Reply-To: <4EB7155A.1050808@intel.com>
X-Ovh-Tracer-Id: 10994694066957692234
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -190
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfedvtddrvdduucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegruhhtohhmrghkvgikrghuthhotghonhhffeigucdlqdeitddmnehlihhnuhigfeigucdlqdeftddm
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -190
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrheekucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegruhhtohhmrghkvgikrghuthhotghonhhffeigucdlqdeitddmnehlihhnuhigfeigucdlqdeftddm
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd changes to dbus, base-passwd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 09:19:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Scott,

Le 07/11/2011 00:16, Scott Garman a =E9crit :
> This looks good, thank you! Two questions though:
>
> When I was testing my own variation of this fix out, I found that testi=
ng
> bb.data.inherits_class('nativesdk', d) did not work as I expected. It r=
eturned
> false for a recipe I was testing with that used BBCLASSEXTEND =3D "nati=
ve
> nativesdk". So instead I was checking if PN ended with -nativesdk. Are =
you
> certain the inherits_class test works?
>
this seems to work as expected in the present case :

$ grep BBCLASSEXTEND sources/openembedded-core/meta/recipes-core/dbus/dbu=
s.inc
BBCLASSEXTEND =3D "native nativesdk"

$ bitbake dbus -e |grep ^DEPENDS=3D
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-nativ=
e=20
libtool-cross gnu-config-native virtual/gettext gettext-native=20
virtual/arm-angstrom-linux-gnueabi-gcc=20
virtual/arm-angstrom-linux-gnueabi-compilerlibs virtual/libc  expat=20
virtual/libintl virtual/libx11 libsm shadow-native shadow-sysroot base-pa=
sswd=20
update-rc.d-native"

$ bitbake dbus-native -e |grep ^DEPENDS=3D
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-nativ=
e=20
gnu-config-native gettext-minimal-native  expat-native virtual/libintl-na=
tive=20
shadow-native shadow-sysroot base-passwd update-rc.d-native"

$ bitbake dbus-nativesdk -e |grep ^DEPENDS=3D
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-nativ=
e=20
libtool-cross gnu-config-native virtual/gettext-nativesdk gettext-native=20
virtual/i686-angstromsdk-linux-gcc-crosssdk=20
virtual/i686-angstromsdk-linux-compilerlibs-nativesdk virtual/libc-native=
sdk=20
expat-nativesdk virtual/libintl-nativesdk virtual/libx11-nativesdk=20
update-rc.d-native"

$ bitbake dbus-nativesdk -e |grep ^SSTATEPOSTIN
$ bitbake dbus-native -e |grep ^SSTATEPOSTIN
SSTATEPOSTINSTFUNCS=3D"useradd_sysroot_sstate"
$ bitbake dbus -e |grep ^SSTATEPOSTIN
SSTATEPOSTINSTFUNCS=3D"useradd_sysroot_sstate"


> My second question is why the autotools_do_install is needed for the na=
tivesdk
> case?
>
because without the do_install_virtclass-nativesdk() , that's the standar=
d=20
do_install which is used which tries to setup some rigths using chown on =
the=20
files and that fails (and is not very useful for a nativesdk).
Maybe we could use a similar do_install as the one used for native.

Eric


