Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rj36e-00035o-Vo
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 07:16:49 +0100
Received: from mail10-tx2-R.bigfish.com (10.9.14.238) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 06:09:24 +0000
Received: from mail10-tx2 (localhost [127.0.0.1])	by mail10-tx2-R.bigfish.com
	(Postfix) with ESMTP id B53502C0431	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:09:24 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail10-tx2 (localhost.localdomain [127.0.0.1]) by mail10-tx2
	(MessageSwitch) id 1325830120141499_8902;
	Fri,  6 Jan 2012 06:08:40 +0000 (UTC)
Received: from TX2EHSMHS017.bigfish.com (unknown [10.9.14.238])	by
	mail10-tx2.bigfish.com (Postfix) with ESMTP id 1B6BD1400F1	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:08:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS017.bigfish.com
	(10.9.99.117) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jan 2012 06:08:39 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 6 Jan 2012 00:08:39 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core v4] linux-dtb: add multi-dtb build
	support and keep dtb in deploy cache package
Thread-Index: AQHMzDmh6CAJy6GocUCUfDXmBrK/8A==
Date: Fri, 6 Jan 2012 06:08:38 +0000
Message-ID: <CAEsOVNe8RroqAY=YP8b0xOwi2Pt-bb9xGwwUV0HQHC4L0_A8bw@mail.gmail.com>
References: <1325829439-848-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1325829439-848-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core v4] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Fri, 06 Jan 2012 06:16:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A3FBA4714F0EFA46BD4DC36DC1454DF4@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 11:57 PM,  <b19537@freescale.com> wrote:
> + =A0 =A0 =A0 =A0 =A0 =A0ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> + =A0 =A0 =A0 =A0 =A0 =A0cd -
> +
> + =A0 =A0 =A0 =A0 =A0 =A0install -d ${DEPLOYDIR}
> + =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.=
dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
> + =A0 =A0 =A0 =A0 =A0 =A0cd ${DEPLOYDIR}
> + =A0 =A0 =A0 =A0 =A0 =A0ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME=3D}.dt=
b

Can you elaborate why we are doing these things twice? Is on for the
cache and one for the current deploy dir or something?

-M=



