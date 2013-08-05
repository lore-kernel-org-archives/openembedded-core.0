Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 30B7A60593
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:50:44 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z11so3523812pdj.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=rkjgZVOd+sFFi6qDld9dXEvIQGzRoUmDFM7A2Shgllw=;
	b=TP/hFly7SSiijGGQBSIPjqa49TIEF7aAB85n1aaIP+jonEcRsXCkBIQwhFYWHaL2Ef
	zRmqz7WaqPdFC8zrbGPLdbhaHUrVTnz24jedyGt2dm0SzBxG11JpWlg+UmSZI6Pi8iUc
	kEYGE33fDmdzDdfoo/syo7p2dkscHOrImAPnhFf+RDS2jfHSiTl0DKJKHHqaz4qyn/bc
	Fo6/BbrYx0CfXsZdRF0wX077RLd94adTTkXR4bQdOechfBR+Qwl8DuPfKn5M3u1vYYxG
	kRDt1VITusMsAup3m0IctU2igIXqtrdgDBCt1N3GJADR4jE4d4/tAzxST4B8RXrqK6eW
	jR8w==
X-Received: by 10.68.203.161 with SMTP id kr1mr23600679pbc.192.1375725044760; 
	Mon, 05 Aug 2013 10:50:44 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id qh10sm246688pbb.33.2013.08.05.10.50.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 10:50:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51FF33AE.20302@linux.intel.com>
Date: Mon, 5 Aug 2013 10:50:50 -0700
Message-Id: <5D4D6CED-7CF1-48C8-A399-6EAAF368A99B@gmail.com>
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
X-List-Received-Date: Mon, 05 Aug 2013 17:50:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


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


I have not tested this combination myself. where you are building =
python3 itself as 32bit package
what I have tested is to be able to build it for default multilib only. =
I don't see much point of
having a 32bit variant of python on a 64bit machine when you have it =
available as a 64bit package.

I will try to find some time to look into it and reproduce it but it =
does not seem like a show stopper
use case.

>>=20
>=20
> Khem:
>=20
> This are kind of killing my enthusiasm with python3
>=20
> Another issue in jinja:
>=20
>> RefactoringTool: There was 1 error:
>> RefactoringTool: Can't parse ./ez_setup.py: ParseError: bad input: =
type=3D22, value=3D'=3D', context=3D('', (54, 19))
>> --- ./jinja/translators/python.py       (original)
>> +++ ./jinja/translators/python.py       (refactored)
>=20


This was bad from me. I have fixed it and pushed the rebased tree.

> Sau!
>=20
>=20
>> Sau!
>>=20
>>=20
>>>=20
>>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>>=20


