Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJon7-0006qR-M2
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 17:56:21 +0200
Received: from mail5-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Oct 2011 15:35:05 +0000
Received: from mail5-am1 (localhost.localdomain [127.0.0.1])	by
	mail5-am1-R.bigfish.com (Postfix) with ESMTP id C1B3D185831E	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:35:09 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail5-am1 (localhost.localdomain [127.0.0.1]) by mail5-am1
	(MessageSwitch) id 1319816090701336_18638;
	Fri, 28 Oct 2011 15:34:50 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.246])	by
	mail5-am1.bigfish.com (Postfix) with ESMTP id 19C5A1820058	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:34:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 28 Oct 2011 15:34:43 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Fri, 28 Oct 2011 10:34:50 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/2] Add new strace-graph package to avoid
	making perl a dependecy for all of strace
Thread-Index: AQHMlYchXSoYbJnXKkys1U8GNYACDQ==
Date: Fri, 28 Oct 2011 15:34:50 +0000
Message-ID: <CAEsOVNdwf8xYTp0K1JftUcMfmuuzMbMKahrP56Q1wx5yf4VPBw@mail.gmail.com>
References: <1319700362.15601.2.camel@ted>
	<1319743874-9891-1-git-send-email-msm@freescale.com>
	<1319792127.22423.1.camel@ted>
In-Reply-To: <1319792127.22423.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Fri, 28 Oct 2011 15:56:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FF739A4D6E635643A2FB9870AA14AB9E@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2011 at 3:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> -RDEPENDS =3D "perl"
>> +PACKAGES_prepend =3D "${PN}-graph "
>> +FILES_${PN}-graph =3D "${bindir}/strace-graph"
>> +RDEPENDS_${PN}-graph =3D "perl"
>
> I should have been clearer in my original email, pretty much every other
> recipe uses +=3D or =3D+ in this context. Whilst the _prepend override is
> probably ok, its probably a bit heavy in this case and the standard
> operator should work just fine.

usr/bin/strace-graph will be picked up by the default rules for ${PN}
- by prepending I thought I was letting strace-graph get picked out
first in ${PN}-graph then everything else could go in ${PN} without
having the explicitly list a new rule for ${PN}.

-M=



