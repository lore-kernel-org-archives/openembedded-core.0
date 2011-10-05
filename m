Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBUjB-0002yp-AL
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 18:53:53 +0200
Received: from mail71-db3-R.bigfish.com (10.3.81.244) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 16:48:17 +0000
Received: from mail71-db3 (localhost.localdomain [127.0.0.1])	by
	mail71-db3-R.bigfish.com (Postfix) with ESMTP id 1FE685A052D	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 16:48:17 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail71-db3 (localhost.localdomain [127.0.0.1]) by mail71-db3
	(MessageSwitch) id 131783329734782_28458;
	Wed,  5 Oct 2011 16:48:17 +0000 (UTC)
Received: from DB3EHSMHS012.bigfish.com (unknown [10.3.81.248])	by
	mail71-db3.bigfish.com (Postfix) with ESMTP id 0160D17B004F	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 16:48:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS012.bigfish.com
	(10.3.87.112) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 16:48:10 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 11:48:08 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/6] Fix sysprof for powerpc64
Thread-Index: AQHMg36Pmll0mnSWpki4iAxH2ajb3w==
Date: Wed, 5 Oct 2011 16:48:08 +0000
Message-ID: <CAEsOVNdOaSFzxMLo1MT-h9rKMQRwuOWTv+hzKCTV-qqub+q3qg@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
In-Reply-To: <1317814555.14671.137.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 16:53:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <41C736AB14185240BBBD0DFBAB16C5FE@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 6:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> this is a gcc built-in define I wonder why you need to add it explicitly
>
> Are you sure? Is the built-in define not __powerpc64__ ?

Further investigation:

[mattsm@right build_p5020ds-64b_release (testing $)]$
./tmp/sysroots/x86_64-linux/usr/bin/ppc64e5500-fsl-linux/powerpc64-fsl-linu=
x-gcc
-c -E -dM empty.c | grep __p
#define __powerpc64__ 1
#define __powerpc__ 1
[mattsm@right build_p5020ds-64b_release (testing $)]$

-M=



