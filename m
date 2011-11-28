Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVA8F-0004gy-Q1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 23:57:03 +0100
Received: from mail1-am1-R.bigfish.com (10.3.201.241) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 22:49:38 +0000
Received: from mail1-am1 (localhost [127.0.0.1])	by mail1-am1-R.bigfish.com
	(Postfix) with ESMTP id 87563708450	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:49:38 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail1-am1 (localhost.localdomain [127.0.0.1]) by mail1-am1
	(MessageSwitch) id 1322520558317111_20357;
	Mon, 28 Nov 2011 22:49:18 +0000 (UTC)
Received: from AM1EHSMHS015.bigfish.com (unknown [10.3.201.241])	by
	mail1-am1.bigfish.com (Postfix) with ESMTP id 028F1228075	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:49:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS015.bigfish.com
	(10.3.207.153) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 22:49:16 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 16:50:02 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqwS+vCtx6Pv4A0Kv3YkijylUD5W9HcKAgAAaWACABhZ1AA==
Date: Mon, 28 Nov 2011 22:50:01 +0000
Message-ID: <CAEsOVNfRLhGupMQWw2aA_idE9+JXCB29QfpHK4S6ZkZL6bbaKQ@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAEsOVNe6ywzXK2b483FA-2T3A8x6-OwQXWKnsdMVWq5QTKh7sw@mail.gmail.com>
	<1322180245.10928.50.camel@ted>
	<CAEsOVNc3U4Vn_Qy54rGYxRxC4UL6qRLMpisEa_ev-hhYXjSZhw@mail.gmail.com>
In-Reply-To: <CAEsOVNc3U4Vn_Qy54rGYxRxC4UL6qRLMpisEa_ev-hhYXjSZhw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Mon, 28 Nov 2011 22:57:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6AF666E487E09E47A2007E7B55D54937@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 7:51 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Thu, Nov 24, 2011 at 6:17 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> This should mean you can't use 32 bit sstate files on a 64 bit system
>> and vice versa already?
>
> That would seem to be the case already:
>
> SSTATE_PKG=3D"/home/mattsm/git/poky/sstate-cache/sstate-gcc-cross-ppce550=
0-fsl-linux-4.6.1+svnr175454-r10-x86_64_ppce5500-2-${BB_TASKHASH}"
>
> SSTATE_PKG=3D"/home/mattsm/git/poky/sstate-cache/sstate-gcc-cross-ppce500=
mc-fsl-linux-4.6.1+svnr175454-r10-i686_ppce500mc-2-${BB_TASKHASH}"
>
> So, I'm not 100% sure what is going on anymore...

For those interested my actual issue is related to linux header
symlinks from eglibc-initial pointing at invalid locations... which
causes gcc-cross-intermediate to fail. I'll submit a potential fix for
this shortly.

-M=



