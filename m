Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SDKni-0007Lk-Dg
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:14:26 +0200
Received: from mail3-va3-R.bigfish.com (10.7.14.246) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Mar 2012 18:50:16 +0000
Received: from mail3-va3 (localhost [127.0.0.1])	by mail3-va3-R.bigfish.com
	(Postfix) with ESMTP id EAC3FE0280	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 18:50:15 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I1432N1418M98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail3-va3 (localhost.localdomain [127.0.0.1]) by mail3-va3
	(MessageSwitch) id 133304701447044_25654;
	Thu, 29 Mar 2012 18:50:14 +0000 (UTC)
Received: from VA3EHSMHS023.bigfish.com (unknown [10.7.14.247])	by
	mail3-va3.bigfish.com (Postfix) with ESMTP id 05B932C0048	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 18:50:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS023.bigfish.com
	(10.7.99.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Mar 2012 18:50:13 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 29 Mar 2012 13:50:12 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] powerpc: define TUNE_PKGARCH for
	powerpc/powerpc-nf
Thread-Index: AQHNDWcWaFGUF6IwukC6rEwZIl9i0w==
Date: Thu, 29 Mar 2012 18:50:12 +0000
Message-ID: <CAEsOVNd+GWKJaChwhTZuqC76=c5t4ZyXHS8a-PJq97hhTPbF+g@mail.gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
	<4F7481FE.3020505@windriver.com>
	<CAEsOVNcbLXA-16E+sFhTExa0oZ62bGEXeNmzzjBOvmLaUPAoYg@mail.gmail.com>
	<4F749060.8020101@windriver.com>
	<CABcZANktSbmBpDPvRoiT_44xY0Pn7pKvo_qhF87hF9oSJNungw@mail.gmail.com>
In-Reply-To: <CABcZANktSbmBpDPvRoiT_44xY0Pn7pKvo_qhF87hF9oSJNungw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 19:14:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F8D547B9D965974C9780B0983DC0DAFD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 1:38 PM, Chris Larson <clarson@kergoth.com> wrote:
>> Does the above seem reasonable? =A0If so I'll try to get started on that=
...
>
> That seems reasonable to me, for what that's worth. I could see
> simplifying the way the powerpc stuff works in the future, but at
> least we'd have something functional for now as well. It keeps primary
> responsibility for TUNE_PKGARCH in arch-powerpc*.inc, which is as it
> should be -- the arch knows best how to manage it. I'm curious to hear
> Matthew's perspective on this.

This is fine with me, I just did not like setting

TUNE_FEATURES =3D foo

only to have

TUNE_ARCH  =3D ${@bb.utils.contains("TUNE_FEATURES", "foo", "foo",
"${PPCPKGARCH}", d)}"

when it seemed better to just

TUNE_ARCH =3D foo

At least I think that was my thought logic, then it went a step
further and thought we could just use TUNE_PKGARCH_tune-$DEFAULTTUNE
since these would be available from multilib anyways...

-M=



