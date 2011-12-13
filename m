Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RacEb-0008Bk-Tk
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 00:58:10 +0100
Received: from mail196-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 13 Dec 2011 23:51:11 +0000
Received: from mail196-va3 (localhost [127.0.0.1])	by
	mail196-va3-R.bigfish.com (Postfix) with ESMTP id C5EE0240075	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 23:51:11 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail196-va3 (localhost.localdomain [127.0.0.1]) by mail196-va3
	(MessageSwitch) id 1323820271381504_12859;
	Tue, 13 Dec 2011 23:51:11 +0000 (UTC)
Received: from VA3EHSMHS008.bigfish.com (unknown [10.7.14.242])	by
	mail196-va3.bigfish.com (Postfix) with ESMTP id 5687B3A0139	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 23:51:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS008.bigfish.com
	(10.7.99.18) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 13 Dec 2011 23:51:11 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.28]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 13 Dec 2011 17:51:09 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] inheirt multi bbclass using variable
Thread-Index: AQHMuF709y+usLyeVkKtYW4/7KTlY5XXuMWAgAAA0oCAABAgAIADDjAA
Date: Tue, 13 Dec 2011 23:51:08 +0000
Message-ID: <CAEsOVNdtvufP4GxQ7ti4EiXrBuQcQNHqKPr6s64U1TMkU3qTpg@mail.gmail.com>
References: <1323419740.1294.70.camel@localhost.localdomain>
	<CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
	<CABcZANnsd0srVep_NSsuFZrGrF2KZocP1EUw3U+fMtTMPpWfvg@mail.gmail.com>
	<CAEsOVNf1qaYLPhMfJvR=0WCgwjFa85DWTyqQ6hb=x15ZYuDmYA@mail.gmail.com>
	<CAMKF1soD62qmg6yQsyQQHWndAjADzntz-J3UcUkvDHcrvabZgA@mail.gmail.com>
In-Reply-To: <CAMKF1soD62qmg6yQsyQQHWndAjADzntz-J3UcUkvDHcrvabZgA@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2011 23:58:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0039A958B982F94C9B173BF70F50273E@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2011 at 7:11 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> To clarify, my case was more like this:
>>
>> IMAGE_EXTRA_CLASSES =3D "${SOME_CFG_VAR}"
>> inherit some_class.bbclass ${IMAGE_EXTRA_CLASSES}
>
> I think you are expecting C like behavour where variables/macros are
> expanded before keywords

Does that mean this would work:

IMAGE_EXTRA_CLASSES :=3D "${SOME_CFG_VAR}"
inherit some_class.bbclass ${IMAGE_EXTRA_CLASSES}

I just assumed if ${IMAGE_EXTRA_CLASSES} was blank the above inherit would =
work.

-M=



