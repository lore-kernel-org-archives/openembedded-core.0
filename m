Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sw4fv-0007Xb-JQ
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 07:07:19 +0200
Received: from mail210-ch1-R.bigfish.com (10.43.68.226) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.23; Tue, 31 Jul 2012 04:55:42 +0000
Received: from mail210-ch1 (localhost [127.0.0.1])	by
	mail210-ch1-R.bigfish.com (Postfix) with ESMTP id 77D3A60160	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 04:55:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail210-ch1 (localhost.localdomain [127.0.0.1]) by mail210-ch1
	(MessageSwitch) id 1343710541470035_16612;
	Tue, 31 Jul 2012 04:55:41 +0000 (UTC)
Received: from CH1EHSMHS025.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail210-ch1.bigfish.com (Postfix) with ESMTP id
	70FFD340047	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 04:55:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS025.bigfish.com
	(10.43.70.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 31 Jul 2012 04:55:41 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Mon, 30 Jul 2012 23:55:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/7] combo-layer improvements
Thread-Index: AQHNbti7WHLbKcBri0+SgXYmAHrtDQ==
Date: Tue, 31 Jul 2012 04:55:39 +0000
Message-ID: <CAEsOVNecqPuKZRGYCtDa9-L++rQb+JHNqtkgWvzpupUyC5jpPA@mail.gmail.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 0/7] combo-layer improvements
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
X-List-Received-Date: Tue, 31 Jul 2012 05:07:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <234CF94553DD8A4F94C3D101DCB0F838@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Is there a wiki or README regarding the usage for this?

-M

On Mon, Jul 30, 2012 at 7:06 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The following changes since commit ab0187c13b2b0a041bf3d98c3a53bd3f45a624=
de:
>
>   libxcb: Update for python-native changes (2012-07-30 16:53:49 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-=
fixes7
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dpaule/combo-layer-fixes7
>
> Paul Eggleton (7):
>   combo-layer: remove &> bashism
>   combo-layer: allow component pull to be done separately
>   combo-layer: ignore patch-* temp directories in dirty check
>   combo-layer: drop to a shell when apply fails during update
>   combo-layer: improve patch list handling and output
>   combo-layer: check that last_revision is valid
>   combo-layer: allow splitting out local config
>
>  scripts/combo-layer |  241 ++++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 192 insertions(+), 49 deletions(-)
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



