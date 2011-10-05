Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBX4D-0006vk-4o
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:23:45 +0200
Received: from mail105-db3-R.bigfish.com (10.3.81.251) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 19:18:03 +0000
Received: from mail105-db3 (localhost.localdomain [127.0.0.1])	by
	mail105-db3-R.bigfish.com (Postfix) with ESMTP id 459601270299	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 19:18:03 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail105-db3 (localhost.localdomain [127.0.0.1]) by mail105-db3
	(MessageSwitch) id 1317842283205919_30018;
	Wed,  5 Oct 2011 19:18:03 +0000 (UTC)
Received: from DB3EHSMHS007.bigfish.com (unknown [10.3.81.246])	by
	mail105-db3.bigfish.com (Postfix) with ESMTP id 274744E004D	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 19:18:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS007.bigfish.com
	(10.3.87.107) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 19:18:02 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 14:18:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 5/6] Fix sysprof for powerpc64
Thread-Index: AQHMg5N/IC9M4rjpUUqfnzPQVOORcQ==
Date: Wed, 5 Oct 2011 19:18:00 +0000
Message-ID: <CAEsOVNepDDF-h882sj_vEw_zgKNh2vcXQz30bU_-P0uUKOYQ5A@mail.gmail.com>
References: <1317841365-32051-1-git-send-email-msm@freescale.com>
	<CAMKF1spPPnQiOddrG9S7PGPwAXYA4RNgcPrS6f0_o83V-1NrmA@mail.gmail.com>
In-Reply-To: <CAMKF1spPPnQiOddrG9S7PGPwAXYA4RNgcPrS6f0_o83V-1NrmA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 19:23:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DCE123E5AC9B924EBD6E979CD9740455@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 2:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
> is sysprof linux specific? if not then this change will mean that it wont=
 work
> on other OSes which dont define __powerpc64__ e.g. darwin. Better solutio=
n is to
> check for both __ppc64__ and __powerpc64__
>
> but thats something for sysprof upstream to consider. For OE this
> patch is sufficient

They will address this issue if they hit it, as this patch is in
upstream already...

-Matthew=



