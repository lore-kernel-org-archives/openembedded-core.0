Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rkg3x-0006Tm-PM for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:04:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AHvHdO012807
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:57:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12415-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:57:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AHvBT7012801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:57:11 GMT
Message-ID: <1326218233.23315.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 17:57:13 +0000
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q0AHvHdO012807
Subject: Re: [CONSOLIDATED PULL 00/22] Patches and Updates for M2
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
X-List-Received-Date: Tue, 10 Jan 2012 18:04:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-09 at 21:53 -0800, Saul Wold wrote:
> This change set has been run through the AB, I pull out the DTB patch
> which is what I think caused the failure for MPC.
>=20
> Please due further review and commit as appropriate.
>=20
> Thanks
> 	Sau!
>=20
>=20
> The following changes since commit fff18970706913e7fd7f4a119d798dddb44b=
388a:
>=20
>   base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)
>=20
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgw/stage
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dsgw/stage
>=20
> Andrea Adami (2):
>   kexec-tools: split packaging of kexec and kdump
>   task-core-tools: adapt to kexec-tools package split
>=20
> Andreas M=C3=BCller (2):
>   libusb1: keep *.la in base_libdir
>   libusb-compat: keep *.la in base_libdir
>=20
> Colin Walters (1):
>   util-linux: .pc files should go in the -dev packages for subpackages
>=20
> Dexuan Cui (1):
>   distro_tracking_fields.inc: upgrade tcf-agent
>=20
> Jessica Zhang (1):
>   add sysroot support for meta-ide-support which is the toolchain
>     within build env case
>=20
> Khem Raj (8):
>   site/common-uclibc: Cache gl_cv_func_wcwidth_works
>   libiconv_1.14.bb: Fix build failure
>   eglibc: Upgrade recipes 2.14 -> 2.15
>   autotools.bbclass: Introduce CACHED_CONFIGUREVARS
>   default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
>   uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
>     distro feature
>   findutils: Use CACHED_CONFIGUREVARS to specify cached configure vars
>   util-linux: Enable fallocate and use CACHED_CONFIGUREVARS
>=20
> Matthew McClintock (1):
>   libxml2: add shared library version info to libxml shared libraries
>=20
> Nitin A Kamble (1):
>   libxxf86dga: fix compilation with x32 toolchain
>=20
> Saul Wold (1):
>   distro_tracking: Update Manual Checks
>=20
> Steve Sakoman (4):
>   Remove last remnants of kernel26 MACHINE_FEATURES
>   dbus: change permissions of dbus-daemon-launch-helper to 4755
>   gtk-icon-cache.bbclass: add -f option to gtk-update-icon-cache in
>     postinst
>   update-modules: don't run modutils.sh if systemd is installed

I merged these apart from:
   default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc

Cheers,

Richard







