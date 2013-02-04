Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2WrJ-0006kp-QL
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 01:58:04 +0100
Received: from mail153-co9-R.bigfish.com (10.236.132.241) by
	CO9EHSOBE019.bigfish.com (10.236.130.82) with Microsoft SMTP Server id
	14.1.225.23; Mon, 4 Feb 2013 23:56:54 +0000
Received: from mail153-co9 (localhost [127.0.0.1])	by
	mail153-co9-R.bigfish.com (Postfix) with ESMTP id 2E08660206;
	Mon,  4 Feb 2013 23:56:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 12
X-BigFish: VS12(z49a8vz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail153-co9 (localhost.localdomain [127.0.0.1]) by mail153-co9
	(MessageSwitch) id 1360022212715947_20095;
	Mon,  4 Feb 2013 23:56:52 +0000 (UTC)
Received: from CO9EHSMHS009.bigfish.com (unknown [10.236.132.254])	by
	mail153-co9.bigfish.com (Postfix) with ESMTP id AC2FF22005C;
	Mon,  4 Feb 2013 23:56:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS009.bigfish.com
	(10.236.130.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 4 Feb 2013 23:56:52 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Mon, 4 Feb 2013 23:56:51 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use
	CC to form KERNEL_CC
Thread-Index: AQHOAxQgkNK9RzoTv0aD6xHtf1I1v5hqThAAgAASRgA=
Date: Mon, 4 Feb 2013 23:56:50 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A86D8D5@039-SN1MPN1-002.039d.mgd.msft.net>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A86C5F5@039-SN1MPN1-002.039d.mgd.msft.net>
	<CAMKF1sojwK+mcrsk1QooHSr6cPCO8XOfr+okpUN1q6e1DYEwqA@mail.gmail.com>
In-Reply-To: <CAMKF1sojwK+mcrsk1QooHSr6cPCO8XOfr+okpUN1q6e1DYEwqA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 05 Feb 2013 00:58:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E6698DC50371354F89A8B271D88223AC@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2013 at 4:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 4, 2013 at 12:13 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>> +
>>> +KERNEL_CC =3D "${CC} ${HOST_CC_KERNEL_ARCH}"
>>
>> Why change to ${CC} from "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX}?
>>
>> It breaks some kernel builds we have...
>
> you did not tell what exactly breaks.

Shame on me. Our kernel gets built wrong if we pass the extra -march
or -mtune to the compiler during the kernel build. It might be
exposing another issue but not sure exactly. I need to dig up a log so
I can send that over later. Here was my fix:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/m=
aster&id=3Df008446117106831585ed371453d1f052cdfd9eb

-M=



