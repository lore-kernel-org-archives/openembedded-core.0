Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Spn2b-0004Do-AP
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 23:04:45 +0200
Received: from mail146-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE014.bigfish.com (10.243.66.77) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 20:53:29 +0000
Received: from mail146-co1 (localhost [127.0.0.1])	by
	mail146-co1-R.bigfish.com (Postfix) with ESMTP id A4CB39E01A1	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 20:53:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail146-co1 (localhost.localdomain [127.0.0.1]) by mail146-co1
	(MessageSwitch) id 1342212807984507_23859;
	Fri, 13 Jul 2012 20:53:27 +0000 (UTC)
Received: from CO1EHSMHS014.bigfish.com (unknown [10.243.78.225])	by
	mail146-co1.bigfish.com (Postfix) with ESMTP id EE43E700048	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 20:53:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS014.bigfish.com
	(10.243.66.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 20:53:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 13 Jul 2012 15:53:26 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] task-core-tools-testapps.bb: kexec-tools
	does not work on e5500-64b parts
Thread-Index: AQHNYTmLRzCgI7yOFUaJxPC5YLPQvw==
Date: Fri, 13 Jul 2012 20:53:25 +0000
Message-ID: <CAEsOVNdHzFoc6m_yAiUk97iFxuDsr-MDL=M19hvci-oxAAcnOg@mail.gmail.com>
References: <1342210017-26817-1-git-send-email-msm@freescale.com>
	<CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
In-Reply-To: <CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
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
X-List-Received-Date: Fri, 13 Jul 2012 21:04:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F61DFD21C78B3F418FBF34D6D8A4E1B7@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock <msm@freescale.com> w=
rote:
>> This prevents kexec from building for this part since it does not work
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-core/tasks/task-core-tools-testapps.bb |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/=
recipes-core/tasks/task-core-tools-testapps.bb
>> index b5847f8..bdd0d05 100644
>> --- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> @@ -22,6 +22,7 @@ KEXECTOOLS ?=3D "kexec"
>>  KEXECTOOLS_mips ?=3D ""
>>  KEXECTOOLS_mipsel ?=3D ""
>>  KEXECTOOLS_powerpc ?=3D ""
>> +KEXECTOOLS_e5500-64b ?=3D ""
>
> you should use arch override here this is not machine specific recipe pro=
bably
>
> KEXECTOOLS_powerpc64 ?=3D ""
>
> is better

I thought about that at first, but there are plenty of powerpc64
machines that do support kexec ;) It's really just the Freescale
variant.

-M

>
>>
>>  RDEPENDS_${PN} =3D "\
>>      blktool \
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



