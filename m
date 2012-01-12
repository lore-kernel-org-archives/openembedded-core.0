Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlSyN-0005Fc-BU
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:18:15 +0100
Received: from mail132-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jan 2012 22:10:43 +0000
Received: from mail132-va3 (localhost [127.0.0.1])	by
	mail132-va3-R.bigfish.com (Postfix) with ESMTP id E4FFC100099	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 22:10:41 +0000 (UTC)
X-SpamScore: -14
X-BigFish: VS-14(zz9371I168aJ542M1432N98dKzz1202hzz8275bhz2dhc1ahc1bh2a8h668h839h8e2h8e3hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail132-va3 (localhost.localdomain [127.0.0.1]) by mail132-va3
	(MessageSwitch) id 132640618617836_29134;
	Thu, 12 Jan 2012 22:09:46 +0000 (UTC)
Received: from VA3EHSMHS007.bigfish.com (unknown [10.7.14.249])	by
	mail132-va3.bigfish.com (Postfix) with ESMTP id F16E9200049	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 22:09:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS007.bigfish.com
	(10.7.99.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jan 2012 22:09:46 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 12 Jan 2012 16:09:45 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core v6] linux-dtb: add multi-dtb build
	support and keep dtb in deploy cache package
Thread-Index: AQHM0Xbj3yUzrRvQx0Oa5t70lGJmEA==
Date: Thu, 12 Jan 2012 22:09:44 +0000
Message-ID: <CAEsOVNeX47ZiDRue8wfLErf4kaTSHWrJTL8rmm070VHMjimP6Q@mail.gmail.com>
References: <1326080274-1998-1-git-send-email-b19537@freescale.com>
	<4F0BCFEF.7000207@linux.intel.com>
	<CA452391058F6D4E9715FB2C29D9312A010CB0EA@039-SN2MPN1-023.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010CB0EA@039-SN2MPN1-023.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core v6] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Thu, 12 Jan 2012 22:18:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C8F8C252384A7A4890BB2B0BB93885CC@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 12:25 AM, Luo Zhenhua-B19537
<B19537@freescale.com> wrote:
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Tuesday, January 10, 2012 1:43 PM
>> > @@ -13,15 +13,21 @@ python __anonymous () {
>> > =A0 =A0 d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>> > =A0 }
>> >
>> I am not sure how this worked, I am seeing a problem with building rootf=
s.
>> |
>>
>> kernel-devicetree is needed by
>> kernel-modules-
>> 3.0.14+git1+6ae3d992cf546184010e87a0349810198f1d167c_1+58ffdb8000e34d2ba=
7c3ef278
>> b26680b0886e8b5-r2.mpc8315e_rdb
>>
>> This might be a PR Bump issue?
> [Luo Zhenhua-B19537] I didn't meet such issue during my build, do we need=
 to add a PR in linux-dtb.inc to solve this issue?

Zhenhua,

I would suggest testing without our 'meta-fsl-ppc' layer and see what happe=
ns.

-M=



