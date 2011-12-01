Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWCrz-0006qE-MG
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 21:04:35 +0100
Received: from mail59-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 1 Dec 2011 19:57:51 +0000
Received: from mail59-am1 (localhost [127.0.0.1])	by mail59-am1-R.bigfish.com
	(Postfix) with ESMTP id 86F1734043D	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 19:57:51 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail59-am1 (localhost.localdomain [127.0.0.1]) by mail59-am1
	(MessageSwitch) id 1322769471475388_23189;
	Thu,  1 Dec 2011 19:57:51 +0000 (UTC)
Received: from AM1EHSMHS019.bigfish.com (unknown [10.3.201.250])	by
	mail59-am1.bigfish.com (Postfix) with ESMTP id 6E3CB180049	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 19:57:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS019.bigfish.com
	(10.3.206.22) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 1 Dec 2011 19:57:49 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 1 Dec 2011 13:57:51 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Coordinating inter-layer dependencies
Thread-Index: AQHMsGOBwn2MhPc9yk+RQspKeHgOJw==
Date: Thu, 1 Dec 2011 19:57:50 +0000
Message-ID: <CAEsOVNcN84sbX3prmmyo-B0E=QfKQD2GOtE7uWHWxhP6uvn2kA@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted> <20111201131337.GG19917@jama.jama.net>
	<CABcZANmi7pgkZeHo4+if-cxXtrZDR_Gd_uZ-mMiM_CG9Czc-MA@mail.gmail.com>
In-Reply-To: <CABcZANmi7pgkZeHo4+if-cxXtrZDR_Gd_uZ-mMiM_CG9Czc-MA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 20:04:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C29CF95CAE25FE47A41FB8D5ECF69533@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 8:33 AM, Chris Larson <clarson@kergoth.com> wrote:
>>> > This is even worse; you end up with a package without the changes don=
e
>>> > on the bbappend and as most bbappend files do not change PR, adding i=
t
>>> > later won't force a package update.
>
> People use bbappends without changing PR? I've been doing a PR .=3D ".1"
> or whatever in every bbappend I've created since they were added to
> bitbake, and used to do the same with amend.inc. It can result in some
> long PR values, but I'd rather that than the alternative..

It would be nice to have something that WARNS or FATALS if there is no
PR modification in the bbappend. This should be required IMO but I
guess there could be some other issues that this would cause.

-M=



