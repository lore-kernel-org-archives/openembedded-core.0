Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B108071AE6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 16:15:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 02 Feb 2017 08:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,325,1477983600"; 
	d="asc'?scan'208";a="61107365"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.122])
	([10.219.128.122])
	by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2017 08:15:11 -0800
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com
References: <1485900624-22510-1-git-send-email-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58935BC8.8080402@linux.intel.com>
Date: Thu, 2 Feb 2017 10:18:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1485900624-22510-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCHv4] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 02 Feb 2017 16:15:13 -0000
X-Groupsio-MsgNum: 92799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="orPuw6JsO6bftkLOFCpv2dEL07KDR4feI"

--orPuw6JsO6bftkLOFCpv2dEL07KDR4feI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 01/31/2017 04:10 PM, An=C3=ADbal Lim=C3=B3n wrote:
> Added patches:
>=20
> - target-ppc-fix-user-mode.patch

The patch was integrated into qemu-ppc-for-2.9 branch and  then dropped
, now there are some discussions about the right fix so is better to
wait upstream to integrate the right fix.

Cheers,
	alimon

>=20
> Rebased patches:
>=20
> - exclude-some-arm-EABI-obsolete-syscalls.patc
>=20
> Removed patches (already in upstream):
>=20
> - 0003-fix-CVE-2016-7908.patch
> - 0004-fix-CVE-2016-7909.patch
> - 0001-target-mips-add-24KEc-CPU-definition.patch
>=20
> Changelog,
>=20
> http://wiki.qemu.org/ChangeLog/2.8
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                |  1 -
>  ...0001-target-mips-add-24KEc-CPU-definition.patch | 54 --------------=
-----
>  .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62 --------------=
--------
>  .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 --------------=
-
>  ...-Arm-versatilepb-Add-memory-size-checking.patch | 46 --------------=
--
>  .../exclude-some-arm-EABI-obsolete-syscalls.patch  | 22 +++-----
>  .../qemu/qemu/target-ppc-fix-user-mode.patch       | 48 ++++++++++++++=
+++
>  .../qemu/{qemu_2.7.1.bb =3D> qemu_2.8.0.bb}          |  8 ++-
>  8 files changed, 59 insertions(+), 224 deletions(-)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-ad=
d-24KEc-CPU-definition.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7=
908.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7=
909.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilep=
b-Add-memory-size-checking.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/target-ppc-fix-user=
-mode.patch
>  rename meta/recipes-devtools/qemu/{qemu_2.7.1.bb =3D> qemu_2.8.0.bb} (=
70%)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index ac5fcac..e3af5c2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -19,7 +19,6 @@ SRC_URI =3D "\
>      file://wacom.patch \
>      file://add-ptest-in-makefile.patch \
>      file://run-ptest \
> -    file://0001-target-mips-add-24KEc-CPU-definition.patch \
>      "
> =20
>  SRC_URI_append_class-native =3D "\
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc=
-CPU-definition.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-=
add-24KEc-CPU-definition.patch
> deleted file mode 100644
> index c4dbee7..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-de=
finition.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 926bc194f918d46bd93557b15da8153b6a94a1d5 Mon Sep 17 00:00:00 2001=

> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> -Date: Mon, 25 Jul 2016 23:58:22 +0100
> -Subject: [PATCH] target-mips: add 24KEc CPU definition
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Define a new CPU definition supporting 24KEc cores, similar to
> -the existing 24Kc, but with added support for DSP instructions
> -and MIPS16e (and without FPU).
> -
> -Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ----
> -Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-=
devel/2016-07/msg05778.html]
> - target-mips/translate_init.c | 22 ++++++++++++++++++++++
> - 1 file changed, 22 insertions(+)
> -
> -diff --git a/target-mips/translate_init.c b/target-mips/translate_init=
=2Ec
> -index 39ed5c4..6ae23e4 100644
> ---- a/target-mips/translate_init.c
> -+++ b/target-mips/translate_init.c
> -@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =3D
> -         .mmu_type =3D MMU_TYPE_R4000,
> -     },
> -     {
> -+        .name =3D "24KEc",
> -+        .CP0_PRid =3D 0x00019600,
> -+        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> -+                       (MMU_TYPE_R4000 << CP0C0_MT),
> -+        .CP0_Config1 =3D MIPS_CONFIG1 | (15 << CP0C1_MMU) |
> -+                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C=
1_IA) |
> -+                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C=
1_DA) |
> -+                       (1 << CP0C1_CA),
> -+        .CP0_Config2 =3D MIPS_CONFIG2,
> -+        .CP0_Config3 =3D MIPS_CONFIG3 | (1 << CP0C3_DSPP) | (0 << CP0=
C3_VInt),
> -+        .CP0_LLAddr_rw_bitmask =3D 0,
> -+        .CP0_LLAddr_shift =3D 4,
> -+        .SYNCI_Step =3D 32,
> -+        .CCRes =3D 2,
> -+        /* we have a DSP, but no FPU */
> -+        .CP0_Status_rw_bitmask =3D 0x1378FF1F,
> -+        .SEGBITS =3D 32,
> -+        .PABITS =3D 32,
> -+        .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP,
> -+        .mmu_type =3D MMU_TYPE_R4000,
> -+    },
> -+    {
> -         .name =3D "24Kf",
> -         .CP0_PRid =3D 0x00019300,
> -         .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> ---=20
> -2.8.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.pat=
ch b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
> deleted file mode 100644
> index 05cc3d9..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport patch to fix CVE-2016-7908 from:
> -
> -http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D070c4b92b8c
> -
> -CVE: CVE-2016-7908
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 070c4b92b8cd5390889716677a0b92444d6e087a Mon Sep 17 00:00:00 2001=

> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 22 Sep 2016 16:02:37 +0530
> -Subject: [PATCH] net: mcf: limit buffer descriptor count
> -
> -ColdFire Fast Ethernet Controller uses buffer descriptors to manage
> -data flow to/fro receive & transmit queues. While transmitting
> -packets, it could continue to read buffer descriptors if a buffer
> -descriptor has length of zero and has crafted values in bd.flags.
> -Set upper limit to number of buffer descriptors.
> -
> -Reported-by: Li Qiang <liqiang6-s@360.cn>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> -Signed-off-by: Jason Wang <jasowang@redhat.com>
> ----
> - hw/net/mcf_fec.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
> -index 0ee8ad9..d31fea1 100644
> ---- a/hw/net/mcf_fec.c
> -+++ b/hw/net/mcf_fec.c
> -@@ -23,6 +23,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } whi=
le (0)
> - #define DPRINTF(fmt, ...) do {} while(0)
> - #endif
> -=20
> -+#define FEC_MAX_DESC 1024
> - #define FEC_MAX_FRAME_SIZE 2032
> -=20
> - typedef struct {
> -@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
> -     uint32_t addr;
> -     mcf_fec_bd bd;
> -     int frame_size;
> --    int len;
> -+    int len, descnt =3D 0;
> -     uint8_t frame[FEC_MAX_FRAME_SIZE];
> -     uint8_t *ptr;
> -=20
> -@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
> -     ptr =3D frame;
> -     frame_size =3D 0;
> -     addr =3D s->tx_descriptor;
> --    while (1) {
> -+    while (descnt++ < FEC_MAX_DESC) {
> -         mcf_fec_read_bd(&bd, addr);
> -         DPRINTF("tx_bd %x flags %04x len %d data %08x\n",
> -                 addr, bd.flags, bd.length, bd.data);
> ---=20
> -2.9.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.pat=
ch b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
> deleted file mode 100644
> index e71bbf6..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Backport [http://git.qemu.org/?p=3Dqemu.git;a=3Dcommi=
t;h=3D34e29ce]
> -CVE: CVE-2016-7909
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 34e29ce754c02bb6b3bdd244fbb85033460feaff Mon Sep 17 00:00:00 2001=

> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Fri, 30 Sep 2016 00:27:33 +0530
> -Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length
> -
> -The AMD PC-Net II emulator has set of control and status(CSR)
> -registers. Of these, CSR76 and CSR78 hold receive and transmit
> -descriptor ring length respectively. This ring length could range
> -from 1 to 65535. Setting ring length to zero leads to an infinite
> -loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.
> -
> -Reported-by: Li Qiang <liqiang6-s@360.cn>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Signed-off-by: Jason Wang <jasowang@redhat.com>
> ----
> - hw/net/pcnet.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> -index 198a01f..3078de8 100644
> ---- a/hw/net/pcnet.c
> -+++ b/hw/net/pcnet.c
> -@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s, uin=
t32_t rap, uint32_t new_value)
> -     case 47: /* POLLINT */
> -     case 72:
> -     case 74:
> -+        break;
> -     case 76: /* RCVRL */
> -     case 78: /* XMTRL */
> -+        val =3D (val > 0) ? val : 512;
> -+        break;
> -     case 112:
> -        if (CSR_STOP(s) || CSR_SPND(s))
> -            break;
> ---=20
> -2.10.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-m=
emory-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-vers=
atilepb-Add-memory-size-checking.patch
> deleted file mode 100644
> index 1a6cf51..0000000
> --- a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-s=
ize-checking.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001=

> -From: Jiang Lu <lu.jiang@windriver.com>
> -Date: Wed, 13 Nov 2013 10:38:08 +0800
> -Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
> -
> -The machine can not work with memory over 256M, so add a checking
> -at startup. If the memory size exceed 256M, just stop emulation then
> -throw out warning about memory limitation.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> -
> -Updated it on 2014-01-15 for rebasing
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Update it when upgrade qemu to 2.2.0
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ----
> - hw/arm/versatilepb.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> -index 6c69f4e..9278d90 100644
> ---- a/hw/arm/versatilepb.c
> -+++ b/hw/arm/versatilepb.c
> -@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine,=
 int board_id)
> -         exit(1);
> -     }
> -
> -+    if (machine->ram_size > (256 << 20)) {
> -+        fprintf(stderr,
> -+                "qemu: Too much memory for this machine: %d MB, maxim=
um 256 MB\n",
> -+                ((unsigned int)ram_size / (1 << 20)));
> -+        exit(1);
> -+    }
> -+
> -     cpuobj =3D object_new(object_class_get_name(cpu_oc));
> -
> -     /* By default ARM1176 CPUs have EL3 enabled.  This board does not=

> ---=20
> -2.1.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obso=
lete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EA=
BI-obsolete-syscalls.patch
> index 171bda7..f593cf9 100644
> --- a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-sy=
scalls.patch
> +++ b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-sy=
scalls.patch
> @@ -27,14 +27,14 @@ or kernel header:
> =20
>  Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>  ---
> - qemu-seccomp.c | 14 ++++++++------
> - 1 file changed, 8 insertions(+), 6 deletions(-)
> + qemu-seccomp.c | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> =20
>  diff --git a/qemu-seccomp.c b/qemu-seccomp.c
> -index caa926e..5a78502 100644
> +index df75d9c..0e577f8 100644
>  --- a/qemu-seccomp.c
>  +++ b/qemu-seccomp.c
> -@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
> +@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
>       { SCMP_SYS(timer_settime), 255 },
>       { SCMP_SYS(timer_gettime), 254 },
>       { SCMP_SYS(futex), 253 },
> @@ -58,7 +58,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(mprotect), 246 },
>       { SCMP_SYS(execve), 245 },
>       { SCMP_SYS(open), 245 },
> -@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
> +@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall seccomp_white=
list[] =3D {
>       { SCMP_SYS(bind), 245 },
>       { SCMP_SYS(listen), 245 },
>       { SCMP_SYS(semget), 245 },
> @@ -66,13 +66,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(gettimeofday), 245 },
>       { SCMP_SYS(readlink), 245 },
>       { SCMP_SYS(access), 245 },
> -     { SCMP_SYS(prctl), 245 },
> -     { SCMP_SYS(signalfd), 245 },
> --    { SCMP_SYS(getrlimit), 245 },
> -     { SCMP_SYS(set_tid_address), 245 },
> -     { SCMP_SYS(statfs), 245 },
> -     { SCMP_SYS(unlink), 245 },
> -@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall seccomp_white=
list[] =3D {
> +@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
>       { SCMP_SYS(times), 245 },
>       { SCMP_SYS(exit), 245 },
>       { SCMP_SYS(clock_gettime), 245 },
> @@ -80,7 +74,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(restart_syscall), 245 },
>       { SCMP_SYS(pwrite64), 245 },
>       { SCMP_SYS(nanosleep), 245 },
> -@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
> +@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall seccomp_whi=
telist[] =3D {
>       { SCMP_SYS(lstat64), 241 },
>       { SCMP_SYS(sendfile64), 241 },
>       { SCMP_SYS(ugetrlimit), 241 },
> @@ -89,5 +83,5 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(rt_sigqueueinfo), 241 },
>       { SCMP_SYS(rt_tgsigqueueinfo), 241 },
>  --=20
> -1.9.1
> +2.1.4
> =20
> diff --git a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.p=
atch b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
> new file mode 100644
> index 0000000..ba21e71
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
> @@ -0,0 +1,48 @@
> +[Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pth=
read
> +
> +From: Sam Bobroff
> +Subject: [Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault=
 with pthread_create()
> +Date: Mon, 30 Jan 2017 16:08:07 +1100
> +Programs run under qemu-ppc64 on an x86_64 host currently segfault
> +if they use pthread_create() due to the adjustment made to the NIP in
> +commit bd6fefe71cec5a0c7d2be4ac96307f25db56abf9.
> +
> +This patch changes cpu_loop() to set the NIP back to the
> +pre-incremented value before calling do_syscall(), which causes the
> +correct address to be used for the new thread and corrects the fault.
> +
> +Signed-off-by: Sam Bobroff <address@hidden>
> +
> +Upstream-Status: Backport
> +
> +---
> +
> +linux-user/main.c | 4 +++-
> +1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/linux-user/main.c b/linux-user/main.c
> +index 30049581ef..b5dee01541 100644
> +--- a/linux-user/main.c
> ++++ b/linux-user/main.c
> +@@ -1712,18 +1712,20 @@ void cpu_loop(CPUPPCState *env)
> +              * in syscalls.
> +              */
> +             env->crf[0] &=3D ~0x1;
> ++            env->nip +=3D 4;
> +             ret =3D do_syscall(env, env->gpr[0], env->gpr[3], env->gp=
r[4],
> +                              env->gpr[5], env->gpr[6], env->gpr[7],
> +                              env->gpr[8], 0, 0);
> +             if (ret =3D=3D -TARGET_ERESTARTSYS) {
> ++                env->nip -=3D 4;
> +                 break;
> +             }
> +             if (ret =3D=3D (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {=

> ++                env->nip -=3D 4;
> +                 /* Returning from a successful sigreturn syscall.
> +                    Avoid corrupting register state.  */
> +                 break;
> +             }
> +-            env->nip +=3D 4;
> +             if (ret > (target_ulong)(-515)) {
> +                 env->crf[0] |=3D 0x1;
> +                 ret =3D -ret;
> diff --git a/meta/recipes-devtools/qemu/qemu_2.7.1.bb b/meta/recipes-de=
vtools/qemu/qemu_2.8.0.bb
> similarity index 70%
> rename from meta/recipes-devtools/qemu/qemu_2.7.1.bb
> rename to meta/recipes-devtools/qemu/qemu_2.8.0.bb
> index 8180c5f..e0527a8 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.7.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
> @@ -5,18 +5,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf=
86e15a37fa47e15a72fbac \
> =20
>  SRC_URI +=3D "file://configure-fix-Darwin-target-detection.patch \
>              file://qemu-enlarge-env-entry-size.patch \
> -            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch=
 \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
>              file://qemu-2.5.0-cflags.patch \
> -            file://0003-fix-CVE-2016-7908.patch \
> -            file://0004-fix-CVE-2016-7909.patch \
> +            file://target-ppc-fix-user-mode.patch \
>  "
> =20
>  SRC_URI =3D+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> =20
> -SRC_URI[md5sum] =3D "a315bc51ed443a08d2cf1416d76b9ab4"
> -SRC_URI[sha256sum] =3D "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c=
282217831c4822958f"
> +SRC_URI[md5sum] =3D "17940dce063b6ce450a12e719a6c9c43"
> +SRC_URI[sha256sum] =3D "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58=
bc2036219b591e5e62"
> =20
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
>=20


--orPuw6JsO6bftkLOFCpv2dEL07KDR4feI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYk1vKAAoJEGJqcE9h3glgN2gP/3JAHOgtkhNej9ghXMuvzpq3
/1pcxArqox8pO/DIex3wMHwTfLowI2Z4wuleljvStd5W351Rr1AstT+fO+M3TwmV
NH7ahDqI+jE0FnxyUD3JlFB86DiDJVZxgUYX73SCB8ImIiAD2w0xHzRbrzfsc5wu
3iazroHCKW7B/MFD/aaY+rh/zoHTd5SQTC2BbF2ooRoUEYwerwemhHnUqKX3r7Rs
6W8H4k1x9rujKvDK+sRVdD5EC87k9J8V7TqxH3oQfZKGSvP3dcSvBB1GNiu+0zx3
dOzqrbJV7zv0K88O1Y+LUdql2a2/9erDaCemwm3kmLcLGJW4i0WEI+9FL7mvOmmG
WX/ppARLfpSIc9y4XK7PUZROpfhysJ0F1A5lA1TauJK+SMqxORedqXJU6ugU3aIe
9Gr0Iek/uYcS5GXOsduiit5rampM/oVgsxmnAHCI2lvEDKiGLfWlfQafTHMga+qL
KfAkwo7+p2DBFJKe6BOIVvVRqpgVo5u4fLV2yqtBWRs//uC/zIK9z7B6vwPbR47j
4BjLeC8SXphUjVTvuLWxkEM7R3sR2UVV74QCYYZERN/7Pi7EGgqNjpRbv/RXYEKw
r/VoOChsQrSoQiEV6vpVYQdNNzTIgUqNRWdA40y+boxIxkH0cCTGv26OEkBibPeW
4c1Wo2wAuy2BkuD0UqGv
=ZN6p
-----END PGP SIGNATURE-----

--orPuw6JsO6bftkLOFCpv2dEL07KDR4feI--
