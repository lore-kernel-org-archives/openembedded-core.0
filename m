Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sn1OX-0002AV-1p
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 07:47:58 +0200
Received: from mail138-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 05:34:43 +0000
Received: from mail138-va3 (localhost [127.0.0.1])	by
	mail138-va3-R.bigfish.com (Postfix) with ESMTP id CB37F22038C	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 05:34:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail138-va3 (localhost.localdomain [127.0.0.1]) by mail138-va3
	(MessageSwitch) id 1341552881290836_17786;
	Fri,  6 Jul 2012 05:34:41 +0000 (UTC)
Received: from VA3EHSMHS044.bigfish.com (unknown [10.7.14.244])	by
	mail138-va3.bigfish.com (Postfix) with ESMTP id 3A0131E0048	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 05:34:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS044.bigfish.com
	(10.7.99.54) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 05:34:41 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Fri, 6 Jul 2012 00:36:47 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libgomp: add libgomp (openmp) library, and
	build for powerpc targets by default
Thread-Index: AQHNWzlU5W1i8WJ3y0K+9ThoYsHusw==
Date: Fri, 6 Jul 2012 05:36:46 +0000
Message-ID: <CAEsOVNfebYabCyfhYd873LeKJwH56Ci9DBcyYbe8_P_Y8go3dA@mail.gmail.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<CAMKF1srU_KcFP7-3-znj+T6m9Tc1J+JVFbxy4L5ojW-2Z3GUag@mail.gmail.com>
In-Reply-To: <CAMKF1srU_KcFP7-3-znj+T6m9Tc1J+JVFbxy4L5ojW-2Z3GUag@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Fri, 06 Jul 2012 05:47:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2B5B103EC76EC440809CE5B05883671A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 6, 2012 at 12:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jul 5, 2012 at 9:32 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.6.inc               |    2 +-
>>  meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    2 ++
>>  meta/recipes-devtools/gcc/gcc-package-runtime.inc   |    9 +++++++++
>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.6.inc
>> index 020e21b..32545eb 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> @@ -1,6 +1,6 @@
>>  require gcc-common.inc
>>
>> -PR =3D "r25"
>> +PR =3D "r26"
>>
>>  # Third digit in PV should be incremented after a minor release
>>  # happens from this branch on gcc e.g. currently its 4.6.0
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/=
recipes-devtools/gcc/gcc-configure-runtime.inc
>> index 34bfaeb..a7d478c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> @@ -9,6 +9,8 @@ EXTRA_OECONF_PATHS =3D " \
>>      --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>>  RUNTIMETARGET =3D "libssp libstdc++-v3"
>> +RUNTIMETARGET_append_powerpc =3D " libgomp"
>> +RUNTIMETARGET_append_powerpc64 =3D " libgomp"
>>  #  ?
>>  # libiberty
>>  # libmudflap
>> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/re=
cipes-devtools/gcc/gcc-package-runtime.inc
>> index feb8735..001a444 100644
>> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> @@ -13,6 +13,8 @@ PACKAGES =3D "\
>>    libgfortran-dev \
>>    libmudflap \
>>    libmudflap-dev \
>> +  libgomp \
>> +  libgomp-dev \
>>  "
>>  # The base package doesn't exist, so we clear the recommends.
>>  RRECOMMENDS_${PN}-dbg =3D ""
>> @@ -61,3 +63,10 @@ FILES_libmudflap-dev =3D "\
>>    ${libdir}/libmudflap*.a \
>>    ${libdir}/libmudflap*.la"
>>
>> +FILES_libgomp =3D "${libdir}/libgomp*.so.*"
>> +FILES_libgomp-dev =3D "\
>> +  ${libdir}/libgomp*.so \
>> +  ${libdir}/libgomp*.a \
>> +  ${libdir}/libgomp*.la \
>> +  ${libdir}/libgomp.spec \
>> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h"
>
> Did you build a non ppc architecture to verify that it does not
> complain about empty packages ?

I tested without the powerpc overrides first...

-M

>
>> --
>> 1.7.10
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



