Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TlNqQ-0007ZF-Ks
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 18:54:20 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id DAD54D22E9; Wed, 19 Dec 2012 18:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A84A5D22B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 18:38:23 +0100 (CET)
Message-ID: <50D1FB8D.1010506@linaro.org>
Date: Wed, 19 Dec 2012 18:38:21 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1355933911-48562-1-git-send-email-bjst@enea.com>
	<1355933911-48562-5-git-send-email-bjst@enea.com>
In-Reply-To: <1355933911-48562-5-git-send-email-bjst@enea.com>
Subject: Re: [PATCH 4/5] Add ptest for dbus.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 17:54:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 19.12.2012 17:18, Bj=C3=B6rn Stenberg pisze:
> This patch adds a new recipe dbus-test to build and package the dbus te=
st
> suite. The reason for a separate recipe is that the dbus test suite dep=
ends
> on dbus-glib, so it cannot be compiled at the same time as dbus.

Failed here:

18:33 hrw@puchatek:build$ bitbake linaro-image-sdk
Loading cache: 100% |####################################################=
#########################################################################=
##| ETA:  00:00:00
Loaded 1891 entries from dependency cache.
Parsing recipes: 100% |##################################################=
#########################################################################=
##| Time: 00:00:04
Parsing of 1515 .bb files complete (1507 cached, 8 parsed). 1899 targets,=
 62 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        =3D "1.17.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-13.04"
TARGET_SYS        =3D "aarch64-oe-linux"
MACHINE           =3D "genericarmv8"
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "aarch64"
meta-oe          =20
meta-webserver   =20
toolchain-layer  =20
meta-gnome        =3D "meta-oe:ef5e1d752003e70d30ce8462c3cd09ce3794d783"
meta-aarch64      =3D "master:c2d418c1da9c21c408511399b85861bcde8cffe3"
meta-linaro       =3D "master:02a6a819c86ac95c57526ad93a81a63ca6649b35"
meta              =3D "master:413ab5e9f525b02c2e8a701e96aee6b1c84c4939"
meta-efl         =20
meta-gpe         =20
meta-initramfs   =20
meta-multimedia  =20
meta-networking  =20
meta-xfce         =3D "meta-oe:ef5e1d752003e70d30ce8462c3cd09ce3794d783"

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
NOTE: multiple providers are available for jpeg-native (jpeg-native, libj=
peg-turbo-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg-native
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Error executing a python function in /home/hrw/HDD/devel/canonical=
/aarch64/CLEAN/openembedded-core/meta/recipes-core/dbus/dbus_1.6.4.bb:
ExpansionError: Failure expanding variable RDEPENDS_dbus-lib, expression =
was 'ptest' 'dbus-ptest' ${@base_contains('DISTRO_FEATURES' '' d)} eglibc=
 (>=3D 2.16) libgcc=20
(>=3D linaro-4.7) which triggered exception SyntaxError: invalid syntax (=
RDEPENDS_dbus-lib, line 1)

ERROR: The stack trace of python calls that resulted in this exception/fa=
ilure was:
ERROR:   File "package_depchains", line 128, in <module>
ERROR:=20
ERROR:   File "package_depchains", line 75, in package_depchains
ERROR:=20
ERROR:   File "/home/hrw/HDD/devel/canonical/aarch64/CLEAN/openembedded-c=
ore/bitbake/lib/bb/data_smart.py", line 295, in getVar
ERROR:     return self.expand(value, var)
ERROR:=20
ERROR:   File "/home/hrw/HDD/devel/canonical/aarch64/CLEAN/openembedded-c=
ore/bitbake/lib/bb/data_smart.py", line 159, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:=20
ERROR:   File "/home/hrw/HDD/devel/canonical/aarch64/CLEAN/openembedded-c=
ore/bitbake/lib/bb/data_smart.py", line 149, in expandWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:=20
ERROR: The code that was being executed was:
ERROR:      0124:                    add_dep(rdeps, dep)
ERROR:      0125:                pkg_addrrecs(pkg, base, suffix, func, rd=
eps, d)
ERROR:      0126:
ERROR:      0127:
ERROR:  *** 0128:package_depchains(d)
ERROR:      0129:
ERROR: [From file: 'package_depchains', lineno: 128, function: <module>]
ERROR:      0071:    for dep in bb.utils.explode_deps(d.getVar('RDEPENDS'=
, True) or ""):
ERROR:      0072:        add_dep(rdepends, dep)
ERROR:      0073:
ERROR:      0074:    for pkg in packages.split():
ERROR:  *** 0075:        for dep in bb.utils.explode_deps(d.getVar('RDEPE=
NDS_' + pkg, True) or ""):
ERROR:      0076:            add_dep(rdepends, dep)
ERROR:      0077:
ERROR:      0078:    #bb.note('rdepends is %s' % rdepends)
ERROR:      0079:
ERROR: [From file: 'package_depchains', lineno: 75, function: package_dep=
chains]
ERROR: Function failed: package_depchains
ERROR: Logfile of failure stored in: /home/hrw/HDD/devel/canonical/aarch6=
4/CLEAN/build/tmp-eglibc/work/aarch64-oe-linux/dbus/1.6.4-r5.0/temp/log.d=
o_package.9925
ERROR: Task 1880 (/home/hrw/HDD/devel/canonical/aarch64/CLEAN/openembedde=
d-core/meta/recipes-core/dbus/dbus_1.6.4.bb, do_package) failed with exit=
 code '1'
NOTE: Tasks Summary: Attempted 2799 tasks of which 2792 didn't need to be=
 rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/hrw/HDD/devel/canonical/aarch64/CLEAN/openembedded-core/meta/reci=
pes-core/dbus/dbus_1.6.4.bb, do_package
Summary: There were 34 ERROR messages shown, returning a non-zero exit co=
de.



