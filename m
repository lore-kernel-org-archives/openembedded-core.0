Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGw2F-0000IQ-Is
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:08:36 +0200
Received: from mail207-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 26 Sep 2012 17:55:43 +0000
Received: from mail207-tx2 (localhost [127.0.0.1])	by
	mail207-tx2-R.bigfish.com (Postfix) with ESMTP id EAF2638011A;
	Wed, 26 Sep 2012 17:55:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1432I1418Izz1202h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail207-tx2 (localhost.localdomain [127.0.0.1]) by mail207-tx2
	(MessageSwitch) id 1348682142214076_32743;
	Wed, 26 Sep 2012 17:55:42 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.247])	by
	mail207-tx2.bigfish.com (Postfix) with ESMTP id 2776764004E;
	Wed, 26 Sep 2012 17:55:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 26 Sep 2012 17:55:41 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 26 Sep 2012 12:55:41 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] libx11: fix nativesdk build on older
	distros
Thread-Index: AQHNmwD5+brGPjerY06d7Y9qKwsk7pebwGEAgABDwQCAAKyxgIAAOVgA
Date: Wed, 26 Sep 2012 17:55:40 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6ACAE2@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
	<CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LYcfqespv9vnEWUASJN6-Psh954FGHRoWhAmUYkFWwtEw@mail.gmail.com>
	<CAPj87rM=D6hSXGqY6O2qOoPb=NiGSrTRSpakcwJQTkssDMYtzg@mail.gmail.com>
	<CAJTo0LYNQrgg3=krn2ezw5w-aByV++Wpw-mszNL6MGGeMdCqRA@mail.gmail.com>
In-Reply-To: <CAJTo0LYNQrgg3=krn2ezw5w-aByV++Wpw-mszNL6MGGeMdCqRA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Wed, 26 Sep 2012 18:08:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <74392EE9F7CE1A41A2EEE5BDA8A92633@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 4:30 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 26 September 2012 00:11, Daniel Stone <daniel@fooishbar.org> wrote:
>>> The best fix is to just #define _GNU_SOURCE at the top of makekeys
>>> then, and push that upstream (mail patch to xorg-devel@lists.x.org).
>>
>> Actually, it isn't, as that breaks non-glibc badly.  glibc takes
>> _GNU_SOURCE to mean 'please add useful GNU extensions to this POSIX
>> wasteland', whereas BSD and/or Solaris take it to mean 'please make
>> this only GNU and don't use any other extensions at all'.  So we have
>> to do whatever AC_USE_SYSTEM_EXTENSIONS does, because that really is
>> the only thing that actually works.
>
> What do you mean non-glibc? :)
>
> Ignoring Minix as a build host (I think that's reasonable),
> AC_USE_SYSTEM_EXTENSIONS  defines _ALL_SOURCE _GNU_SOURCE
> _POSIX_PTHREAD_SEMANTICS _TANDEM_SOURCE, and does a compile-time
> sanity test of __EXTENSIONS__ (because it's possible that some
> combination of these defines make the system headers unusable on
> Solaris).
>
> This is annoying.  How about for oe-core we patch in -D_GNU_SOURCE to
> src/util/Makefile.am's CPPFLAGS definition and I'll discuss with
> xorg-dev for a proper fix?

Would this be OK for now in libx11.inc?

-export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
+export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS} -D_GNU_SOURCE"

-M=



