Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXxT0-0004Wh-2j
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:02:02 +0100
Received: from mail51-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Dec 2011 15:55:14 +0000
Received: from mail51-ch1 (localhost [127.0.0.1])	by mail51-ch1-R.bigfish.com
	(Postfix) with ESMTP id 21EE61C027A	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 15:55:14 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail51-ch1 (localhost.localdomain [127.0.0.1]) by mail51-ch1
	(MessageSwitch) id 132318691464327_20622;
	Tue,  6 Dec 2011 15:55:14 +0000 (UTC)
Received: from CH1EHSMHS017.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail51-ch1.bigfish.com (Postfix) with ESMTP id
	0A233200045 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 15:55:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS017.bigfish.com
	(10.43.70.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Dec 2011 15:55:12 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 6 Dec 2011 09:55:11 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] sstate.bbclass: add option to use
	alternate compression in lieu of gzip
Thread-Index: AQHMtC9voGJr1bmO1EaKUiEnkw7t8g==
Date: Tue, 6 Dec 2011 15:55:11 +0000
Message-ID: <CAEsOVNdDP0oEUi3HbrgTZTGbE4r1DS53gE66wR6kXs5-MkUX6Q@mail.gmail.com>
References: <CAEsOVNe8RPoKqokyxoJTFQBm=g+EZ+0LkCmsnhBDMQ0uemepcA@mail.gmail.com>
	<1322846687-13057-1-git-send-email-msm@freescale.com>
In-Reply-To: <1322846687-13057-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] sstate.bbclass: add option to use alternate compression in lieu of gzip
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
X-List-Received-Date: Tue, 06 Dec 2011 16:02:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D8D706A70AAD6A4CBE66F4A2F7E7312B@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 11:24 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -czf ${SSTATE_PKG} *
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -${SSTATE_PKG_TAROPT}cf ${SSTATE_PKG} *
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cz --file=3D${SSTATE_PKG} --files-from=
=3D/dev/null
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -${SSTATE_PKG_TAROPT}c --file=3D${SSTAT=
E_PKG} --files-from=3D/dev/null
> =A0 =A0 =A0 =A0fi
>
> =A0 =A0 =A0 =A0cd ${WORKDIR}
> @@ -463,7 +466,7 @@ sstate_create_package () {
> =A0sstate_unpack_package () {
> =A0 =A0 =A0 =A0mkdir -p ${SSTATE_INSTDIR}
> =A0 =A0 =A0 =A0cd ${SSTATE_INSTDIR}
> - =A0 =A0 =A0 tar -xvzf ${SSTATE_PKG}
> + =A0 =A0 =A0 tar -${SSTATE_PKG_TAROPT}xvf =A0${SSTATE_PKG}

I'm going to respin this to look more like:

tar -cvf - | "$SSTATE_PKG_TARCOMPRESSION"

such that we don't depend on newer versions of tar for specific types
of compression.

-M=



