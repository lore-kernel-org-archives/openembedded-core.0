Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAqBL-0002Cs-8c
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:36:15 +0200
Received: from mail170-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 21:30:37 +0000
Received: from mail170-tx2 (localhost.localdomain [127.0.0.1])	by
	mail170-tx2-R.bigfish.com (Postfix) with ESMTP id DCE4F14E0188	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:30:37 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail170-tx2 (localhost.localdomain [127.0.0.1]) by mail170-tx2
	(MessageSwitch) id 1317677424256387_3593;
	Mon,  3 Oct 2011 21:30:24 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.248])	by
	mail170-tx2.bigfish.com (Postfix) with ESMTP id 3654AB60054	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:30:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 21:30:23 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 16:30:10 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate_clean() overzealous?
Thread-Index: AQHMghEWByaZDBNudkeuZ/nyp+AU3ZVrdXoAgAABXAA=
Date: Mon, 3 Oct 2011 21:30:10 +0000
Message-ID: <CAEsOVNekGoGvTPOJKj1a+FDrYT-mWvF-T5AdcjQMEP6diDZhQQ@mail.gmail.com>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
	<4E8A2828.7090202@intel.com>
In-Reply-To: <4E8A2828.7090202@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 21:36:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <49E383A77E097E438749B5792E1ACA92@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 4:24 PM, Saul Wold <saul.wold@intel.com> wrote:
> I am not sure that's correct, since we use sstate with the Autobuilder an=
d
> it's shared across different hosts building different MACHINEs, we don't =
see
> the -natives getting build, do you have any examples?

I'm building with targets that are not upstream, so I can't comment on
the upstream variant. There are different TUNES though. I'm actually
currently in the process of looking at why sstate-cache is not being
reused.

Can you point at the autobuilder stuff? Is it going from
fsl-mpc8315e-rdb to and x86_64 target? Or between two x86_64 targets?

-M=



