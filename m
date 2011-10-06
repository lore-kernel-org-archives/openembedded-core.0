Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBc61-0006fJ-3d
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 02:45:57 +0200
Received: from mail149-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.22; Thu, 6 Oct 2011 00:25:15 +0000
Received: from mail149-va3 (localhost.localdomain [127.0.0.1])	by
	mail149-va3-R.bigfish.com (Postfix) with ESMTP id 793E1998088	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 00:25:15 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail149-va3 (localhost.localdomain [127.0.0.1]) by mail149-va3
	(MessageSwitch) id 1317860715402849_6948;
	Thu,  6 Oct 2011 00:25:15 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.252])	by
	mail149-va3.bigfish.com (Postfix) with ESMTP id 599DF90050	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 00:25:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 6 Oct 2011 00:25:15 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 19:25:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/6] Add new IMAGE_CLASSES variable for
	classes for image generation
Thread-Index: AQHMg7FtYqexAWTY0EGfrD7QF392mpVuwFwAgAAIzQA=
Date: Thu, 6 Oct 2011 00:25:14 +0000
Message-ID: <CAEsOVNdG_O9ssO1HFsBwprmLyN=HjkyqrUg-Bp42aub7_SMhCQ@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-3-git-send-email-msm@freescale.com>
	<CAEsOVNeNerChRP+bA8D354J2M+og5TPkWO9e_83rNLLbRZS4Jw@mail.gmail.com>
	<1317858811.6398.36.camel@ted>
In-Reply-To: <1317858811.6398.36.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/6] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Thu, 06 Oct 2011 00:45:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <734C7012F4F69F45B3CBBB5ED074AB8F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 6:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> So this does not work properly, I thought I tested it but... need to
>> do something like this:
>>
>> IMAGE_CLASSES =3D "image_types"
>> inherit ${IMAGE_CLASSES}
>>
>> then let the user added via
>>
>> IMAGE_CLASESS +=3D "image_types_uboot"
>>
>> then there will always be something that is expanded to avoid this issue=
:
>>
>> ERROR: Could not inherit file classes/$IMAGE_CLASSES.bbclass
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| ETA: =A0--:--:-=
-
>> ERROR: Command execution failed: Exited with 1
>
> Its not expanding the variables? :/ This happened even when
> IMAGE_CLASSES had a value before the inherit?

If I added a IMAGE_CLASSES to something other than "" it worked fine.
If I left it as "" it tried to expand the blank var and look in the
BBPATHS or wherever it looks for classes for an unnamed ".bbclass"
file.

-M=



