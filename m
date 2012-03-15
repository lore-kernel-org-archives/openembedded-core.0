Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S815o-0004nX-Is
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 04:11:08 +0100
Received: from mail18-am1-R.bigfish.com (10.3.201.252) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Thu, 15 Mar 2012 02:47:18 +0000
Received: from mail18-am1 (localhost [127.0.0.1])	by mail18-am1-R.bigfish.com
	(Postfix) with ESMTP id 8E14180441	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 02:47:18 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail18-am1 (localhost.localdomain [127.0.0.1]) by mail18-am1
	(MessageSwitch) id 1331779637276972_4889;
	Thu, 15 Mar 2012 02:47:17 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.235])	by
	mail18-am1.bigfish.com (Postfix) with ESMTP id 36EAF320045	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 02:47:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 15 Mar 2012 02:47:17 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Wed, 14 Mar 2012 21:47:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] gcc: enable multilib for target gcc
Thread-Index: AQHNAlXskg2PXW4H00ieB0Tmd3PnXg==
Date: Thu, 15 Mar 2012 02:47:13 +0000
Message-ID: <CAEsOVNdBma0dRbnzkq05avjSbtJfVuSC67ihWvLi17RK_duaxQ@mail.gmail.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
In-Reply-To: <513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 8/8] gcc: enable multilib for target gcc
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
X-List-Received-Date: Thu, 15 Mar 2012 03:11:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <62176A848C8F4243A5464C42CA436793@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 9:02 PM,  <nitin.a.kamble@intel.com> wrote:
> + =A0 =A0multilibs =3D d.getVar('MULTILIB_VARIANTS', True)
> + =A0 =A0target_arch =3D d.getVar('TARGET_ARCH', True)
> +
> + =A0 =A0gcc_target_config_files =3D {
> + =A0 =A0 =A0 =A0'x86_64' =A0 =A0 =A0: ['gcc/config/i386/t-linux64', 'gcc=
/config/i386/t-linux'],
> + =A0 =A0 =A0 =A0'i586' =A0 =A0 =A0 =A0: ['gcc/config/mips/t-linux'],
> + =A0 =A0 =A0 =A0'mips' =A0 =A0 =A0 =A0: ['gcc/config/mips/t-linux64', 'g=
cc/config/mips/t-linux'],
> + =A0 =A0 =A0 =A0'ppc' =A0 =A0 =A0 =A0 : ['gcc/config/rs6000/t-linux64'] =
}
> +
> + =A0 =A0gcc_header_config_files =3D {
> + =A0 =A0 =A0 =A0'x86_64' =A0 =A0 =A0: ['gcc/config/i386/linux64.h'],
> + =A0 =A0 =A0 =A0'i586' =A0 =A0 =A0 =A0: ['gcc/config/mips/linux.h'],
> + =A0 =A0 =A0 =A0'mips' =A0 =A0 =A0 =A0: ['gcc/config/mips/linux64.h', 'g=
cc/config/mips/linux.h'],
> + =A0 =A0 =A0 =A0'ppc' =A0 =A0 =A0 =A0 : ['gcc/config/rs6000/linux64.h', =
'gcc/config/rs6000/linux.h'] }
> +
> + =A0 =A0if target_arch not in gcc_target_config_files:
> + =A0 =A0 =A0 =A0bb.warn('gcc multilib setup is not supported for TARGET_=
ARCH=3D' + target_arch)
> + =A0 =A0 =A0 =A0return
> +
> + =A0 =A0gcc_multilib_target_config_files =3D gcc_target_config_files[tar=
get_arch]
> + =A0 =A0gcc_multilib_header_config_files =3D gcc_header_config_files[tar=
get_arch]
> +
> + =A0 =A0ml_list =3D ['DEFAULTTUNE']
> + =A0 =A0if multilibs !=3D '':
> + =A0 =A0 =A0 =A0for ml in multilibs.split(' '):
> + =A0 =A0 =A0 =A0 =A0 =A0ml_list.append('DEFAULTTUNE_virtclass-multilib-'=
 + ml)

What about adding non-multilib variants? I want to make one toolchain
for ppce500v2, ppce500mc, ppce5550, and ppc64e5500?

Also, somehow, should we enforce all "toolchains" are built through
this multilib build process such that I only need to configure things
properly and then theoretically I can make a toolchain ONCE that
supports all desired targets? E.g. I don't think we want references to
DEFAULTTUNE since I don't want the DEFAULTTUNE to matter? Does this
make any sense?

-M=



