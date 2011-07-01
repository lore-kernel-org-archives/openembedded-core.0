Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QceHd-0006Q7-Mo
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 16:01:25 +0200
Received: by pzk36 with SMTP id 36so665504pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=J/Oulg1Zz94HOpR3Tefi19lJV5ahYe/1bTTJwC1SO7I=;
	b=Na0BKLHgk7DmmDm68eL+3if4Ur87JrbhLPnJETIjmZtGWCZbxMyb8KYaN5Eq1eHavP
	nAxn+KwGd2ZGe9bT2RwOk3XqTTXRtKuZFFfoQ2QVZ4CyIV5PWd9p9I9DbeLOcdum5PA6
	BkMV5sVz2s5MhxyXmgSpkGWUQUEWNUB3awiaI=
Received: by 10.142.61.33 with SMTP id j33mr1499436wfa.135.1309528656781;
	Fri, 01 Jul 2011 06:57:36 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k2sm2114849wfe.3.2011.07.01.06.57.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 06:57:35 -0700 (PDT)
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
	<1309509178.20015.513.camel@rex>
	<72100965-D39D-41D0-B6E7-78E18D6FD072@dominion.thruhere.net>
In-Reply-To: <72100965-D39D-41D0-B6E7-78E18D6FD072@dominion.thruhere.net>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <7A98A269-0EB8-452E-839C-68A68128B5A3@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2011 06:57:55 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 01 Jul 2011 14:01:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 1, 2011, at 4:00 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

>=20
> Op 1 jul 2011, om 10:32 heeft Richard Purdie het volgende geschreven:
>=20
>> On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
>>> incremental build with rm_work turned on:
>>>=20
>>> ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstr=
om_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r3=
7.0+svnr175127/temp/log.do_configure.27092 for further information)
>>> ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_201=
0_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+sv=
nr175127/temp/log.do_configure.27092
>>> Log data follows:
>>> | + cd /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstro=
m-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-=
linux.arm-angstrom-linux-gnueabi
>>> | + do_configure
>>> | + sed -i '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-an=
gstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/g=
cc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SY=
STEMLIBS_DIR\2#'
>>> | sed: can't read /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/arm=
v7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-br=
anch/gcc/config/*/linux*.h: No such file or directory
>>> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angs=
trom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-=
r37.0+svnr175127/temp/log.do_configure.27092 for further information)
>>> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task do_configure:=
 Failed
>>> ERROR: Task 764 (/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-=
devtools/gcc/gcc-cross-initial_4.5.bb, do_configure) failed with exit code '=
1'
>>>=20
>>> Can this patchset get reverted please and reapplied when it actually has=
 been tested to work?
>>=20
>> I checked and everything is fine with rm_work.
>>=20
>> Looking at this error, something is changing ${S} as there is no mention
>> of work-shared in the sed command yet there should be.
>>=20
>> At a guess this is coming from:
>>=20
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-openembedded/t=
ree/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
>>=20
>> where it says:
>>=20
>> S =3D "${WORKDIR}/${BRANCH}"
>>=20
>> and if that is changed to
>>=20
>> S_append =3D "/${BRANCH}"
>>=20
>> or removed it will likely work better.
>=20
> It was indeed a bug in meta-oe and the following fixed it:
>=20
> https://github.com/koenkooi/meta-oe/commit/8a917caaa5506fa0f875202243658a1=
c2fe60c40

Additionally you would need to port the patch which mucks makefile fragment I=
 think
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


