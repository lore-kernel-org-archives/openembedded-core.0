Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TKEWO-0005BA-Du
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:29:20 +0200
Received: from mail2-ch1-R.bigfish.com (10.43.68.236) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Fri, 5 Oct 2012 20:16:16 +0000
Received: from mail2-ch1 (localhost [127.0.0.1])	by mail2-ch1-R.bigfish.com
	(Postfix) with ESMTP id E4F20300102;
	Fri,  5 Oct 2012 20:16:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1b0bI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail2-ch1 (localhost.localdomain [127.0.0.1]) by mail2-ch1
	(MessageSwitch) id 1349468175736021_16142;
	Fri,  5 Oct 2012 20:16:15 +0000 (UTC)
Received: from CH1EHSMHS040.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail2-ch1.bigfish.com (Postfix) with ESMTP id
	AC60940220; Fri,  5 Oct 2012 20:16:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS040.bigfish.com
	(10.43.69.249) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 5 Oct 2012 20:16:15 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Fri, 5 Oct 2012 15:16:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Scott Garman <scott.a.garman@intel.com>
Thread-Topic: [OE-core] [PATCH 0/6] denzil pull request 3
Thread-Index: AQHNozZEAR9a2jwko0OU4bqww9NpEg==
Date: Fri, 5 Oct 2012 20:16:14 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6DBCF1@039-SN1MPN1-002.039d.mgd.msft.net>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] denzil pull request 3
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
X-List-Received-Date: Fri, 05 Oct 2012 20:29:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7A7715081DA30047B83120359C5FDBDF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 5, 2012 at 2:52 PM, Scott Garman <scott.a.garman@intel.com> wro=
te:
>
> nightly-ppc-lsb: kernel compile failure
> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/=
82
>
> kernel do_compile failure for mpc8315e_rdb-poky-linux:
>
> |   BOOTCC  arch/powerpc/boot/cuboot-pq2.o
> | In file included from /srv/home/pokybuild/yocto-autobuilder/yocto-slave=
/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/linux-yocto-3=
.0.32+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+83f422f718cf15633cb4c=
2d309aa041c3c354f65-r4/linux/arch/powerpc/boot/epapr.c:20:0:
> | arch/powerpc/boot/libfdt.h:854:1: error: unterminated comment
> | arch/powerpc/boot/libfdt.h:1:0: error: unterminated #ifndef
> |   BOOTCC  arch/powerpc/boot/cuboot-sequoia.o
> | make[3]: *** [arch/powerpc/boot/epapr.o] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | make[2]: *** [uImage] Error 2
> | make[1]: *** [sub-make] Error 2
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> NOTE: package linux-yocto-3.0.32+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a=
7ee23_1+83f422f718cf15633cb4c2d309aa041c3c354f65-r4: task do_compile: Faile=
d
>
> I heard from Matthew McClintock that a fix for this has been sent
> upstream, sounds like we need to get this merged to our kernel tree.

FYI,

http://patchwork.ozlabs.org/patch/182260/

-M=



