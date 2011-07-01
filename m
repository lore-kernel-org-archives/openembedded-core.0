Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QceKx-0006Tj-GR
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 16:04:51 +0200
Received: by wyg30 with SMTP id 30so2508012wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 07:01:06 -0700 (PDT)
Received: by 10.216.65.18 with SMTP id e18mr1213914wed.23.1309528863401;
	Fri, 01 Jul 2011 07:01:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm2374305wbb.52.2011.07.01.07.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 07:01:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7A98A269-0EB8-452E-839C-68A68128B5A3@gmail.com>
Date: Fri, 1 Jul 2011 16:01:00 +0200
Message-Id: <AB227B7A-755C-454D-A38E-7FF913801989@dominion.thruhere.net>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
	<1309509178.20015.513.camel@rex>
	<72100965-D39D-41D0-B6E7-78E18D6FD072@dominion.thruhere.net>
	<7A98A269-0EB8-452E-839C-68A68128B5A3@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 14:04:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 15:57 heeft Khem Raj het volgende geschreven:

>=20
>=20
> On Jul 1, 2011, at 4:00 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>=20
>>=20
>> Op 1 jul 2011, om 10:32 heeft Richard Purdie het volgende geschreven:
>>=20
>>> On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
>>>> incremental build with rm_work turned on:
>>>>=20
>>>> ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 =
for further information)
>>>> ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092
>>>> Log data follows:
>>>> | + cd =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-linux.a=
rm-angstrom-linux-gnueabi
>>>> | + do_configure
>>>> | + sed -i =
'/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-=
gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*=
/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 =
SYSTEMLIBS_DIR\2#'
>>>> | sed: can't read =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/=
linux*.h: No such file or directory
>>>> | ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 =
for further information)
>>>> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task =
do_configure: Failed
>>>> ERROR: Task 764 =
(/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-c=
ross-initial_4.5.bb, do_configure) failed with exit code '1'
>>>>=20
>>>> Can this patchset get reverted please and reapplied when it =
actually has been tested to work?
>>>=20
>>> I checked and everything is fine with rm_work.
>>>=20
>>> Looking at this error, something is changing ${S} as there is no =
mention
>>> of work-shared in the sed command yet there should be.
>>>=20
>>> At a guess this is coming from:
>>>=20
>>> =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-openembedded/tr=
ee/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
>>>=20
>>> where it says:
>>>=20
>>> S =3D "${WORKDIR}/${BRANCH}"
>>>=20
>>> and if that is changed to
>>>=20
>>> S_append =3D "/${BRANCH}"
>>>=20
>>> or removed it will likely work better.
>>=20
>> It was indeed a bug in meta-oe and the following fixed it:
>>=20
>> =
https://github.com/koenkooi/meta-oe/commit/8a917caaa5506fa0f875202243658a1=
c2fe60c40
>=20
> Additionally you would need to port the patch which mucks makefile =
fragment I think

Any volunteers for that? My incremental build seems to work now, haven't =
tried a from scratch yet.=


