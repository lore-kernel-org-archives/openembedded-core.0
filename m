Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S80mj-00048j-4k
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:51:25 +0100
Received: from mail11-am1-R.bigfish.com (10.3.201.246) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 15 Mar 2012 02:42:40 +0000
Received: from mail11-am1 (localhost [127.0.0.1])	by mail11-am1-R.bigfish.com
	(Postfix) with ESMTP id 1196D420695	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 02:42:40 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail11-am1 (localhost.localdomain [127.0.0.1]) by mail11-am1
	(MessageSwitch) id 1331779357948282_13497;
	Thu, 15 Mar 2012 02:42:37 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.231])	by
	mail11-am1.bigfish.com (Postfix) with ESMTP id DB7E3100046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 02:42:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS014.bigfish.com
	(10.3.207.152) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 15 Mar 2012 02:42:37 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 14 Mar 2012 21:42:35 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] gcc: enable multilib for target gcc
Thread-Index: AQHNAlVGkg2PXW4H00ieB0Tmd3PnXg==
Date: Thu, 15 Mar 2012 02:42:34 +0000
Message-ID: <CAEsOVNceckzotWC3xA9emHbW3aW8DxBk_zArYN1KHhn3anUQ1g@mail.gmail.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
In-Reply-To: <513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 8/8] gcc: enable multilib for target gcc
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
X-List-Received-Date: Thu, 15 Mar 2012 02:51:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D11C0181905E5344A9D8A6601CD51571@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 9:02 PM,  <nitin.a.kamble@intel.com> wrote:
> =A0 ${libdir}/${TARGET_SYS}/${BINV}/crt* \
> + =A0${libdir}/${TARGET_SYS}/${BINV}/32 \
> + =A0${libdir}/${TARGET_SYS}/${BINV}/x32 \
> + =A0${libdir}/${TARGET_SYS}/${BINV}/n32 \

Would ${libdir}/${TARGET_SYS}/${BINV}/64 ever exist?

-M=



