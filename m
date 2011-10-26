Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RIsra-0000UP-UJ
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 04:05:24 +0200
Received: from mail58-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Oct 2011 01:59:02 +0000
Received: from mail58-tx2 (localhost.localdomain [127.0.0.1])	by
	mail58-tx2-R.bigfish.com (Postfix) with ESMTP id B364F1B400CF;
	Wed, 26 Oct 2011 01:59:04 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail58-tx2 (localhost.localdomain [127.0.0.1]) by mail58-tx2
	(MessageSwitch) id 1319594344671901_12418;
	Wed, 26 Oct 2011 01:59:04 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.238])	by
	mail58-tx2.bigfish.com (Postfix) with ESMTP id 93DA8144804F;
	Wed, 26 Oct 2011 01:59:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 26 Oct 2011 01:59:01 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 25 Oct 2011 20:59:06 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Give coreutils a chance to build the df utility
Thread-Index: AQHMk4LYjh2mImZYCUuUCOULJ8+eoA==
Date: Wed, 26 Oct 2011 01:59:06 +0000
Message-ID: <CAEsOVNfvkJkLPMCg=x7Yu3JFQSt2GuupkZgXOpj+YhwFZJZryg@mail.gmail.com>
References: <1319505532-23199-2-git-send-email-julian.pidancet@gmail.com>
In-Reply-To: <1319505532-23199-2-git-send-email-julian.pidancet@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Wed, 26 Oct 2011 02:05:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <02BE57BDCD976247A7352B7C3DEC830A@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> +do_configure_prepend () {
> + =A0 =A0 =A0 =A0export fu_cv_sys_stat_statfs2_bsize=3Dyes

I'm asking out of curiosity.. why don't these go in meta/site/common instea=
d?

-M=



