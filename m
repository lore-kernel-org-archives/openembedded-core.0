Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRELo-0000ym-EJ
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 03:38:48 +0100
Received: from mail159-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 18 Nov 2011 02:31:45 +0000
Received: from mail159-tx2 (localhost.localdomain [127.0.0.1])	by
	mail159-tx2-R.bigfish.com (Postfix) with ESMTP id 8D65519401D7	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 02:32:05 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail159-tx2 (localhost.localdomain [127.0.0.1]) by mail159-tx2
	(MessageSwitch) id 1321583524406759_32172;
	Fri, 18 Nov 2011 02:32:04 +0000 (UTC)
Received: from TX2EHSMHS026.bigfish.com (unknown [10.9.14.244])	by
	mail159-tx2.bigfish.com (Postfix) with ESMTP id 56B2FE90055	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 02:32:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS026.bigfish.com
	(10.9.99.126) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 18 Nov 2011 02:31:44 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Thu, 17 Nov 2011 20:32:17 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFZWyK8aAgAAiNgA=
Date: Fri, 18 Nov 2011 02:32:17 +0000
Message-ID: <CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Nov 2011 02:38:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3369ABEE1FDEFD4795DAABF3BABD994C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2011 at 6:29 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> I see your point but add more "must be online" requirements is wrong
> IMO.

It must be online though in this case?

> This could be done with a specific package that could mangle the
> image at first boot if really need but doing it by default on oe-core
> seems the wrong way.

Isn't that exactly what this is doing?

Easy enough to add this to a separate recipe or bbapends elsewhere if
there is disagreement.

-M=



