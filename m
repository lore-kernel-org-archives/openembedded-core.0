Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Spl18-00019Y-40
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 20:55:06 +0200
Received: from mail180-va3-R.bigfish.com (10.7.14.237) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 18:43:51 +0000
Received: from mail180-va3 (localhost [127.0.0.1])	by
	mail180-va3-R.bigfish.com (Postfix) with ESMTP id DE2B51A03FE	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 18:43:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail180-va3 (localhost.localdomain [127.0.0.1]) by mail180-va3
	(MessageSwitch) id 1342205021910819_1852;
	Fri, 13 Jul 2012 18:43:41 +0000 (UTC)
Received: from VA3EHSMHS045.bigfish.com (unknown [10.7.14.238])	by
	mail180-va3.bigfish.com (Postfix) with ESMTP id D07F64E02DC	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 18:43:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS045.bigfish.com
	(10.7.99.55) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 18:43:40 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Fri, 13 Jul 2012 13:43:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc-package-runtime.inc: Fix QA warning
Thread-Index: AQHNYSdrNSDyGsmbFE2XqIrwuTm0Lw==
Date: Fri, 13 Jul 2012 18:43:39 +0000
Message-ID: <CAEsOVNccp+nLyn7U=-Oz3=eMawi1r4haxkTQW6ROU+zD=pZdzw@mail.gmail.com>
References: <1342204577-9605-1-git-send-email-msm@freescale.com>
	<CAMKF1sq6g7uidfS5NXZ7xxujAjSz9vk7WFSreG1y2P1KUmLvcQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq6g7uidfS5NXZ7xxujAjSz9vk7WFSreG1y2P1KUmLvcQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Fri, 13 Jul 2012 18:55:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <21B28D6C0A80D748AFCE7D90F7D5976A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 1:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 13, 2012 at 11:36 AM, Matthew McClintock <msm@freescale.com> =
wrote:
>>> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not =
shipped
>>>   /usr/lib/libgomp.so.1.0.0
>>>   /usr/lib/libgomp.so.1
>>
>
> that should go into the real libgomp package not -dev package

Err... all the so files? Or just the new ones?

-M

>
>
>>  FILES_libgomp-dev =3D "\
>> -  ${libdir}/libgomp*.so \
>> +  ${libdir}/libgomp*.so* \
>>    ${libdir}/libgomp*.la \
>>    ${libdir}/libgomp.spec \
>>    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
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



