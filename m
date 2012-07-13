Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SpYOM-0006Xg-LD
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 07:26:14 +0200
Received: from mail174-co1-R.bigfish.com (10.243.78.239) by
	CO1EHSOBE006.bigfish.com (10.243.66.69) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 04:59:52 +0000
Received: from mail174-co1 (localhost [127.0.0.1])	by
	mail174-co1-R.bigfish.com (Postfix) with ESMTP id 5DB69DC020C	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:59:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zzbb2dI98dI9371I1432Izz1202hzz8275eh8275bh8275dha1495iz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail174-co1 (localhost.localdomain [127.0.0.1]) by mail174-co1
	(MessageSwitch) id 1342155590491820_16886;
	Fri, 13 Jul 2012 04:59:50 +0000 (UTC)
Received: from CO1EHSMHS019.bigfish.com (unknown [10.243.78.242])	by
	mail174-co1.bigfish.com (Postfix) with ESMTP id 7593F8A003F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:59:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS019.bigfish.com
	(10.243.66.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 04:59:50 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 23:59:49 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 2/2] libgomp: add libgomp (openmp)
	library, and build for powerpc targets by default
Thread-Index: AQHNYLPOZtV6Py4ocU6bUqaZ6ZAaeJcm+viA
Date: Fri, 13 Jul 2012 04:59:48 +0000
Message-ID: <CAEsOVNfbc2WgOiQF7kM_hgftFzoxjX-FwY_itS+FKDy5R-v5Zw@mail.gmail.com>
References: <1341936749-3209-1-git-send-email-msm@freescale.com>
	<4FFFAA5F.6070700@linux.intel.com>
In-Reply-To: <4FFFAA5F.6070700@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v4 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 13 Jul 2012 05:26:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F66780229008B64594615D284D2A4CFF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 11:55 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/10/2012 09:12 AM, Matthew McClintock wrote:
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
>>   meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    7 +++++++
>>   meta/recipes-devtools/gcc/gcc-package-runtime.inc   |   14
>> +++++++++++++-
>>   3 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> index c7dbc3c..be142a1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -1,6 +1,6 @@
>>   require gcc-common.inc
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>>   # Third digit in PV should be incremented after a minor release
>>   # happens from this branch on gcc e.g. currently its 4.7.1
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> index 095d6c1..d40383c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> @@ -8,6 +8,8 @@ EXTRA_OECONF_PATHS =3D " \
>>       --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>>   RUNTIMETARGET =3D "libssp libstdc++-v3"
>> +RUNTIMETARGET_append_powerpc =3D " libgomp"
>> +RUNTIMETARGET_append_powerpc64 =3D " libgomp"
>>   #  ?
>>   # libiberty
>>   # libmudflap
>> @@ -41,6 +43,11 @@ do_install () {
>>         for d in ${RUNTIMETARGET}; do
>>                 cd ${B}/$target/$d/
>>                 oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/$target=
/$d/
>> install
>> +               if [ "$d" =3D "libgomp" ]; then
>> +                       rm -rf ${D}${datadir}/info/libgomp.info
>> ${D}${datadir}/info/dir
>> +                       rmdir --ignore-fail-on-non-empty -p
>> ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
>> +                       rmdir --ignore-fail-on-non-empty -p
>> ${D}${datadir}/info
>> +               fi
>>         done
>>         chown -R root:root ${D}
>>   }
>> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> index e0cb51b..a81e3b7 100644
>> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> @@ -13,6 +13,9 @@ PACKAGES =3D "\
>>     libgfortran-dev \
>>     libmudflap \
>>     libmudflap-dev \
>> +  libgomp \
>> +  libgomp-dev \
>> +  libgomp-staticdev \
>>   "
>>   # The base package doesn't exist, so we clear the recommends.
>>   RRECOMMENDS_${PN}-dbg =3D ""
>> @@ -61,7 +64,16 @@ FILES_libmudflap-dev =3D "\
>>     ${libdir}/libmudflap*.a \
>>     ${libdir}/libmudflap*.la"
>>
>> +FILES_libgomp-dev =3D "\
>> +  ${libdir}/libgomp*.so \
>> +  ${libdir}/libgomp*.la \
>> +  ${libdir}/libgomp.spec \
>> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>> +  "
>
> This was already merged into OE-Core, but I just found a packaging issue
> with it.
>
> The above .so should be libgomp*${SOLIBDEV} and libgomp*${SOLIB}
>
> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not
> shipped
>   /usr/lib/libgomp.so.1.0.0
>   /usr/lib/libgomp.so.1
>
> Sorry I did not catch this earlier

Will you fix this or do you want me too?

I'm confused why not just do a

${libdir}/libgomp*.so*

?

-M

>
> Sau!
>
>
>> +FILES_libgomp-staticdev =3D "\
>> +  ${libdir}/libgomp*.a \
>> +  "
>> +
>>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}libc:do_package=
"
>>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}libc:do_package=
"
>>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}libc:do_package=
"
>> -
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



