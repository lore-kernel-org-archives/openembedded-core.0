Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVRwG-0007eF-N8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 18:57:53 +0100
Received: from mail185-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 17:50:23 +0000
Received: from mail185-tx2 (localhost [127.0.0.1])	by
	mail185-tx2-R.bigfish.com (Postfix) with ESMTP id F1F881802F6	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 17:50:20 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail185-tx2 (localhost.localdomain [127.0.0.1]) by mail185-tx2
	(MessageSwitch) id 1322588945896984_17368;
	Tue, 29 Nov 2011 17:49:05 +0000 (UTC)
Received: from TX2EHSMHS020.bigfish.com (unknown [10.9.14.235])	by
	mail185-tx2.bigfish.com (Postfix) with ESMTP id 7CD685A02BE	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 17:48:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS020.bigfish.com
	(10.9.99.120) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 17:48:09 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 11:48:57 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/5] m4: Add m4-nativesdk recipes
Thread-Index: AQHMrr8rwVROFJ6H80Gw5u8tD++dhA==
Date: Tue, 29 Nov 2011 17:48:57 +0000
Message-ID: <CAEsOVNcZYhLayMYXcwm8fYFpqJ=dVTfbyDjvM+Ox_qqVOmEn_w@mail.gmail.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
	<ba86babf9425bb34f62c879e2c44febf7308a543.1322554339.git.wenzong.fan@windriver.com>
In-Reply-To: <ba86babf9425bb34f62c879e2c44febf7308a543.1322554339.git.wenzong.fan@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/5] m4: Add m4-nativesdk recipes
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
X-List-Received-Date: Tue, 29 Nov 2011 17:57:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6D10F877E01D0E4EA8F1509BA109F09D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 2:38 AM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> [YOCTO #1603]
>
> m4-nativesdk is required by autoconf-nativesdk.

Is there a reason we don't just extend the m4 recipe for native and
nativesdk? (I'm just curious)

-M=



