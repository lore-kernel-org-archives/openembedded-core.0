Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLcRj-0000Oq-IN
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 16:09:43 +0100
Received: from mail141-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Nov 2011 15:03:21 +0000
Received: from mail141-tx2 (localhost.localdomain [127.0.0.1])	by
	mail141-tx2-R.bigfish.com (Postfix) with ESMTP id 0196D3A81D3	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 15:03:29 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail141-tx2 (localhost.localdomain [127.0.0.1]) by mail141-tx2
	(MessageSwitch) id 1320246207923225_30803;
	Wed,  2 Nov 2011 15:03:27 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.244])	by
	mail141-tx2.bigfish.com (Postfix) with ESMTP id DC0523C0052	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 15:03:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 2 Nov 2011 15:03:15 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Wed, 2 Nov 2011 10:03:30 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add new IMAGE_CLASSES variable for classes
	for image generation
Thread-Index: AQHMmPbOspSkoZVEsEev/ZH2YkccWZWZFH4AgAAB4gCAAOyRAA==
Date: Wed, 2 Nov 2011 15:03:30 +0000
Message-ID: <CAEsOVNeWr9A+8e62+A7YxSNwWzDJsyxqmOnKh=+EqG+4L04YjA@mail.gmail.com>
References: <1319786807-9015-1-git-send-email-msm@freescale.com>
	<4EB08F6B.5080009@intel.com>
	<CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
	<4EB09538.3010701@intel.com>
In-Reply-To: <4EB09538.3010701@intel.com>
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
X-List-Received-Date: Wed, 02 Nov 2011 15:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9E0A6CCABB0E8B4189FD35935AB75359@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2011 at 7:56 PM, Saul Wold <saul.wold@intel.com> wrote:
> Right I understood that part from before I think. =A0But why can't you ha=
ve
>
> IMAGE_CLASSES ?=3D "image_types"
>
> and then in the local.conf override that with
>
> IMAGE_CLASSES =3D "image_types_uboot"
>
> since image_types_uboot inherits image_types.
>
>> IMAGE_CLASSES +=3D "image_types_uboot" and leave the other bit as is...
>
> I have to admit I like this a little better with the possible thought of
> breaking up image_types a little more, keep more used ones in image_types=
,
> but move lesser used ones to their on .bbclass
>
> Them IMAGE_CLASSES truly is a list of image_type classes.

I think this is best, let the user override IMAGE_CLASSES to
(eventually) be able to add individual image_types_XYZ. Will send new
patch.

-M=



