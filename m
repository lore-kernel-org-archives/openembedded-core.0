Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Ripog-0005Dn-PA
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 17:05:22 +0100
Received: from mail79-db3-R.bigfish.com (10.3.81.250) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jan 2012 15:57:59 +0000
Received: from mail79-db3 (localhost [127.0.0.1])	by mail79-db3-R.bigfish.com
	(Postfix) with ESMTP id 69E361000D2	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 15:57:59 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail79-db3 (localhost.localdomain [127.0.0.1]) by mail79-db3
	(MessageSwitch) id 1325779079368745_622; Thu,  5 Jan 2012 15:57:59 +0000
	(UTC)
Received: from DB3EHSMHS017.bigfish.com (unknown [10.3.81.243])	by
	mail79-db3.bigfish.com (Postfix) with ESMTP id 4A01A560046	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 15:57:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS017.bigfish.com
	(10.3.87.117) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jan 2012 15:57:56 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Thu, 5 Jan 2012 09:57:54 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/28] Build Fixes and Updates
Thread-Index: AQHMy8LIIGZr5ZAPLEihyRkFEPitUA==
Date: Thu, 5 Jan 2012 15:57:54 +0000
Message-ID: <CAEsOVNcVXE+hTNMBzHnVS_x9zs_Gp+_VKaop90n8h=-_Y_RJPQ@mail.gmail.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
In-Reply-To: <1325763002.20759.62.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 16:05:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D758543F047A2E4AA3FCC828CA30B361@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 5:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Zhenhua Luo (1):
>> =A0 linux-dtb: add multi-dtb build support and keep dtb in deploy cache
>> =A0 =A0 package
>
> This looks like it should be done in do_deploy and doesn't fix the real
> problem just adding some races in.

Can you add a bit more info here? Should we be building all the device
trees in do_deploy? What races are added?

-M=



