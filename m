Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBvOt-0000Y9-Lx
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 23:22:43 +0200
Received: from mail90-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.22; Thu, 6 Oct 2011 21:02:01 +0000
Received: from mail90-ch1 (localhost.localdomain [127.0.0.1])	by
	mail90-ch1-R.bigfish.com (Postfix) with ESMTP id 5D140F504C9	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 21:02:01 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail90-ch1 (localhost.localdomain [127.0.0.1]) by mail90-ch1
	(MessageSwitch) id 1317934876633011_12741;
	Thu,  6 Oct 2011 21:01:16 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail90-ch1.bigfish.com (Postfix) with ESMTP id
	96164D5004B for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 21:01:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 6 Oct 2011 21:01:14 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Thu, 6 Oct 2011 16:01:13 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] native.bbclass: Ensure native recipes have a
	deterministic baselib value
Thread-Index: AQHMhGsUWelqhD2EokWvl0yXRKZ0SQ==
Date: Thu, 6 Oct 2011 21:01:12 +0000
Message-ID: <CAEsOVNfOE5+52BuT2TbeSsWZz21+13YPqsCr_7ar2+yh9HV=QA@mail.gmail.com>
References: <1317910843.6398.87.camel@ted>
In-Reply-To: <1317910843.6398.87.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] native.bbclass: Ensure native recipes have a deterministic baselib value
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
X-List-Received-Date: Thu, 06 Oct 2011 21:22:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C9492F732A04494F963129D4AC166EB7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 6, 2011 at 9:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Changes to baselib by specific machine configuration were resulting
> in sstate cache invalidation, particularly in multilib configurations.
>
> This patch ensures this doesn't happen and native sstate cache files
> are reusable.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes native sstate-cache (re)usage when enabling multilib.

-M=



