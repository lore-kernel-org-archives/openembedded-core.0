Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TLlnu-0006z1-S2
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 04:13:46 +0200
Received: from mail35-db3-R.bigfish.com (10.3.81.238) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Oct 2012 01:45:35 +0000
Received: from mail35-db3 (localhost [127.0.0.1])	by mail35-db3-R.bigfish.com
	(Postfix) with ESMTP id 786EE2E00E6	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 01:45:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail35-db3 (localhost.localdomain [127.0.0.1]) by mail35-db3
	(MessageSwitch) id 1349833533597942_23807;
	Wed, 10 Oct 2012 01:45:33 +0000 (UTC)
Received: from DB3EHSMHS003.bigfish.com (unknown [10.3.81.225])	by
	mail35-db3.bigfish.com (Postfix) with ESMTP id 853C4220068	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 01:45:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS003.bigfish.com
	(10.3.87.103) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Oct 2012 01:45:30 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 10 Oct 2012 01:45:28 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Recipes with disabled parallel make
Thread-Index: AQHNpojsM6hpWoXuAkacfcG2KXBu3A==
Date: Wed, 10 Oct 2012 01:45:28 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6ED3E4@039-SN1MPN1-002.039d.mgd.msft.net>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
	<4F58B564.5040708@opendreambox.org>
In-Reply-To: <4F58B564.5040708@opendreambox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Wed, 10 Oct 2012 02:13:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2D7C64117665CF4A86E25F0BE0484F18@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 8, 2012 at 7:34 AM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> On 02.03.2012 23:29, Yury Bushmelev wrote:
>> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
>>> Hi
>>>
>>> Just grepped for the occurances of disabled parallel make and I see
>>> around 40 cases on oe-core
>>>
>>> git grep PARALLEL_MAKE.*=3D.*\"\" recipes* | grep -v "#"
>>>
>>> If someone has time to kill then it would help to see if some of these
>>> are fixed by time or can be fixed
>>>
>>> it can help in paralleling the build a bit more.
>>
>> Well, I have some first results! :)
>>
>>
>> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
>> P_M disabled as it is now):
>> meta/recipes-connectivity/bind/bind_9.8.1.bb
>> meta/recipes-extended/slang/slang_2.2.4.bb
>> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>> meta/recipes-support/pth/pth_2.0.7.bb
>
> meta/recipes-devtools/libtool/libtool_2.4.2.bb might need disabled
> P_M, too:
>
> | ./mipsel-oe-linux-libtool  --tag=3DCC   --mode=3Dcompile ccache mipsel-=
oe-linux-gcc  -mel -mabi=3D32   -mhard-float -march=3Dmips32 --sysroot=3D..=
./tmp/sysroots/dm7020hd -DHAVE_CONFIG_H -I.  -DLTDLOPEN=3Dlibltdl -DLT_CONF=
IG_H=3D'<config.h>' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl/libltd=
l   -Os -pipe -g -feliminate-unused-debug-types -c -o libltdl/libltdl_liblt=
dl_la-slist.lo `test -f 'libltdl/slist.c' || echo './'`libltdl/slist.c
> | /bin/sh: ./mipsel-oe-linux-libtool: /bin/sh: bad interpreter: Text file=
 busy
> | make[2]: *** [libltdl/libltdl_libltdl_la-slist.lo] Error 126
> | make[2]: *** Waiting for unfinished jobs....
>
> This was a fresh build with clean tmp and sstate-cache. I've just
> seen this failue for the first time.
>
> BB_NUMBER_THREADS =3D "4"
> PARALLEL_MAKE =3D "-j 4"

I'm seeing this on denzil on Ubuntu 10.04.2 LTS 32-bit.

-M=



