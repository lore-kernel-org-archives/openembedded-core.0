Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SIMMT-0000gN-LV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 17:55:05 +0200
Received: from mail22-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Apr 2012 15:45:44 +0000
Received: from mail22-tx2 (localhost [127.0.0.1])	by mail22-tx2-R.bigfish.com
	(Postfix) with ESMTP id D13D730016E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 15:45:44 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371Ic89bh1432N98dKzz1202hzz8275ch8275bhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail22-tx2 (localhost.localdomain [127.0.0.1]) by mail22-tx2
	(MessageSwitch) id 1334245543691891_27071;
	Thu, 12 Apr 2012 15:45:43 +0000 (UTC)
Received: from TX2EHSMHS015.bigfish.com (unknown [10.9.14.251])	by
	mail22-tx2.bigfish.com (Postfix) with ESMTP id A4284420084	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 15:45:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS015.bigfish.com
	(10.9.99.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Apr 2012 15:45:42 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.132]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Thu, 12 Apr 2012 10:45:42 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Yocto Project 1.2 M4 schedule
Thread-Index: AQHNGMNQhZ+TZMKgekW4ywXi0lVeyg==
Date: Thu, 12 Apr 2012 15:45:41 +0000
Message-ID: <CAEsOVNfn+yEZ6rLhjxgu9iQ1+1OsWeQ9ia_T_VihUMFxUB3dtg@mail.gmail.com>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAP9ODKp2s_PY9RPgkfC6O597v-05ha-+bbbZFFApwrRTa5zNGg@mail.gmail.com>
	<AF3E65EA-522E-49C3-BFA0-9EA50C39721C@dominion.thruhere.net>
	<20120412165158.52c84ded@eb-e6520>
In-Reply-To: <20120412165158.52c84ded@eb-e6520>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 15:55:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <85B02EE37112DF4CB6AFCBE44F755369@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 9:51 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Thu, 12 Apr 2012 16:39:52 +0200,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>
>>
>> Op 12 apr. 2012, om 16:24 heeft Otavio Salvador het volgende geschreven:
>>
>> > On Thu, Apr 12, 2012 at 06:29, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> >> I'm still a big fan of using 'yoctoproject-1.2' as substring for tags=
 and branches. The objections I heard to that didn't make sense to me, but =
I see this as a purely technical matter where others see it as something di=
fferent :)
>> >
>> > OE-Core branch could be 2012-1.
>>
>> Yes, but experience has shown that PHBs and new yocto users want to see =
'yocto' in the name and go apeshit when it's missing. OTOH people will hate=
 whatever gets chosen, so let's get this over with and pick a name and stro=
ngly recommend other layers to adopt it as well.
>>
> FWIW I'm also in favor of a tag yocto-1.2 for the OE-core release which
> yocto 1.2 is based on.

This is one of those things were someone just needs to decide or a
group of people need to vote. It's not worth debating anymore - you
can't make everyone happy. As long as it's tagged though.

-M=



