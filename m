Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBeMQ-0003fD-J2
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:15:34 +0200
Received: from mail69-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 04:03:02 +0000
Received: from mail69-tx2 (localhost [127.0.0.1])	by mail69-tx2-R.bigfish.com
	(Postfix) with ESMTP id 284AD2000A2	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 04:03:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail69-tx2 (localhost.localdomain [127.0.0.1]) by mail69-tx2
	(MessageSwitch) id 1347422580107302_26693;
	Wed, 12 Sep 2012 04:03:00 +0000 (UTC)
Received: from TX2EHSMHS018.bigfish.com (unknown [10.9.14.235])	by
	mail69-tx2.bigfish.com (Postfix) with ESMTP id 16FB7480045	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 04:03:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS018.bigfish.com
	(10.9.99.118) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 04:02:59 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Tue, 11 Sep 2012 23:02:58 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Luo Zhenhua-B19537 <B19537@freescale.com>, St John Robert-RAT173
	<RAT173@freescale.com>
Thread-Topic: [OE-core] [oe-core] valgrind: fix debug info reading error
	when do memcheck on ppc targets
Thread-Index: AQHNkJt+9Zig/of4hk+q2wJNSbpnHg==
Date: Wed, 12 Sep 2012 04:02:58 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347421458-2044-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1347421458-2044-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: valgrind: fix debug info reading error when do memcheck on ppc targets
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
X-List-Received-Date: Wed, 12 Sep 2012 04:15:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A3569B5D2FC87E4384B90159225DFAD9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 10:44 PM,  <b19537@freescale.com> wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>
>     following is the error message:
>         --2263-- WARNING: Serious error when reading debug info
>         --2263-- When reading debug info from /lib/ld-2.13.so:
>         --2263-- Can't make sense of .got section mapping
>         --2263-- WARNING: Serious error when reading debug info
>         --2263-- When reading debug info from /home/root/lzh:
>         --2263-- Can't make sense of .data section mapping
>         --2263-- WARNING: Serious error when reading debug info
>         --2263-- When reading debug info from /usr/lib/valgrind/vgpreload=
_core-ppc32-linux.so:
>         --2263-- Can't make sense of .data section mapping
>         --2263-- WARNING: Serious error when reading debug info
>         --2263-- When reading debug info from /usr/lib/valgrind/vgpreload=
_memcheck-ppc32-linux.so:
>         --2263-- Can't make sense of .data section mapping
>         --2263-- WARNING: Serious error when reading debug info
>         --2263-- When reading debug info from /lib/libc-2.13.so:
>         --2263-- Can't make sense of .data section mapping
>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   11 +++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 ++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrin=
d-3.7.0-fix-error-of-reading-debug-info.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0=
-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/val=
grind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch

Patch needs Upstream-Status:

-M

> new file mode 100644
> index 0000000..c3ebd67
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-er=
ror-of-reading-debug-info.patch
> @@ -0,0 +1,11 @@
> +--- a/coregrind/m_debuginfo/readelf.c  2012-09-11 21:45:36.696462313 -05=
00
> ++++ b/coregrind/m_debuginfo/readelf.c  2012-09-11 21:45:49.913463615 -05=
00
> +@@ -1539,7 +1539,7 @@
> +                 && phdr->p_offset < di->fsm.rw_map_foff + di->fsm.rw_ma=
p_size
> +                 && phdr->p_offset + phdr->p_filesz
> +                    <=3D di->fsm.rw_map_foff + di->fsm.rw_map_size
> +-                && (phdr->p_flags & (PF_R | PF_W | PF_X)) =3D=3D (PF_R =
| PF_W)) {
> ++                && (phdr->p_flags & (PF_R | PF_W | PF_X)) >=3D (PF_R | =
PF_W)) {
> +                if (n_rw =3D=3D N_RX_RW_AREAS) {
> +                   ML_(symerr)(di, True,
> +                               "N_RX_RW_AREAS is too low; "
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/reci=
pes-devtools/valgrind/valgrind_3.7.0.bb
> index abda7a6..651ae60 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46082167a314d=
785d012a244748d803 \
>
>  X11DEPENDS =3D "virtual/libx11"
>  DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}',=
 '', d)}"
> -PR =3D "r5"
> +PR =3D "r6"
>
>  SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>            file://fix_issue_caused_by_ccache.patch \
> @@ -21,6 +21,9 @@ SRC_URI =3D "http://www.valgrind.org/downloads/valgrind=
-${PV}.tar.bz2 \
>             file://configure-with-glibc-2.16.patch \
>            "
>
> +SRC_URI_append_powerpc =3D " file://valgrind-3.7.0-fix-error-of-reading-=
debug-info.patch"
> +SRC_URI_append_powerpc64 =3D "file://valgrind-3.7.0-fix-error-of-reading=
-debug-info.patch"

Is it safe to apply this to everything? I can't image an elf issue
would be powerpc specific.

-M

> +
>  SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d1775"
>  SRC_URI[sha256sum] =3D "5d62c0330f1481fe2c593249192fa68ff454c19c34343978=
cc9ce91aa324cbf6"
>
> --
> 1.7.9.5
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



