Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TER0M-0001VQ-1t
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 22:36:19 +0200
Received: from mail18-db3-R.bigfish.com (10.3.81.233) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Sep 2012 19:53:29 +0000
Received: from mail18-db3 (localhost [127.0.0.1])	by mail18-db3-R.bigfish.com
	(Postfix) with ESMTP id 08E2960165;
	Wed, 19 Sep 2012 19:53:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail18-db3 (localhost.localdomain [127.0.0.1]) by mail18-db3
	(MessageSwitch) id 1348084407187014_9393;
	Wed, 19 Sep 2012 19:53:27 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.251])	by
	mail18-db3.bigfish.com (Postfix) with ESMTP id 20F4F380069;
	Wed, 19 Sep 2012 19:53:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Sep 2012 19:53:21 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Wed, 19 Sep 2012 14:53:11 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] multilib errors
Thread-Index: AQHNlg+6OMS/xOqYcUClQ5N5275vd5eR1GKAgABAL4A=
Date: Wed, 19 Sep 2012 19:53:11 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68F8F1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
	<224680354.d9icDWC9tY@helios>
In-Reply-To: <224680354.d9icDWC9tY@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 20:36:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9584F9999D4B7B4AAC8B6CAC4AA2C825@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 6:03 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I have seen these errors as well. It definitely should be doing these che=
cks

Even for lib64-nativesdk-libtool? It's doing multilib processing on
nativesdk recipes?

-M=



