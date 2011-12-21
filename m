Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RdOXV-00058g-He
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 16:57:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 07:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90024004"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 07:50:03 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 23:50:02 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 21 Dec 2011 23:50:01 +0800
From: "Xu, Jiajun" <jiajun.xu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 23:49:56 +0800
Thread-Topic: [OE-core] [PATCH 1/3] ltp: Add recipe from OE
Thread-Index: AcyyFOG9OE6x0BsjShipBGh2LmwpNQN4fwVQ
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED75814D@shsmsx501.ccr.corp.intel.com>
References: <cover.1322840490.git.jiajun.xu@intel.com>
	<658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
	<4EDAB34E.6050103@linux.intel.com>
In-Reply-To: <4EDAB34E.6050103@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {C031AB65-F107-404E-BC34-C776C55989E5}
x-cr-hashedpuzzle: 7qU= AeIe EZjo ErW8 Fkhb KlwV KxFp M6l/ NKlf Rdp3 TbQ1
	TpM/ TyFf UFHW WQgZ WyYl; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA7AHMAZwB3AEAAbABpAG4AdQB4AC4AaQBuAHQAZQBsAC4AYwBvAG0A;
	Sosha1_v1; 7; {C031AB65-F107-404E-BC34-C776C55989E5};
	agBpAGEAagB1AG4ALgB4AHUAQABpAG4AdABlAGwALgBjAG8AbQA=; Wed,
	21 Dec 2011 15:49:56 GMT;
	UgBFADoAIABbAE8ARQAtAGMAbwByAGUAXQAgAFsAUABBAFQAQwBIACAAMQAvADMAXQAgAGwAdABwADoAIABBAGQAZAAgAHIAZQBjAGkAcABlACAAZgByAG8AbQAgAE8ARQA=
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ltp: Add recipe from OE
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
X-List-Received-Date: Wed, 21 Dec 2011 15:57:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> The "mv" seems to cause a problem.  Is there a reason you do this
> instead of just setting "S =3D ${WORKDIR}/ltp-full-${PV} if that's what
> the tarball normally extracts to?
>=20

Sorry for late response, Saul. If I set S to ltp-full-${PV}, do_unpack will=
 report that ltp-full-${PV} is not a directory. It is due to that the sourc=
e file for ltp is named as "ltp-full-${PV}.bz2", which in fact should be ex=
tracted by bzip2 and tar. But the unpack code in bitbake could not handle t=
his so I have to add some extra code for it.
I have modified the patch to make the unpack pass and will send out again f=
or review.

Thanks a lot.

>=20
>=20
> ERROR: Function 'do_extract_tarball' failed (see
> /srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/
> tmp/w ork/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714 for
> further information) ERROR: Logfile of failure stored in:
> /srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/
> tmp/w ork/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714 Log
> data follows: | NOTE: Unpacking
> /srv/home/swold/downloads/ltp-full-20110915.bz2 to
> /srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/
> tmp/w ork/i586-poky-linux/ltp-20110915-r0/ | DEBUG: SITE files
> ['endian-little', 'bit-32', 'ix86-common', 'common-linux',
> 'common-glibc', 'i586-linux', 'common'] | ERROR: Function
> 'do_extract_tarball' failed (see
> /srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/
> tmp/w ork/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714 for
> further information) | mv: cannot overwrite directory
> `/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build
> /tmp/w
> ork/i586-poky-linux/ltp-20110915-r0/ltp-20110915/ltp-full-20110915' with
> non-directory NOTE: package ltp-20110915-r0: task do_unpack: Failed
> ERROR: Task 2303
> (/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/
> recipe s-extended/ltp/ltp_20110915.bb, do_unpack) failed with exit code
> '1'
>=20
>> +do_install(){ +	install -d ${D}/opt/ltp/ +	oe_runmake DESTDIR=3D${D}
>> SKIP_IDCHECK=3D1 install + +	# Copy POSIX test suite into
>> ${D}/opt/ltp/testcases by manual +	cp -r testcases/open_posix_testsuite
>> ${D}/opt/ltp/testcases + +	# We need to remove all scripts which depend
>> on /usr/bin/expect, +since expect is not supported in poky +	# We will
>> add expect for enhancement in future +	find ${D} -type f -print | xargs
>> grep "\!.*\/usr\/bin\/expect" | +awk -F":" '{print $1}' | xargs rm -f }

Best Regards,
Jiajun




