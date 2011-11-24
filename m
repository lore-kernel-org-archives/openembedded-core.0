Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=VA3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTjGP-0006i5-H6
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:03:33 +0100
Received: from mail48-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Nov 2011 23:56:16 +0000
Received: from mail48-va3 (localhost [127.0.0.1])	by mail48-va3-R.bigfish.com
	(Postfix) with ESMTP id 6154A600255;
	Thu, 24 Nov 2011 23:56:56 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail48-va3 (localhost.localdomain [127.0.0.1]) by mail48-va3
	(MessageSwitch) id 1322179016307283_23617;
	Thu, 24 Nov 2011 23:56:56 +0000 (UTC)
Received: from VA3EHSMHS010.bigfish.com (unknown [10.7.14.236])	by
	mail48-va3.bigfish.com (Postfix) with ESMTP id 3AA076E0227;
	Thu, 24 Nov 2011 23:56:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS010.bigfish.com
	(10.7.99.20) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 24 Nov 2011 23:56:14 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 24 Nov 2011 17:56:56 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqwS+vCtx6Pv4A0Kv3YkijylUDw==
Date: Thu, 24 Nov 2011 23:56:56 +0000
Message-ID: <CAEsOVNe6ywzXK2b483FA-2T3A8x6-OwQXWKnsdMVWq5QTKh7sw@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
In-Reply-To: <1322041226-10075-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Fri, 25 Nov 2011 00:03:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <86C7C2027A4A9F45AA2ED709AEEE0928@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 3:40 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> +# we also add this to the PV so its clear in filenames
> +# that this is arch specific even though it's labeled as
> +# a target package
> +PV .=3D "+${BUILD_ARCH_EXPANDED}"

Seems like based on discussion this should be the following instead:

PN .=3D "-{BUILD_ARCH}-${TARGET_ARCH}"

-M=



