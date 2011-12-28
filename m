Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rfz6G-00060p-Pf
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:23:45 +0100
Received: from mail53-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 19:16:06 +0000
Received: from mail53-ch1 (localhost [127.0.0.1])	by mail53-ch1-R.bigfish.com
	(Postfix) with ESMTP id 14AD1C010E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 19:16:08 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 13250997669190_29856; Wed, 28 Dec 2011 19:16:06 +0000
	(UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	EE453200048 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 19:16:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 19:16:03 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 28 Dec 2011 13:16:24 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6A//+nkuCAAGo+AIAAA8mAgAAcxgCAAHOJgA==
Date: Wed, 28 Dec 2011 19:16:23 +0000
Message-ID: <CAEsOVNc2qwW-Tz4MCmnpAA99qWirtu=SWwBUqLdMRHbsj2MLow@mail.gmail.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
	<2295923.3R0Nmqr59V@helios>
	<80E8B5C9-63CE-4BFA-8C5F-39ABA85736C7@dominion.thruhere.net>
	<20111228121512.GB3995@jama.jama.net>
In-Reply-To: <20111228121512.GB3995@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Garg Vakul-B16394 <B16394@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 28 Dec 2011 19:23:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C2ACE427D2447E4994302E7EEF1E56CB@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 6:15 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>> > If a dependency on the libc debug packages is really needed you could =
do
>> > something this instead:
>> >
>> > RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"

This seems better since it include uclibc if that was selected...

>>
>> Or:
>>
>> RECOMMENDS_libc-glibc =3D "glibc-dbg"
>
> with extra R and PN, right?
> RRECOMMENDS_${PN}_libc-glibc =3D "glibc-dbg"

This is only provided by eglibc now, so it leaves out uclibc... I think...


-M=



