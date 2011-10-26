Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RIt1l-0000UQ-AZ
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 04:15:37 +0200
Received: from mail17-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Oct 2011 02:09:33 +0000
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1])	by
	mail17-tx2-R.bigfish.com (Postfix) with ESMTP id 8A972160033C;
	Wed, 26 Oct 2011 02:09:35 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(zz9371K1432N98dK4015Lzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1]) by mail17-tx2
	(MessageSwitch) id 1319594975258181_23053;
	Wed, 26 Oct 2011 02:09:35 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.240])	by
	mail17-tx2.bigfish.com (Postfix) with ESMTP id 38235C98052;
	Wed, 26 Oct 2011 02:09:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 26 Oct 2011 02:09:32 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Tue, 25 Oct 2011 21:09:37 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Introduce biarch DISTRO_FEATURE
Thread-Index: AQHMk4RPSNNvOwcjRk+rCnxcs8KJIQ==
Date: Wed, 26 Oct 2011 02:09:36 +0000
Message-ID: <CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
In-Reply-To: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Wed, 26 Oct 2011 02:15:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <11E458E663728544AE2DC66DCBD78434@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> This patch introduces a distro feature which enables gcc to produce
> both 32bit and 64bit code, and enables binutils to operate on both
> 32bit and 64bit binaries. It differs from multilib toolchains in
> that it does not require to compile a version of the libc for each
> architecture variant. However, the code produced for the secondary
> architecture will not be linkable against the libc.
>
> This patch only works with x86 and x86_64 architectures, but can
> probably be extended to support other architectures as well.
>
> One use-case would be when one wants to compile a system which runs
> 32bit userspace applications with a 64bit kernel without having to
> deal with two separate libc.

What happens with the native gcc on the root file system. And what
about meta-toolchain? Any effect?

Thanks,
Matthew=



