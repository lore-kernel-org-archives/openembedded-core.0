Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGEFX-00078B-RC
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 21:23:24 +0200
Received: from mail94-ch1-R.bigfish.com (10.43.68.228) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 19:10:35 +0000
Received: from mail94-ch1 (localhost [127.0.0.1])	by mail94-ch1-R.bigfish.com
	(Postfix) with ESMTP id 2F7B820278;
	Mon, 24 Sep 2012 19:10:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1521I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ahbe9i1155h)
Received: from mail94-ch1 (localhost.localdomain [127.0.0.1]) by mail94-ch1
	(MessageSwitch) id 1348513833709584_19958;
	Mon, 24 Sep 2012 19:10:33 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail94-ch1.bigfish.com (Postfix) with ESMTP id
	ABC9A400AB; Mon, 24 Sep 2012 19:10:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 19:10:27 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Mon, 24 Sep 2012 14:10:26 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
Thread-Index: AQHNmohBTmjdsWw1HUSCR3qOTf/zjQ==
Date: Mon, 24 Sep 2012 19:10:26 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A295A@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348487376.31293.31.camel@phil-desktop>
	<CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
In-Reply-To: <CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Phil Blundell <philb@gnu.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 19:23:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EA55C32C3E85C54493F3CA88BC125684@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 24, 2012 at 4:49 AM, Phil Blundell <philb@gnu.org> wrote:
>>
>> -COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*=
)'
>> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|fr=
eebsd.*)'
>
> I wonder if this expression should be removed completely now that mips is=
 added
> we dont have any supported arch left.

All the powerpc64 target still won't work (the Freescale ones at least).

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



