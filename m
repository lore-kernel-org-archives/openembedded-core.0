Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWGGm-0006zq-8h
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 00:42:24 +0100
Received: from mail62-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.22; Thu, 1 Dec 2011 23:35:38 +0000
Received: from mail62-ch1 (localhost [127.0.0.1])	by mail62-ch1-R.bigfish.com
	(Postfix) with ESMTP id CF335140635	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 23:35:38 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail62-ch1 (localhost.localdomain [127.0.0.1]) by mail62-ch1
	(MessageSwitch) id 1322782536773829_9203;
	Thu,  1 Dec 2011 23:35:36 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail62-ch1.bigfish.com (Postfix) with ESMTP id
	AEBD82C0046 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 23:35:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS021.bigfish.com
	(10.43.70.21) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 1 Dec 2011 23:35:36 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 1 Dec 2011 17:35:38 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] sstate.bbclass: add option to use alternate
	compression in lieu of gzip
Thread-Index: AQHMsIHubSj7nhLymk2r8DI/1uMsfg==
Date: Thu, 1 Dec 2011 23:35:37 +0000
Message-ID: <CAEsOVNe8RPoKqokyxoJTFQBm=g+EZ+0LkCmsnhBDMQ0uemepcA@mail.gmail.com>
References: <1322782393-31385-1-git-send-email-msm@freescale.com>
In-Reply-To: <1322782393-31385-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] sstate.bbclass: add option to use alternate compression in lieu of gzip
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
X-List-Received-Date: Thu, 01 Dec 2011 23:42:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DD1D67E03A054745B59B8121791A05A2@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 5:33 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> The savings can be substantial. The resutls below are for a
> core-image-minimal type image:
>
> gzip: =A0 =A01.1G =A0 sstate-cache
> xz =A0 =A0 =A0 714M =A0 sstate-cache
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>

Ugh, ignore this it does not actually work...

-M=



