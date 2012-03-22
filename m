Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAjcs-00032z-2S
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:08:30 +0100
Received: from mail65-am1-R.bigfish.com (10.3.201.238) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Mar 2012 14:44:24 +0000
Received: from mail65-am1 (localhost [127.0.0.1])	by mail65-am1-R.bigfish.com
	(Postfix) with ESMTP id CC14F2C0256;
	Thu, 22 Mar 2012 14:44:23 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371Ic89bh1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail65-am1 (localhost.localdomain [127.0.0.1]) by mail65-am1
	(MessageSwitch) id 1332427461923470_27359;
	Thu, 22 Mar 2012 14:44:21 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.225])	by
	mail65-am1.bigfish.com (Postfix) with ESMTP id DD4EE2400A4;
	Thu, 22 Mar 2012 14:44:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Mar 2012 14:44:20 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 22 Mar 2012 09:44:26 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] busybox: enable eject
Thread-Index: AQHNCDpHGoDKjA/760+F5Z0j4laMjQ==
Date: Thu, 22 Mar 2012 14:44:26 +0000
Message-ID: <CAEsOVNcmrEy4hqE4W6EEuw20yDXt=z5SVr3fn_5Rkwd1_zDEpg@mail.gmail.com>
References: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
	<1332414627-6512-2-git-send-email-schnitzeltony@googlemail.com>
	<1376344.pbiv3OAoml@helios>
In-Reply-To: <1376344.pbiv3OAoml@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] busybox: enable eject
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
X-List-Received-Date: Thu, 22 Mar 2012 15:08:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1C777B18091ED043A40BEC652E961D26@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 9:41 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 22 March 2012 12:10:27 Andreas M=FCller wrote:
>> In xfce-environment ejecting USB-memory stick caused:
>> Error starting job: Failed to execute child process "eject" (No such fil=
e or
>> directory)
>
> Not to say we shouldn't merge this, but I'm concerned if this continues w=
e
> could end up with busybox in the default configuration creeping up in siz=
e as
> more and more features get enabled.
>
> Where do we draw the line?

Perhaps it should be the default settings? We always have 'bitbake -c
menuconfig busybox' for the "small" cases?

-M=



