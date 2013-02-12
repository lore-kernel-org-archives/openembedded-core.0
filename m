Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U5JrQ-0005pS-F3
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:41:40 +0100
Received: from mail208-co9-R.bigfish.com (10.236.132.240) by
	CO9EHSOBE023.bigfish.com (10.236.130.86) with Microsoft SMTP Server id
	14.1.225.23; Tue, 12 Feb 2013 17:25:39 +0000
Received: from mail208-co9 (localhost [127.0.0.1])	by
	mail208-co9-R.bigfish.com (Postfix) with ESMTP id 8E62E420171;
	Tue, 12 Feb 2013 17:25:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eIda00h1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275chz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail208-co9 (localhost.localdomain [127.0.0.1]) by mail208-co9
	(MessageSwitch) id 1360689937842858_19710;
	Tue, 12 Feb 2013 17:25:37 +0000 (UTC)
Received: from CO9EHSMHS023.bigfish.com (unknown [10.236.132.242])	by
	mail208-co9.bigfish.com (Postfix) with ESMTP id CB32E38004B;
	Tue, 12 Feb 2013 17:25:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS023.bigfish.com
	(10.236.130.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 12 Feb 2013 17:25:37 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.48]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Tue, 12 Feb 2013 17:25:36 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] libpfm4: exclude from world
Thread-Index: AQHOCURyZQoRGeL9O0GwN52OSM1rAJh2d5gAgAABtQA=
Date: Tue, 12 Feb 2013 17:25:36 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A87216C@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
	<51142E1F.1020404@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A87213C@039-SN1MPN1-002.039d.mgd.msft.net>
	<1360689548.4246.39.camel@phil-desktop.brightsign>
In-Reply-To: <1360689548.4246.39.camel@phil-desktop.brightsign>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpfm4: exclude from world
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
X-List-Received-Date: Tue, 12 Feb 2013 17:41:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <051BC1704D185445ADD086406D40FAC1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 11:19 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-02-12 at 17:14 +0000, McClintock Matthew-B29882 wrote:
>> We really need COMPATIBLE_ARCH here...
>
> Why can't you use COMPATIBLE_HOST?

Yes, that's what it's called ;)

-M=



