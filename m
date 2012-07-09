Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoL58-0003U5-3q
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:01:22 +0200
Received: from mail21-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jul 2012 20:32:49 +0000
Received: from mail21-ch1 (localhost [127.0.0.1])	by mail21-ch1-R.bigfish.com
	(Postfix) with ESMTP id 7231B460319;
	Mon,  9 Jul 2012 20:32:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail21-ch1 (localhost.localdomain [127.0.0.1]) by mail21-ch1
	(MessageSwitch) id 1341865968392701_7223;
	Mon,  9 Jul 2012 20:32:48 +0000 (UTC)
Received: from CH1EHSMHS022.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail21-ch1.bigfish.com (Postfix) with ESMTP id
	5D25660048; Mon,  9 Jul 2012 20:32:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS022.bigfish.com
	(10.43.70.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jul 2012 20:32:46 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Mon, 9 Jul 2012 15:35:03 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libgomp: add libgomp (openmp) library, and
	build for powerpc targets by default
Thread-Index: AQHNXU8a5W1i8WJ3y0K+9ThoYsHus5cgN+iAgAF+0oCAAAcBgA==
Date: Mon, 9 Jul 2012 20:35:02 +0000
Message-ID: <CAEsOVNc_KRXGih9aMJpGxsSHt_e8Wnr6PJq16Dv3waMwguBx9Q@mail.gmail.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<4FF9F8F4.6050408@linux.intel.com> <4FF9F95F.8010300@linux.intel.com>
	<CAEsOVNe1zoUsMawDX4LOLWu9=gx3NBeyaCHnK0S9eBM9Xj=s+A@mail.gmail.com>
In-Reply-To: <CAEsOVNe1zoUsMawDX4LOLWu9=gx3NBeyaCHnK0S9eBM9Xj=s+A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Mon, 09 Jul 2012 21:01:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0966D29753714F418018275E63CF9F61@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 9, 2012 at 3:09 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> On Sun, Jul 8, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>   /usr/share/info/dir
>
> I don't see this dir on my build... perhaps it's the specific version
> of gcc? or it's some munged text output?
>
> If you still see if can you add it to the patch? v2 coming shortly.

Nevermind, I do see this dir. Will fix.

-M=



