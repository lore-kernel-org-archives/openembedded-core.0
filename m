Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0zJz-0006sR-4N
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:52:43 +0100
Received: from mail84-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Feb 2012 17:44:19 +0000
Received: from mail84-tx2 (localhost [127.0.0.1])	by mail84-tx2-R.bigfish.com
	(Postfix) with ESMTP id B2D60160626	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:44:19 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(zz9371I936eK1102K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail84-tx2 (localhost.localdomain [127.0.0.1]) by mail84-tx2
	(MessageSwitch) id 1330105457476029_16030;
	Fri, 24 Feb 2012 17:44:17 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.250])	by
	mail84-tx2.bigfish.com (Postfix) with ESMTP id 6F73C14004B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:44:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Feb 2012 17:44:12 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 24 Feb 2012 11:44:11 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Luo Zhenhua-B19537
	<B19537@freescale.com>
Thread-Topic: [OE-core] Using external source trees with OE-Core
Thread-Index: AQHM8xUmFjkmqUF3KU6/yhONOVV3h5ZMs/gAgAACLYA=
Date: Fri, 24 Feb 2012 17:44:11 +0000
Message-ID: <CAEsOVNdSH5W5=MhuWhdofC0X8nDCqQUnmooi919_3Ue8jG8tAw@mail.gmail.com>
References: <1330088135.32006.14.camel@ted>
	<CAEsOVNe0Fe5qyzYWK3Tf5P1=oYMnB3n-LoOVdE5bk-EkHdPf3A@mail.gmail.com>
	<1330104962.8430.4.camel@ted>
In-Reply-To: <1330104962.8430.4.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 17:52:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <02415B928C897E4988FBA2AEBEE34176@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 11:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-02-24 at 16:55 +0000, McClintock Matthew-B29882 wrote:
>> We do something very similar to this currently. I've pushed what we
>> are using here:
>>
>> https://github.com/mattsm/meta-fsl-local-sdk
>>
>> It would be nice to consolidate all the required bits upstream... =3D)
>
> I would warn you that there is code in there that is clearly
> inappropriate for OE-Core.

No surprise at all...

> It would also explain that bug report you sent me which referenced
> "do_populate_sysroot_post" and I asked what local modifications you had
> and you said "none" ;-).

I don't use this... we use this for internal developers... so the
error was not using this...

> Does the patch in this thread take care of your needs regarding the
> srctree and clean classes?

Not sure, hoping Zhenhua can take a look.

> For cleanobjs, I can see advantages in merging something like that into
> the core...

....

-M=



