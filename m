Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UQDzO-0007iw-Na
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:40:22 +0200
Received: from mail81-ch1-R.bigfish.com (10.43.68.236) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Thu, 11 Apr 2013 09:22:55 +0000
Received: from mail81-ch1 (localhost [127.0.0.1])	by mail81-ch1-R.bigfish.com
	(Postfix) with ESMTP id 80B301C03E3	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:22:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail81-ch1 (localhost.localdomain [127.0.0.1]) by mail81-ch1
	(MessageSwitch) id 1365672173504217_17685;
	Thu, 11 Apr 2013 09:22:53 +0000 (UTC)
Received: from CH1EHSMHS032.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail81-ch1.bigfish.com (Postfix) with ESMTP id
	7878712004D for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:22:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS032.bigfish.com
	(10.43.70.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Apr 2013 09:22:53 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.128]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Thu, 11 Apr 2013 09:22:51 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: The build issue of wayland-native on Linux distros with old glibc
Thread-Index: Ac42liK2o8WqNflgS5WKJV9DDJQE+g==
Date: Thu, 11 Apr 2013 09:22:50 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A014CB5E0@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: The build issue of wayland-native on Linux distros with old glibc
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
X-List-Received-Date: Thu, 11 Apr 2013 09:40:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried to build wayland-native which requires sys/signalfd.h and sys/timer=
fd.h, the two headers are not provided by Yocto build env, so host version =
is searched.=20

When the build is conducted in Linux distros with old glibc(not sure about =
the accurate version), above two headers are not available, so build will f=
ailed as following:
| /home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-lin=
ux/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:33:26: error: sys=
/signalfd.h: No such file or directory
| /home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-lin=
ux/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:34:25: error: sys=
/timerfd.h: No such file or directory

Can anybody shed some light on how to solve the issue in Yocto to ensure th=
e build doesn't depend on host env?


Best Regards,

Zhenhua



