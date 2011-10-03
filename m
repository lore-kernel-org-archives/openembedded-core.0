Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAZBI-0006GX-0L
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 05:27:04 +0200
Received: from mail156-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 03:21:28 +0000
Received: from mail156-tx2 (localhost.localdomain [127.0.0.1])	by
	mail156-tx2-R.bigfish.com (Postfix) with ESMTP id 0DC5AD082AE	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 03:21:28 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail156-tx2 (localhost.localdomain [127.0.0.1]) by mail156-tx2
	(MessageSwitch) id 1317612021252471_30825;
	Mon,  3 Oct 2011 03:20:21 +0000 (UTC)
Received: from TX2EHSMHS045.bigfish.com (unknown [10.9.14.252])	by
	mail156-tx2.bigfish.com (Postfix) with ESMTP id A62963980C8	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 03:17:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS045.bigfish.com
	(10.9.99.145) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 03:17:59 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Sun, 2 Oct 2011 22:17:59 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problem building gcc-cross-initial with latest
	linaro patches.
Thread-Index: AQHMgXsN0hl4/dDp/kW44h365albOQ==
Date: Mon, 3 Oct 2011 03:17:59 +0000
Message-ID: <CAEsOVNd8rh+-KqYWd=Tngp1GfLavxb5FZgNEAHMc42iK5Gn-dw@mail.gmail.com>
References: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Problem building gcc-cross-initial with latest linaro patches.
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
X-List-Received-Date: Mon, 03 Oct 2011 03:27:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <51CCB762B479E842BCAA6C097DB17538@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 2, 2011 at 9:46 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
> | xterm Xt error: Can't open display:
> | xterm: =A0DISPLAY is not set
> | ERROR: Error executing a python function in /home/james/oe/sources/oe-c=
ore/meta/recipes-devtools/

Did you have the DISPLAY setup properly though? I noticed some issue
with this. Some point in the past an xterm would pop up properly, then
it stopped working and I could not longer get a TERMCMD prompt.

-M=



