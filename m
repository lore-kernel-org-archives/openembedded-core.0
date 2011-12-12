Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RZtdg-0007SP-74
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 01:21:04 +0100
Received: from mail62-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 12 Dec 2011 00:13:59 +0000
Received: from mail62-ch1 (localhost [127.0.0.1])	by mail62-ch1-R.bigfish.com
	(Postfix) with ESMTP id BB27C140295	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 00:13:59 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail62-ch1 (localhost.localdomain [127.0.0.1]) by mail62-ch1
	(MessageSwitch) id 1323648837462816_25106;
	Mon, 12 Dec 2011 00:13:57 +0000 (UTC)
Received: from CH1EHSMHS007.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail62-ch1.bigfish.com (Postfix) with ESMTP id
	6B9FE2C0047 for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 00:13:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS007.bigfish.com
	(10.43.70.7) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 12 Dec 2011 00:13:52 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.28]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sun, 11 Dec 2011 18:13:52 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] inheirt multi bbclass using variable
Thread-Index: AQHMuF709y+usLyeVkKtYW4/7KTlY5XXuMWAgAAA0oA=
Date: Mon, 12 Dec 2011 00:13:52 +0000
Message-ID: <CAEsOVNf1qaYLPhMfJvR=0WCgwjFa85DWTyqQ6hb=x15ZYuDmYA@mail.gmail.com>
References: <1323419740.1294.70.camel@localhost.localdomain>
	<CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
	<CABcZANnsd0srVep_NSsuFZrGrF2KZocP1EUw3U+fMtTMPpWfvg@mail.gmail.com>
In-Reply-To: <CABcZANnsd0srVep_NSsuFZrGrF2KZocP1EUw3U+fMtTMPpWfvg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: inheirt multi bbclass using variable
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
X-List-Received-Date: Mon, 12 Dec 2011 00:21:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AC9EF3C2E55EF649849168B05F5B6A88@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2011 at 6:10 PM, Chris Larson <clarson@kergoth.com> wrote:
>> There are some issues with inherit. I've seen a similar issue with:
>>
>> IMAGE_EXTRA_CLASSES =3D ""
>> inherit ${IMAGE_EXTRA_CLASSES}
>>
>> ERROR: Could not inherit file classes/.bbclass
>
> To be fair, in this case, it's doing exactly what you told it to do --
> inherit an empty string.

To clarify, my case was more like this:

IMAGE_EXTRA_CLASSES =3D "${SOME_CFG_VAR}"
inherit some_class.bbclass ${IMAGE_EXTRA_CLASSES}

-M=



