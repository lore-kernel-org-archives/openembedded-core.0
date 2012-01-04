Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiIkU-0002jp-2w
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:46:50 +0100
Received: from mail217-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 04:39:25 +0000
Received: from mail217-ch1 (localhost [127.0.0.1])	by
	mail217-ch1-R.bigfish.com (Postfix) with ESMTP id 676585000E1;
	Wed,  4 Jan 2012 04:39:25 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail217-ch1 (localhost.localdomain [127.0.0.1]) by mail217-ch1
	(MessageSwitch) id 1325651963339467_8273;
	Wed,  4 Jan 2012 04:39:23 +0000 (UTC)
Received: from CH1EHSMHS017.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail217-ch1.bigfish.com (Postfix) with ESMTP id
	4E1034A0043;	Wed,  4 Jan 2012 04:39:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS017.bigfish.com
	(10.43.70.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 04:39:23 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 22:39:22 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Garg Vakul-B16394 <B16394@freescale.com>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6AgAC57QD///6vEIAI3xkAgACpPHCAAGlGAP//m58AgABprID//5wTkAAM9JuA
Date: Wed, 4 Jan 2012 04:39:21 +0000
Message-ID: <CAEsOVNdBy7uAtJnMmOBLMobXg=XHfpsrgTvmDOz9=pszh7hHLg@mail.gmail.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
	<CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
	<1325591055.24417.330.camel@phil-desktop>
	<065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNe0j=Kq+irY3wnP46pbDywRtM1g-8jNnfsHRZXWuU0avA@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018AC3@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNeQ2zrS8dviqJ0TLfkwKdiEHPs_pZ=6KXvJcJ1h9ur2qw@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018ADB@039-SN2MPN1-011.039d.mgd.msft.net>
In-Reply-To: <065BBB7616BCE543832A2EF096986B94018ADB@039-SN2MPN1-011.039d.mgd.msft.net>
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
X-List-Received-Date: Wed, 04 Jan 2012 04:46:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <98FBE56367086946B684D3E73389089A@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2012 at 10:31 PM, Garg Vakul-B16394 <B16394@freescale.com> w=
rote:
> Hi Matthew
>
> I am not sure if I understood your point fully.
>
> I am suggesting to do below mentioned as suggested on valgrind page.
> http://valgrind.org/docs/manual/dist.readme-packagers.html
>
>
> "If you don't want to leave symbols on ld.so, alternatively you can have =
your distro install ld.so's debuginfo package by default, or make ld.so.deb=
uginfo be a requirement of your Valgrind RPM/DEB/whatever."

This is what I am suggest. If we include valgrind in an image and the
arch is powerpc or powerpc64, we need to include ld.so with debug
symbols by default. Otherwise valgrind will not work at all. This
seems like a reasonable thing to do for these two arches.

-M=



