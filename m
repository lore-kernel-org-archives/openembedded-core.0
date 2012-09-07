Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9sty-0003ZP-Gg
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 09:22:54 +0200
Received: from mail13-db3-R.bigfish.com (10.3.81.229) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 7 Sep 2012 06:55:24 +0000
Received: from mail13-db3 (localhost [127.0.0.1])	by mail13-db3-R.bigfish.com
	(Postfix) with ESMTP id BF630300265;
	Fri,  7 Sep 2012 06:55:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288hbe9i1155h)
Received: from mail13-db3 (localhost.localdomain [127.0.0.1]) by mail13-db3
	(MessageSwitch) id 1347000922736617_17086;
	Fri,  7 Sep 2012 06:55:22 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.229])	by
	mail13-db3.bigfish.com (Postfix) with ESMTP id A752F26004D;
	Fri,  7 Sep 2012 06:55:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 7 Sep 2012 06:55:21 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Fri, 7 Sep 2012 01:55:19 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/1] conf/tune: add tune-ppce300c3
Thread-Index: AQHNjMW9xqwTTtOmUkWoyjbpi0AiVw==
Date: Fri, 7 Sep 2012 06:55:18 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A65EAB7@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
	<fb717d4aa26b125680f620254cde9eb97ef0708a.1346956528.git.bruce.ashfield@windriver.com>
	<1346969961.7493.24.camel@ted> <504921BD.4040004@windriver.com>
	<5049253B.4090402@windriver.com> <1346972362.7493.32.camel@ted>
	<50492CAF.3010203@windriver.com>
In-Reply-To: <50492CAF.3010203@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] conf/tune: add tune-ppce300c3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 07:22:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3859F76FC6CF7A458EFC9C53B07A4BFF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 6, 2012 at 6:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 9/6/12 5:59 PM, Richard Purdie wrote:
>>
>> On Thu, 2012-09-06 at 17:35 -0500, Mark Hatle wrote:
>>>
>>> On 9/6/12 5:20 PM, Bruce Ashfield wrote:
>>>>
>>>> On 12-09-06 6:19 PM, Richard Purdie wrote:
>>>>>
>>>>> On Thu, 2012-09-06 at 14:43 -0400, Bruce Ashfield wrote:
>>>>>>
>>>>>> It has been pointed out several times that the yocto mpc8315e-rdb
>>>>>> reference was using the wrong tuning (603e), since it is actually
>>>>>> a e300c3 board.
>>>>>>
>>>>>> This commit creates a e300c3 tune file based on the e300c2 variant
>>>>>> already in oe-core.
>>>>>>
>>>>>> This commit also inhibits altivec in flac when this new tuning is
>>>>>> enabled. It was also noticed that the existing tune based overrides
>>>>>> in the flac package would not be triggered since DEFAULTTUNE is not
>>>>>> in the overrides list. To avoid doing per-board disabling of altivec
>>>>>> DEFAULTTUNE is added to the local package OVERRIDES and then used
>>>>>> to disable altivec.
>>>>>>
>>>>>> [YOCTO #1192]
>>>>>>
>>>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>>>>
>>>>>> asdfkljds
>>>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>>>> ---
>>>>>>     meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
>>>>>>     meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
>>>>>>     2 files changed, 16 insertions(+), 0 deletions(-)
>>>>>>     create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
>>>>>>
>>>>>> diff --git a/meta/conf/machine/include/tune-ppce300c3.inc
>>>>>> b/meta/conf/machine/include/tune-ppce300c3.inc
>>>>>> new file mode 100644
>>>>>> index 0000000..3f5ac26
>>>>>> --- /dev/null
>>>>>> +++ b/meta/conf/machine/include/tune-ppce300c3.inc
>>>>>> @@ -0,0 +1,11 @@
>>>>>> +DEFAULTTUNE ?=3D "ppce300c3"
>>>>>> +
>>>>>> +require conf/machine/include/powerpc/arch-powerpc.inc
>>>>>> +
>>>>>> +TUNEVALID[ppce300c3] =3D "Enable ppce300c3 specific processor
>>>>>> optimizations"
>>>>>> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3"=
,
>>>>>> "-mcpu=3De300c3", "", d)}"
>>>>>> +
>>>>>> +AVAILTUNES +=3D "ppce300c3"
>>>>>> +TUNE_FEATURES_tune-ppce300c3 =3D "m32 fpu-soft ppce300c3"
>>>>>> +TUNE_PKGARCH_tune-ppce300c3 =3D "ppce300c3"
>>>>>> +PACKAGE_EXTRA_ARCHS_tune-ppce300c3 =3D
>>>>>> "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3"
>>>>>> diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>>>>> b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>>>>> index 3c5b73c..25db1c4 100644
>>>>>> --- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>>>>> +++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>>>>> @@ -36,9 +36,14 @@ EXTRA_OECONF =3D "--disable-oggtest
>>>>>> --disable-id3libtest \
>>>>>>                     --without-xmms-exec-prefix \
>>>>>>                     --without-libiconv-prefix \
>>>>>>                     --without-id3lib"
>>>>>> +
>>>>>> +FLACOVERRIDE =3D ":${DEFAULTTUNE}"
>>>>>> +OVERRIDES .=3D "${FLACOVERRIDE}"
>>>>>> +
>>>>>>     EXTRA_OECONF_prepend_e500mc =3D "--disable-altivec "
>>>>>>     EXTRA_OECONF_prepend_e5500 =3D "--disable-altivec "
>>>>>>     EXTRA_OECONF_prepend_e5500-64b =3D "--disable-altivec "
>>>>>> +EXTRA_OECONF_prepend_ppce300c3 =3D "--disable-altivec "
>>>>>>
>>>>>
>>>>> This is getting ugly and is kind of unsafe. Perhaps the architecture
>>>>> should be doing something like:
>>>>>
>>>>> MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300=
c3",
>>>>> ":noaltivec", "" ,d)}
>>>>>
>>>>> or even in this recipe just do:
>>>>>
>>>>> EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3",=
 "
>>>>> --disable-altivec", "" ,d)}

These don't work because you still have the other 3 lines that look
just like this. Or am I missing something?

>>>>
>>>>
>>>> I definitely considered this route. I can do that for the new arch, an=
d
>>>> the
>>>> old ones, but can't test the old ones at the moment.
>>>
>>>
>>> The problem is actually in the flac.  This recipe sees powerpc as the
>>> machine
>>> type, and immediately enabled altivec.  By default altivec support is
>>> disabled
>>> in OE-Core.
>>>
>>> Perhaps one way we could address this is add a tune flag that says if t=
he
>>> tune
>>> has altivec support or not.. then in the flac binary, disable it unless
>>> it's
>>> enabled?
>>
>>
>> I think having altivec in the tune_features would be ideal. I'd love to
>> get this cleaned up too but I lack much knowledge about powerpc...
>
>
> My proposal then would be to accept Bruce's patch, with the understanding
> that we need to add a tune flag of 'altivec' to the PowerPC tunings (wher=
e
> appropriate) and then make the flac recipe respect that flag.

This sounds good to me. If a bug is filed against me I can take a look
at it since I did the initial damage.

-M

> Unfortunately I don't have the time to do that right now or I would.  Wou=
ld
> an enhancement bug in the Yocto Project bugzilla be enough to be sure the
> work is done?
>
> --Mark
>
>
>> Cheers,
>>
>> Richard
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



