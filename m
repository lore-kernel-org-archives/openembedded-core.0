Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXHxJ-0003aU-Ha
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 20:42:33 +0100
Received: from mail189-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Sun, 4 Dec 2011 19:35:47 +0000
Received: from mail189-ch1 (localhost [127.0.0.1])	by
	mail189-ch1-R.bigfish.com (Postfix) with ESMTP id A4E6F62023E	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:35:47 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail189-ch1 (localhost.localdomain [127.0.0.1]) by mail189-ch1
	(MessageSwitch) id 1323027345585252_26073;
	Sun,  4 Dec 2011 19:35:45 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail189-ch1.bigfish.com (Postfix) with ESMTP id
	899D020117 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:35:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 4 Dec 2011 19:35:41 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Sun, 4 Dec 2011 13:35:40 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] do_populate_lic_setscene when building LSB on edison
Thread-Index: AQHMsrTI+sIH3mCgFEC3XmCMc1OGDZXMdg2AgAAAqgCAAAAnAA==
Date: Sun, 4 Dec 2011 19:35:39 +0000
Message-ID: <CAEsOVNd6g1Vn6TgzJ1ppPYY5vq0T4F=EXdDqtQB7L5C1z28VJg@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
	<CAPhnLPBwuKWbVXrk9feYzcxQOogtif7As+BgFqT-s1njDtJSKA@mail.gmail.com>
	<CAEsOVNdFw+8Wis4jO8TT5zkzs=j4p7NWF1HpZhyzfjLBEMWvBA@mail.gmail.com>
In-Reply-To: <CAEsOVNdFw+8Wis4jO8TT5zkzs=j4p7NWF1HpZhyzfjLBEMWvBA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: do_populate_lic_setscene when building LSB on edison
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
X-List-Received-Date: Sun, 04 Dec 2011 19:42:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <94CE470BC7E07D429D09986D68968263@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 4, 2011 at 1:34 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> On Sun, Dec 4, 2011 at 1:32 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>> On Sun, Dec 4, 2011 at 10:44 AM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>
>>> Can anyone comment if this issue has been resolved on master? It's
>>> very random which package it occurs on, it only seems to happen when
>>> building the LSB target, and it also appears to happen on my CentOS 5
>>> box and not my Ubuntu box (at least less often)... sometimes it
>>> happens only on one package in a build, sometimes it's 5-10
>>> packages...
>>>
>>
>> I haven't run across this. Is this from a clean sstate-cache? I'm assumi=
ng
>> this is from an older release (as bind is now at 9.8.1).
>
> This is on our last release (edison, 1.1) from a full sstate-cache
> rebuild. It's an sstate-cache issue...

I'll add that it's edison with a handful of fixes pulled from master.
Looking more like our 1.1.1 release.

-M=



