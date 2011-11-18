Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRCLY-0004b4-Oj
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 01:30:24 +0100
Received: from mail77-am1-R.bigfish.com (10.3.201.240) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Fri, 18 Nov 2011 00:23:22 +0000
Received: from mail77-am1 (localhost [127.0.0.1])	by mail77-am1-R.bigfish.com
	(Postfix) with ESMTP id 820123200E4	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 00:23:20 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail77-am1 (localhost.localdomain [127.0.0.1]) by mail77-am1
	(MessageSwitch) id 1321575800337337_8903;
	Fri, 18 Nov 2011 00:23:20 +0000 (UTC)
Received: from AM1EHSMHS007.bigfish.com (unknown [10.3.201.248])	by
	mail77-am1.bigfish.com (Postfix) with ESMTP id 4D5A4400047	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 00:23:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS007.bigfish.com
	(10.3.207.107) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 18 Nov 2011 00:23:21 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Thu, 17 Nov 2011 18:23:54 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFQ==
Date: Fri, 18 Nov 2011 00:23:54 +0000
Message-ID: <CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Fri, 18 Nov 2011 00:30:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FFF6AEDE5C6A0740990531837B06DF88@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2011 at 6:08 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This enforces online use so won't work for read-only-fs.

Online use is sort of the point here - I think it should be configurable th=
ough.

> Please use SERIAL_CONSOLE value to write iniitab but supporting offline u=
se

Already done but sometimes we want to run the same root file system
with boards with 1 or 2 serial ports. So we need to dynamically add or
remove entries.

I'm mostly soliciting ideas for how we detect if a serial port is
actually present besides 'dmesg'

-M=



