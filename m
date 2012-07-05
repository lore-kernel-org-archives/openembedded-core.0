Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SmqYe-0005v4-3J
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:13:40 +0200
Received: from mail73-co1-R.bigfish.com (10.243.78.251) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jul 2012 18:00:29 +0000
Received: from mail73-co1 (localhost [127.0.0.1])	by mail73-co1-R.bigfish.com
	(Postfix) with ESMTP id F3491D00253	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 18:00:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail73-co1 (localhost.localdomain [127.0.0.1]) by mail73-co1
	(MessageSwitch) id 1341511227460576_16796;
	Thu,  5 Jul 2012 18:00:27 +0000 (UTC)
Received: from CO1EHSMHS003.bigfish.com (unknown [10.243.78.239])	by
	mail73-co1.bigfish.com (Postfix) with ESMTP id 64F4E860044	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 18:00:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS003.bigfish.com
	(10.243.66.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 18:00:27 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Thu, 5 Jul 2012 13:02:31 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Generating a movable SDK
Thread-Index: AQHNWthY4+vCdGfTDkO3AhEFgoLeHA==
Date: Thu, 5 Jul 2012 18:02:31 +0000
Message-ID: <CAEsOVNe_OiSH8N9MyPG7_m2ciWiv=TshttamtdWbJ=m5-eJu+w@mail.gmail.com>
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
	<CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
	<4FE167B4.3020802@gmail.com> <4FF3E606.7000001@gmail.com>
In-Reply-To: <4FF3E606.7000001@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Generating a movable SDK
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
X-List-Received-Date: Thu, 05 Jul 2012 18:13:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8BE15967D9274B468980A482F54ED07A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 4, 2012 at 1:43 AM, Tasslehoff Kjappfot <tasskjapp@gmail.com> w=
rote:
> On 06/20/2012 08:03 AM, Tasslehoff Kjappfot wrote:
>>
>> On 06/19/2012 10:33 PM, Khem Raj wrote:
>>>
>>>
>>>
>>> On Tuesday, June 19, 2012, Steve English <steve.english@navetas.com
>>> <mailto:steve.english@navetas.com>> wrote:
>>>  > Hi,
>>>  > I've generated a cross compiling ARM SDK
>>> (angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works
>>> great if installed in /usr/local/oecore-x86_64. I would like to move
>>> these binaries and run them from under my home directory (on this and
>>> other host machines).
>>>  >
>>>  > I can tweak the PATH and use --sysroot where appropriate, but the EL=
F
>>> binaries themselves specify a loader of
>>>
>>> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux=
-x86-64.so.2
>>>
>>> in their .interp header. Is it possible to generate an SDK that uses th=
e
>>> standard host loader, or at least uses a relative path for the built
>>> loader?
>>>
>>>
>>> Sdk is not install time relocatable yet there is a feature enhancement
>>> request in yo to bugzilla for the same
>>>
>> That request is mine, I think. I have gotten around this by making
>> /usr/local/oecore-i686 a symlink to where I want to keep the toolchain
>> (in a vcs). Works like a charm.
>>
>> - Tasslehoff
>
>
> But now I wish the sdk was relocatable again.
>
> As I said we have the sdk in our vcs, and a symlink in /usr/local to make
> the toolchain binaries happy. We have a build server that does continous
> builds, and she has multiple trees checked out, so the symlink-approach i=
s
> not ideal.
>
> Any clever workaround for this (or even better, a fix to make the sdk
> relocatable)?

chroot jail could work for you... a bit more effort though.

-M


>
>
> - Tasslehoff
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



