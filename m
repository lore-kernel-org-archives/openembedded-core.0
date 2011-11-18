Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRSk0-0001z6-Fh
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 19:00:46 +0100
Received: from mail96-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.22; Fri, 18 Nov 2011 17:53:39 +0000
Received: from mail96-tx2 (localhost.localdomain [127.0.0.1])	by
	mail96-tx2-R.bigfish.com (Postfix) with ESMTP id 2F6711100060	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 17:53:58 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail96-tx2 (localhost.localdomain [127.0.0.1]) by mail96-tx2
	(MessageSwitch) id 1321638838126503_20355;
	Fri, 18 Nov 2011 17:53:58 +0000 (UTC)
Received: from TX2EHSMHS029.bigfish.com (unknown [10.9.14.249])	by
	mail96-tx2.bigfish.com (Postfix) with ESMTP id 1A30972804E	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 17:53:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS029.bigfish.com
	(10.9.99.129) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 18 Nov 2011 17:53:37 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Fri, 18 Nov 2011 11:54:11 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFZWyq9EAgACjvoA=
Date: Fri, 18 Nov 2011 17:54:11 +0000
Message-ID: <CAEsOVNccy=xs1Fc6MieaanH9zvMFoqq7n-b7ipCXSNLUaVggLw@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<1321603664.5276.2.camel@lenovo.internal.reciva.com>
In-Reply-To: <1321603664.5276.2.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Fri, 18 Nov 2011 18:00:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7E1D98B37CE54D4E880AD6F475451D20@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 2:07 AM, Phil Blundell <philb@gnu.org> wrote:
> if [ true < /dev/ttyS0 ]; then

This test returns 0 if the serial node is in my device tree or not
(e.g. there or not).

-M=



