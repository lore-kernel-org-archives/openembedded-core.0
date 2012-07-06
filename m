Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnEfs-0008L5-NF
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 21:58:51 +0200
Received: from mail91-co1-R.bigfish.com (10.243.78.244) by
	CO1EHSOBE009.bigfish.com (10.243.66.72) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 19:29:35 +0000
Received: from mail91-co1 (localhost [127.0.0.1])	by mail91-co1-R.bigfish.com
	(Postfix) with ESMTP id 0E0019802CE	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 19:29:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail91-co1 (localhost.localdomain [127.0.0.1]) by mail91-co1
	(MessageSwitch) id 134160297456667_9589; Fri,  6 Jul 2012 19:29:34 +0000
	(UTC)
Received: from CO1EHSMHS001.bigfish.com (unknown [10.243.78.248])	by
	mail91-co1.bigfish.com (Postfix) with ESMTP id 0BE0220044	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 19:29:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS001.bigfish.com
	(10.243.66.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 19:29:34 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 6 Jul 2012 14:31:41 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libgomp: add libgomp (openmp) library, and
	build for powerpc targets by default
Thread-Index: AQHNWzlU5W1i8WJ3y0K+9ThoYsHus5ccGmsAgACJiQCAABugAIAAOaEA
Date: Fri, 6 Jul 2012 19:31:41 +0000
Message-ID: <CAEsOVNdKa45YELACuuT57T4_xCyPapJV1MQVX5=SoMiPjRFVyA@mail.gmail.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<CAMKF1srU_KcFP7-3-znj+T6m9Tc1J+JVFbxy4L5ojW-2Z3GUag@mail.gmail.com>
	<CAEsOVNfebYabCyfhYd873LeKJwH56Ci9DBcyYbe8_P_Y8go3dA@mail.gmail.com>
	<CAMKF1spjF-h=LhkbCoWO49N64PYnHW3B0Q9tq+ZJa5gQtKwymw@mail.gmail.com>
	<CAEsOVNeFub8iHJ4JycECH-2fPdrbEaACu_4Y2U7mFYgV9SLryQ@mail.gmail.com>
	<CAMKF1so=Cqbp10r9Odhc3tBrP2P3mkTupgxCy43HJzB+cHLekA@mail.gmail.com>
In-Reply-To: <CAMKF1so=Cqbp10r9Odhc3tBrP2P3mkTupgxCy43HJzB+cHLekA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Fri, 06 Jul 2012 19:58:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FD854E91AAAC254B84659FA1A8E4D1EE@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 6, 2012 at 11:05 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 6, 2012 at 7:26 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Fri, Jul 6, 2012 at 1:13 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Jul 5, 2012 at 10:36 PM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>> On Fri, Jul 6, 2012 at 12:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Thu, Jul 5, 2012 at 9:32 PM, Matthew McClintock <msm@freescale.com=
> wrote:
>>>>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>>>>> ---
>>>>>>  meta/recipes-devtools/gcc/gcc-4.6.inc               |    2 +-
>>>>>>  meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    2 ++
>>>>>>  meta/recipes-devtools/gcc/gcc-package-runtime.inc   |    9 ++++++++=
+
>>>>>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-de=
vtools/gcc/gcc-4.6.inc
>>>>>> index 020e21b..32545eb 100644
>>>>>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>>>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>>>>> @@ -1,6 +1,6 @@
>>>>>>  require gcc-common.inc
>>>>>>
>>>>>> -PR =3D "r25"
>>>>>> +PR =3D "r26"
>>>>>>
>>>>>>  # Third digit in PV should be incremented after a minor release
>>>>>>  # happens from this branch on gcc e.g. currently its 4.6.0
>>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/m=
eta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>>>>> index 34bfaeb..a7d478c 100644
>>>>>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>>>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>>>>> @@ -9,6 +9,8 @@ EXTRA_OECONF_PATHS =3D " \
>>>>>>      --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>>>>>
>>>>>>  RUNTIMETARGET =3D "libssp libstdc++-v3"
>>>>>> +RUNTIMETARGET_append_powerpc =3D " libgomp"
>>>>>> +RUNTIMETARGET_append_powerpc64 =3D " libgomp"
>>>>>>  #  ?
>>>>>>  # libiberty
>>>>>>  # libmudflap
>>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/met=
a/recipes-devtools/gcc/gcc-package-runtime.inc
>>>>>> index feb8735..001a444 100644
>>>>>> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>>>>>> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>>>>>> @@ -13,6 +13,8 @@ PACKAGES =3D "\
>>>>>>    libgfortran-dev \
>>>>>>    libmudflap \
>>>>>>    libmudflap-dev \
>>>>>> +  libgomp \
>>>>>> +  libgomp-dev \
>>>>>>  "
>>>>>>  # The base package doesn't exist, so we clear the recommends.
>>>>>>  RRECOMMENDS_${PN}-dbg =3D ""
>>>>>> @@ -61,3 +63,10 @@ FILES_libmudflap-dev =3D "\
>>>>>>    ${libdir}/libmudflap*.a \
>>>>>>    ${libdir}/libmudflap*.la"
>>>>>>
>>>>>> +FILES_libgomp =3D "${libdir}/libgomp*.so.*"
>>>>>> +FILES_libgomp-dev =3D "\
>>>>>> +  ${libdir}/libgomp*.so \
>>>>>> +  ${libdir}/libgomp*.a \
>>>>>> +  ${libdir}/libgomp*.la \
>>>>>> +  ${libdir}/libgomp.spec \
>>>>>> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h"
>>>>>
>>>>> Did you build a non ppc architecture to verify that it does not
>>>>> complain about empty packages ?
>>>>
>>>> I tested without the powerpc overrides first...
>>>
>>> OK let me put it differently remove
>>>
>>> +RUNTIMETARGET_append_powerpc =3D " libgomp"
>>> +RUNTIMETARGET_append_powerpc64 =3D " libgomp"
>>>
>>> and leave the rest of patch in
>>>
>>> then build for powerpc
>>
>> That's what I'm saying I did... I did not even get libgomp packages
>> (rpm's) in this scenario....
>
> OK, Dont you get warnings about empty packages.

Let me double check.... it does not seem to have any such messages:

$ bitbake -c cleanall gcc-runtime
$ bitbake gcc-runtime
$ grep libgomp -r tmp/cooker.log.20120706190*

With your changes above starting from scratch with a PR bump for kicks
does not even make the packages.

-M=



