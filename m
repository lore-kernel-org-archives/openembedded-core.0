Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXHwh-0003RO-5O
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 20:41:55 +0100
Received: from mail56-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Sun, 4 Dec 2011 19:35:09 +0000
Received: from mail56-am1 (localhost [127.0.0.1])	by mail56-am1-R.bigfish.com
	(Postfix) with ESMTP id B2C841003CC	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:35:09 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail56-am1 (localhost.localdomain [127.0.0.1]) by mail56-am1
	(MessageSwitch) id 1323027309650209_14011;
	Sun,  4 Dec 2011 19:35:09 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.252])	by
	mail56-am1.bigfish.com (Postfix) with ESMTP id 9BAE864007B	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:35:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 4 Dec 2011 19:35:10 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Sun, 4 Dec 2011 13:35:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] do_populate_lic_setscene when building LSB on edison
Thread-Index: AQHMsrTI+sIH3mCgFEC3XmCMc1OGDZXMdg2AgAAAqgA=
Date: Sun, 4 Dec 2011 19:35:07 +0000
Message-ID: <CAEsOVNdFw+8Wis4jO8TT5zkzs=j4p7NWF1HpZhyzfjLBEMWvBA@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
	<CAPhnLPBwuKWbVXrk9feYzcxQOogtif7As+BgFqT-s1njDtJSKA@mail.gmail.com>
In-Reply-To: <CAPhnLPBwuKWbVXrk9feYzcxQOogtif7As+BgFqT-s1njDtJSKA@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Dec 2011 19:41:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BEAE62453ECC2540BED1C05369EDCC94@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 4, 2011 at 1:32 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> On Sun, Dec 4, 2011 at 10:44 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> Can anyone comment if this issue has been resolved on master? It's
>> very random which package it occurs on, it only seems to happen when
>> building the LSB target, and it also appears to happen on my CentOS 5
>> box and not my Ubuntu box (at least less often)... sometimes it
>> happens only on one package in a build, sometimes it's 5-10
>> packages...
>>
>
> I haven't run across this. Is this from a clean sstate-cache? I'm assumin=
g
> this is from an older release (as bind is now at 9.8.1).

This is on our last release (edison, 1.1) from a full sstate-cache
rebuild. It's an sstate-cache issue...

-M=



