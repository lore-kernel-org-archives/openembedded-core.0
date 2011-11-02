Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLPCQ-0004tb-Fb
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 02:01:02 +0100
Received: from mail6-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Nov 2011 00:54:41 +0000
Received: from mail6-ch1 (localhost.localdomain [127.0.0.1])	by
	mail6-ch1-R.bigfish.com (Postfix) with ESMTP id 4191A1B7823C	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 00:54:48 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail6-ch1 (localhost.localdomain [127.0.0.1]) by mail6-ch1
	(MessageSwitch) id 1320195288186485_12807;
	Wed,  2 Nov 2011 00:54:48 +0000 (UTC)
Received: from CH1EHSMHS015.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail6-ch1.bigfish.com (Postfix) with ESMTP id
	1C41A1028050 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 00:54:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS015.bigfish.com
	(10.43.70.15) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 2 Nov 2011 00:54:39 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 1 Nov 2011 19:54:52 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add new IMAGE_CLASSES variable for classes
	for image generation
Thread-Index: AQHMmPbOspSkoZVEsEev/ZH2YkccWZWZFH4AgAABWYA=
Date: Wed, 2 Nov 2011 00:54:52 +0000
Message-ID: <CAEsOVNc0v+Kv2pc89mahG6P2y2QW=B+AytYm7pzi2+uGwM5Fug@mail.gmail.com>
References: <1319786807-9015-1-git-send-email-msm@freescale.com>
	<4EB08F6B.5080009@intel.com>
	<CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
In-Reply-To: <CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 02 Nov 2011 01:01:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <691F1744113F004893AF9F6EF1142004@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2011 at 7:50 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> IMAGE_CLASSES +=3D "image_types_uboot" and leave the other bit as is...

Except it seems I have to do this:

IMAGE_CLASSES_append =3D " image_types_uboot"

if I want the value to actually be appended.

-M=



