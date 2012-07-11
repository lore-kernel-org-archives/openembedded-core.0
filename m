Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sp1J6-00045u-IS
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 20:06:36 +0200
Received: from mail137-co1-R.bigfish.com (10.243.78.244) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 17:53:01 +0000
Received: from mail137-co1 (localhost [127.0.0.1])	by
	mail137-co1-R.bigfish.com (Postfix) with ESMTP id 55A897604CF	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:53:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -9
X-BigFish: VS-9(z691L6caIzbb2dI98dI9371I936eI1432Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail137-co1 (localhost.localdomain [127.0.0.1]) by mail137-co1
	(MessageSwitch) id 1342029178662223_25668;
	Wed, 11 Jul 2012 17:52:58 +0000 (UTC)
Received: from CO1EHSMHS029.bigfish.com (unknown [10.243.78.249])	by
	mail137-co1.bigfish.com (Postfix) with ESMTP id 9FEA3720044	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:52:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS029.bigfish.com
	(10.243.66.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 17:52:58 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Wed, 11 Jul 2012 12:55:19 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Upcoming Yocto 1.2.1 "denzil" release this week.
Thread-Index: AQHNX45V3Nni/t7D5UGCk4cmgKmTFg==
Date: Wed, 11 Jul 2012 17:55:18 +0000
Message-ID: <CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
References: <4FFD0425.7040004@intel.com>
	<4FFD3FF0.6080409@communistcode.co.uk> <1342004414.7934.11.camel@ted>
In-Reply-To: <1342004414.7934.11.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 18:06:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BD91A62D4F2538469B6316081E58E1AB@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
>> On 11/07/12 05:42, Scott Garman wrote:
>> > Hello,
>> >
>> > After a review of the QA full pass test report for Yocto 1.2.1, the
>> > release team has agreed to submit this release candidate as our final
>> > release for 1.2.1. Song Liu will organize the release readiness
>> > decision, and I expect Beth Flanagan will be able to perform the
>> > official release by the end of this week.
>> >
>> > Unfortunately the timing of this is such that I will be out of the
>> > office for the rest of this week. Saul Wold can handle any
>> > questions/concerns in my absence.
>> >
>> > Thanks so much to everyone who contributed work that went into 1.2.1!
>> > We now have 35 bugfixes and a few further enhancements to denzil since
>> > 1.2 to share with our users.
>> >
>> > Scott
>> >
>>
>> Are Khems eglibc patches going to make it in for this - 2.16 is playing
>> havoc with my builds at the moment and surely will with everyone else
>> when the major distros catch up.
>
> Its too late to get those pieces into 1.2.1, they're not even in master
> yet, let alone in a stable release branch.
>
> I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in master,
> then port them to the denzil branch quickly post release so they'd make
> any 1.2.2 release and are available on the git branch for people using
> the stable branch.

Can you fill me in? Why would a point release include such a dramatic upgra=
de?

-M

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



