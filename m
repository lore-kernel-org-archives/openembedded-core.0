Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiIXX-0002PA-6Y
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:33:27 +0100
Received: from mail83-db3-R.bigfish.com (10.3.81.247) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 04:26:06 +0000
Received: from mail83-db3 (localhost [127.0.0.1])	by mail83-db3-R.bigfish.com
	(Postfix) with ESMTP id 021C9200218;
	Wed,  4 Jan 2012 04:26:06 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail83-db3 (localhost.localdomain [127.0.0.1]) by mail83-db3
	(MessageSwitch) id 1325651165927782_28649;
	Wed,  4 Jan 2012 04:26:05 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.251])	by
	mail83-db3.bigfish.com (Postfix) with ESMTP id DF64F3C0043;
	Wed,  4 Jan 2012 04:26:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 04:26:05 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 22:26:04 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Garg Vakul-B16394 <B16394@freescale.com>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6AgAC57QD///6vEIAI3xkAgACpPHCAAGlGAP//m58AgABprIA=
Date: Wed, 4 Jan 2012 04:26:04 +0000
Message-ID: <CAEsOVNeQ2zrS8dviqJ0TLfkwKdiEHPs_pZ=6KXvJcJ1h9ur2qw@mail.gmail.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
	<CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
	<1325591055.24417.330.camel@phil-desktop>
	<065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNe0j=Kq+irY3wnP46pbDywRtM1g-8jNnfsHRZXWuU0avA@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018AC3@039-SN2MPN1-011.039d.mgd.msft.net>
In-Reply-To: <065BBB7616BCE543832A2EF096986B94018AC3@039-SN2MPN1-011.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phil Blundell <philb@gnu.org>, Luo Zhenhua-B19537 <B19537@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 04 Jan 2012 04:33:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BFD0BD269E17E3439481CF99560908BE@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2012 at 10:16 PM, Garg Vakul-B16394 <B16394@freescale.com> w=
rote:
> Hi Matthew
>
> Are you proposing to add 'debuginfo pkg of ld.so'?

What provides ld.so? That package should provide a ${PKGNAME}-dbg
which contains the debug version. This work should already be done, in
theory at least. Unless I am missing something.

-M=



