Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RU1DU-0001Gn-CX
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 20:13:47 +0100
Received: from mail183-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Fri, 25 Nov 2011 19:06:26 +0000
Received: from mail183-ch1 (localhost [127.0.0.1])	by
	mail183-ch1-R.bigfish.com (Postfix) with ESMTP id 4292F42025E;
	Fri, 25 Nov 2011 19:07:09 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail183-ch1 (localhost.localdomain [127.0.0.1]) by mail183-ch1
	(MessageSwitch) id 1322248027174151_428;
	Fri, 25 Nov 2011 19:07:07 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail183-ch1.bigfish.com (Postfix) with ESMTP id
	26825400252;	Fri, 25 Nov 2011 19:07:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 25 Nov 2011 19:06:23 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Fri, 25 Nov 2011 13:07:06 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OA==
Date: Fri, 25 Nov 2011 19:07:06 +0000
Message-ID: <CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
In-Reply-To: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 25 Nov 2011 19:13:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <169BF59EF7A72C42A96D06D9D279B35E@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2011 at 6:29 AM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> This patch introduces a distro feature which enables gcc to produce
> both 32bit and 64bit code, and enables binutils to operate on both
> 32bit and 64bit binaries.
>
> v3: - Make get_gcc_multiarch_setting more elegant. Use a dictionnary
> to store the config options and replace bb.data.getVar with d.getVar.
> =A0 =A0- Remove i686 from the architecture list because it doesn't seem
> to be a valid TARGET_ARCH any more in OE.
> =A0 =A0- Configure gdb (gdb and gdb-cross) with --enable-64-bit-bfd if
> multiarch DISTRO_FEATURE is present
>
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>

I'm not sure if this is the correct spot to bring this up, but how
should we go about building a 32-bit and 64-bit libgcc?

-M=



