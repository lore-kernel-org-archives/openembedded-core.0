Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9UVA-0005AQ-3C
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 06:15:08 +0200
Received: from mail66-am1-R.bigfish.com (10.3.201.240) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 04:09:39 +0000
Received: from mail66-am1 (localhost.localdomain [127.0.0.1])	by
	mail66-am1-R.bigfish.com (Postfix) with ESMTP id 857231BE83CA	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:09:39 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail66-am1 (localhost.localdomain [127.0.0.1]) by mail66-am1
	(MessageSwitch) id 1317355779474813_18665;
	Fri, 30 Sep 2011 04:09:39 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.244])	by
	mail66-am1.bigfish.com (Postfix) with ESMTP id 58A5C7D004F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:09:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 04:09:39 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 23:09:37 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMfybENeCaQrDzXk+6c7ADKhUffQ==
Date: Fri, 30 Sep 2011 04:09:37 +0000
Message-ID: <CAEsOVNdsWvCRj+nixWeE-vubRTGG3yrDkEiUCZCUpFyrUESY3g@mail.gmail.com>
References: <1317323496-1818-1-git-send-email-msm@freescale.com>
In-Reply-To: <1317323496-1818-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 30 Sep 2011 04:15:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CFD8DDA3B01EA54EA086F2D58EFE90E6@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 2:11 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> From: Tom Rini <tom_rini@mentor.com>
>
> At issue is that route/pktloc.c (not generated) depends on
> route/pktloc_syntax.h (generated).
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Matthew McClintock <msm@freescale.com>

Please ignore this patch as it does not seem to fix the issue.

-M=



