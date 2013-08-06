Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDE660886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 05:29:31 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id up15so4312545pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZpYxc//z6wmWt4lCSmPvFRgJj8yj2rw5+OEJVJk0Zwc=;
	b=FHY6flfw2+WJ8J2HKIngVwvWW/lK90w8m3hvcy16BQdbdlvzEkJ0E9bhfJwq32Qzc3
	uFUrUeEPYueQjfJwIPmRCZgPHibmPgfE0obJPSCRZXILvoN/OjH7qP3NfzBaFri+7rEC
	DHZWVAFLADpR67Z9UxOmoYAhQIwkdrdmiVjMDdFVlxJvZE+1hdOFHHr0Su2pZ0dyUvi4
	t5bh+wqmwMSK4QD+p88NgYVVz9cvpAYJPs+yx5721TP11osxugREMles6kePb/JZPaBm
	JuF1p6RcrZZsEEBbH+TOm3Z6L1MLKHOracnfr0Ad5Ropx6tFR1OgPhebzdZmlZa2BCgi
	idYg==
X-Received: by 10.66.252.129 with SMTP id zs1mr1201791pac.113.1375766971857;
	Mon, 05 Aug 2013 22:29:31 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qh10sm2891206pbb.33.2013.08.05.22.29.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 22:29:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51FF33AE.20302@linux.intel.com>
Date: Mon, 5 Aug 2013 22:29:28 -0700
Message-Id: <C4934DB9-23CC-4B7D-AC40-CCEB59D08039@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
	<FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
	<51FB3B2F.1060908@linux.intel.com>
	<45FADA31-8F4F-4BF7-A672-D083C3353813@gmail.com>
	<51FD840E.7000004@linux.intel.com> <51FF33AE.20302@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Tue, 06 Aug 2013 05:29:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


>>>=20
>> OK, Ran it on the Autobuilder last night, and came up with the =
following
>> on a World build with multilib enabled:
>>=20
>>> ERROR: This autoconf log indicates errors, it looked at host include
>>> and/or library paths while determining system capabilities.
>>> Rerun configure task after fixing this. The path was
>>> =
'/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build=
/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.3.2-r0.0/Python-3.3.=
2'
>>>=20
>>> ERROR: Function failed: do_qa_configure
>>> ERROR: Logfile of failure stored in:
>>> =
/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/=
build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.3.2-r0.0/temp/log.do_=
configure.13443
>>>=20
>>> NOTE: recipe lib32-python3-3.3.2-r0.0: task do_configure: Failed
>>> ERROR: Task 11368
>>> =
(virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder-new/yocto-sl=
ave/nightly-world/build/meta/recipes-devtools/python/python3_3.3.2.bb,
>>> do_configure) failed with exit code '1'
>>> NOTE: Running task 10412 of 21582 (ID: 12424,
>>> =
virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder-new/yocto-sla=
ve/nightly-world/build/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.b=
b,
>>> do_packagedata)
>>> NOTE: recipe lib32-quota-4.01-r1: task do_compile: Started
>>> ERROR: This autoconf log indicates errors, it looked at host include
>>> and/or library paths while determining system capabilities.
>>> Rerun configure task after fixing this. The path was
>>> =
'/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build=
/build/tmp/work/i586-poky-linux/python3/3.3.2-r0.0/Python-3.3.2'
>>>=20
>>> ERROR: Function failed: do_qa_configure
>>> ERROR: Logfile of failure stored in:
>>> =
/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/=
build/tmp/work/i586-poky-linux/python3/3.3.2-r0.0/temp/log.do_configure.15=
796
>>>=20
>>> NOTE: recipe python3-3.3.2-r0.0: task do_configure: Failed
>>> ERROR: Task 80
>>> =
(/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build=
/meta/recipes-devtools/python/python3_3.3.2.bb,
>>> do_configure) failed with exit code '1'
>>=20
>> Summary of local.conf changes:
>> DISTRO =3D "poky"
>> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>> BB_NUMBER_THREADS =3D "16"
>> PARALLEL_MAKE =3D "-j 16"
>> SDKMACHINE ?=3D "x86_64"
>> DL_DIR =3D =
"/srv/www/vhosts/autobuilder.yoctoproject.org/current_sources"
>> require conf/multilib.conf
>> MULTILIBS =3D "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>> SSTATE_DIR ?=3D "/srv/www/vhosts/sstate.yoctoproject.org//multilib"
>> MACHINE =3D "qemux86"
>> PREMIRRORS =3D ""
>> BB_GENERATE_MIRROR_TARBALLS =3D "1"
>> ADTREPO =3D "http://adtrepo.yoctoproject.org//1.4+snapshot"
>>=20


This is not reproducible on my end on multiple attempts. Built from =
scratch incremental anything
works ok python branch is on top of=20

commit bc6258f88705b0e7989089a8666ac5e5d2355823
Author: Saul Wold <sgw@linux.intel.com>
Date:   Thu Aug 1 18:30:59 2013 -0700

    grep: Add patch for texinfo 5.1
   =20
    Signed-off-by: Saul Wold <sgw@linux.intel.com>


Build Configuration:
BB_VERSION        =3D "1.19.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "x86_64-oe-linux"
MACHINE           =3D "qemux86-64"
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "m64"
TARGET_FPU        =3D ""
meta-nslu2        =3D "master:392b7799314a49b00f20a1bef004f9b0a0c9c364"
meta              =3D "master:f902781f1cc6a7007060dfad3e3596688866ef87"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 917 tasks of which 834 didn't need to be =
rerun and all succeeded.


