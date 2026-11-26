Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6180.1795659313491799986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 18:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ppPUg/1N;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.201.6, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF6wzl6J1Xq4P5I5ipbpNSTe9HyA4a2UbtX0ip4kxbl8yMkufsEb2L8O0hsjfpB3EA8vT1v+eCu0V0mEpIR04krwkC2R4EGdL+moacuW7v5GgVIDjdORAt6LHtxestch/vhcUkATRw+H19Ji8AHkol8JuvSvbvsq63Nsgbvep2lSPK1GAmNPtBAKRRrrGsLiMYFVd1lm21Y1m9EzVIl6Xx27BSL8AJg7DELmjlrC6SkSfKkX8CfYlDlXqMz61ynMsaxf6shE5Py7/T1mJfbT3KdB1FzBzZCLJaWNG71SpnsMND4m6kXMLTs56Qv8aM346AIgYc9rOB8FMYjGCntCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlAU4PgY5Mn782rNAk1VyBy2KM4IWsaMUqx3ZSDcdzY=;
 b=Y0NQgYUmItEbzWtDXaRwKXcnL9jZRnVsm3wrlXeI/lZl7Ejr1g/P8FRWvIZel0gDy/WRn3L4iqxYun9CNFKVJ6E4FKKYh/Ik23bgXaSTxe1bWvpTO9lSpSkXKJxO1ULwGVOYSYH6HVY/ABVTvtQP9ercpYU6T0GSZInBnAaZMeNbPdyAzsEeM/kaTcjBH7Ga33XChAF2i5hA3q3Bgdt95Z0MtFoOlb4QU6+aYuTP+CDMiX0XZ/BuKm93vHm6CfdFTScxPuF6jbB6uGATokMs6UiFM+e102KEAK2dXuF4/oiw95NmEhEaUDTYM9DucdCUEJ8Lw4tpHmaTKwXEJpXUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlAU4PgY5Mn782rNAk1VyBy2KM4IWsaMUqx3ZSDcdzY=;
 b=ppPUg/1NHl10mloW4MXWmUWZ8JTR3BLoHwE128FO/ZUugXmHz8xBBNL7vkYideaww1903lvROqFcLK++B/gZMWROx+U4nfFOvkBh45oq3Q7HHzOO3AFSv/PFeq18OGE25qNlAaglLGzCj+1ebQ2THBUMIU17muNTzycesgPqU6s=
Received: from BYAPR21CA0018.namprd21.prod.outlook.com (2603:10b6:a03:114::28)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 02:15:05 +0000
Received: from PH7PEPF00000007.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::5a) by BYAPR21CA0018.outlook.office365.com
 (2603:10b6:a03:114::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Thu, 26
 Nov 2026 02:15:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF00000007.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 02:15:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 20:15:04 -0600
Received: from xcolc230100.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 20:15:04 -0600
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] pseudo: Update to 1.99.2 version
Date: Wed, 25 Nov 2026 19:15:04 -0700
Message-ID: <20261126021504.2712290-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mark.hatle@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000007:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 089a3e13-0c56-4574-5d2a-08df4b6315a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|261021121427099003|11063799006|260925021311599003|260925021911599003|10067099003|260925022911599003|261009223327099003|261021123027099003|261026140227099003|261022105027099003|261009223027099003|261026121527099003|261021135927099003|261009220027099003|261009221227099003|261022075727099003|261009221727099003|261102123227099003|261028144727099003|25016099003|12006099003|29003799003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: IixKs3nSSI+aZ0dqTIA1fPs25Knh28Az0t0q2qszK7uSv0431nL/+hXbsueFvPcCsXbpIuDIwIqJW5gy/DojhAjbvA+p+0EObfT+jballvQvnohPr3JTwCAzDjzcSTD2upEIaVm05qRxVtkJgEHfvyQhA1BB99l8eVbzJD0+3kE+fFBSvM/GxKdhWnGmH893RiVWIDyxykLxATYdWEt5v87OMkb4uA4ZhTSoDXgg3pWF/8vc7dGyDH8p3Lk35XffahkO+kEkw3HP3Ztk7YXMiHPcPfojU/Mt33C0bDIic+v5eYBsKYGGbyCNrXCDLRAJly7F3HmK0SsB6aI5Sle4O938kgm7s4RtV5WX0Ob9oW/cszpuGfmHYwI+06dKhvNmnsocGKf3/+V4l7jWsgeRmSdKcJysmajHZaiIq6KlMtYhejvb3nwx/ANzfyynEvLcHxazqzBa2seSQVNAEhShpwM+CxXwNCFWK/GJf10KOdnKP7NnTaLNUBxljjprZt3kYB7kr/1AptRw6etq5ZkXGAkXrRK7o9Zgrv+OgXQ7qMmqW8rhf99ybuHB/E/RW2f7JAkRfaS0YYPr0SsCU3mqvQLMw6txAs/1d0YHukwU+dqWZtNYPSkfhhNuukth+atEJTohX/9U9YzvnfIrF5VPWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(261021121427099003)(11063799006)(260925021311599003)(260925021911599003)(10067099003)(260925022911599003)(261009223327099003)(261021123027099003)(261026140227099003)(261022105027099003)(261009223027099003)(261026121527099003)(261021135927099003)(261009220027099003)(261009221227099003)(261022075727099003)(261009221727099003)(261102123227099003)(261028144727099003)(25016099003)(12006099003)(29003799003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PrMfS1N+gStqYiZ6KGTPZ5uN3q1QHm5md2RNw9C1ly8ylf9JkKOA67Icp9JCuNUmJ1jduOp+j+R32ygPZqVkBVUK3o4eBfIAeZBgm+0Q3/CK03HlFS35iJ+sqC/WgzY5LuL68uQ1nK/HRJwmanGVcM+8PZK6Sb9y88lY5ZAh3nrgnhP/uH1iKey9eQoawRKx1qtr2xbAkRL1unoIVs7jdppOAMJBX1U6abMB1Yt5vSyxesR281uCwveKH2GJyvEUIPCeAfIxpxyij4/O+jw61tuC9AmJ32aVggq8Xh7rnT74xUytpH3v7V9nA4e5bwEraNzYiULeoqIZH2o25H9beu/Ugvlm3Rp/tke024oQ2zdXbd6CVXM7OIwKpc1lsEER59os8P2CLgBjqpkJ3OhSMkTqf/O4kdq8L0tncxQNhsxipO30ACENWeMK9PcoFeZZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 02:15:04.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089a3e13-0c56-4574-5d2a-08df4b6315a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH7PEPF00000007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 02:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251271
Content-Type: text/plain; charset="utf-8"

Changelog from last version:
    Makefile.in: call this 1.99.2
    Replace FASTOP with requests that don't wait for a reply
    Send client requests over one shared datagram socket
    pseudo_server: Log when running in a confined SELinux domain
    ports/linux: Report SELinux as disabled under pseudo
    README.security: Describe io_uring refusal and the host fallback
    ports/linux: Refuse io_uring in the kernel rather than be bypassed by i=
t
    ports/linux/pseudo_wrappers: Report io_uring as unsupported in syscall(=
)
    openat2: Look at dirfd for an empty path
    ports/linux: Pass an empty openat() path to the kernel
    ports/linux: Wrap name_to_handle_at() and open_by_handle_at()
    pseudo_client: Fail when the local state directory isn't writable
    ports/linux/pseudo_wrappers: Fake seccomp strict mode in syscall()
    ports/linux/pseudo_wrappers: Fake seccomp filters set by prctl()
    test-seccomp: Check that seccomp is never really enabled
    ports/linux/pseudo_wrappers: Report Landlock as unsupported
    pseudo_client: Connect to the server without changing directory
    test-landlock: Add a Landlock sandbox test
    Wrap execvpe(), fexecve() and execveat()
    wrappers: Don't re-block signals in nested wrapper calls
    pseudo_util: Skip unneeded lstat calls when canonicalizing paths
    configure: Fix the --enable-profiling default
    doc: Update README and doc/ to match the code
    configure: Require GCC 5 or later
    ports/linux: Don't require <linux/mount.h>
    pseudo.1: Update to match the current code
    pseudo_util: Write the event log to PSEUDO_EVLOG_FILE
    pseudo: List -p in the usage message
    pseudo_util: Fix the date format in the event log dump
    AGENTS.md: Add to assist future developers
    pseudo_util: Make -v and numeric PSEUDO_DEBUG add debug flags
    pseudo: Fix the -k severity option
    pseudo_util: Store PSEUDO_SEVERITY as severity names
    pseudo_server: Set highest_client to the new client when growing
    pseudo_server: Lower highest_client when the highest client closes
    configure: Fix --disable-* options
    pseudo_server: Always use epoll
    pseudo_server: Drop an idle client when out of file descriptors
    pseudo_server: Skip events for clients closed earlier in the batch
    ports/linux: Drop redundant PSEUDO_LINK_SYMLINK_BEHAVIOR override
    ports/common/subports: Show the unknown OS name in the error
    pseudo_util: Remove stale with_libpseudo() comment
    Replace #if 0 strerror() debug messages with a comment
    Remove unused #if 0 debug code
    patches/yocto-older-glibc-symbols.patch: Update to latest YP version
    ports: Let the port define how pseudo stats files
    ports/unix: Remove guts overridden by the Linux port
    ports: Remove PSEUDO_NO_REAL_AT_FUNCTIONS
    test-parallel-ops: Add a parallel create/rename/link/chmod test
    ports: check created files under the path lock before recording them
    ports: hold the path lock in create and metadata wrappers
    pseudo_client: serialize path changes across clients
    Makefile.in: Declare 1.99.1
    README.security: Add information specific to file/process security
    test-chroot-proc-dev: Add /proc and /dev within a chroot test
    test-proc-fd: Add a stale directory descriptor case
    pseudo_client.h: remove dangling pseudo_client_fdpath declaration
    pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
    makewrappers: Allow the wrapper architecture to be set for cross builds
    makewrappers: Change 'Warning' to 'Info'
    makewrappers: Don't generate unused _int paths with noignore_path
    ports: Remove Darwin (macOS) support
    test: Skip open_tree tests when the function or syscall is unavailable
    ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
V3:
Remove obsolete 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.p=
atch
missed in the V2 patch and detected by patchtest.

V2:
Corrects the V1 by removing the makewrappers patch

 ...ow-the-wrapper-architecture-to-be-se.patch | 149 ------------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   5 +-
 2 files changed, 2 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-makewrappers-Al=
low-the-wrapper-architecture-to-be-se.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the=
-wrapper-architecture-to-be-se.patch b/meta/recipes-devtools/pseudo/files/0=
001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
deleted file mode 100644
index 6bdea7ad6d..0000000000
--- a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrappe=
r-architecture-to-be-se.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 979add31166eadc1954b32ff7cb6038fbd171e06 Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Fri, 30 Oct 2026 11:56:45 -0700
-Subject: [PATCH] makewrappers: Allow the wrapper architecture to be set fo=
r
- cross builds
-
-Architecture specific modifiers in wrapfuncs.in, such as
-version-aarch64=3D"GLIBC_2.17" on the xattr wrappers, are selected with
-platform.machine(), so they follow the machine running the script
-rather than the one pseudo is built for. An aarch64 pseudo cross built
-on x86_64 ends up with GLIBC_2.3 and the reverse with GLIBC_2.17, which
-shows up as pseudo not being reproducible between x86_64 and aarch64
-builders.
-
-Add a --target option to configure and pass it on to makewrappers,
-which uses the cpu part of the triplet for these modifiers. Without
---target the build machine is used as before.
-
-[YOCTO #16376]
-
-Upstream-Status: Backport [https://git.yoctoproject.org/pseudo/commit/?id=
=3D979add31166eadc1954b32ff7cb6038fbd171e06]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
-Message-Id: <20261030185645.765144-1-sunilkumar.dora@windriver.com>
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- Makefile.in  |  3 ++-
- configure    |  6 ++++++
- makewrappers | 17 +++++++++++++++--
- 3 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6640a73..9c6da77 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -34,6 +34,7 @@ BITS=3D@BITS@
- ARCH_FLAGS=3D@ARCH_FLAGS@
- MARK64=3D@MARK64@
- RPATH=3D@RPATH@
-+TARGET=3D@TARGET@
- VERSION=3D1.99.0
-=20
- LIB=3D@LIB@
-@@ -146,7 +147,7 @@ tables: enums/*.in maketables templatefile.py $(TABLES=
)
- 	./maketables enums/*.in
-=20
- wrappers: makewrappers templatefile.py $(TEMPLATES) ports/*/wrapfuncs.in
--	CC=3D"$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers "xattr=3D$(XATTR)=
"
-+	CC=3D"$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers --target=3D"$(TAR=
GET)" "xattr=3D$(XATTR)"
-=20
- .SECONDARY: tables wrappers
-=20
-diff --git a/configure b/configure
-index 68c9962..b43809e 100755
---- a/configure
-+++ b/configure
-@@ -10,6 +10,7 @@
- opt_prefix=3D
- opt_libdir=3D
- opt_suffix=3D
-+opt_target=3D
- opt_arch=3Dx86
- opt_bits=3D
- opt_sqlite=3D/usr
-@@ -32,6 +33,7 @@ usage()
-     echo >&2 "  configure --prefix=3D..."
-     echo >&2 "           [--libdir=3D...]"
-     echo >&2 "           [--suffix=3D...]"
-+    echo >&2 "           [--target=3D...]"
-     echo >&2 "           [--enable-memory-db]"
-     echo >&2 "           [--enable-epoll]"
-     echo >&2 "           [--enable-xattr]"
-@@ -153,6 +155,9 @@ do
-     --suffix=3D*)
-         opt_suffix=3D${arg#--suffix=3D}
-         ;;
-+    --target=3D*)
-+        opt_target=3D${arg#--target=3D}
-+        ;;
-     --arch=3D*)
-         echo >&2 "WARNING: The --arch option is now deprecated. Use --cfl=
ags."
-         opt_arch=3D${arg#--arch=3D}
-@@ -341,6 +346,7 @@ sed -e '
-   s,@LIBDIR@,'"$opt_libdir"',g
-   s,@LIB@,'"$opt_lib"',g
-   s,@SUFFIX@,'"$opt_suffix"',g
-+  s,@TARGET@,'"$opt_target"',g
-   s,@SQLITE@,'"$opt_sqlite"',g
-   s,@ARCH_FLAGS@,'"$arch_flags"',g
-   s,@DEFAULT_SQLITE@,'"$default_sqlite"',g
-diff --git a/makewrappers b/makewrappers
-index 81d2444..1ac46bf 100755
---- a/makewrappers
-+++ b/makewrappers
-@@ -15,6 +15,13 @@ import platform
- import subprocess
- from templatefile import TemplateFile
-=20
-+# Set from --target=3D, empty means the machine running this script
-+target_arch =3D ""
-+
-+def wrapper_arch():
-+    """Architecture the wrappers are built for: the --target cpu or the b=
uild machine."""
-+    return target_arch or platform.machine()
-+
- class ArgumentList:
-     """A (possibly empty) list of arguments"""
-=20
-@@ -316,11 +323,11 @@ class Function:
-             # Strip all leading/trailing whitespace
-             modifiers =3D {k.strip():v.strip() for k, v in modifiers.item=
s()}
-=20
--            arch =3D "-" + platform.machine()
-+            arch =3D "-" + wrapper_arch()
-             # Sorted so that versions-foo appear after versions, so overr=
ides are easy
-             for key in sorted(modifiers):
-                 value =3D modifiers[key].replace('<equals>', '=3D=3D')
--                # If the key is version-arm64 and we're on arm64 then ren=
ame this to version
-+                # If the key is version-arm64 and we're building for arm6=
4 then rename this to version
-                 if key.endswith(arch):
-                     key =3D key.replace(arch, "")
-                 setattr(self, key, value)
-@@ -664,10 +671,15 @@ def process_wrapfuncs(port):
-=20
- def main(argv):
-     """Read in function definitions, write out files based on templates."=
""
-+    global target_arch
-     funcs =3D []
-     sources =3D []
-=20
-     for arg in argv:
-+        if arg.startswith('--target=3D'):
-+            # A GNU triplet such as aarch64-poky-linux, only the cpu part=
 is used
-+            target_arch =3D arg[len('--target=3D'):].split('-')[0]
-+            continue
-         if '=3D' not in arg:
-             print("Invalid argument '%s', must be of the form name=3Dvalu=
e" % arg)
-             exit(1)
-@@ -697,6 +709,7 @@ def main(argv):
-     port =3D Port('common', sources)
-=20
-     # the per-function stuff
-+    print("Architecture for wrapper modifiers: %s" % wrapper_arch())
-     print("Writing functions...")
-     all_funcs =3D port.functions()
-     for name in sorted(all_funcs.keys()):
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devt=
ools/pseudo/pseudo_git.bb
index f8903dbb63..5db98f8ef5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,7 +3,6 @@ require pseudo.inc
 SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=3D=
https \
            file://fallback-passwd \
            file://fallback-group \
-           file://0001-makewrappers-Allow-the-wrapper-architecture-to-be-s=
e.patch \
            "
 SRC_URI:append:class-native =3D " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.=
tar.xz;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=3Dprebuilt \
@@ -13,8 +12,8 @@ SRC_URI:append:class-nativesdk =3D " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d604=
0282b84c8d97b99072485aa"
=20
-SRCREV =3D "75222afce8836d12e58b7e85c2dd6057518257a1"
-PV =3D "1.99.0+git"
+SRCREV =3D "ca3223c55f51c046605fedc87c2c0de8deef4f7e"
+PV =3D "1.99.2+git"
=20
 # largefile and 64bit time_t support adds these macros via compiler flags =
globally
 # remove them for pseudo since pseudo intercepts some of the functions whi=
ch will be
--=20
2.34.1

