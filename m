Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=VA3EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAqKK-0002Jn-P7
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:45:32 +0200
Received: from mail83-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 21:24:52 +0000
Received: from mail83-va3 (localhost.localdomain [127.0.0.1])	by
	mail83-va3-R.bigfish.com (Postfix) with ESMTP id 20EF9B5015B	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:24:52 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K179dN98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail83-va3 (localhost.localdomain [127.0.0.1]) by mail83-va3
	(MessageSwitch) id 1317677035780189_2270;
	Mon,  3 Oct 2011 21:23:55 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.243])	by
	mail83-va3.bigfish.com (Postfix) with ESMTP id 3C69B1B20198	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:22:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS027.bigfish.com
	(10.7.99.37) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 21:22:02 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 16:22:01 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate_clean() overzealous?
Thread-Index: AQHMghEWByaZDBNudkeuZ/nyp+AU3ZVrc7aAgAAA2YA=
Date: Mon, 3 Oct 2011 21:22:01 +0000
Message-ID: <CAEsOVNcaC-6de+=cN0pNRyOL4OyXBvObmzm=aitJ1PVe=EYoMw@mail.gmail.com>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
	<4E8A26AD.3060101@gmail.com>
In-Reply-To: <4E8A26AD.3060101@gmail.com>
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
X-List-Received-Date: Mon, 03 Oct 2011 21:45:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <160DBFD043AF7B4F90EC582EFFE82B0B@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 4:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> hmmm so we can not share sstate parts for two machines in same tmpdir ?

I'm not 100% sure I'm doing things properly but this is what I did:

$ bitbake pseudo-native
$ cp sstate-cache/* ~/sstate-cache
$ rm -rf tmp/
$ bitbake pseudo-native

Now sstate-cache is verified to be working.... then I changed machines and =
ran

$ cp ~/sstate-cache/* sstate-cache/
$ bitbake pseudo-native

bitbake starts rebuilding everything, and added -DDD I see SState
cache is missing.

-M=



