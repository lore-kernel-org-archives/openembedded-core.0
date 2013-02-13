Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U5fy5-0005J5-A2
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 18:18:03 +0100
Received: from mail177-co9-R.bigfish.com (10.236.132.242) by
	CO9EHSOBE015.bigfish.com (10.236.130.78) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Feb 2013 17:01:58 +0000
Received: from mail177-co9 (localhost [127.0.0.1])	by
	mail177-co9-R.bigfish.com (Postfix) with ESMTP id E973FBE013C;
	Wed, 13 Feb 2013 17:01:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail177-co9 (localhost.localdomain [127.0.0.1]) by mail177-co9
	(MessageSwitch) id 1360774916691805_31141;
	Wed, 13 Feb 2013 17:01:56 +0000 (UTC)
Received: from CO9EHSMHS026.bigfish.com (unknown [10.236.132.237])	by
	mail177-co9.bigfish.com (Postfix) with ESMTP id 9CE2E780061;
	Wed, 13 Feb 2013 17:01:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS026.bigfish.com
	(10.236.130.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Feb 2013 17:01:53 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.221]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Wed, 13 Feb 2013 17:01:53 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [denzil 11/18] qemu-0.15.1: add patch to fix
	compilatation problems on powerpc
Thread-Index: AQHOCgvScrXt00rDAUiiMWcdJ0yQQw==
Date: Wed, 13 Feb 2013 17:01:52 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A87C379@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1360270199.git.mark.hatle@windriver.com>
	<01fc2a44e951dd523989d5834ccd5a4e22feb40f.1360270199.git.mark.hatle@windriver.com>
In-Reply-To: <01fc2a44e951dd523989d5834ccd5a4e22feb40f.1360270199.git.mark.hatle@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [denzil 11/18] qemu-0.15.1: add patch to fix compilatation problems on powerpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 17:18:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B41CCF7E78BFB3448E170499991A312F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2013 at 5:56 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> From: Matthew McClintock <msm@freescale.com>
>
> ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64=
b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/te=
mp/log.do_compile.28447 for further information)
> ERROR: Logfile of failure stored in: /opt/yocto/cache-build/p5020ds-64b/b=
uild_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/=
log.do_compile.28447
> Log data follows:
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-li=
nux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
> | ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-=
64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/=
temp/log.do_compile.28447 for further information)
> | NOTE: make -j 24
> |   LINK  ppc-linux-user/qemu-ppc
> | /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/sysroo=
ts/x86_64-linux/usr/libexec/ppc64e5500-fsl-linux/gcc/powerpc64-fsl-linux/4.=
6.4/ld:/opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/wor=
k/ppc64e5500-fsl-linux/qemu-0.15.1-r6/qemu-0.15.1/ppc64.ld:84: syntax error
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-ppc] Error 1
> | make: *** [subdir-ppc-linux-user] Error 2
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
>
> (master rev: a9207aad5b163a071cd8298517d61514c587e0ed)
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu_0.15.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-dev=
tools/qemu/qemu_0.15.1.bb
> index b3fb354..2cc59f6 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
>                      file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
>
> -PR =3D "r8"
> +PR =3D "r9"
>
>  FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}"
>  FILESDIR =3D "${WORKDIR}"
> --
> 1.8.1.2.545.g2f19ada

Missing a patch?

-M

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



