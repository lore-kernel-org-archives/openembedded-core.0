Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJSYS-0005mi-2J
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 18:11:44 +0200
Received: from mail150-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 16:05:33 +0000
Received: from mail150-ch1 (localhost.localdomain [127.0.0.1])	by
	mail150-ch1-R.bigfish.com (Postfix) with ESMTP id C6260164034A	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 16:05:36 +0000 (UTC)
X-SpamScore: -18
X-BigFish: VS-18(zz9371K936eK103dK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail150-ch1 (localhost.localdomain [127.0.0.1]) by mail150-ch1
	(MessageSwitch) id 1319731536711657_27305;
	Thu, 27 Oct 2011 16:05:36 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail150-ch1.bigfish.com (Postfix) with ESMTP id
	A657195004F	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 16:05:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 16:05:31 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 27 Oct 2011 11:05:38 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add readline as dependecy for
	gdb-cross-canadian
Thread-Index: AQHMlMJDMOSX0NFt9Uq3ZeNXDPfN4Q==
Date: Thu, 27 Oct 2011 16:05:37 +0000
Message-ID: <CAEsOVNfqY2XcCXZJ+bMp1xcCTaQZGj32ZJe7v=tfwyaYtHcGmg@mail.gmail.com>
References: <1319684612-24265-1-git-send-email-msm@freescale.com>
	<1319701366.15601.7.camel@ted>
In-Reply-To: <1319701366.15601.7.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Add readline as dependecy for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Oct 2011 16:11:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <82D0749191C6294C8366596DBD71718D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 2:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-10-26 at 22:03 -0500, Matthew McClintock wrote:
>> Got errors that we were unable to find -lreadline, this fixed the
>> issue
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0meta/recipes-devtools/gdb/gdb-cross-canadian.inc =A0 | =A0 =A02 +-
>> =A0.../gdb/gdb-cross-canadian_7.3a.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
>> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> This patch didn't apply as it wasn't against master. I have manually
> fixed it up but please send patches against master in future! :)

Thanks! Sorry, I've been working on edison lately this must have
slipped my mind.

-M=



