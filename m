Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S9hty-0001BC-Uc
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 20:05:55 +0100
Received: from mail157-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Mon, 19 Mar 2012 18:11:39 +0000
Received: from mail157-va3 (localhost [127.0.0.1])	by
	mail157-va3-R.bigfish.com (Postfix) with ESMTP id 739473000A4	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 18:11:39 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzzz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail157-va3 (localhost.localdomain [127.0.0.1]) by mail157-va3
	(MessageSwitch) id 1332180697879131_4174;
	Mon, 19 Mar 2012 18:11:37 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.253])	by
	mail157-va3.bigfish.com (Postfix) with ESMTP id C0760E0050	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 18:11:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Mar 2012 18:11:34 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Mon, 19 Mar 2012 13:11:38 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] how can i share the "native" content across multiple
	builds?
Thread-Index: AQHNBfu5vEvtXIofvUuRPyJwe2dArQ==
Date: Mon, 19 Mar 2012 18:11:37 +0000
Message-ID: <CAEsOVNfVZbizxP6qnmFXs6NqHN=qDimpqPy4W4i7oPZgocUm3w@mail.gmail.com>
References: <alpine.DEB.2.02.1203191406040.6960@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203191406040.6960@oneiric>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: how can i share the "native" content across multiple builds?
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
X-List-Received-Date: Mon, 19 Mar 2012 19:05:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8C6A43604D518347B6B571C1E636D034@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 1:07 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> =A0i'm sure i'm just missing where it's explained but given that i'm
> about to do a number of builds, how can i reuse all of the native
> content that's compiled for each build?

Use a common SSTATE_DIR and/or common TMPDIR

-M=



