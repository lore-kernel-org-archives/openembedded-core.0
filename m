Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TP1tD-0008D7-55
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 04:00:43 +0200
Received: from mail107-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Fri, 19 Oct 2012 01:47:22 +0000
Received: from mail107-ch1 (localhost [127.0.0.1])	by
	mail107-ch1-R.bigfish.com (Postfix) with ESMTP id 7DC2620083;
	Fri, 19 Oct 2012 01:47:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail107-ch1 (localhost.localdomain [127.0.0.1]) by mail107-ch1
	(MessageSwitch) id 1350611240475642_26132;
	Fri, 19 Oct 2012 01:47:20 +0000 (UTC)
Received: from CH1EHSMHS004.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.233])	by mail107-ch1.bigfish.com (Postfix) with ESMTP id
	72275420048;	Fri, 19 Oct 2012 01:47:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS004.bigfish.com
	(10.43.70.4) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 19 Oct 2012 01:47:20 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Fri, 19 Oct 2012 01:47:19 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNrW/ikWSgpKAgu0+LKa1V8BZDiJe/hiIAgABWPYA=
Date: Fri, 19 Oct 2012 01:47:19 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A709A30@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
	<508068BA.8070301@linux.intel.com>
In-Reply-To: <508068BA.8070301@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 02:00:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9F8B691AA09DC0438CD2B41665F8A129@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 3:38 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>>>> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
>>>
>>> modules.bbclass already sets KERNEL_PATH and KERNEL_SRC, perhaps you
>>> could use one of those?
>>
>> cryptodev Makefile does not use these it uses KERNEL_DIR in it's
>> Makefile for whatever reason. Getting an upstream project to change is
>> more difficult.
>
> I think this is the second reference to KERNEL_DIR in an external module,
> perhaps module.bbclass should add that to it's list of predefined names f=
or
> the STAGING_KERNEL_DIR.

Fine with me, but not sure how its worth it quite yet...=



