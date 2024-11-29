Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86603D6EBEC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:17:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.111283.1732868254447176294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 00:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2063c7128b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7Y6Gq001495
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:17:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671asw7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:17:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 29 Nov 2024 00:17:28 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] qemu: upgrade 8.2.3 -> 8.2.7
Date: Fri, 29 Nov 2024 08:17:08 +0000
Message-ID: <20241129081708.2064784-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: qndowhsEtJL8Do0aqjEEc5ywvy7M-Q_c
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=6749789d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=bDdBU3oEAAAA:8 a=JF9118EUAAAA:8 a=9qUTvQc-AAAA:8 a=20KFwNOVAAAA:8 a=69wJf7TsAAAA:8 a=6R7veym_AAAA:8 a=TYBLyS7eAAAA:8 a=m1oCZ56VXPu70RfcER4A:9 a=L6peYFxynwtOCbA3:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=DN7SgORnOiO7RqxRx1GC:22 a=xVlTc564ipvMDusKsbsT:22 a=axOgMmt4Ejcwn1cqzmsR:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=ILCOIF4F_8SzUMnO7jNM:22 a=zvYvwCWiE4KgVXXeO06c:22
X-Proofpoint-GUID: qndowhsEtJL8Do0aqjEEc5ywvy7M-Q_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_06,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AT7Y6Gq001495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208007

From: Yogita Urade <yogita.urade@windriver.com>

This includes fix for: CVE-2024-4693, CVE-2024-6505 and CVE-2024-7730

General changelog for 8.2: https://wiki.qemu.org/ChangeLog/8.2

Droped:
0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch
CVE-2024-4467 and CVE-2024-7409 since already contained the fix.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...u-native_8.2.3.bb =3D> qemu-native_8.2.7.bb} |    0
 ...e_8.2.3.bb =3D> qemu-system-native_8.2.7.bb} |    0
 meta/recipes-devtools/qemu/qemu.inc           |   14 +-
 ...kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch |   75 --
 ...kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch |   73 -
 ...cv-kvm-change-timer-regs-size-to-u64.patch |  107 --
 .../qemu/qemu/CVE-2024-4467-0001.patch        |  112 --
 .../qemu/qemu/CVE-2024-4467-0002.patch        |   55 -
 .../qemu/qemu/CVE-2024-4467-0003.patch        |   57 -
 .../qemu/qemu/CVE-2024-4467-0004.patch        | 1187 -----------------
 .../qemu/qemu/CVE-2024-4467-0005.patch        |  239 ----
 .../qemu/qemu/CVE-2024-7409-0001.patch        |  167 ---
 .../qemu/qemu/CVE-2024-7409-0002.patch        |  175 ---
 .../qemu/qemu/CVE-2024-7409-0003.patch        |  126 --
 .../qemu/qemu/CVE-2024-7409-0004.patch        |  164 ---
 .../qemu/{qemu_8.2.3.bb =3D> qemu_8.2.7.bb}     |    0
 16 files changed, 1 insertion(+), 2550 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.3.bb =3D> qemu-native=
_8.2.7.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.3.bb =3D> qemu=
-system-native_8.2.7.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm=
-change-KVM_REG_RISCV_FP_F-to-u32.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm=
-change-KVM_REG_RISCV_FP_D-to-u64.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm=
-change-timer-regs-size-to-u64.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.pa=
tch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.pa=
tch
 rename meta/recipes-devtools/qemu/{qemu_8.2.3.bb =3D> qemu_8.2.7.bb} (10=
0%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.3.bb b/meta/recip=
es-devtools/qemu/qemu-native_8.2.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.7.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.3.bb b/met=
a/recipes-devtools/qemu/qemu-system-native_8.2.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.7.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e9f63b9eaf..40ee267a42 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,18 +40,6 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-se=
lf-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-           file://CVE-2024-4467-0001.patch \
-           file://CVE-2024-4467-0002.patch \
-           file://CVE-2024-4467-0003.patch \
-           file://CVE-2024-4467-0004.patch \
-           file://CVE-2024-4467-0005.patch \
-           file://CVE-2024-7409-0001.patch \
-           file://CVE-2024-7409-0002.patch \
-           file://CVE-2024-7409-0003.patch \
-           file://CVE-2024-7409-0004.patch \
-           file://0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32=
.patch \
-           file://0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64=
.patch \
-           file://0003-target-riscv-kvm-change-timer-regs-size-to-u64.pa=
tch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
@@ -68,7 +56,7 @@ SRC_URI:append:class-native =3D " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch =
\
         "
=20
-SRC_URI[sha256sum] =3D "dc747fb366809455317601c4876bd1f6829a32a23e83fb76=
e45ab12c2a569964"
+SRC_URI[sha256sum] =3D "1f0604f296ab9acb4854c054764a1ba408643fc299bd54a6=
500cccfaaca65b55"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change=
-KVM_REG_RISCV_FP_F-to-u32.patch b/meta/recipes-devtools/qemu/qemu/0001-t=
arget-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
deleted file mode 100644
index 39a6a85162..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_RE=
G_RISCV_FP_F-to-u32.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From bbdcc89678daa5cb131ef22a6cd41a5f7f9dcea9 Mon Sep 17 00:00:00 2001
-From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Date: Fri, 8 Dec 2023 15:38:31 -0300
-Subject: [PATCH 1/3] target/riscv/kvm: change KVM_REG_RISCV_FP_F to u32
-
-KVM_REG_RISCV_FP_F regs have u32 size according to the API, but by using
-kvm_riscv_reg_id() in RISCV_FP_F_REG() we're returning u64 sizes when
-running with TARGET_RISCV64. The most likely reason why no one noticed
-this is because we're not implementing kvm_cpu_synchronize_state() in
-RISC-V yet.
-
-Create a new helper that returns a KVM ID with u32 size and use it in
-RISCV_FP_F_REG().
-
-Reported-by: Andrew Jones <ajones@ventanamicro.com>
-Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
-Message-ID: <20231208183835.2411523-2-dbarboza@ventanamicro.com>
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-(cherry picked from commit 49c211ffca00fdf7c0c29072c224e88527a14838)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [bbdcc89678daa5cb131ef22a6cd41a5f7f9dcea9]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index c1675158fe..2eef2be86a 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -72,6 +72,11 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, =
uint64_t type,
-     return id;
- }
-=20
-+static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
-+{
-+    return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
-+}
-+
- #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_=
CORE, \
-                  KVM_REG_RISCV_CORE_REG(name))
-=20
-@@ -81,7 +86,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, u=
int64_t type,
- #define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV=
_TIMER, \
-                  KVM_REG_RISCV_TIMER_REG(name))
-=20
--#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_F=
P_F, idx)
-+#define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, i=
dx)
-=20
- #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_F=
P_D, idx)
-=20
-@@ -586,7 +591,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
-     if (riscv_has_ext(env, RVF)) {
-         uint32_t reg;
-         for (i =3D 0; i < 32; i++) {
--            ret =3D kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
-+            ret =3D kvm_get_one_reg(cs, RISCV_FP_F_REG(i), &reg);
-             if (ret) {
-                 return ret;
-             }
-@@ -620,7 +625,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
-         uint32_t reg;
-         for (i =3D 0; i < 32; i++) {
-             reg =3D env->fpr[i];
--            ret =3D kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
-+            ret =3D kvm_set_one_reg(cs, RISCV_FP_F_REG(i), &reg);
-             if (ret) {
-                 return ret;
-             }
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change=
-KVM_REG_RISCV_FP_D-to-u64.patch b/meta/recipes-devtools/qemu/qemu/0002-t=
arget-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
deleted file mode 100644
index 9480d3e0b5..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_RE=
G_RISCV_FP_D-to-u64.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 125b95d79e746cbab6b72683b3382dd372e38c61 Mon Sep 17 00:00:00 2001
-From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Date: Fri, 8 Dec 2023 15:38:32 -0300
-Subject: [PATCH 2/3] target/riscv/kvm: change KVM_REG_RISCV_FP_D to u64
-
-KVM_REG_RISCV_FP_D regs are always u64 size. Using kvm_riscv_reg_id() in
-RISCV_FP_D_REG() ends up encoding the wrong size if we're running with
-TARGET_RISCV32.
-
-Create a new helper that returns a KVM ID with u64 size and use it with
-RISCV_FP_D_REG().
-
-Reported-by: Andrew Jones <ajones@ventanamicro.com>
-Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
-Message-ID: <20231208183835.2411523-3-dbarboza@ventanamicro.com>
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-(cherry picked from commit 450bd6618fda3d2e2ab02b2fce1c79efd5b66084)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [125b95d79e746cbab6b72683b3382dd372e38c61]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 2eef2be86a..82ed4455a5 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -77,6 +77,11 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, u=
int64_t idx)
-     return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
- }
-=20
-+static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
-+{
-+    return KVM_REG_RISCV | KVM_REG_SIZE_U64 | type | idx;
-+}
-+
- #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_=
CORE, \
-                  KVM_REG_RISCV_CORE_REG(name))
-=20
-@@ -88,7 +93,7 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, ui=
nt64_t idx)
-=20
- #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, i=
dx)
-=20
--#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_F=
P_D, idx)
-+#define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_FP_D, i=
dx)
-=20
- #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
-     do { \
-@@ -579,7 +584,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
-     if (riscv_has_ext(env, RVD)) {
-         uint64_t reg;
-         for (i =3D 0; i < 32; i++) {
--            ret =3D kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
-+            ret =3D kvm_get_one_reg(cs, RISCV_FP_D_REG(i), &reg);
-             if (ret) {
-                 return ret;
-             }
-@@ -613,7 +618,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
-         uint64_t reg;
-         for (i =3D 0; i < 32; i++) {
-             reg =3D env->fpr[i];
--            ret =3D kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
-+            ret =3D kvm_set_one_reg(cs, RISCV_FP_D_REG(i), &reg);
-             if (ret) {
-                 return ret;
-             }
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change=
-timer-regs-size-to-u64.patch b/meta/recipes-devtools/qemu/qemu/0003-targ=
et-riscv-kvm-change-timer-regs-size-to-u64.patch
deleted file mode 100644
index 1ea1bcfe70..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-=
regs-size-to-u64.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From cbae1080988e0f1af0fb4c816205f7647f6de16f Mon Sep 17 00:00:00 2001
-From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Date: Fri, 8 Dec 2023 15:38:33 -0300
-Subject: [PATCH 3/3] target/riscv/kvm: change timer regs size to u64
-
-KVM_REG_RISCV_TIMER regs are always u64 according to the KVM API, but at
-this moment we'll return u32 regs if we're running a RISCV32 target.
-
-Use the kvm_riscv_reg_id_u64() helper in RISCV_TIMER_REG() to fix it.
-
-Reported-by: Andrew Jones <ajones@ventanamicro.com>
-Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
-Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
-Message-ID: <20231208183835.2411523-4-dbarboza@ventanamicro.com>
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-(cherry picked from commit 10f86d1b845087d14b58d65dd2a6e3411d1b6529)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [cbae1080988e0f1af0fb4c816205f7647f6de16f]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- target/riscv/kvm/kvm-cpu.c | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 82ed4455a5..ddbe820e10 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -88,7 +88,7 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type, ui=
nt64_t idx)
- #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_C=
SR, \
-                  KVM_REG_RISCV_CSR_REG(name))
-=20
--#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV=
_TIMER, \
-+#define RISCV_TIMER_REG(name)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_TIMER=
, \
-                  KVM_REG_RISCV_TIMER_REG(name))
-=20
- #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, i=
dx)
-@@ -111,17 +111,17 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type=
, uint64_t idx)
-         } \
-     } while (0)
-=20
--#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
-+#define KVM_RISCV_GET_TIMER(cs, name, reg) \
-     do { \
--        int ret =3D kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &re=
g); \
-+        int ret =3D kvm_get_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
-         if (ret) { \
-             abort(); \
-         } \
-     } while (0)
-=20
--#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
-+#define KVM_RISCV_SET_TIMER(cs, name, reg) \
-     do { \
--        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &re=
g); \
-+        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
-         if (ret) { \
-             abort(); \
-         } \
-@@ -649,10 +649,10 @@ static void kvm_riscv_get_regs_timer(CPUState *cs)
-         return;
-     }
-=20
--    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
--    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
--    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
--    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
-+    KVM_RISCV_GET_TIMER(cs, time, env->kvm_timer_time);
-+    KVM_RISCV_GET_TIMER(cs, compare, env->kvm_timer_compare);
-+    KVM_RISCV_GET_TIMER(cs, state, env->kvm_timer_state);
-+    KVM_RISCV_GET_TIMER(cs, frequency, env->kvm_timer_frequency);
-=20
-     env->kvm_timer_dirty =3D true;
- }
-@@ -666,8 +666,8 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
-         return;
-     }
-=20
--    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
--    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
-+    KVM_RISCV_SET_TIMER(cs, time, env->kvm_timer_time);
-+    KVM_RISCV_SET_TIMER(cs, compare, env->kvm_timer_compare);
-=20
-     /*
-      * To set register of RISCV_TIMER_REG(state) will occur a error fro=
m KVM
-@@ -676,7 +676,7 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
-      * TODO If KVM changes, adapt here.
-      */
-     if (env->kvm_timer_state) {
--        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
-+        KVM_RISCV_SET_TIMER(cs, state, env->kvm_timer_state);
-     }
-=20
-     /*
-@@ -685,7 +685,7 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
-      * during the migration.
-      */
-     if (migration_is_running(migrate_get_current()->state)) {
--        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
-+        KVM_RISCV_GET_TIMER(cs, frequency, reg);
-         if (reg !=3D env->kvm_timer_frequency) {
-             error_report("Dst Hosts timer frequency !=3D Src Hosts");
-         }
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
deleted file mode 100644
index dbcc71bb4e..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From bd385a5298d7062668e804d73944d52aec9549f1 Mon Sep 17 00:00:00 2001
-From: Kevin Wolf <kwolf@redhat.com>
-Date: Fri, 16 Aug 2024 08:29:04 +0000
-Subject: [PATCH] qcow2: Don't open data_file with BDRV_O_NO_IO
-
-One use case for 'qemu-img info' is verifying that untrusted images
-don't reference an unwanted external file, be it as a backing file or an
-external data file. To make sure that calling 'qemu-img info' can't
-already have undesired side effects with a malicious image, just don't
-open the data file at all with BDRV_O_NO_IO. If nothing ever tries to do
-I/O, we don't need to have it open.
-
-This changes the output of iotests case 061, which used 'qemu-img info'
-to show that opening an image with an invalid data file fails. After
-this patch, it succeeds. Replace this part of the test with a qemu-io
-call, but keep the final 'qemu-img info' to show that the invalid data
-file is correctly displayed in the output.
-
-Fixes: CVE-2024-4467
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
-
-CVE: CVE-2024-4667
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/bd385a5298d7062668e804d73944d52aec9549f1]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- block/qcow2.c              | 17 ++++++++++++++++-
- tests/qemu-iotests/061     |  6 ++++--
- tests/qemu-iotests/061.out |  8 ++++++--
- 3 files changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/block/qcow2.c b/block/qcow2.c
-index 13e032bd5..7af7c0bee 100644
---- a/block/qcow2.c
-+++ b/block/qcow2.c
-@@ -1636,7 +1636,22 @@ qcow2_do_open(BlockDriverState *bs, QDict *option=
s, int flags,
-         goto fail;
-     }
-
--    if (open_data_file) {
-+    if (open_data_file && (flags & BDRV_O_NO_IO)) {
-+        /*
-+         * Don't open the data file for 'qemu-img info' so that it can =
be used
-+         * to verify that an untrusted qcow2 image doesn't refer to ext=
ernal
-+         * files.
-+         *
-+         * Note: This still makes has_data_file() return true.
-+         */
-+        if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
-+            s->data_file =3D NULL;
-+        } else {
-+            s->data_file =3D bs->file;
-+        }
-+        qdict_extract_subqdict(options, NULL, "data-file.");
-+        qdict_del(options, "data-file");
-+    } else if (open_data_file) {
-         /* Open external data file */
-         bdrv_graph_co_rdunlock();
-         s->data_file =3D bdrv_co_open_child(NULL, options, "data-file",=
 bs,
-diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
-index 53c7d428e..b71ac097d 100755
---- a/tests/qemu-iotests/061
-+++ b/tests/qemu-iotests/061
-@@ -326,12 +326,14 @@ $QEMU_IMG amend -o "data_file=3Dfoo" "$TEST_IMG"
- echo
- _make_test_img -o "compat=3D1.1,data_file=3D$TEST_IMG.data" 64M
- $QEMU_IMG amend -o "data_file=3Dfoo" "$TEST_IMG"
--_img_info --format-specific
-+$QEMU_IO -c "read 0 4k" "$TEST_IMG" 2>&1 | _filter_testdir | _filter_im=
gfmt
-+$QEMU_IO -c "open -o data-file.filename=3D$TEST_IMG.data,file.filename=3D=
$TEST_IMG" -c "read 0 4k" | _filter_qemu_io
- TEST_IMG=3D"data-file.filename=3D$TEST_IMG.data,file.filename=3D$TEST_I=
MG" _img_info --format-specific --image-opts
-
- echo
- $QEMU_IMG amend -o "data_file=3D" --image-opts "data-file.filename=3D$T=
EST_IMG.data,file.filename=3D$TEST_IMG"
--_img_info --format-specific
-+$QEMU_IO -c "read 0 4k" "$TEST_IMG" 2>&1 | _filter_testdir | _filter_im=
gfmt
-+$QEMU_IO -c "open -o data-file.filename=3D$TEST_IMG.data,file.filename=3D=
$TEST_IMG" -c "read 0 4k" | _filter_qemu_io
- TEST_IMG=3D"data-file.filename=3D$TEST_IMG.data,file.filename=3D$TEST_I=
MG" _img_info --format-specific --image-opts
-
- echo
-diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
-index 139fc6817..24c33add7 100644
---- a/tests/qemu-iotests/061.out
-+++ b/tests/qemu-iotests/061.out
-@@ -545,7 +545,9 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D=
67108864
- qemu-img: data-file can only be set for images that use an external dat=
a file
-
- Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 data_file=3D=
TEST_DIR/t.IMGFMT.data
--qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Could not open 'foo': No =
such file or directory
-+qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'foo': No =
such file or directory
-+read 4096/4096 bytes at offset 0
-+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
- image: TEST_DIR/t.IMGFMT
- file format: IMGFMT
- virtual size: 64 MiB (67108864 bytes)
-@@ -560,7 +562,9 @@ Format specific information:
-     corrupt: false
-     extended l2: false
-
--qemu-img: Could not open 'TEST_DIR/t.IMGFMT': 'data-file' is required f=
or this image
-+qemu-io: can't open device TEST_DIR/t.IMGFMT: 'data-file' is required f=
or this image
-+read 4096/4096 bytes at offset 0
-+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
- image: TEST_DIR/t.IMGFMT
- file format: IMGFMT
- virtual size: 64 MiB (67108864 bytes)
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
deleted file mode 100644
index 686176189c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2eb42a728d27a43fdcad5f37d3f65706ce6deba5 Mon Sep 17 00:00:00 2001
-From: Kevin Wolf <kwolf@redhat.com>
-Date: Fri, 16 Aug 2024 09:35:24 +0000
-Subject: [PATCH] iotests/244: Don't store data-file with protocol in ima=
ge
-
-We want to disable filename parsing for data files because it's too easy
-to abuse in malicious image files. Make the test ready for the change by
-passing the data file explicitly in command line options.
-
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
-
-CVE: CVE-2024-4467
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/2eb42a728d27a43fdcad5f37d3f65706ce6deba5]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tests/qemu-iotests/244 | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
-index 3e61fa25b..bb9cc6512 100755
---- a/tests/qemu-iotests/244
-+++ b/tests/qemu-iotests/244
-@@ -215,9 +215,22 @@ $QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TES=
T_IMG.src" "$TEST_IMG"
- $QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$TEST_IMG"
-
- # blkdebug doesn't support copy offloading, so this tests the error pat=
h
--$QEMU_IMG amend -f $IMGFMT -o "data_file=3Dblkdebug::$TEST_IMG.data" "$=
TEST_IMG"
--$QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$TEST_IM=
G"
--$QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$TEST_IMG"
-+test_img_with_blkdebug=3D"json:{
-+    'driver': 'qcow2',
-+    'file': {
-+        'driver': 'file',
-+        'filename': '$TEST_IMG'
-+    },
-+    'data-file': {
-+        'driver': 'blkdebug',
-+        'image': {
-+            'driver': 'file',
-+            'filename': '$TEST_IMG.data'
-+        }
-+    }
-+}"
-+$QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$test_im=
g_with_blkdebug"
-+$QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$test_img_with=
_blkdebug"
-
- echo
- echo "=3D=3D=3D Flushing should flush the data file =3D=3D=3D"
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
deleted file mode 100644
index 02611d6732..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 7e1110664ecbc4826f3c978ccb06b6c1bce823e6 Mon Sep 17 00:00:00 2001
-From: Kevin Wolf <kwolf@redhat.com>
-Date: Fri, 16 Aug 2024 10:24:58 +0000
-Subject: [PATCH] iotests/270: Don't store data-file with json: prefix in=
 image
-
-We want to disable filename parsing for data files because it's too easy
-to abuse in malicious image files. Make the test ready for the change by
-passing the data file explicitly in command line options.
-
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
-
-CVE: CVE-2024-4467
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/7e1110664ecbc4826f3c978ccb06b6c1bce823e6]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tests/qemu-iotests/270 | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
-index 74352342d..c37b674aa 100755
---- a/tests/qemu-iotests/270
-+++ b/tests/qemu-iotests/270
-@@ -60,8 +60,16 @@ _make_test_img -o cluster_size=3D2M,data_file=3D"$TES=
T_IMG.orig" \
- # "write" 2G of data without using any space.
- # (qemu-img create does not like it, though, because null-co does not
- # support image creation.)
--$QEMU_IMG amend -o data_file=3D"json:{'driver':'null-co',,'size':'42949=
67296'}" \
--    "$TEST_IMG"
-+test_img_with_null_data=3D"json:{
-+    'driver': '$IMGFMT',
-+    'file': {
-+        'filename': '$TEST_IMG'
-+    },
-+    'data-file': {
-+        'driver': 'null-co',
-+        'size':'4294967296'
-+    }
-+}"
-
- # This gives us a range of:
- #   2^31 - 512 + 768 - 1 =3D 2^31 + 255 > 2^31
-@@ -74,7 +82,7 @@ $QEMU_IMG amend -o data_file=3D"json:{'driver':'null-c=
o',,'size':'4294967296'}" \
- # on L2 boundaries, we need large L2 tables; hence the cluster size of
- # 2 MB.  (Anything from 256 kB should work, though, because then one L2
- # table covers 8 GB.)
--$QEMU_IO -c "write 768 $((2 ** 31 - 512))" "$TEST_IMG" | _filter_qemu_i=
o
-+$QEMU_IO -c "write 768 $((2 ** 31 - 512))" "$test_img_with_null_data" |=
 _filter_qemu_io
-
- _check_test_img
-
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
deleted file mode 100644
index 7568a453c4..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
+++ /dev/null
@@ -1,1187 +0,0 @@
-From 6bc30f19498547fac9cef98316a65cf6c1f14205 Mon Sep 17 00:00:00 2001
-From: Stefan Hajnoczi <stefanha@redhat.com>
-Date: Tue, 5 Dec 2023 13:20:02 -0500
-Subject: [PATCH] graph-lock: remove AioContext locking
-
-Stop acquiring/releasing the AioContext lock in
-bdrv_graph_wrlock()/bdrv_graph_unlock() since the lock no longer has any
-effect.
-
-The distinction between bdrv_graph_wrunlock() and
-bdrv_graph_wrunlock_ctx() becomes meaningless and they can be collapsed
-into one function.
-
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Reviewed-by: Kevin Wolf <kwolf@redhat.com>
-Message-ID: <20231205182011.1976568-6-stefanha@redhat.com>
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-
-CVE: CVE-2024-4467
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/6bc30f19498547fac9cef98316a65cf6c1f14205]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- block.c                            | 50 +++++++++++++++---------------
- block/backup.c                     |  4 +--
- block/blklogwrites.c               |  8 ++---
- block/blkverify.c                  |  4 +--
- block/block-backend.c              | 11 +++----
- block/commit.c                     | 16 +++++-----
- block/graph-lock.c                 | 44 ++------------------------
- block/mirror.c                     | 22 ++++++-------
- block/qcow2.c                      |  4 +--
- block/quorum.c                     |  8 ++---
- block/replication.c                | 14 ++++-----
- block/snapshot.c                   |  4 +--
- block/stream.c                     | 12 +++----
- block/vmdk.c                       | 20 ++++++------
- blockdev.c                         |  8 ++---
- blockjob.c                         | 12 +++----
- include/block/graph-lock.h         | 21 ++-----------
- scripts/block-coroutine-wrapper.py |  4 +--
- tests/unit/test-bdrv-drain.c       | 40 ++++++++++++------------
- tests/unit/test-bdrv-graph-mod.c   | 20 ++++++------
- 20 files changed, 133 insertions(+), 193 deletions(-)
-
-diff --git a/block.c b/block.c
-index bfb0861ec..25e1ebc60 100644
---- a/block.c
-+++ b/block.c
-@@ -1708,12 +1708,12 @@ bdrv_open_driver(BlockDriverState *bs, BlockDriv=
er *drv, const char *node_name,
- open_failed:
-     bs->drv =3D NULL;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     if (bs->file !=3D NULL) {
-         bdrv_unref_child(bs, bs->file);
-         assert(!bs->file);
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     g_free(bs->opaque);
-     bs->opaque =3D NULL;
-@@ -3575,9 +3575,9 @@ int bdrv_set_backing_hd(BlockDriverState *bs, Bloc=
kDriverState *backing_hd,
-
-     bdrv_ref(drain_bs);
-     bdrv_drained_begin(drain_bs);
--    bdrv_graph_wrlock(backing_hd);
-+    bdrv_graph_wrlock();
-     ret =3D bdrv_set_backing_hd_drained(bs, backing_hd, errp);
--    bdrv_graph_wrunlock(backing_hd);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(drain_bs);
-     bdrv_unref(drain_bs);
-
-@@ -3790,13 +3790,13 @@ BdrvChild *bdrv_open_child(const char *filename,
-         return NULL;
-     }
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     ctx =3D bdrv_get_aio_context(bs);
-     aio_context_acquire(ctx);
-     child =3D bdrv_attach_child(parent, bs, bdref_key, child_class, chi=
ld_role,
-                               errp);
-     aio_context_release(ctx);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     return child;
- }
-@@ -4650,9 +4650,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queu=
e, Error **errp)
-         aio_context_release(ctx);
-     }
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     tran_commit(tran);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
-         BlockDriverState *bs =3D bs_entry->state.bs;
-@@ -4669,9 +4669,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queu=
e, Error **errp)
-     goto cleanup;
-
- abort:
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     tran_abort(tran);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-         if (bs_entry->prepared) {
-@@ -4852,12 +4852,12 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenStat=
e *reopen_state,
-     }
-
-     bdrv_graph_rdunlock_main_loop();
--    bdrv_graph_wrlock(new_child_bs);
-+    bdrv_graph_wrlock();
-
-     ret =3D bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backin=
g,
-                                           tran, errp);
-
--    bdrv_graph_wrunlock_ctx(ctx);
-+    bdrv_graph_wrunlock();
-
-     if (old_ctx !=3D ctx) {
-         aio_context_release(ctx);
-@@ -5209,14 +5209,14 @@ static void bdrv_close(BlockDriverState *bs)
-         bs->drv =3D NULL;
-     }
-
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
-         bdrv_unref_child(bs, child);
-     }
-
-     assert(!bs->backing);
-     assert(!bs->file);
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-
-     g_free(bs->opaque);
-     bs->opaque =3D NULL;
-@@ -5509,9 +5509,9 @@ int bdrv_drop_filter(BlockDriverState *bs, Error *=
*errp)
-     bdrv_graph_rdunlock_main_loop();
-
-     bdrv_drained_begin(child_bs);
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     ret =3D bdrv_replace_node_common(bs, child_bs, true, true, errp);
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(child_bs);
-
-     return ret;
-@@ -5561,7 +5561,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDri=
verState *bs_top,
-     aio_context_acquire(old_context);
-     new_context =3D NULL;
-
--    bdrv_graph_wrlock(bs_top);
-+    bdrv_graph_wrlock();
-
-     child =3D bdrv_attach_child_noperm(bs_new, bs_top, "backing",
-                                      &child_of_bds, bdrv_backing_role(b=
s_new),
-@@ -5593,7 +5593,7 @@ out:
-     tran_finalize(tran, ret);
-
-     bdrv_refresh_limits(bs_top, NULL, NULL);
--    bdrv_graph_wrunlock(bs_top);
-+    bdrv_graph_wrunlock();
-
-     bdrv_drained_end(bs_top);
-     bdrv_drained_end(bs_new);
-@@ -5620,7 +5620,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockD=
riverState *new_bs,
-     bdrv_ref(old_bs);
-     bdrv_drained_begin(old_bs);
-     bdrv_drained_begin(new_bs);
--    bdrv_graph_wrlock(new_bs);
-+    bdrv_graph_wrlock();
-
-     bdrv_replace_child_tran(child, new_bs, tran);
-
-@@ -5631,7 +5631,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockD=
riverState *new_bs,
-
-     tran_finalize(tran, ret);
-
--    bdrv_graph_wrunlock(new_bs);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(old_bs);
-     bdrv_drained_end(new_bs);
-     bdrv_unref(old_bs);
-@@ -5718,9 +5718,9 @@ BlockDriverState *bdrv_insert_node(BlockDriverStat=
e *bs, QDict *options,
-     bdrv_ref(bs);
-     bdrv_drained_begin(bs);
-     bdrv_drained_begin(new_node_bs);
--    bdrv_graph_wrlock(new_node_bs);
-+    bdrv_graph_wrlock();
-     ret =3D bdrv_replace_node(bs, new_node_bs, errp);
--    bdrv_graph_wrunlock(new_node_bs);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(new_node_bs);
-     bdrv_drained_end(bs);
-     bdrv_unref(bs);
-@@ -5975,7 +5975,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, =
BlockDriverState *base,
-
-     bdrv_ref(top);
-     bdrv_drained_begin(base);
--    bdrv_graph_wrlock(base);
-+    bdrv_graph_wrlock();
-
-     if (!top->drv || !base->drv) {
-         goto exit_wrlock;
-@@ -6015,7 +6015,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, =
BlockDriverState *base,
-      * That's a FIXME.
-      */
-     bdrv_replace_node_common(top, base, false, false, &local_err);
--    bdrv_graph_wrunlock(base);
-+    bdrv_graph_wrunlock();
-
-     if (local_err) {
-         error_report_err(local_err);
-@@ -6052,7 +6052,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, =
BlockDriverState *base,
-     goto exit;
-
- exit_wrlock:
--    bdrv_graph_wrunlock(base);
-+    bdrv_graph_wrunlock();
- exit:
-     bdrv_drained_end(base);
-     bdrv_unref(top);
-diff --git a/block/backup.c b/block/backup.c
-index 8aae5836d..ec29d6b81 100644
---- a/block/backup.c
-+++ b/block/backup.c
-@@ -496,10 +496,10 @@ BlockJob *backup_job_create(const char *job_id, Bl=
ockDriverState *bs,
-     block_copy_set_speed(bcs, speed);
-
-     /* Required permissions are taken by copy-before-write filter targe=
t */
--    bdrv_graph_wrlock(target);
-+    bdrv_graph_wrlock();
-     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
-                        &error_abort);
--    bdrv_graph_wrunlock(target);
-+    bdrv_graph_wrunlock();
-
-     return &job->common;
-
-diff --git a/block/blklogwrites.c b/block/blklogwrites.c
-index 84e03f309..ba717dab4 100644
---- a/block/blklogwrites.c
-+++ b/block/blklogwrites.c
-@@ -251,9 +251,9 @@ static int blk_log_writes_open(BlockDriverState *bs,=
 QDict *options, int flags,
-     ret =3D 0;
- fail_log:
-     if (ret < 0) {
--        bdrv_graph_wrlock(NULL);
-+        bdrv_graph_wrlock();
-         bdrv_unref_child(bs, s->log_file);
--        bdrv_graph_wrunlock(NULL);
-+        bdrv_graph_wrunlock();
-         s->log_file =3D NULL;
-     }
- fail:
-@@ -265,10 +265,10 @@ static void blk_log_writes_close(BlockDriverState =
*bs)
- {
-     BDRVBlkLogWritesState *s =3D bs->opaque;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_unref_child(bs, s->log_file);
-     s->log_file =3D NULL;
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
- }
-
- static int64_t coroutine_fn GRAPH_RDLOCK
-diff --git a/block/blkverify.c b/block/blkverify.c
-index 9b17c4664..ec45d8335 100644
---- a/block/blkverify.c
-+++ b/block/blkverify.c
-@@ -151,10 +151,10 @@ static void blkverify_close(BlockDriverState *bs)
- {
-     BDRVBlkverifyState *s =3D bs->opaque;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_unref_child(bs, s->test_file);
-     s->test_file =3D NULL;
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
- }
-
- static int64_t coroutine_fn GRAPH_RDLOCK
-diff --git a/block/block-backend.c b/block/block-backend.c
-index 86315d62c..a2348b31e 100644
---- a/block/block-backend.c
-+++ b/block/block-backend.c
-@@ -885,7 +885,6 @@ void blk_remove_bs(BlockBackend *blk)
- {
-     ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
-     BdrvChild *root;
--    AioContext *ctx;
-
-     GLOBAL_STATE_CODE();
-
-@@ -915,10 +914,9 @@ void blk_remove_bs(BlockBackend *blk)
-     root =3D blk->root;
-     blk->root =3D NULL;
-
--    ctx =3D bdrv_get_aio_context(root->bs);
--    bdrv_graph_wrlock(root->bs);
-+    bdrv_graph_wrlock();
-     bdrv_root_unref_child(root);
--    bdrv_graph_wrunlock_ctx(ctx);
-+    bdrv_graph_wrunlock();
- }
-
- /*
-@@ -929,16 +927,15 @@ void blk_remove_bs(BlockBackend *blk)
- int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp=
)
- {
-     ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
--    AioContext *ctx =3D bdrv_get_aio_context(bs);
-
-     GLOBAL_STATE_CODE();
-     bdrv_ref(bs);
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     blk->root =3D bdrv_root_attach_child(bs, "root", &child_root,
-                                        BDRV_CHILD_FILTERED | BDRV_CHILD=
_PRIMARY,
-                                        blk->perm, blk->shared_perm,
-                                        blk, errp);
--    bdrv_graph_wrunlock_ctx(ctx);
-+    bdrv_graph_wrunlock();
-     if (blk->root =3D=3D NULL) {
-         return -EPERM;
-     }
-diff --git a/block/commit.c b/block/commit.c
-index 69cc75be0..1dd7a65ff 100644
---- a/block/commit.c
-+++ b/block/commit.c
-@@ -100,9 +100,9 @@ static void commit_abort(Job *job)
-     bdrv_graph_rdunlock_main_loop();
-
-     bdrv_drained_begin(commit_top_backing_bs);
--    bdrv_graph_wrlock(commit_top_backing_bs);
-+    bdrv_graph_wrlock();
-     bdrv_replace_node(s->commit_top_bs, commit_top_backing_bs, &error_a=
bort);
--    bdrv_graph_wrunlock(commit_top_backing_bs);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(commit_top_backing_bs);
-
-     bdrv_unref(s->commit_top_bs);
-@@ -339,7 +339,7 @@ void commit_start(const char *job_id, BlockDriverSta=
te *bs,
-      * this is the responsibility of the interface (i.e. whoever calls
-      * commit_start()).
-      */
--    bdrv_graph_wrlock(top);
-+    bdrv_graph_wrlock();
-     s->base_overlay =3D bdrv_find_overlay(top, base);
-     assert(s->base_overlay);
-
-@@ -370,19 +370,19 @@ void commit_start(const char *job_id, BlockDriverS=
tate *bs,
-         ret =3D block_job_add_bdrv(&s->common, "intermediate node", ite=
r, 0,
-                                  iter_shared_perms, errp);
-         if (ret < 0) {
--            bdrv_graph_wrunlock(top);
-+            bdrv_graph_wrunlock();
-             goto fail;
-         }
-     }
-
-     if (bdrv_freeze_backing_chain(commit_top_bs, base, errp) < 0) {
--        bdrv_graph_wrunlock(top);
-+        bdrv_graph_wrunlock();
-         goto fail;
-     }
-     s->chain_frozen =3D true;
-
-     ret =3D block_job_add_bdrv(&s->common, "base", base, 0, BLK_PERM_AL=
L, errp);
--    bdrv_graph_wrunlock(top);
-+    bdrv_graph_wrunlock();
-
-     if (ret < 0) {
-         goto fail;
-@@ -434,9 +434,9 @@ fail:
-      * otherwise this would fail because of lack of permissions. */
-     if (commit_top_bs) {
-         bdrv_drained_begin(top);
--        bdrv_graph_wrlock(top);
-+        bdrv_graph_wrlock();
-         bdrv_replace_node(commit_top_bs, top, &error_abort);
--        bdrv_graph_wrunlock(top);
-+        bdrv_graph_wrunlock();
-         bdrv_drained_end(top);
-     }
- }
-diff --git a/block/graph-lock.c b/block/graph-lock.c
-index 079e878d9..c81162b14 100644
---- a/block/graph-lock.c
-+++ b/block/graph-lock.c
-@@ -106,27 +106,12 @@ static uint32_t reader_count(void)
-     return rd;
- }
-
--void no_coroutine_fn bdrv_graph_wrlock(BlockDriverState *bs)
-+void no_coroutine_fn bdrv_graph_wrlock(void)
- {
--    AioContext *ctx =3D NULL;
--
-     GLOBAL_STATE_CODE();
-     assert(!qatomic_read(&has_writer));
-     assert(!qemu_in_coroutine());
-
--    /*
--     * Release only non-mainloop AioContext. The mainloop often relies =
on the
--     * BQL and doesn't lock the main AioContext before doing things.
--     */
--    if (bs) {
--        ctx =3D bdrv_get_aio_context(bs);
--        if (ctx !=3D qemu_get_aio_context()) {
--            aio_context_release(ctx);
--        } else {
--            ctx =3D NULL;
--        }
--    }
--
-     /* Make sure that constantly arriving new I/O doesn't cause starvat=
ion */
-     bdrv_drain_all_begin_nopoll();
-
-@@ -155,27 +140,13 @@ void no_coroutine_fn bdrv_graph_wrlock(BlockDriver=
State *bs)
-     } while (reader_count() >=3D 1);
-
-     bdrv_drain_all_end();
--
--    if (ctx) {
--        aio_context_acquire(bdrv_get_aio_context(bs));
--    }
- }
-
--void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioContext *ctx)
-+void no_coroutine_fn bdrv_graph_wrunlock(void)
- {
-     GLOBAL_STATE_CODE();
-     assert(qatomic_read(&has_writer));
-
--    /*
--     * Release only non-mainloop AioContext. The mainloop often relies =
on the
--     * BQL and doesn't lock the main AioContext before doing things.
--     */
--    if (ctx && ctx !=3D qemu_get_aio_context()) {
--        aio_context_release(ctx);
--    } else {
--        ctx =3D NULL;
--    }
--
-     WITH_QEMU_LOCK_GUARD(&aio_context_list_lock) {
-         /*
-          * No need for memory barriers, this works in pair with
-@@ -197,17 +168,6 @@ void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioCon=
text *ctx)
-      * progress.
-      */
-     aio_bh_poll(qemu_get_aio_context());
--
--    if (ctx) {
--        aio_context_acquire(ctx);
--    }
--}
--
--void no_coroutine_fn bdrv_graph_wrunlock(BlockDriverState *bs)
--{
--    AioContext *ctx =3D bs ? bdrv_get_aio_context(bs) : NULL;
--
--    bdrv_graph_wrunlock_ctx(ctx);
- }
-
- void coroutine_fn bdrv_graph_co_rdlock(void)
-diff --git a/block/mirror.c b/block/mirror.c
-index abbddb39e..f9db6f0f7 100644
---- a/block/mirror.c
-+++ b/block/mirror.c
-@@ -768,7 +768,7 @@ static int mirror_exit_common(Job *job)
-          * check for an op blocker on @to_replace, and we have our own
-          * there.
-          */
--        bdrv_graph_wrlock(target_bs);
-+        bdrv_graph_wrlock();
-         if (bdrv_recurse_can_replace(src, to_replace)) {
-             bdrv_replace_node(to_replace, target_bs, &local_err);
-         } else {
-@@ -777,7 +777,7 @@ static int mirror_exit_common(Job *job)
-                        "would not lead to an abrupt change of visible d=
ata",
-                        to_replace->node_name, target_bs->node_name);
-         }
--        bdrv_graph_wrunlock(target_bs);
-+        bdrv_graph_wrunlock();
-         bdrv_drained_end(to_replace);
-         if (local_err) {
-             error_report_err(local_err);
-@@ -800,9 +800,9 @@ static int mirror_exit_common(Job *job)
-      * valid.
-      */
-     block_job_remove_all_bdrv(bjob);
--    bdrv_graph_wrlock(mirror_top_bs);
-+    bdrv_graph_wrlock();
-     bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error=
_abort);
--    bdrv_graph_wrunlock(mirror_top_bs);
-+    bdrv_graph_wrunlock();
-
-     bdrv_drained_end(target_bs);
-     bdrv_unref(target_bs);
-@@ -1916,13 +1916,13 @@ static BlockJob *mirror_start_job(
-      */
-     bdrv_disable_dirty_bitmap(s->dirty_bitmap);
-
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     ret =3D block_job_add_bdrv(&s->common, "source", bs, 0,
-                              BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE =
|
-                              BLK_PERM_CONSISTENT_READ,
-                              errp);
-     if (ret < 0) {
--        bdrv_graph_wrunlock(bs);
-+        bdrv_graph_wrunlock();
-         goto fail;
-     }
-
-@@ -1967,17 +1967,17 @@ static BlockJob *mirror_start_job(
-             ret =3D block_job_add_bdrv(&s->common, "intermediate node",=
 iter, 0,
-                                      iter_shared_perms, errp);
-             if (ret < 0) {
--                bdrv_graph_wrunlock(bs);
-+                bdrv_graph_wrunlock();
-                 goto fail;
-             }
-         }
-
-         if (bdrv_freeze_backing_chain(mirror_top_bs, target, errp) < 0)=
 {
--            bdrv_graph_wrunlock(bs);
-+            bdrv_graph_wrunlock();
-             goto fail;
-         }
-     }
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-
-     QTAILQ_INIT(&s->ops_in_flight);
-
-@@ -2003,12 +2003,12 @@ fail:
-
-     bs_opaque->stop =3D true;
-     bdrv_drained_begin(bs);
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     assert(mirror_top_bs->backing->bs =3D=3D bs);
-     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
-                              &error_abort);
-     bdrv_replace_node(mirror_top_bs, bs, &error_abort);
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(bs);
-
-     bdrv_unref(mirror_top_bs);
-diff --git a/block/qcow2.c b/block/qcow2.c
-index 7af7c0bee..77dd49d4f 100644
---- a/block/qcow2.c
-+++ b/block/qcow2.c
-@@ -2822,9 +2822,9 @@ qcow2_do_close(BlockDriverState *bs, bool close_da=
ta_file)
-     if (close_data_file && has_data_file(bs)) {
-         GLOBAL_STATE_CODE();
-         bdrv_graph_rdunlock_main_loop();
--        bdrv_graph_wrlock(NULL);
-+        bdrv_graph_wrlock();
-         bdrv_unref_child(bs, s->data_file);
--        bdrv_graph_wrunlock(NULL);
-+        bdrv_graph_wrunlock();
-         s->data_file =3D NULL;
-         bdrv_graph_rdlock_main_loop();
-     }
-diff --git a/block/quorum.c b/block/quorum.c
-index 505b8b3e1..db8fe891c 100644
---- a/block/quorum.c
-+++ b/block/quorum.c
-@@ -1037,14 +1037,14 @@ static int quorum_open(BlockDriverState *bs, QDi=
ct *options, int flags,
-
- close_exit:
-     /* cleanup on error */
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     for (i =3D 0; i < s->num_children; i++) {
-         if (!opened[i]) {
-             continue;
-         }
-         bdrv_unref_child(bs, s->children[i]);
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-     g_free(s->children);
-     g_free(opened);
- exit:
-@@ -1057,11 +1057,11 @@ static void quorum_close(BlockDriverState *bs)
-     BDRVQuorumState *s =3D bs->opaque;
-     int i;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     for (i =3D 0; i < s->num_children; i++) {
-         bdrv_unref_child(bs, s->children[i]);
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     g_free(s->children);
- }
-diff --git a/block/replication.c b/block/replication.c
-index 5ded5f1ca..424b537ff 100644
---- a/block/replication.c
-+++ b/block/replication.c
-@@ -560,7 +560,7 @@ static void replication_start(ReplicationState *rs, =
ReplicationMode mode,
-             return;
-         }
-
--        bdrv_graph_wrlock(bs);
-+        bdrv_graph_wrlock();
-
-         bdrv_ref(hidden_disk->bs);
-         s->hidden_disk =3D bdrv_attach_child(bs, hidden_disk->bs, "hidd=
en disk",
-@@ -568,7 +568,7 @@ static void replication_start(ReplicationState *rs, =
ReplicationMode mode,
-                                            &local_err);
-         if (local_err) {
-             error_propagate(errp, local_err);
--            bdrv_graph_wrunlock(bs);
-+            bdrv_graph_wrunlock();
-             aio_context_release(aio_context);
-             return;
-         }
-@@ -579,7 +579,7 @@ static void replication_start(ReplicationState *rs, =
ReplicationMode mode,
-                                               BDRV_CHILD_DATA, &local_e=
rr);
-         if (local_err) {
-             error_propagate(errp, local_err);
--            bdrv_graph_wrunlock(bs);
-+            bdrv_graph_wrunlock();
-             aio_context_release(aio_context);
-             return;
-         }
-@@ -592,7 +592,7 @@ static void replication_start(ReplicationState *rs, =
ReplicationMode mode,
-         if (!top_bs || !bdrv_is_root_node(top_bs) ||
-             !check_top_bs(top_bs, bs)) {
-             error_setg(errp, "No top_bs or it is invalid");
--            bdrv_graph_wrunlock(bs);
-+            bdrv_graph_wrunlock();
-             reopen_backing_file(bs, false, NULL);
-             aio_context_release(aio_context);
-             return;
-@@ -600,7 +600,7 @@ static void replication_start(ReplicationState *rs, =
ReplicationMode mode,
-         bdrv_op_block_all(top_bs, s->blocker);
-         bdrv_op_unblock(top_bs, BLOCK_OP_TYPE_DATAPLANE, s->blocker);
-
--        bdrv_graph_wrunlock(bs);
-+        bdrv_graph_wrunlock();
-
-         s->backup_job =3D backup_job_create(
-                                 NULL, s->secondary_disk->bs, s->hidden_=
disk->bs,
-@@ -691,12 +691,12 @@ static void replication_done(void *opaque, int ret=
)
-     if (ret =3D=3D 0) {
-         s->stage =3D BLOCK_REPLICATION_DONE;
-
--        bdrv_graph_wrlock(NULL);
-+        bdrv_graph_wrlock();
-         bdrv_unref_child(bs, s->secondary_disk);
-         s->secondary_disk =3D NULL;
-         bdrv_unref_child(bs, s->hidden_disk);
-         s->hidden_disk =3D NULL;
--        bdrv_graph_wrunlock(NULL);
-+        bdrv_graph_wrunlock();
-
-         s->error =3D 0;
-     } else {
-diff --git a/block/snapshot.c b/block/snapshot.c
-index c4d40e80d..6fd720aef 100644
---- a/block/snapshot.c
-+++ b/block/snapshot.c
-@@ -292,9 +292,9 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
-         }
-
-         /* .bdrv_open() will re-attach it */
--        bdrv_graph_wrlock(NULL);
-+        bdrv_graph_wrlock();
-         bdrv_unref_child(bs, fallback);
--        bdrv_graph_wrunlock(NULL);
-+        bdrv_graph_wrunlock();
-
-         ret =3D bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
-         open_ret =3D drv->bdrv_open(bs, options, bs->open_flags, &local=
_err);
-diff --git a/block/stream.c b/block/stream.c
-index 01fe7c0f1..048c2d282 100644
---- a/block/stream.c
-+++ b/block/stream.c
-@@ -99,9 +99,9 @@ static int stream_prepare(Job *job)
-             }
-         }
-
--        bdrv_graph_wrlock(s->target_bs);
-+        bdrv_graph_wrlock();
-         bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
--        bdrv_graph_wrunlock(s->target_bs);
-+        bdrv_graph_wrunlock();
-
-         /*
-          * This call will do I/O, so the graph can change again from he=
re on.
-@@ -366,10 +366,10 @@ void stream_start(const char *job_id, BlockDriverS=
tate *bs,
-      * already have our own plans. Also don't allow resize as the image=
 size is
-      * queried only at the job start and then cached.
-      */
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-     if (block_job_add_bdrv(&s->common, "active node", bs, 0,
-                            basic_flags | BLK_PERM_WRITE, errp)) {
--        bdrv_graph_wrunlock(bs);
-+        bdrv_graph_wrunlock();
-         goto fail;
-     }
-
-@@ -389,11 +389,11 @@ void stream_start(const char *job_id, BlockDriverS=
tate *bs,
-         ret =3D block_job_add_bdrv(&s->common, "intermediate node", ite=
r, 0,
-                                  basic_flags, errp);
-         if (ret < 0) {
--            bdrv_graph_wrunlock(bs);
-+            bdrv_graph_wrunlock();
-             goto fail;
-         }
-     }
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-
-     s->base_overlay =3D base_overlay;
-     s->above_base =3D above_base;
-diff --git a/block/vmdk.c b/block/vmdk.c
-index d6971c706..bf78e1238 100644
---- a/block/vmdk.c
-+++ b/block/vmdk.c
-@@ -272,7 +272,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
-     BDRVVmdkState *s =3D bs->opaque;
-     VmdkExtent *e;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     for (i =3D 0; i < s->num_extents; i++) {
-         e =3D &s->extents[i];
-         g_free(e->l1_table);
-@@ -283,7 +283,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
-             bdrv_unref_child(bs, e->file);
-         }
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     g_free(s->extents);
- }
-@@ -1247,9 +1247,9 @@ vmdk_parse_extents(const char *desc, BlockDriverSt=
ate *bs, QDict *options,
-                             0, 0, 0, 0, 0, &extent, errp);
-             if (ret < 0) {
-                 bdrv_graph_rdunlock_main_loop();
--                bdrv_graph_wrlock(NULL);
-+                bdrv_graph_wrlock();
-                 bdrv_unref_child(bs, extent_file);
--                bdrv_graph_wrunlock(NULL);
-+                bdrv_graph_wrunlock();
-                 bdrv_graph_rdlock_main_loop();
-                 goto out;
-             }
-@@ -1266,9 +1266,9 @@ vmdk_parse_extents(const char *desc, BlockDriverSt=
ate *bs, QDict *options,
-             g_free(buf);
-             if (ret) {
-                 bdrv_graph_rdunlock_main_loop();
--                bdrv_graph_wrlock(NULL);
-+                bdrv_graph_wrlock();
-                 bdrv_unref_child(bs, extent_file);
--                bdrv_graph_wrunlock(NULL);
-+                bdrv_graph_wrunlock();
-                 bdrv_graph_rdlock_main_loop();
-                 goto out;
-             }
-@@ -1277,9 +1277,9 @@ vmdk_parse_extents(const char *desc, BlockDriverSt=
ate *bs, QDict *options,
-             ret =3D vmdk_open_se_sparse(bs, extent_file, bs->open_flags=
, errp);
-             if (ret) {
-                 bdrv_graph_rdunlock_main_loop();
--                bdrv_graph_wrlock(NULL);
-+                bdrv_graph_wrlock();
-                 bdrv_unref_child(bs, extent_file);
--                bdrv_graph_wrunlock(NULL);
-+                bdrv_graph_wrunlock();
-                 bdrv_graph_rdlock_main_loop();
-                 goto out;
-             }
-@@ -1287,9 +1287,9 @@ vmdk_parse_extents(const char *desc, BlockDriverSt=
ate *bs, QDict *options,
-         } else {
-             error_setg(errp, "Unsupported extent type '%s'", type);
-             bdrv_graph_rdunlock_main_loop();
--            bdrv_graph_wrlock(NULL);
-+            bdrv_graph_wrlock();
-             bdrv_unref_child(bs, extent_file);
--            bdrv_graph_wrunlock(NULL);
-+            bdrv_graph_wrunlock();
-             bdrv_graph_rdlock_main_loop();
-             ret =3D -ENOTSUP;
-             goto out;
-diff --git a/blockdev.c b/blockdev.c
-index c91f49e7b..9e1381169 100644
---- a/blockdev.c
-+++ b/blockdev.c
-@@ -1611,9 +1611,9 @@ static void external_snapshot_abort(void *opaque)
-             }
-
-             bdrv_drained_begin(state->new_bs);
--            bdrv_graph_wrlock(state->old_bs);
-+            bdrv_graph_wrlock();
-             bdrv_replace_node(state->new_bs, state->old_bs, &error_abor=
t);
--            bdrv_graph_wrunlock(state->old_bs);
-+            bdrv_graph_wrunlock();
-             bdrv_drained_end(state->new_bs);
-
-             bdrv_unref(state->old_bs); /* bdrv_replace_node() ref'ed ol=
d_bs */
-@@ -3657,7 +3657,7 @@ void qmp_x_blockdev_change(const char *parent, con=
st char *child,
-     BlockDriverState *parent_bs, *new_bs =3D NULL;
-     BdrvChild *p_child;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-
-     parent_bs =3D bdrv_lookup_bs(parent, parent, errp);
-     if (!parent_bs) {
-@@ -3693,7 +3693,7 @@ void qmp_x_blockdev_change(const char *parent, con=
st char *child,
-     }
-
- out:
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
- }
-
- BlockJobInfoList *qmp_query_block_jobs(Error **errp)
-diff --git a/blockjob.c b/blockjob.c
-index b7a29052b..731041231 100644
---- a/blockjob.c
-+++ b/blockjob.c
-@@ -199,7 +199,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
-      * to process an already freed BdrvChild.
-      */
-     aio_context_release(job->job.aio_context);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     aio_context_acquire(job->job.aio_context);
-     while (job->nodes) {
-         GSList *l =3D job->nodes;
-@@ -212,7 +212,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
-
-         g_slist_free_1(l);
-     }
--    bdrv_graph_wrunlock_ctx(job->job.aio_context);
-+    bdrv_graph_wrunlock();
- }
-
- bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
-@@ -514,7 +514,7 @@ void *block_job_create(const char *job_id, const Blo=
ckJobDriver *driver,
-     int ret;
-     GLOBAL_STATE_CODE();
-
--    bdrv_graph_wrlock(bs);
-+    bdrv_graph_wrlock();
-
-     if (job_id =3D=3D NULL && !(flags & JOB_INTERNAL)) {
-         job_id =3D bdrv_get_device_name(bs);
-@@ -523,7 +523,7 @@ void *block_job_create(const char *job_id, const Blo=
ckJobDriver *driver,
-     job =3D job_create(job_id, &driver->job_driver, txn, bdrv_get_aio_c=
ontext(bs),
-                      flags, cb, opaque, errp);
-     if (job =3D=3D NULL) {
--        bdrv_graph_wrunlock(bs);
-+        bdrv_graph_wrunlock();
-         return NULL;
-     }
-
-@@ -563,11 +563,11 @@ void *block_job_create(const char *job_id, const B=
lockJobDriver *driver,
-         goto fail;
-     }
-
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-     return job;
-
- fail:
--    bdrv_graph_wrunlock(bs);
-+    bdrv_graph_wrunlock();
-     job_early_fail(&job->job);
-     return NULL;
- }
-diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
-index 22b5db1ed..d7545e82d 100644
---- a/include/block/graph-lock.h
-+++ b/include/block/graph-lock.h
-@@ -110,34 +110,17 @@ void unregister_aiocontext(AioContext *ctx);
-  *
-  * The wrlock can only be taken from the main loop, with BQL held, as o=
nly the
-  * main loop is allowed to modify the graph.
-- *
-- * If @bs is non-NULL, its AioContext is temporarily released.
-- *
-- * This function polls. Callers must not hold the lock of any AioContex=
t other
-- * than the current one and the one of @bs.
-  */
- void no_coroutine_fn TSA_ACQUIRE(graph_lock) TSA_NO_TSA
--bdrv_graph_wrlock(BlockDriverState *bs);
-+bdrv_graph_wrlock(void);
-
- /*
-  * bdrv_graph_wrunlock:
-  * Write finished, reset global has_writer to 0 and restart
-  * all readers that are waiting.
-- *
-- * If @bs is non-NULL, its AioContext is temporarily released.
-- */
--void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
--bdrv_graph_wrunlock(BlockDriverState *bs);
--
--/*
-- * bdrv_graph_wrunlock_ctx:
-- * Write finished, reset global has_writer to 0 and restart
-- * all readers that are waiting.
-- *
-- * If @ctx is non-NULL, its lock is temporarily released.
-  */
- void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
--bdrv_graph_wrunlock_ctx(AioContext *ctx);
-+bdrv_graph_wrunlock(void);
-
- /*
-  * bdrv_graph_co_rdlock:
-diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutin=
e-wrapper.py
-index a38e5833f..38364fa55 100644
---- a/scripts/block-coroutine-wrapper.py
-+++ b/scripts/block-coroutine-wrapper.py
-@@ -261,8 +261,8 @@ def gen_no_co_wrapper(func: FuncDecl) -> str:
-         graph_lock=3D'    bdrv_graph_rdlock_main_loop();'
-         graph_unlock=3D'    bdrv_graph_rdunlock_main_loop();'
-     elif func.graph_wrlock:
--        graph_lock=3D'    bdrv_graph_wrlock(NULL);'
--        graph_unlock=3D'    bdrv_graph_wrunlock(NULL);'
-+        graph_lock=3D'    bdrv_graph_wrlock();'
-+        graph_unlock=3D'    bdrv_graph_wrunlock();'
-
-     return f"""\
- /*
-diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
-index 704d1a3f3..d9754dfeb 100644
---- a/tests/unit/test-bdrv-drain.c
-+++ b/tests/unit/test-bdrv-drain.c
-@@ -807,9 +807,9 @@ static void test_blockjob_common_drain_node(enum dra=
in_type drain_type,
-     tjob->bs =3D src;
-     job =3D &tjob->common;
-
--    bdrv_graph_wrlock(target);
-+    bdrv_graph_wrlock();
-     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_a=
bort);
--    bdrv_graph_wrunlock(target);
-+    bdrv_graph_wrunlock();
-
-     switch (result) {
-     case TEST_JOB_SUCCESS:
-@@ -991,11 +991,11 @@ static void bdrv_test_top_close(BlockDriverState *=
bs)
- {
-     BdrvChild *c, *next_c;
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     QLIST_FOREACH_SAFE(c, &bs->children, next, next_c) {
-         bdrv_unref_child(bs, c);
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
- }
-
- static int coroutine_fn GRAPH_RDLOCK
-@@ -1085,10 +1085,10 @@ static void do_test_delete_by_drain(bool detach_=
instead_of_delete,
-
-     null_bs =3D bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_=
O_PROTOCOL,
-                         &error_abort);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds,
-                       BDRV_CHILD_DATA, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     /* This child will be the one to pass to requests through to, and
-      * it will stall until a drain occurs */
-@@ -1096,21 +1096,21 @@ static void do_test_delete_by_drain(bool detach_=
instead_of_delete,
-                                     &error_abort);
-     child_bs->total_sectors =3D 65536 >> BDRV_SECTOR_BITS;
-     /* Takes our reference to child_bs */
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     tts->wait_child =3D bdrv_attach_child(bs, child_bs, "wait-child",
-                                         &child_of_bds,
-                                         BDRV_CHILD_DATA | BDRV_CHILD_PR=
IMARY,
-                                         &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     /* This child is just there to be deleted
-      * (for detach_instead_of_delete =3D=3D true) */
-     null_bs =3D bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_=
O_PROTOCOL,
-                         &error_abort);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds, BDRV_CH=
ILD_DATA,
-                       &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL)=
;
-     blk_insert_bs(blk, bs, &error_abort);
-@@ -1193,14 +1193,14 @@ static void no_coroutine_fn detach_indirect_bh(v=
oid *opaque)
-
-     bdrv_dec_in_flight(data->child_b->bs);
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_unref_child(data->parent_b, data->child_b);
-
-     bdrv_ref(data->c);
-     data->child_c =3D bdrv_attach_child(data->parent_b, data->c, "PB-C"=
,
-                                       &child_of_bds, BDRV_CHILD_DATA,
-                                       &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
- }
-
- static void coroutine_mixed_fn detach_by_parent_aio_cb(void *opaque, in=
t ret)
-@@ -1298,7 +1298,7 @@ static void TSA_NO_TSA test_detach_indirect(bool b=
y_parent_cb)
-     /* Set child relationships */
-     bdrv_ref(b);
-     bdrv_ref(a);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     child_b =3D bdrv_attach_child(parent_b, b, "PB-B", &child_of_bds,
-                                 BDRV_CHILD_DATA, &error_abort);
-     child_a =3D bdrv_attach_child(parent_b, a, "PB-A", &child_of_bds,
-@@ -1308,7 +1308,7 @@ static void TSA_NO_TSA test_detach_indirect(bool b=
y_parent_cb)
-     bdrv_attach_child(parent_a, a, "PA-A",
-                       by_parent_cb ? &child_of_bds : &detach_by_driver_=
cb_class,
-                       BDRV_CHILD_DATA, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     g_assert_cmpint(parent_a->refcnt, =3D=3D, 1);
-     g_assert_cmpint(parent_b->refcnt, =3D=3D, 1);
-@@ -1727,7 +1727,7 @@ static void test_drop_intermediate_poll(void)
-      * Establish the chain last, so the chain links are the first
-      * elements in the BDS.parents lists
-      */
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     for (i =3D 0; i < 3; i++) {
-         if (i) {
-             /* Takes the reference to chain[i - 1] */
-@@ -1735,7 +1735,7 @@ static void test_drop_intermediate_poll(void)
-                               &chain_child_class, BDRV_CHILD_COW, &erro=
r_abort);
-         }
-     }
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     job =3D block_job_create("job", &test_simple_job_driver, NULL, job_=
node,
-                            0, BLK_PERM_ALL, 0, 0, NULL, NULL, &error_ab=
ort);
-@@ -1982,10 +1982,10 @@ static void do_test_replace_child_mid_drain(int =
old_drain_count,
-     new_child_bs->total_sectors =3D 1;
-
-     bdrv_ref(old_child_bs);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
-                       BDRV_CHILD_COW, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-     parent_s->setup_completed =3D true;
-
-     for (i =3D 0; i < old_drain_count; i++) {
-@@ -2016,9 +2016,9 @@ static void do_test_replace_child_mid_drain(int ol=
d_drain_count,
-     g_assert(parent_bs->quiesce_counter =3D=3D old_drain_count);
-     bdrv_drained_begin(old_child_bs);
-     bdrv_drained_begin(new_child_bs);
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_replace_node(old_child_bs, new_child_bs, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-     bdrv_drained_end(new_child_bs);
-     bdrv_drained_end(old_child_bs);
-     g_assert(parent_bs->quiesce_counter =3D=3D new_drain_count);
-diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-gra=
ph-mod.c
-index 074adcbb9..8ee6ef38d 100644
---- a/tests/unit/test-bdrv-graph-mod.c
-+++ b/tests/unit/test-bdrv-graph-mod.c
-@@ -137,10 +137,10 @@ static void test_update_perm_tree(void)
-
-     blk_insert_bs(root, bs, &error_abort);
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(filter, bs, "child", &child_of_bds,
-                       BDRV_CHILD_DATA, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     aio_context_acquire(qemu_get_aio_context());
-     ret =3D bdrv_append(filter, bs, NULL);
-@@ -206,11 +206,11 @@ static void test_should_update_child(void)
-
-     bdrv_set_backing_hd(target, bs, &error_abort);
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     g_assert(target->backing->bs =3D=3D bs);
-     bdrv_attach_child(filter, target, "target", &child_of_bds,
-                       BDRV_CHILD_DATA, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-     aio_context_acquire(qemu_get_aio_context());
-     bdrv_append(filter, bs, &error_abort);
-     aio_context_release(qemu_get_aio_context());
-@@ -248,7 +248,7 @@ static void test_parallel_exclusive_write(void)
-     bdrv_ref(base);
-     bdrv_ref(fl1);
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(top, fl1, "backing", &child_of_bds,
-                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                       &error_abort);
-@@ -260,7 +260,7 @@ static void test_parallel_exclusive_write(void)
-                       &error_abort);
-
-     bdrv_replace_node(fl1, fl2, &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     bdrv_drained_end(fl2);
-     bdrv_drained_end(fl1);
-@@ -367,7 +367,7 @@ static void test_parallel_perm_update(void)
-      */
-     bdrv_ref(base);
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(top, ws, "file", &child_of_bds, BDRV_CHILD_DATA,
-                       &error_abort);
-     c_fl1 =3D bdrv_attach_child(ws, fl1, "first", &child_of_bds,
-@@ -380,7 +380,7 @@ static void test_parallel_perm_update(void)
-     bdrv_attach_child(fl2, base, "backing", &child_of_bds,
-                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                       &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     /* Select fl1 as first child to be active */
-     s->selected =3D c_fl1;
-@@ -434,11 +434,11 @@ static void test_append_greedy_filter(void)
-     BlockDriverState *base =3D no_perm_node("base");
-     BlockDriverState *fl =3D exclusive_writer_node("fl1");
-
--    bdrv_graph_wrlock(NULL);
-+    bdrv_graph_wrlock();
-     bdrv_attach_child(top, base, "backing", &child_of_bds,
-                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                       &error_abort);
--    bdrv_graph_wrunlock(NULL);
-+    bdrv_graph_wrunlock();
-
-     aio_context_acquire(qemu_get_aio_context());
-     bdrv_append(fl, base, &error_abort);
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
deleted file mode 100644
index bcdd0fbed8..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 7ead946998610657d38d1a505d5f25300d4ca613 Mon Sep 17 00:00:00 2001
-From: Kevin Wolf <kwolf@redhat.com>
-Date: Thu, 25 Apr 2024 14:56:02 +0000
-Subject: [PATCH] block: Parse filenames only when explicitly requested
-
-When handling image filenames from legacy options such as -drive or from
-tools, these filenames are parsed for protocol prefixes, including for
-the json:{} pseudo-protocol.
-
-This behaviour is intended for filenames that come directly from the
-command line and for backing files, which may come from the image file
-itself. Higher level management tools generally take care to verify that
-untrusted images don't contain a bad (or any) backing file reference;
-'qemu-img info' is a suitable tool for this.
-
-However, for other files that can be referenced in images, such as
-qcow2 data files or VMDK extents, the string from the image file is
-usually not verified by management tools - and 'qemu-img info' wouldn't
-be suitable because in contrast to backing files, it already opens these
-other referenced files. So here the string should be interpreted as a
-literal local filename. More complex configurations need to be specified
-explicitly on the command line or in QMP...
-
-CVE: CVE-2024-4467
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/7ead946998610657d38d1a505d5f25300d4ca613]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- block.c | 94 ++++++++++++++++++++++++++++++++++-----------------------
- 1 file changed, 57 insertions(+), 37 deletions(-)
-
-diff --git a/block.c b/block.c
-index 25e1ebc60..f3cb32cd7 100644
---- a/block.c
-+++ b/block.c
-@@ -86,6 +86,7 @@ static BlockDriverState *bdrv_open_inherit(const char =
*filename,
-                                            BlockDriverState *parent,
-                                            const BdrvChildClass *child_=
class,
-                                            BdrvChildRole child_role,
-+                                           bool parse_filename,
-                                            Error **errp);
-
- static bool bdrv_recurse_has_child(BlockDriverState *bs,
-@@ -2047,7 +2048,8 @@ static void parse_json_protocol(QDict *options, co=
nst char **pfilename,
-  * block driver has been specified explicitly.
-  */
- static int bdrv_fill_options(QDict **options, const char *filename,
--                             int *flags, Error **errp)
-+                             int *flags, bool allow_parse_filename,
-+                             Error **errp)
- {
-     const char *drvname;
-     bool protocol =3D *flags & BDRV_O_PROTOCOL;
-@@ -2089,7 +2091,7 @@ static int bdrv_fill_options(QDict **options, cons=
t char *filename,
-     if (protocol && filename) {
-         if (!qdict_haskey(*options, "filename")) {
-             qdict_put_str(*options, "filename", filename);
--            parse_filename =3D true;
-+            parse_filename =3D allow_parse_filename;
-         } else {
-             error_setg(errp, "Can't specify 'file' and 'filename' optio=
ns at "
-                              "the same time");
-@@ -3675,7 +3677,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, Q=
Dict *parent_options,
-     }
-
-     backing_hd =3D bdrv_open_inherit(backing_filename, reference, optio=
ns, 0, bs,
--                                   &child_of_bds, bdrv_backing_role(bs)=
, errp);
-+                                   &child_of_bds, bdrv_backing_role(bs)=
, true,
-+                                   errp);
-     if (!backing_hd) {
-         bs->open_flags |=3D BDRV_O_NO_BACKING;
-         error_prepend(errp, "Could not open backing file: ");
-@@ -3712,7 +3715,8 @@ free_exit:
- static BlockDriverState *
- bdrv_open_child_bs(const char *filename, QDict *options, const char *bd=
ref_key,
-                    BlockDriverState *parent, const BdrvChildClass *chil=
d_class,
--                   BdrvChildRole child_role, bool allow_none, Error **e=
rrp)
-+                   BdrvChildRole child_role, bool allow_none,
-+                   bool parse_filename, Error **errp)
- {
-     BlockDriverState *bs =3D NULL;
-     QDict *image_options;
-@@ -3743,7 +3747,8 @@ bdrv_open_child_bs(const char *filename, QDict *op=
tions, const char *bdref_key,
-     }
-
-     bs =3D bdrv_open_inherit(filename, reference, image_options, 0,
--                           parent, child_class, child_role, errp);
-+                           parent, child_class, child_role, parse_filen=
ame,
-+                           errp);
-     if (!bs) {
-         goto done;
-     }
-@@ -3753,6 +3758,33 @@ done:
-     return bs;
- }
-
-+static BdrvChild *bdrv_open_child_common(const char *filename,
-+                                         QDict *options, const char *bd=
ref_key,
-+                                         BlockDriverState *parent,
-+                                         const BdrvChildClass *child_cl=
ass,
-+                                         BdrvChildRole child_role,
-+                                         bool allow_none, bool parse_fi=
lename,
-+                                         Error **errp)
-+{
-+    BlockDriverState *bs;
-+    BdrvChild *child;
-+
-+    GLOBAL_STATE_CODE();
-+
-+    bs =3D bdrv_open_child_bs(filename, options, bdref_key, parent, chi=
ld_class,
-+                            child_role, allow_none, parse_filename, err=
p);
-+    if (bs =3D=3D NULL) {
-+        return NULL;
-+    }
-+
-+    bdrv_graph_wrlock();
-+    child =3D bdrv_attach_child(parent, bs, bdref_key, child_class, chi=
ld_role,
-+                              errp);
-+    bdrv_graph_wrunlock();
-+
-+    return child;
-+}
-+
- /*
-  * Opens a disk image whose options are given as BlockdevRef in another=
 block
-  * device's options.
-@@ -3778,31 +3810,15 @@ BdrvChild *bdrv_open_child(const char *filename,
-                            BdrvChildRole child_role,
-                            bool allow_none, Error **errp)
- {
--    BlockDriverState *bs;
--    BdrvChild *child;
--    AioContext *ctx;
--
--    GLOBAL_STATE_CODE();
--
--    bs =3D bdrv_open_child_bs(filename, options, bdref_key, parent, chi=
ld_class,
--                            child_role, allow_none, errp);
--    if (bs =3D=3D NULL) {
--        return NULL;
--    }
--
--    bdrv_graph_wrlock();
--    ctx =3D bdrv_get_aio_context(bs);
--    aio_context_acquire(ctx);
--    child =3D bdrv_attach_child(parent, bs, bdref_key, child_class, chi=
ld_role,
--                              errp);
--    aio_context_release(ctx);
--    bdrv_graph_wrunlock();
--
--    return child;
-+   return bdrv_open_child_common(filename, options, bdref_key, parent,
-+                                  child_class, child_role, allow_none, =
false,
-+                                  errp);
- }
-
- /*
-- * Wrapper on bdrv_open_child() for most popular case: open primary chi=
ld of bs.
-+ * This does mostly the same as bdrv_open_child(), but for opening the =
primary
-+ * child of a node. A notable difference from bdrv_open_child() is that=
 it
-+ * enables filename parsing for protocol names (including json:).
-  *
-  * The caller must hold the lock of the main AioContext and no other Ai=
oContext.
-  * @parent can move to a different AioContext in this function. Callers=
 must
-@@ -3819,8 +3835,8 @@ int bdrv_open_file_child(const char *filename,
-     role =3D parent->drv->is_filter ?
-         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
-
--    if (!bdrv_open_child(filename, options, bdref_key, parent,
--                         &child_of_bds, role, false, errp))
-+    if (!bdrv_open_child_common(filename, options, bdref_key, parent,
-+                                &child_of_bds, role, false, true, errp)=
)
-     {
-         return -EINVAL;
-     }
-@@ -3865,7 +3881,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevR=
ef *ref, Error **errp)
-
-     }
-
--    bs =3D bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, =
errp);
-+    bs =3D bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, =
false,
-+                           errp);
-     obj =3D NULL;
-     qobject_unref(obj);
-     visit_free(v);
-@@ -3962,7 +3979,7 @@ static BlockDriverState * no_coroutine_fn
- bdrv_open_inherit(const char *filename, const char *reference, QDict *o=
ptions,
-                   int flags, BlockDriverState *parent,
-                   const BdrvChildClass *child_class, BdrvChildRole chil=
d_role,
--                  Error **errp)
-+                  bool parse_filename, Error **errp)
- {
-     int ret;
-     BlockBackend *file =3D NULL;
-@@ -4011,9 +4028,11 @@ bdrv_open_inherit(const char *filename, const cha=
r *reference, QDict *options,
-     }
-
-     /* json: syntax counts as explicit options, as if in the QDict */
--    parse_json_protocol(options, &filename, &local_err);
--    if (local_err) {
--        goto fail;
-+    if (parse_filename) {
-+        parse_json_protocol(options, &filename, &local_err);
-+        if (local_err) {
-+            goto fail;
-+        }
-     }
-
-     bs->explicit_options =3D qdict_clone_shallow(options);
-@@ -4038,7 +4057,8 @@ bdrv_open_inherit(const char *filename, const char=
 *reference, QDict *options,
-                                      parent->open_flags, parent->option=
s);
-     }
-
--    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
-+    ret =3D bdrv_fill_options(&options, filename, &flags, parse_filenam=
e,
-+                            &local_err);
-     if (ret < 0) {
-         goto fail;
-     }
-@@ -4107,7 +4127,7 @@ bdrv_open_inherit(const char *filename, const char=
 *reference, QDict *options,
-
-         file_bs =3D bdrv_open_child_bs(filename, options, "file", bs,
-                                      &child_of_bds, BDRV_CHILD_IMAGE,
--                                     true, &local_err);
-+                                     true, true, &local_err);
-         if (local_err) {
-             goto fail;
-         }
-@@ -4270,7 +4290,7 @@ BlockDriverState *bdrv_open(const char *filename, =
const char *reference,
-     GLOBAL_STATE_CODE();
-
-     return bdrv_open_inherit(filename, reference, options, flags, NULL,
--                             NULL, 0, errp);
-+                             NULL, 0, true, errp);
- }
-
- /* Return true if the NULL-terminated @list contains @str */
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
deleted file mode 100644
index 631e93a6d2..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From fb1c2aaa981e0a2fa6362c9985f1296b74f055ac Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Wed, 7 Aug 2024 08:50:01 -0500
-Subject: [PATCH] nbd/server: Plumb in new args to nbd_client_add()
-
-Upcoming patches to fix a CVE need to track an opaque pointer passed
-in by the owner of a client object, as well as request for a time
-limit on how fast negotiation must complete.  Prepare for that by
-changing the signature of nbd_client_new() and adding an accessor to
-get at the opaque pointer, although for now the two servers
-(qemu-nbd.c and blockdev-nbd.c) do not change behavior even though
-they pass in a new default timeout value.
-
-Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
-Signed-off-by: Eric Blake <eblake@redhat.com>
-Message-ID: <20240807174943.771624-11-eblake@redhat.com>
-Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-[eblake: s/LIMIT/MAX_SECS/ as suggested by Dan]
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-CVE: CVE-2024-7409
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/fb1c2aaa9=
81e0a2fa6362c9985f1296b74f055ac]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- blockdev-nbd.c      |  6 ++++--
- include/block/nbd.h | 11 ++++++++++-
- nbd/server.c        | 20 +++++++++++++++++---
- qemu-nbd.c          |  4 +++-
- 4 files changed, 34 insertions(+), 7 deletions(-)
-
-diff --git a/blockdev-nbd.c b/blockdev-nbd.c
-index 213012435..267a1de90 100644
---- a/blockdev-nbd.c
-+++ b/blockdev-nbd.c
-@@ -64,8 +64,10 @@ static void nbd_accept(QIONetListener *listener, QIOC=
hannelSocket *cioc,
-     nbd_update_server_watch(nbd_server);
-
-     qio_channel_set_name(QIO_CHANNEL(cioc), "nbd-server");
--    nbd_client_new(cioc, nbd_server->tlscreds, nbd_server->tlsauthz,
--                   nbd_blockdev_client_closed);
-+    /* TODO - expose handshake timeout as QMP option */
-+    nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
-+                   nbd_server->tlscreds, nbd_server->tlsauthz,
-+                   nbd_blockdev_client_closed, NULL);
- }
-
- static void nbd_update_server_watch(NBDServerData *s)
-diff --git a/include/block/nbd.h b/include/block/nbd.h
-index 4e7bd6342..1d4d65922 100644
---- a/include/block/nbd.h
-+++ b/include/block/nbd.h
-@@ -33,6 +33,12 @@ typedef struct NBDMetaContexts NBDMetaContexts;
-
- extern const BlockExportDriver blk_exp_nbd;
-
-+/*
-+ * NBD_DEFAULT_HANDSHAKE_MAX_SECS: Number of seconds in which client mu=
st
-+ * succeed at NBD_OPT_GO before being forcefully dropped as too slow.
-+ */
-+#define NBD_DEFAULT_HANDSHAKE_MAX_SECS 10
-+
- /* Handshake phase structs - this struct is passed on the wire */
-
- typedef struct NBDOption {
-@@ -403,9 +409,12 @@ AioContext *nbd_export_aio_context(NBDExport *exp);
- NBDExport *nbd_export_find(const char *name);
-
- void nbd_client_new(QIOChannelSocket *sioc,
-+                    uint32_t handshake_max_secs,
-                     QCryptoTLSCreds *tlscreds,
-                     const char *tlsauthz,
--                    void (*close_fn)(NBDClient *, bool));
-+                    void (*close_fn)(NBDClient *, bool),
-+                    void *owner);
-+void *nbd_client_owner(NBDClient *client);
- void nbd_client_get(NBDClient *client);
- void nbd_client_put(NBDClient *client);
-
-diff --git a/nbd/server.c b/nbd/server.c
-index 091b57119..f8881936e 100644
---- a/nbd/server.c
-+++ b/nbd/server.c
-@@ -124,12 +124,14 @@ struct NBDMetaContexts {
- struct NBDClient {
-     int refcount; /* atomic */
-     void (*close_fn)(NBDClient *client, bool negotiated);
-+    void *owner;
-
-     QemuMutex lock;
-
-     NBDExport *exp;
-     QCryptoTLSCreds *tlscreds;
-     char *tlsauthz;
-+    uint32_t handshake_max_secs;
-     QIOChannelSocket *sioc; /* The underlying data channel */
-     QIOChannel *ioc; /* The current I/O channel which may differ (eg TL=
S) */
-
-@@ -3160,6 +3162,7 @@ static coroutine_fn void nbd_co_client_start(void =
*opaque)
-
-     qemu_co_mutex_init(&client->send_lock);
-
-+    /* TODO - utilize client->handshake_max_secs */
-     if (nbd_negotiate(client, &local_err)) {
-         if (local_err) {
-             error_report_err(local_err);
-@@ -3174,14 +3177,17 @@ static coroutine_fn void nbd_co_client_start(voi=
d *opaque)
- }
-
- /*
-- * Create a new client listener using the given channel @sioc.
-+ * Create a new client listener using the given channel @sioc and @owne=
r.
-  * Begin servicing it in a coroutine.  When the connection closes, call
-- * @close_fn with an indication of whether the client completed negotia=
tion.
-+ * @close_fn with an indication of whether the client completed negotia=
tion
-+ * within @handshake_max_secs seconds (0 for unbounded).
-  */
- void nbd_client_new(QIOChannelSocket *sioc,
-+                    uint32_t handshake_max_secs,
-                     QCryptoTLSCreds *tlscreds,
-                     const char *tlsauthz,
--                    void (*close_fn)(NBDClient *, bool))
-+                    void (*close_fn)(NBDClient *, bool),
-+                    void *owner)
- {
-     NBDClient *client;
-     Coroutine *co;
-@@ -3194,13 +3200,21 @@ void nbd_client_new(QIOChannelSocket *sioc,
-         object_ref(OBJECT(client->tlscreds));
-     }
-     client->tlsauthz =3D g_strdup(tlsauthz);
-+    client->handshake_max_secs =3D handshake_max_secs;
-     client->sioc =3D sioc;
-     qio_channel_set_delay(QIO_CHANNEL(sioc), false);
-     object_ref(OBJECT(client->sioc));
-     client->ioc =3D QIO_CHANNEL(sioc);
-     object_ref(OBJECT(client->ioc));
-     client->close_fn =3D close_fn;
-+    client->owner =3D owner;
-
-     co =3D qemu_coroutine_create(nbd_co_client_start, client);
-     qemu_coroutine_enter(co);
- }
-+
-+void *
-+nbd_client_owner(NBDClient *client)
-+{
-+    return client->owner;
-+}
-diff --git a/qemu-nbd.c b/qemu-nbd.c
-index 186e6468b..5fa399c0b 100644
---- a/qemu-nbd.c
-+++ b/qemu-nbd.c
-@@ -389,7 +389,9 @@ static void nbd_accept(QIONetListener *listener, QIO=
ChannelSocket *cioc,
-
-     nb_fds++;
-     nbd_update_server_watch();
--    nbd_client_new(cioc, tlscreds, tlsauthz, nbd_client_closed);
-+    /* TODO - expose handshake timeout as command line option */
-+    nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
-+                   tlscreds, tlsauthz, nbd_client_closed, NULL);
- }
-
- static void nbd_update_server_watch(void)
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
deleted file mode 100644
index ca8ef0b44d..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From c8a76dbd90c2f48df89b75bef74917f90a59b623 Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Tue, 6 Aug 2024 13:53:00 -0500
-Subject: [PATCH] nbd/server: CVE-2024-7409: Cap default max-connections =
to 100
-
-Allowing an unlimited number of clients to any web service is a recipe
-for a rudimentary denial of service attack: the client merely needs to
-open lots of sockets without closing them, until qemu no longer has
-any more fds available to allocate.
-
-For qemu-nbd, we default to allowing only 1 connection unless more are
-explicitly asked for (-e or --shared); this was historically picked as
-a nice default (without an explicit -t, a non-persistent qemu-nbd goes
-away after a client disconnects, without needing any additional
-follow-up commands), and we are not going to change that interface now
-(besides, someday we want to point people towards qemu-storage-daemon
-instead of qemu-nbd).
-
-But for qemu proper, and the newer qemu-storage-daemon, the QMP
-nbd-server-start command has historically had a default of unlimited
-number of connections, in part because unlike qemu-nbd it is
-inherently persistent until nbd-server-stop.  Allowing multiple client
-sockets is particularly useful for clients that can take advantage of
-MULTI_CONN (creating parallel sockets to increase throughput),
-although known clients that do so (such as libnbd's nbdcopy) typically
-use only 8 or 16 connections (the benefits of scaling diminish once
-more sockets are competing for kernel attention).  Picking a number
-large enough for typical use cases, but not unlimited, makes it
-slightly harder for a malicious client to perform a denial of service
-merely by opening lots of connections withot progressing through the
-handshake.
-
-This change does not eliminate CVE-2024-7409 on its own, but reduces
-the chance for fd exhaustion or unlimited memory usage as an attack
-surface.  On the other hand, by itself, it makes it more obvious that
-with a finite limit, we have the problem of an unauthenticated client
-holding 100 fds opened as a way to block out a legitimate client from
-being able to connect; thus, later patches will further add timeouts
-to reject clients that are not making progress.
-
-This is an INTENTIONAL change in behavior, and will break any client
-of nbd-server-start that was not passing an explicit max-connections
-parameter, yet expects more than 100 simultaneous connections.  We are
-not aware of any such client (as stated above, most clients aware of
-MULTI_CONN get by just fine on 8 or 16 connections, and probably cope
-with later connections failing by relying on the earlier connections;
-libvirt has not yet been passing max-connections, but generally
-creates NBD servers with the intent for a single client for the sake
-of live storage migration; meanwhile, the KubeSAN project anticipates
-a large cluster sharing multiple clients [up to 8 per node, and up to
-100 nodes in a cluster], but it currently uses qemu-nbd with an
-explicit --shared=3D0 rather than qemu-storage-daemon with
-nbd-server-start).
-
-We considered using a deprecation period (declare that omitting
-max-parameters is deprecated, and make it mandatory in 3 releases -
-then we don't need to pick an arbitrary default); that has zero risk
-of breaking any apps that accidentally depended on more than 100
-connections, and where such breakage might not be noticed under unit
-testing but only under the larger loads of production usage.  But it
-does not close the denial-of-service hole until far into the future,
-and requires all apps to change to add the parameter even if 100 was
-good enough.  It also has a drawback that any app (like libvirt) that
-is accidentally relying on an unlimited default should seriously
-consider their own CVE now, at which point they are going to change to
-pass explicit max-connections sooner than waiting for 3 qemu releases.
-Finally, if our changed default breaks an app, that app can always
-pass in an explicit max-parameters with a larger value.
-
-It is also intentional that the HMP interface to nbd-server-start is
-not changed to expose max-connections (any client needing to fine-tune
-things should be using QMP).
-
-Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-Signed-off-by: Eric Blake <eblake@redhat.com>
-Message-ID: <20240807174943.771624-12-eblake@redhat.com>
-Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-[ericb: Expand commit message to summarize Dan's argument for why we
-break corner-case back-compat behavior without a deprecation period]
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-CVE: CVE-2024-7409
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/c8a76dbd9=
0c2f48df89b75bef74917f90a59b623]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- block/monitor/block-hmp-cmds.c | 3 ++-
- blockdev-nbd.c                 | 8 ++++++++
- include/block/nbd.h            | 7 +++++++
- qapi/block-export.json         | 4 ++--
- 4 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cm=
ds.c
-index c729cbf1e..78a697585 100644
---- a/block/monitor/block-hmp-cmds.c
-+++ b/block/monitor/block-hmp-cmds.c
-@@ -415,7 +415,8 @@ void hmp_nbd_server_start(Monitor *mon, const QDict =
*qdict)
-         goto exit;
-     }
-
--    nbd_server_start(addr, NULL, NULL, 0, &local_err);
-+    nbd_server_start(addr, NULL, NULL, NBD_DEFAULT_MAX_CONNECTIONS,
-+                     &local_err);
-     qapi_free_SocketAddress(addr);
-     if (local_err !=3D NULL) {
-         goto exit;
-diff --git a/blockdev-nbd.c b/blockdev-nbd.c
-index 267a1de90..24ba5382d 100644
---- a/blockdev-nbd.c
-+++ b/blockdev-nbd.c
-@@ -170,6 +170,10 @@ void nbd_server_start(SocketAddress *addr, const ch=
ar *tls_creds,
-
- void nbd_server_start_options(NbdServerOptions *arg, Error **errp)
- {
-+    if (!arg->has_max_connections) {
-+        arg->max_connections =3D NBD_DEFAULT_MAX_CONNECTIONS;
-+    }
-+
-     nbd_server_start(arg->addr, arg->tls_creds, arg->tls_authz,
-                      arg->max_connections, errp);
- }
-@@ -182,6 +186,10 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr=
,
- {
-     SocketAddress *addr_flat =3D socket_address_flatten(addr);
-
-+    if (!has_max_connections) {
-+        max_connections =3D NBD_DEFAULT_MAX_CONNECTIONS;
-+    }
-+
-     nbd_server_start(addr_flat, tls_creds, tls_authz, max_connections, =
errp);
-     qapi_free_SocketAddress(addr_flat);
- }
-diff --git a/include/block/nbd.h b/include/block/nbd.h
-index 1d4d65922..d4f8b21ae 100644
---- a/include/block/nbd.h
-+++ b/include/block/nbd.h
-@@ -39,6 +39,13 @@ extern const BlockExportDriver blk_exp_nbd;
-  */
- #define NBD_DEFAULT_HANDSHAKE_MAX_SECS 10
-
-+/*
-+ * NBD_DEFAULT_MAX_CONNECTIONS: Number of client sockets to allow at
-+ * once; must be large enough to allow a MULTI_CONN-aware client like
-+ * nbdcopy to create its typical number of 8-16 sockets.
-+ */
-+#define NBD_DEFAULT_MAX_CONNECTIONS 100
-+
- /* Handshake phase structs - this struct is passed on the wire */
-
- typedef struct NBDOption {
-diff --git a/qapi/block-export.json b/qapi/block-export.json
-index 7874a49ba..1d255d77e 100644
---- a/qapi/block-export.json
-+++ b/qapi/block-export.json
-@@ -28,7 +28,7 @@
- # @max-connections: The maximum number of connections to allow at the
- #     same time, 0 for unlimited.  Setting this to 1 also stops the
- #     server from advertising multiple client support (since 5.2;
--#     default: 0)
-+#     default: 100)
- #
- # Since: 4.2
- ##
-@@ -63,7 +63,7 @@
- # @max-connections: The maximum number of connections to allow at the
- #     same time, 0 for unlimited.  Setting this to 1 also stops the
- #     server from advertising multiple client support (since 5.2;
--#     default: 0).
-+#     default: 100).
- #
- # Returns: error if the server is already running.
- #
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
deleted file mode 100644
index b2b9b15c54..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From b9b72cb3ce15b693148bd09cef7e50110566d8a0 Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Thu, 8 Aug 2024 16:05:08 -0500
-Subject: [PATCH] nbd/server: CVE-2024-7409: Drop non-negotiating clients
-
-A client that opens a socket but does not negotiate is merely hogging
-qemu's resources (an open fd and a small amount of memory); and a
-malicious client that can access the port where NBD is listening can
-attempt a denial of service attack by intentionally opening and
-abandoning lots of unfinished connections.  The previous patch put a
-default bound on the number of such ongoing connections, but once that
-limit is hit, no more clients can connect (including legitimate ones).
-The solution is to insist that clients complete handshake within a
-reasonable time limit, defaulting to 10 seconds.  A client that has
-not successfully completed NBD_OPT_GO by then (including the case of
-where the client didn't know TLS credentials to even reach the point
-of NBD_OPT_GO) is wasting our time and does not deserve to stay
-connected.  Later patches will allow fine-tuning the limit away from
-the default value (including disabling it for doing integration
-testing of the handshake process itself).
-
-Note that this patch in isolation actually makes it more likely to see
-qemu SEGV after nbd-server-stop, as any client socket still connected
-when the server shuts down will now be closed after 10 seconds rather
-than at the client's whims.  That will be addressed in the next patch.
-
-For a demo of this patch in action:
-$ qemu-nbd -f raw -r -t -e 10 file &
-$ nbdsh --opt-mode -c '
-H =3D list()
-for i in range(20):
-  print(i)
-  H.insert(i, nbd.NBD())
-  H[i].set_opt_mode(True)
-  H[i].connect_uri("nbd://localhost")
-'
-$ kill $!
-
-where later connections get to start progressing once earlier ones are
-forcefully dropped for taking too long, rather than hanging.
-
-Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-Signed-off-by: Eric Blake <eblake@redhat.com>
-Message-ID: <20240807174943.771624-13-eblake@redhat.com>
-Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-[eblake: rebase to changes earlier in series, reduce scope of timer]
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-CVE: CVE-2024-7409
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/b9b72cb3ce15b693148bd09cef7e50110566d8a0]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- nbd/server.c     | 28 +++++++++++++++++++++++++++-
- nbd/trace-events |  1 +
- 2 files changed, 28 insertions(+), 1 deletion(-)
-
-diff --git a/nbd/server.c b/nbd/server.c
-index f8881936e..6155e329a 100644
---- a/nbd/server.c
-+++ b/nbd/server.c
-@@ -3155,22 +3155,48 @@ static void nbd_client_receive_next_request(NBDC=
lient *client)
-     }
- }
-
-+static void nbd_handshake_timer_cb(void *opaque)
-+{
-+    QIOChannel *ioc =3D opaque;
-+
-+    trace_nbd_handshake_timer_cb();
-+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-+}
-+
- static coroutine_fn void nbd_co_client_start(void *opaque)
- {
-     NBDClient *client =3D opaque;
-     Error *local_err =3D NULL;
-+    QEMUTimer *handshake_timer =3D NULL;
-
-     qemu_co_mutex_init(&client->send_lock);
-
--    /* TODO - utilize client->handshake_max_secs */
-+    /*
-+     * Create a timer to bound the time spent in negotiation. If the
-+     * timer expires, it is likely nbd_negotiate will fail because the
-+     * socket was shutdown.
-+     */
-+    if (client->handshake_max_secs > 0) {
-+        handshake_timer =3D aio_timer_new(qemu_get_aio_context(),
-+                                        QEMU_CLOCK_REALTIME,
-+                                        SCALE_NS,
-+                                        nbd_handshake_timer_cb,
-+                                        client->sioc);
-+        timer_mod(handshake_timer,
-+                  qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
-+                  client->handshake_max_secs * NANOSECONDS_PER_SECOND);
-+    }
-+
-     if (nbd_negotiate(client, &local_err)) {
-         if (local_err) {
-             error_report_err(local_err);
-         }
-+        timer_free(handshake_timer);
-         client_close(client, false);
-         return;
-     }
-
-+    timer_free(handshake_timer);
-     WITH_QEMU_LOCK_GUARD(&client->lock) {
-         nbd_client_receive_next_request(client);
-     }
-diff --git a/nbd/trace-events b/nbd/trace-events
-index 00ae3216a..cbd0a4ab7 100644
---- a/nbd/trace-events
-+++ b/nbd/trace-events
-@@ -76,6 +76,7 @@ nbd_co_receive_request_payload_received(uint64_t cooki=
e, uint64_t len) "Payload
- nbd_co_receive_ext_payload_compliance(uint64_t from, uint64_t len) "cli=
ent sent non-compliant write without payload flag: from=3D0x%" PRIx64 ", =
len=3D0x%" PRIx64
- nbd_co_receive_align_compliance(const char *op, uint64_t from, uint64_t=
 len, uint32_t align) "client sent non-compliant unaligned %s request: fr=
om=3D0x%" PRIx64 ", len=3D0x%" PRIx64 ", align=3D0x%" PRIx32
- nbd_trip(void) "Reading request"
-+nbd_handshake_timer_cb(void) "client took too long to negotiate"
-
- # client-connection.c
- nbd_connect_thread_sleep(uint64_t timeout) "timeout %" PRIu64
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
deleted file mode 100644
index 9515c631ad..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 3e7ef738c8462c45043a1d39f702a0990406a3b3 Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Wed, 7 Aug 2024 12:23:13 -0500
-Subject: [PATCH] nbd/server: CVE-2024-7409: Close stray clients at serve=
r-stop
-
-A malicious client can attempt to connect to an NBD server, and then
-intentionally delay progress in the handshake, including if it does
-not know the TLS secrets.  Although the previous two patches reduce
-this behavior by capping the default max-connections parameter and
-killing slow clients, they did not eliminate the possibility of a
-client waiting to close the socket until after the QMP nbd-server-stop
-command is executed, at which point qemu would SEGV when trying to
-dereference the NULL nbd_server global which is no longer present.
-This amounts to a denial of service attack.  Worse, if another NBD
-server is started before the malicious client disconnects, I cannot
-rule out additional adverse effects when the old client interferes
-with the connection count of the new server (although the most likely
-is a crash due to an assertion failure when checking
-nbd_server->connections > 0).
-
-For environments without this patch, the CVE can be mitigated by
-ensuring (such as via a firewall) that only trusted clients can
-connect to an NBD server.  Note that using frameworks like libvirt
-that ensure that TLS is used and that nbd-server-stop is not executed
-while any trusted clients are still connected will only help if there
-is also no possibility for an untrusted client to open a connection
-but then stall on the NBD handshake.
-
-Given the previous patches, it would be possible to guarantee that no
-clients remain connected by having nbd-server-stop sleep for longer
-than the default handshake deadline before finally freeing the global
-nbd_server object, but that could make QMP non-responsive for a long
-time.  So intead, this patch fixes the problem by tracking all client
-sockets opened while the server is running, and forcefully closing any
-such sockets remaining without a completed handshake at the time of
-nbd-server-stop, then waiting until the coroutines servicing those
-sockets notice the state change.  nbd-server-stop now has a second
-AIO_WAIT_WHILE_UNLOCKED (the first is indirectly through the
-blk_exp_close_all_type() that disconnects all clients that completed
-handshakes), but forced socket shutdown is enough to progress the
-coroutines and quickly tear down all clients before the server is
-freed, thus finally fixing the CVE.
-
-This patch relies heavily on the fact that nbd/server.c guarantees
-that it only calls nbd_blockdev_client_closed() from the main loop
-(see the assertion in nbd_client_put() and the hoops used in
-nbd_client_put_nonzero() to achieve that); if we did not have that
-guarantee, we would also need a mutex protecting our accesses of the
-list of connections to survive re-entrancy from independent iothreads.
-
-Although I did not actually try to test old builds, it looks like this
-problem has existed since at least commit 862172f45c (v2.12.0, 2017) -
-even back when that patch started using a QIONetListener to handle
-listening on multiple sockets, nbd_server_free() was already unaware
-that the nbd_blockdev_client_closed callback can be reached later by a
-client thread that has not completed handshakes (and therefore the
-client's socket never got added to the list closed in
-nbd_export_close_all), despite that patch intentionally tearing down
-the QIONetListener to prevent new clients.
-
-Reported-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
-Fixes: CVE-2024-7409
-CC: qemu-stable@nongnu.org
-Signed-off-by: Eric Blake <eblake@redhat.com>
-Message-ID: <20240807174943.771624-14-eblake@redhat.com>
-Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
-
-CVE: CVE-2024-7409
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/3e7ef738c8462c45043a1d39f702a0990406a3b3]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- blockdev-nbd.c | 35 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/blockdev-nbd.c b/blockdev-nbd.c
-index 24ba5382d..f73409ae4 100644
---- a/blockdev-nbd.c
-+++ b/blockdev-nbd.c
-@@ -21,12 +21,18 @@
- #include "io/channel-socket.h"
- #include "io/net-listener.h"
-
-+typedef struct NBDConn {
-+    QIOChannelSocket *cioc;
-+    QLIST_ENTRY(NBDConn) next;
-+} NBDConn;
-+
- typedef struct NBDServerData {
-     QIONetListener *listener;
-     QCryptoTLSCreds *tlscreds;
-     char *tlsauthz;
-     uint32_t max_connections;
-     uint32_t connections;
-+    QLIST_HEAD(, NBDConn) conns;
- } NBDServerData;
-
- static NBDServerData *nbd_server;
-@@ -51,6 +57,14 @@ int nbd_server_max_connections(void)
-
- static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
- {
-+    NBDConn *conn =3D nbd_client_owner(client);
-+
-+    assert(qemu_in_main_thread() && nbd_server);
-+
-+    object_unref(OBJECT(conn->cioc));
-+    QLIST_REMOVE(conn, next);
-+    g_free(conn);
-+
-     nbd_client_put(client);
-     assert(nbd_server->connections > 0);
-     nbd_server->connections--;
-@@ -60,14 +74,20 @@ static void nbd_blockdev_client_closed(NBDClient *cl=
ient, bool ignored)
- static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc=
,
-                        gpointer opaque)
- {
-+    NBDConn *conn =3D g_new0(NBDConn, 1);
-+
-+    assert(qemu_in_main_thread() && nbd_server);
-     nbd_server->connections++;
-+    object_ref(OBJECT(cioc));
-+    conn->cioc =3D cioc;
-+    QLIST_INSERT_HEAD(&nbd_server->conns, conn, next);
-     nbd_update_server_watch(nbd_server);
-
-     qio_channel_set_name(QIO_CHANNEL(cioc), "nbd-server");
-     /* TODO - expose handshake timeout as QMP option */
-     nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
-                    nbd_server->tlscreds, nbd_server->tlsauthz,
--                   nbd_blockdev_client_closed, NULL);
-+                   nbd_blockdev_client_closed, conn);
- }
-
- static void nbd_update_server_watch(NBDServerData *s)
-@@ -81,12 +101,25 @@ static void nbd_update_server_watch(NBDServerData *=
s)
-
- static void nbd_server_free(NBDServerData *server)
- {
-+    NBDConn *conn, *tmp;
-+
-     if (!server) {
-         return;
-     }
-
-+    /*
-+     * Forcefully close the listener socket, and any clients that have
-+     * not yet disconnected on their own.
-+     */
-     qio_net_listener_disconnect(server->listener);
-     object_unref(OBJECT(server->listener));
-+    QLIST_FOREACH_SAFE(conn, &server->conns, next, tmp) {
-+        qio_channel_shutdown(QIO_CHANNEL(conn->cioc), QIO_CHANNEL_SHUTD=
OWN_BOTH,
-+                             NULL);
-+    }
-+
-+    AIO_WAIT_WHILE_UNLOCKED(NULL, server->connections > 0);
-+
-     if (server->tlscreds) {
-         object_unref(OBJECT(server->tlscreds));
-     }
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.3.bb b/meta/recipes-devt=
ools/qemu/qemu_8.2.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.3.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.7.bb
--=20
2.40.0


