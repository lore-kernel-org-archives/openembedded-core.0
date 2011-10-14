Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1REYcM-0004DE-4D
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 05:39:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Oct 2011 20:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,343,1315206000"; d="scan'208";a="73516202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 20:33:43 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 13 Oct 2011 20:33:43 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi;
	Thu, 13 Oct 2011 20:33:43 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 20:33:42 -0700
Thread-Topic: [review/test 0/5] Python upgrade and other commits
Thread-Index: AcyJ/L+MJKSpmW5HT9y0Rnrc3UbgeQAJTvAA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E0BCEFD0@orsmsx504.amr.corp.intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318547063.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [review/test 0/5] Python upgrade and other commits
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
X-List-Received-Date: Fri, 14 Oct 2011 03:39:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I also tested on qemuppc and python's basic functionality is working inside=
 qemuppc machine.

Thanks,
Nitin


> -----Original Message-----
> From: Kamble, Nitin A
> Sent: Thursday, October 13, 2011 4:06 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Kamble, Nitin A; Martin Jansa
> Subject: [review/test 0/5] Python upgrade and other commits
>=20
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> I tested and found that python 2.7.2 is working as expected inside
> qemux86 machine.
> Please give it a try and let me know your experience.
>=20
> Thanks,
> Nitin
>=20
> The following changes since commit
> 5ed59ae0f25bf673d514df2371da7e0415b62bb2:
>=20
>   local.conf.sample: Disable interactive patch resolution for now since
> doesn't work well (2011-10-07 00:00:21 +0100)
>=20
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/upgrades
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dnitin/upgrades
>=20
> Martin Jansa (1):
>   python: update generate-manifest for 2.7 version and regenerate it
>=20
> Nitin A Kamble (4):
>   x86 tune files: set baselib for x32 tune as libx32
>   python-dbus: upgrade from 0.83.2 to 0.84.0
>   python, python-native: upgrade from 2.6.6 to 2.7.2
>   update python 2.7 manifest
>=20
>  meta/conf/distro/include/default-versions.inc      |    6 +-
>  meta/conf/machine/include/ia32/arch-ia32.inc       |    2 +-
>  meta/conf/machine/include/tune-core2.inc           |    2 +-
>  ...on-2.6-manifest.inc =3D> python-2.7-manifest.inc} |  124 +++++-----
>  ...python-dbus_0.83.2.bb =3D> python-dbus_0.84.0.bb} |    4 +-
>  .../python/python-native/multilib.patch            |  240
> ++++++++++++++++++++
>  .../python/python-native/nohostlibs.patch          |   36 ++-
>  ...thon-native_2.6.6.bb =3D> python-native_2.7.2.bb} |   13 +-
>  meta/recipes-devtools/python/python.inc            |   16 +-
>  .../01-use-proper-tools-for-cross-build.patch      |   80 ++++---
>  .../python/python/02-remove-test-for-cross.patch   |  108 ---------
>  .../06-avoid_usr_lib_termcap_path_in_linking.patch |   12 +-
>  .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
>  meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
>  .../python/python/security_issue_2254_fix.patch    |  184 ------------
> ---
>  .../python/{python_2.6.6.bb =3D> python_2.7.2.bb}    |   11 +-
>  meta/site/common-linux                             |    3 +
>  ...te-manifest-2.6.py =3D> generate-manifest-2.7.py} |    6 +-
>  18 files changed, 495 insertions(+), 520 deletions(-)
>  rename meta/recipes-devtools/python/{python-2.6-manifest.inc =3D>
> python-2.7-manifest.inc} (52%)
>  rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb =3D> python-
> dbus_0.84.0.bb} (83%)
>  create mode 100644 meta/recipes-devtools/python/python-
> native/multilib.patch
>  rename meta/recipes-devtools/python/{python-native_2.6.6.bb =3D> python-
> native_2.7.2.bb} (74%)
>  delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-
> for-cross.patch
>  delete mode 100644 meta/recipes-
> devtools/python/python/security_issue_2254_fix.patch
>  rename meta/recipes-devtools/python/{python_2.6.6.bb =3D>
> python_2.7.2.bb} (92%)
>  rename scripts/contrib/python/{generate-manifest-2.6.py =3D> generate-
> manifest-2.7.py} (99%)
>=20
> --
> 1.7.4.4



