Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBr53-0003e7-0s
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:50:29 +0200
Received: from mail204-co1-R.bigfish.com (10.243.78.231) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 17:37:55 +0000
Received: from mail204-co1 (localhost [127.0.0.1])	by
	mail204-co1-R.bigfish.com (Postfix) with ESMTP id 4454180058;
	Wed, 12 Sep 2012 17:37:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I4015Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail204-co1 (localhost.localdomain [127.0.0.1]) by mail204-co1
	(MessageSwitch) id 1347471473447469_6755;
	Wed, 12 Sep 2012 17:37:53 +0000 (UTC)
Received: from CO1EHSMHS030.bigfish.com (unknown [10.243.78.234])	by
	mail204-co1.bigfish.com (Postfix) with ESMTP id 69AD0740049;
	Wed, 12 Sep 2012 17:37:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS030.bigfish.com
	(10.243.66.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 17:37:52 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Wed, 12 Sep 2012 12:37:51 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Luo Zhenhua-B19537 <B19537@freescale.com>, Scott Garman
	<scott.a.garman@intel.com>
Thread-Topic: [OE-core] [oe-core v2] valgrind: fix debug info reading error
	when do memcheck on ppc targets
Thread-Index: AQHNkQ1UgIoGeM8ycUOJO4YQC3jvjg==
Date: Wed, 12 Sep 2012 17:37:50 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A674CE7@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347438046-9745-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1347438046-9745-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core v2] valgrind: fix debug info reading error when do memcheck on ppc targets
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
X-List-Received-Date: Wed, 12 Sep 2012 17:50:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C55F6832B501AB42BE1AF3C3E345CF40@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 3:20 AM,  <b19537@freescale.com> wrote:
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

Scott,

I've added this to my denzil branch. Please pick it up for denzil-next
when you are working on it again.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dmattsm/denz=
il

Thanks,
Matthew

> ---
>  ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   33 ++++++++++++++=
++++++
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 ++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrin=
d-3.7.0-fix-error-of-reading-debug-info.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0=
-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/val=
grind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
> new file mode 100644
> index 0000000..b1626f0
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-er=
ror-of-reading-debug-info.patch
> @@ -0,0 +1,33 @@
> +Upstream-Status: Pending
> +
> +fix debug info reading error when do memcheck on ppc targets
> +    following is the error message:
> +        --2263-- WARNING: Serious error when reading debug info
> +        --2263-- When reading debug info from /lib/ld-2.13.so:
> +        --2263-- Can't make sense of .got section mapping
> +        --2263-- WARNING: Serious error when reading debug info
> +        --2263-- When reading debug info from /home/root/lzh:
> +        --2263-- Can't make sense of .data section mapping
> +        --2263-- WARNING: Serious error when reading debug info
> +        --2263-- When reading debug info from /usr/lib/valgrind/vgpreloa=
d_core-ppc32-linux.so:
> +        --2263-- Can't make sense of .data section mapping
> +        --2263-- WARNING: Serious error when reading debug info
> +        --2263-- When reading debug info from /usr/lib/valgrind/vgpreloa=
d_memcheck-ppc32-linux.so:
> +        --2263-- Can't make sense of .data section mapping
> +        --2263-- WARNING: Serious error when reading debug info
> +        --2263-- When reading debug info from /lib/libc-2.13.so:
> +        --2263-- Can't make sense of .data section mapping
> +
> +Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> +
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



