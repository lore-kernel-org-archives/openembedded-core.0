Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RL0LI-0001yl-OF
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 23:28:33 +0100
Received: from mail186-tx2-R.bigfish.com (10.9.14.245) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.22; Mon, 31 Oct 2011 22:22:14 +0000
Received: from mail186-tx2 (localhost.localdomain [127.0.0.1])	by
	mail186-tx2-R.bigfish.com (Postfix) with ESMTP id 2310A12B83DE	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:22:21 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zzbb2dK9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail186-tx2 (localhost.localdomain [127.0.0.1]) by mail186-tx2
	(MessageSwitch) id 1320099740699399_18001;
	Mon, 31 Oct 2011 22:22:20 +0000 (UTC)
Received: from TX2EHSMHS006.bigfish.com (unknown [10.9.14.240])	by
	mail186-tx2.bigfish.com (Postfix) with ESMTP id 964C51110057	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:22:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS006.bigfish.com
	(10.9.99.106) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 31 Oct 2011 22:22:08 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Mon, 31 Oct 2011 17:22:20 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] dtc: update to latest git version
Thread-Index: AQHMmBuOk1lqozNpnUqmwd61okOGpw==
Date: Mon, 31 Oct 2011 22:22:20 +0000
Message-ID: <CAEsOVNdEAk3PCiiNO=+aw6XPNOHseR_qn7JFNe0GBYikqymFpQ@mail.gmail.com>
References: <1319786762-8854-1-git-send-email-msm@freescale.com>
In-Reply-To: <1319786762-8854-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] dtc: update to latest git version
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
X-List-Received-Date: Mon, 31 Oct 2011 22:28:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CEC8E66908DBAB4BBD8CC3E2B8D9CDFD@freescale.net>
Content-Transfer-Encoding: quoted-printable

Ignore this for now, I'm going to send an update version that has
proper dbg, dev, and staticdev packages!

-M

On Fri, Oct 28, 2011 at 2:26 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> Also remove patches that are no longer needed
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =A0meta/recipes-kernel/dtc/dtc.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A04 +-
> =A0.../dtc/fix_for_compilation_with_gcc_4.6.0.patch =A0 | =A0 51 --------=
------------
> =A0meta/recipes-kernel/dtc/dtc/remove_space_opt.patch | =A0 18 -------
> =A0meta/recipes-kernel/dtc/dtc_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 10 +---
> =A04 files changed, 5 insertions(+), 78 deletions(-)
> =A0delete mode 100644 meta/recipes-kernel/dtc/dtc/fix_for_compilation_wit=
h_gcc_4.6.0.patch
> =A0delete mode 100644 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
>
> diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dt=
c.inc
> index eae46ac..5dbfb32 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -11,8 +11,8 @@ do_install() {
> =A0 =A0 =A0 =A0install -m 755 dtc ${D}${bindir}/dtc
> =A0}
> =A0SRC_URI =3D "git://www.jdl.com/software/dtc.git;protocol=3Dgit \
> - =A0 =A0 =A0 file://fix_for_compilation_with_gcc_4.6.0.patch"
> + =A0 =A0 =A0 =A0 "
>
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
>
> =A0S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6=
.0.patch b/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.p=
atch
> deleted file mode 100644
> index b34894d..0000000
> --- a/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patc=
h
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Upstream-Status: Pending
> -
> -Fix following compilation errors with gcc 4.6.0
> -| dtc.c: In function 'main':
> -| dtc.c:100:17: error: variable 'check' set but not used [-Werror=3Dunus=
ed-but-set-variable]
> -| cc1: all warnings being treated as errors
> -|
> -| make: *** [dtc.o] Error 1
> -| make: *** Waiting for unfinished jobs....
> -| flattree.c: In function 'flat_read_mem_reserve':
> -| flattree.c:700:14: error: variable 'p' set but not used [-Werror=3Dunu=
sed-but-set-variable]
> -| cc1: all warnings being treated as errors
> -|
> -| make: *** [flattree.o] Error 1
> -| ERROR: oe_runmake failed
> -
> -Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
> -
> -Index: git/dtc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/dtc.c
> -+++ git/dtc.c
> -@@ -97,7 +97,7 @@ int main(int argc, char *argv[])
> - =A0 =A0 =A0 const char *inform =3D "dts";
> - =A0 =A0 =A0 const char *outform =3D "dts";
> - =A0 =A0 =A0 const char *outname =3D "-";
> -- =A0 =A0 =A0int force =3D 0, check =3D 0;
> -+ =A0 =A0 =A0int force =3D 0, __attribute__((__unused__)) check =3D 0;
> - =A0 =A0 =A0 const char *arg;
> - =A0 =A0 =A0 int opt;
> - =A0 =A0 =A0 FILE *outf =3D NULL;
> -Index: git/flattree.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/flattree.c
> -+++ git/flattree.c
> -@@ -697,7 +697,6 @@ static struct reserve_info *flat_read_me
> - {
> - =A0 =A0 =A0 struct reserve_info *reservelist =3D NULL;
> - =A0 =A0 =A0 struct reserve_info *new;
> -- =A0 =A0 =A0const char *p;
> - =A0 =A0 =A0 struct fdt_reserve_entry re;
> -
> - =A0 =A0 =A0 /*
> -@@ -706,7 +705,6 @@ static struct reserve_info *flat_read_me
> - =A0 =A0 =A0 =A0*
> - =A0 =A0 =A0 =A0* First pass, count entries.
> - =A0 =A0 =A0 =A0*/
> -- =A0 =A0 =A0p =3D inb->ptr;
> - =A0 =A0 =A0 while (1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 flat_read_chunk(inb, &re, sizeof(re));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 re.address =A0=3D fdt64_to_cpu(re.address);
> diff --git a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch b/meta/re=
cipes-kernel/dtc/dtc/remove_space_opt.patch
> deleted file mode 100644
> index 8c26dec..0000000
> --- a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Remove the -Os flag
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -Index: git/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/Makefile
> -+++ git/Makefile
> -@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =3D
> - CPPFLAGS =3D -I libfdt
> - WARNINGS =3D -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs=
 \
> - =A0 =A0 =A0 -Wstrict-prototypes -Wmissing-prototypes
> --CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> -+CFLAGS =3D -g -fPIC -Werror $(WARNINGS)
> -
> - BISON =3D bison
> - LEX =3D flex
> diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc=
/dtc_git.bb
> index e010488..c205de7 100644
> --- a/meta/recipes-kernel/dtc/dtc_git.bb
> +++ b/meta/recipes-kernel/dtc/dtc_git.bb
> @@ -3,14 +3,10 @@ require dtc.inc
> =A0LIC_FILES_CHKSUM =3D "file://GPL;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://libfdt/libfdt.h;beginline=
=3D3;endline=3D52;md5=3Dfb360963151f8ec2d6c06b055bcbb68c"
>
> -SRCREV =3D "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
> +SRCREV =3D "033089f29099bdfd5c2d6986cdb9fd07b16cfde0"
> =A0PV =3D "1.3.0+git${SRCPV}"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =A0S =3D "${WORKDIR}/git"
>
> -SRC_URI_PATCH =3D " file://remove_space_opt.patch"
> -SRC_URI_PATCH_virtclass-native =3D ""
> -SRC_URI +=3D "${SRC_URI_PATCH}"
> -
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



