Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U5Jgv-0004S2-1S
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:31:11 +0100
Received: from mail5-ch1-R.bigfish.com (10.43.68.226) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Tue, 12 Feb 2013 17:14:49 +0000
Received: from mail5-ch1 (localhost [127.0.0.1])	by mail5-ch1-R.bigfish.com
	(Postfix) with ESMTP id 34C042001B8;
	Tue, 12 Feb 2013 17:14:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail5-ch1 (localhost.localdomain [127.0.0.1]) by mail5-ch1
	(MessageSwitch) id 1360689287461185_29946;
	Tue, 12 Feb 2013 17:14:47 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail5-ch1.bigfish.com (Postfix) with ESMTP id
	6E3893000D5; Tue, 12 Feb 2013 17:14:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 12 Feb 2013 17:14:42 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.48]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Tue, 12 Feb 2013 17:14:41 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] libpfm4: exclude from world
Thread-Index: AQHOCURyZQoRGeL9O0GwN52OSM1rAA==
Date: Tue, 12 Feb 2013 17:14:41 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A87213C@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
	<51142E1F.1020404@linux.intel.com>
In-Reply-To: <51142E1F.1020404@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpfm4: exclude from world
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
X-List-Received-Date: Tue, 12 Feb 2013 17:31:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CC151288D7B2B943B96AD215FD9C0D55@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2013 at 4:43 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/07/2013 06:33 AM, Martin Jansa wrote:
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> index 460029f..438dbc3 100644
>> --- a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> @@ -24,3 +24,6 @@ S =3D "${WORKDIR}/libpfm-${PV}"
>>   do_install () {
>>         oe_runmake install
>>   }
>> +
>> +# oprofile depends on it only for ppc* and it fails to build on arm
>> +EXCLUDE_FROM_WORLD =3D "1"
>>
>
> Should it be EXCLUDE_FROM_WORLD or
>
> COMPATIBLE_MACHINE=3D "(*ppc*|mpc*)"
>
> Since for a ppc world build it would be valid.

We really need COMPATIBLE_ARCH here...

Actually I've found since I tried to upstream my last patches that
libpfm is only a req for ppc64. I'm going to submit some follow up
patches once I hear back from the oprofile person I've been chatting
with

-M=



