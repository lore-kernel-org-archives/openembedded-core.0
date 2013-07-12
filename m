Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0189.outbound.messaging.microsoft.com [213.199.154.189])
	by mail.openembedded.org (Postfix) with ESMTP id E3C086AB93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:11:19 +0000 (UTC)
Received: from mail138-db8-R.bigfish.com (10.174.8.243) by
	DB8EHSOBE014.bigfish.com (10.174.4.77) with Microsoft SMTP Server id
	14.1.225.22; Fri, 12 Jul 2013 02:11:18 +0000
Received: from mail138-db8 (localhost [127.0.0.1])	by
	mail138-db8-R.bigfish.com (Postfix) with ESMTP id 8D39C2A0275;
	Fri, 12 Jul 2013 02:11:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I542Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail138-db8 (localhost.localdomain [127.0.0.1]) by mail138-db8
	(MessageSwitch) id 1373595077456023_2137;
	Fri, 12 Jul 2013 02:11:17 +0000 (UTC)
Received: from DB8EHSMHS003.bigfish.com (unknown [10.174.8.225])	by
	mail138-db8.bigfish.com (Postfix) with ESMTP id 6AA60120047;
	Fri, 12 Jul 2013 02:11:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS003.bigfish.com
	(10.174.4.13) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 12 Jul 2013 02:11:17 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.105]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.03.0136.001;
	Fri, 12 Jul 2013 02:13:29 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Peter Seebach <peter.seebach@windriver.com>
Thread-Topic: [OE-core] [PATCH] pseudo: pseudo-native breaks native builds
	for symver.patch
Thread-Index: AQHOflHGhd/B/ChFMES3Clz1WEIUlplgSWPQ
Date: Fri, 12 Jul 2013 02:10:21 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E104187A5@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1373529521-31010-1-git-send-email-B40290@freescale.com>
	<20130711111223.06985e9f@e6410-2>
In-Reply-To: <20130711111223.06985e9f@e6410-2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: pseudo-native breaks native builds for symver.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2013 02:11:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Powerpc architecture and ppc64 hosts.


-----Original Message-----
From: Peter Seebach [mailto:peter.seebach@windriver.com]=20
Sent: Friday, July 12, 2013 12:12 AM
To: Guo Chunrong-B40290
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pseudo: pseudo-native breaks native builds f=
or symver.patch

On Thu, 11 Jul 2013 15:58:41 +0800
Chunrong Guo <B40290@freescale.com> wrote:

>       *symver.patch causes failure if the host glibc does not provide the=
 glibc-2.0 version of the symbol.

I don't think we should take this out unconditionally, because it was added=
 to address a (different) problem -- we were ending up with the pseudo-nati=
ve libraries being used with host glibc that might be too old, and not have=
 newer versions.

I was under the impression that glibc tried to maintain binary compatibilit=
y a fairly long way back; which hosts are omitting this symbol? What archit=
ecture are you on?

-s
--
Listen, get this.  Nobody with a good compiler needs to be justified.



