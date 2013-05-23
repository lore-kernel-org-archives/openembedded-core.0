Return-Path: <B19537@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe003.messaging.microsoft.com [213.199.154.206])
	by mail.openembedded.org (Postfix) with ESMTP id F1C916086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:46:05 +0000 (UTC)
Received: from mail70-am1-R.bigfish.com (10.3.201.251) by
	AM1EHSOBE026.bigfish.com (10.3.207.148) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 May 2013 08:46:05 +0000
Received: from mail70-am1 (localhost [127.0.0.1])	by mail70-am1-R.bigfish.com
	(Postfix) with ESMTP id C13543E010F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:46:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz1443I14ffIzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1hbe9i1155h)
Received: from mail70-am1 (localhost.localdomain [127.0.0.1]) by mail70-am1
	(MessageSwitch) id 1369298764476611_20951;
	Thu, 23 May 2013 08:46:04 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.227])	by
	mail70-am1.bigfish.com (Postfix) with ESMTP id 68ADF2C0C49	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:46:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 May 2013 08:46:04 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.137]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Thu, 23 May 2013 08:46:46 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Query for multilib support in Yocto
Thread-Index: Ac5XkfOOG+GOdd4KTn+RuqsEmY7v4A==
Date: Thu, 23 May 2013 08:46:45 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01570F29@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Query for multilib support in Yocto
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
X-List-Received-Date: Thu, 23 May 2013 08:46:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,=20

I am trying the multilib feature of Yocto, and I want to make sure if below=
 scenarios are supported, who can help to clarify? Thanks in advance.=20

For standalone toolchain built by "bitbake meta-toolchain"
1. Can the same gcc binary build both 32b and 64b applications or two diffe=
rent gcc binaries(one is for 32b, the other is for 64b) are required?=20

For gcc with multilib support running on target board
1. Can the same gcc binary build both 32b and 64b applications or two diffe=
rent gcc binaries(one is for 32b, the other is for 64b) are required?=20
2. Can both 32b and 64b application be executed in the same rootfs image wi=
th multilib support?

BTW, may I know how the default value of LIBRARY_PATH is set? I experienced=
 following error when I use gcc(32bit rootfs with multilib support) to do 6=
4b build, I find the linker search libraries in /usr/lib and /lib instead o=
f /usr/lib64 and /lib64.=20

root@p5020ds:~# gcc -m64 my_test.c -o my_test
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powe=
rpc-poky-linux/4.7.2/libgcc.a when searching for -lgcc
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when sea=
rching for -lgcc
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: cannot find -lgcc
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible /lib/../lib/libgcc_s.so.1 when searching for libgcc=
_s.so.1
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible //lib/libgcc_s.so.1 when searching for libgcc_s.so.=
1
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: cannot find libgcc_s.so.1
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powe=
rpc-poky-linux/4.7.2/libgcc.a when searching for libgcc.a
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: skipping incompatible /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when sea=
rching for libgcc.a
/usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld=
: cannot find libgcc.a
collect2: error: ld returned 1 exit status
root@p5020ds:~# cat my_test.c=20
int main()
{
    int a=3D0;

    return a;
}


Best Regards,

Zhenhua


