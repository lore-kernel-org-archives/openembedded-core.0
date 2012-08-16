Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T23L8-000613-2e
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 18:54:34 +0200
Received: from mail107-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 16 Aug 2012 16:12:28 +0000
Received: from mail107-am1 (localhost [127.0.0.1])	by
	mail107-am1-R.bigfish.com (Postfix) with ESMTP id A28E226012E;
	Thu, 16 Aug 2012 16:12:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eIdf9M1432Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i1155h)
Received: from mail107-am1 (localhost.localdomain [127.0.0.1]) by mail107-am1
	(MessageSwitch) id 134513354734749_24180;
	Thu, 16 Aug 2012 16:12:27 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.226])	by
	mail107-am1.bigfish.com (Postfix) with ESMTP id 06288460046;
	Thu, 16 Aug 2012 16:12:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 16 Aug 2012 16:12:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Thu, 16 Aug 2012 11:12:23 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [discussion] perf: specify SLANG_INC dir for perf
Thread-Index: AQHNe8nrE56cohk/pE60uL+NWeiu6A==
Date: Thu, 16 Aug 2012 16:12:22 +0000
Message-ID: <CAEsOVNcjZfE4ofUeY-PPaxb6uJgZWNaEf8QGkbUOme0o_xf8dA@mail.gmail.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted>
In-Reply-To: <1345132684.14667.70.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "darren.hart@intel.com" <darren.hart@intel.com>
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
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
X-List-Received-Date: Thu, 16 Aug 2012 16:54:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7692F57776DBB74A919D950097EB51A9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 10:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-08-16 at 11:33 -0400, Bruce Ashfield wrote:
>> On 12-08-13 10:17 PM, Liang Li wrote:
>> > Hi Richard,
>> >
>> > Ping ...
>> >
>> > Hopefully you could recall sufficient context from this thread about
>> > the 'include path for slang.h' cause compile error issue that we are
>> > trying to fix here.
>>
>> Bump.
>>
>> I'm holding off on merging a kernel patch for this while this is still
>> outstanding.
>>
>> Can I distill this into the following (in the hope of resolving it).
>>
>>    - do we want to fix this problem for all kernels, or just the linux-y=
octo
>>      ones ? And by 'fix', I mean without the requirement of porting
>>      a kernel patch to older recipes.
>
> I propose we add a sed expression to the general kernel do_install which
> changes the -I/usr/include/slang -> -I=3D/usr/include/slang. That should
> be generic, acceptable to upstream and fixes all kernel versions.
>
> Comments?

That would work for me as well ;)

-M=



