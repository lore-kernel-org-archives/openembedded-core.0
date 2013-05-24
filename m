Return-Path: <B19537@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7C9621CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 08:25:12 +0000 (UTC)
Received: from mail176-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE038.bigfish.com (10.243.66.103) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 May 2013 08:25:12 +0000
Received: from mail176-co1 (localhost [127.0.0.1])	by
	mail176-co1-R.bigfish.com (Postfix) with ESMTP id 59B90580358;
	Fri, 24 May 2013 08:25:12 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I542I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fhbe9i1155h)
Received: from mail176-co1 (localhost.localdomain [127.0.0.1]) by mail176-co1
	(MessageSwitch) id 1369383910604868_26171;
	Fri, 24 May 2013 08:25:10 +0000 (UTC)
Received: from CO1EHSMHS026.bigfish.com (unknown [10.243.78.240])	by
	mail176-co1.bigfish.com (Postfix) with ESMTP id 9119088004C;
	Fri, 24 May 2013 08:25:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS026.bigfish.com
	(10.243.66.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 May 2013 08:25:10 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.137]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Fri, 24 May 2013 08:25:55 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] Query for multilib support in Yocto
Thread-Index: Ac5XkfOOG+GOdd4KTn+RuqsEmY7v4AAMl0sAACPmlgA=
Date: Fri, 24 May 2013 08:25:55 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01572F8B@039-SN2MPN1-021.039d.mgd.msft.net>
References: <CA452391058F6D4E9715FB2C29D9312A01570F29@039-SN2MPN1-021.039d.mgd.msft.net>
	<519E2BC8.2090905@windriver.com>
In-Reply-To: <519E2BC8.2090905@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Query for multilib support in Yocto
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
X-List-Received-Date: Fri, 24 May 2013 08:25:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thanks for your comments.=20

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ma=
rk Hatle
> Sent: Thursday, May 23, 2013 10:47 PM
>=20
> On 5/23/13 3:46 AM, Luo Zhenhua-B19537 wrote:
> >
> > For gcc with multilib support running on target board 1. Can the same
> > gcc binary build both 32b and 64b applications or two different gcc
> binaries(one is for 32b, the other is for 64b) are required?
>=20
> As far as I'm aware the same issue above holds true here.  You still need
> multiple compiler binaries, one for each multilib.  (Khem Raj would know
> if this is still true however.)
[Luo Zhenhua-B19537] I see an successful case of single gcc on target can b=
uild both 32b and 64b app, https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D1369. Is that still true in recent Yocto?=20
=20
> I experienced following error when I use gcc(32bit rootfs with multilib
> support) to do 64b build, I find the linker search libraries in /usr/lib
> and /lib instead of /usr/lib64 and /lib64.
> >
> > root@p5020ds:~# gcc -m64 my_test.c -o my_test
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powerpc-poky-linux/4.7.
> > 2/libgcc.a when searching for -lgcc
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible
> > /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when searching for -lgcc
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: cannot find -lgcc
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible /lib/../lib/libgcc_s.so.1 when searching
> > for libgcc_s.so.1
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible //lib/libgcc_s.so.1 when searching for
> > libgcc_s.so.1
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: cannot find libgcc_s.so.1
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powerpc-poky-linux/4.7.
> > 2/libgcc.a when searching for libgcc.a
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: skipping incompatible
> > /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when searching for libgcc.a
> > /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/b
> > in/ld: cannot find libgcc.a
>=20
> Ya, this is running the 'wrong' toolchain.  From the errors it appears to
> me that it's the 32-bit gcc, attempting to compile for 64-bit.  There is
> a command that will tell you what architectures gcc was built to support,
> but unfortunately I don't remember it offhand.
[Luo Zhenhua-B19537] The test program can be compiled and assembled correct=
ly, but link failed. Seems like -m64 influenced powerpc-poky-linux-gcc, but=
 not influenced powerpc-poky-linux-ld, LIBRARY_PATH is same for both 32b an=
d 64b build, how can the value of LIBRARY_PATH be set to different value if=
 -m64 is passed?

root@p5020ds:~# gcc -m64 -c my_test.c=20
root@p5020ds:~# ls -l
total 3
-rw-r--r-- 1 root root   30 May 23 09:40 my_test.c
-rw-r--r-- 1 root root 1208 May 24 08:09 my_test.o
root@p5020ds:~# file my_test.o=20
my_test.o: ELF 64-bit MSB relocatable, 64-bit PowerPC or cisco 7500, versio=
n 1 (SYSV), not stripped
root@p5020ds:~# cat my_test.c=20
int main()
{
    return 0;
}


Best Regards,

Zhenhua


