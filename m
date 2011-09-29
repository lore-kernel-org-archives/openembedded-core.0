Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9L3n-0002G1-DP
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:10:15 +0200
Received: from mail36-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:04:47 +0000
Received: from mail36-va3 (localhost.localdomain [127.0.0.1])	by
	mail36-va3-R.bigfish.com (Postfix) with ESMTP id 0745B3801DC	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:04:47 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail36-va3 (localhost.localdomain [127.0.0.1]) by mail36-va3
	(MessageSwitch) id 1317319486945258_15320;
	Thu, 29 Sep 2011 18:04:46 +0000 (UTC)
Received: from VA3EHSMHS023.bigfish.com (unknown [10.7.14.247])	by
	mail36-va3.bigfish.com (Postfix) with ESMTP id DF8FD31804D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:04:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS023.bigfish.com
	(10.7.99.33) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:04:46 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:04:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 02/16] bitbake pseudo wrapper: Don't base
	success on bitbake return code
Thread-Index: AQHMftJFHZc6be+MakSzrfBWySsSNg==
Date: Thu, 29 Sep 2011 18:04:46 +0000
Message-ID: <CAEsOVNdPjWvgaCL0EYUqh1XOriYMstGz3iLMG3Mamwd4sW9QQA@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-2-git-send-email-msm@freescale.com>
	<1317284813.12332.76.camel@ted>
In-Reply-To: <1317284813.12332.76.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 02/16] bitbake pseudo wrapper: Don't base success on bitbake return code
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
X-List-Received-Date: Thu, 29 Sep 2011 18:10:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DC9681BAD8E9524598D67C98E2937797@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 3:26 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 23:20 -0500, Matthew McClintock wrote:
>> bitbake does not return 0 when a build succeeds.
>
> Er, yes it does. If you're seeing something other than 0 its likely
> because you're seeing ERROR messages?

First off, this appears to have been fixed along the way. But I know I
was getting a message like:

[snip]
NOTE: Tasks Summary: Attempted 133 tasks of which 0 didn't need to be
rerun and 0 failed.

Then it would stop after building pseudo-native. Maybe we should add a
message to scripts/bitbake so we get an actual failure message when
this occurs? Also, are these errors relevant if we built psuedo-native
properly?

-M=



