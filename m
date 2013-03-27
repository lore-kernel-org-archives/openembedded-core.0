Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UKozR-0002tN-Cq
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 12:58:11 +0100
Received: from mail47-co9-R.bigfish.com (10.236.132.251) by
	CO9EHSOBE017.bigfish.com (10.236.130.80) with Microsoft SMTP Server id
	14.1.225.23; Wed, 27 Mar 2013 10:55:33 +0000
Received: from mail47-co9 (localhost [127.0.0.1])	by mail47-co9-R.bigfish.com
	(Postfix) with ESMTP id 79A4CC80197	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:55:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz1443Ida00hdc73hzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail47-co9 (localhost.localdomain [127.0.0.1]) by mail47-co9
	(MessageSwitch) id 1364381730928250_980; Wed, 27 Mar 2013 10:55:30 +0000
	(UTC)
Received: from CO9EHSMHS031.bigfish.com (unknown [10.236.132.232])	by
	mail47-co9.bigfish.com (Postfix) with ESMTP id DF66570004B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:55:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS031.bigfish.com
	(10.236.130.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 27 Mar 2013 10:55:30 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Wed, 27 Mar 2013 10:55:29 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Tar failed occasionally during the nativesdk toolchain build
Thread-Index: Ac4q2ZYTfKU9MdC0RQuwbCnqDpn2QA==
Date: Wed, 27 Mar 2013 10:55:29 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0148ADFF@039-SN2MPN1-022.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: BLk= AQdd AwHw A7A0 B3U3 DXX6 EVs/ EbE4 En3U E2xP F76d
	GlS9 Glth HLSI JB9z JGvw; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA=;
	Sosha1_v1; 7; {F4185554-2600-4E15-8C66-987980CE773A};
	YgAxADkANQAzADcAQABmAHIAZQBlAHMAYwBhAGwAZQAuAGMAbwBtAA==; Wed,
	27 Mar 2013 10:55:25 GMT;
	VABhAHIAIABmAGEAaQBsAGUAZAAgAG8AYwBjAGEAcwBpAG8AbgBhAGwAbAB5ACAAZAB1AHIAaQBuAGcAIAB0AGgAZQAgAG4AYQB0AGkAdgBlAHMAZABrACAAdABvAG8AbABjAGgAYQBpAG4AIABiAHUAaQBsAGQA
x-cr-puzzleid: {F4185554-2600-4E15-8C66-987980CE773A}
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Tar failed occasionally during the nativesdk toolchain build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 11:58:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When I build nativesdk toolchain, following build error appears sometimes, =
any suggestion to solve the issue?

    "tar: ./sysroots/ppce500mc-fsl_networking-linux/var/lib/rpm/__db.002: f=
ile changed as we read it"=20

Thanks in advance.


Regards,=20

Zhenhua



