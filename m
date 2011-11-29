Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVVdl-0006hb-Kr
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:55:01 +0100
Received: from mail153-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 21:47:24 +0000
Received: from mail153-tx2 (localhost [127.0.0.1])	by
	mail153-tx2-R.bigfish.com (Postfix) with ESMTP id 5AA12480334;
	Tue, 29 Nov 2011 21:47:27 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(zz9371K1432N98dK4015Lzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail153-tx2 (localhost.localdomain [127.0.0.1]) by mail153-tx2
	(MessageSwitch) id 1322603247267849_19843;
	Tue, 29 Nov 2011 21:47:27 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.237])	by
	mail153-tx2.bigfish.com (Postfix) with ESMTP id 39E87340042;
	Tue, 29 Nov 2011 21:47:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 21:47:22 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 15:48:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OJW+pGYAgASTS4CAABdtAIAAAQ+AgADiWwCAAD2DAIAAXkuA
Date: Tue, 29 Nov 2011 21:48:06 +0000
Message-ID: <CAEsOVNfFGfisoxEgvWig66TqBUvCBBbvEg3rVYztN4qQCwN7vg@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
	<1322520968.30225.23.camel@ted>
	<CAEsOVNcCc5ZOT6wi_0pwkrFsJWmCGGS_Co-uA-z=oeFCYSDe8g@mail.gmail.com>
	<1322569804.3166.5.camel@ted>
	<CAEsOVNf7hckDk4i8gHx4_jXvzKzRxPkGfT4jP9ORSJvn_t=r=g@mail.gmail.com>
In-Reply-To: <CAEsOVNf7hckDk4i8gHx4_jXvzKzRxPkGfT4jP9ORSJvn_t=r=g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Julian Pidancet <julian.pidancet@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 21:55:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1228A1342E71114CB2F976D022FCFFAE@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 10:10 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
> On Tue, Nov 29, 2011 at 6:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> If you depend just on lib32-libgcc:do_populate_sysroot, it shouldn't
>> build eglibc. You can do that with something like:
>>
>> do_compile[depends] +=3D "lib32-libgcc:do_populate_sysroot"
>
> Thanks, I'll give this a try.

This is building some eglibc stuff...

NOTE: package lib32-eglibc-initial-2.13-r15+svnr14157: task
do_populate_sysroot: Succeeded

-M=



