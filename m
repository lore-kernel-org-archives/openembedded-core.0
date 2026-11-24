Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31756.1795563384738958420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 15:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=Z61Fn3Bp;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.93.195.43, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMZbRH3ryJm3BNxOakH3jqroJjqe2UqQ1qjYJB/lg2hVXyUD5Er0O6VJlAqY/6Rb6F6rP5oYkbUCyScEhkxfD4Y9O6UyJ51GRkf1qjaQJAXFMpyz/IdBtv1C/nlu2CLMFc4Js7QBeNnXvegz+TgtHzczmE/KWv52YixLGPws27INJY/762P3qFtTjUPXBuk933raXiTi4Gp1ehw/uP/XleJakxgdCtlfJp9udt3CJhI1joReB1kkhvGF8SWx0LyqjV3db2Ig2gSH/zKfGrIEMFAQh/5lwXgyqnit2a9U3ZJTnP8tZvi57A4//Md7dlH1A3ZPp8jll0YIIxlLDX+kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLvNYm1VVFW0sInSMw+038WIliM9N5N+MPRFBwBBgTo=;
 b=rQE0JNyKLw1w7f3vLqtpIPmjE/zK0ZFMwzSjYvDbHfYHYtzeqGpbF+b7IL98T2gozrgdaXjDGP3dY11G/796jQ6F63LuuZo269OQKZ+JVesC2nvLUMRBmmIdjPFo6Q2oJIIyqnPBP7noBQgwH/srsP4Eu0VPGheEGLT57etzs2jmddLnSrECmJjupZwWSH5eiMnj2Mw78kPF9Nq4XAUHL7UeDB/iz7oZTPBAptAGsBMwm5Aw1XnLj76mXpOXW+xAsuY1aB+Kn8QUCmfmUdna4wBzqCimHML2tVYnzvEeYOefe/ssvpnbaXY0iZooHJoOMxOxAfcUvZ3uY56IydcfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLvNYm1VVFW0sInSMw+038WIliM9N5N+MPRFBwBBgTo=;
 b=Z61Fn3Bp2rORcWa0O7+tgd1FRZrsrQxvPvpAUGEbKgxIhMKNKlNjOmzMx01GFLhpSqhNWzJFLuj84uLTuYiBEy3sWev5WmzEqeFV2d12wL0UaDhg7pACEJeecuNrqj9dZoGQ5AHUMh3RDtvOICLm/iGHF0ddV5TnhEv1wHywDIQ=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by SJ5PPF000ACABD1.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::984) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 23:36:17 +0000
Received: from BN3PEPF00022BC7.namprd05.prod.outlook.com
 (2603:10b6:610:60:cafe::ab) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 23:36:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC7.mail.protection.outlook.com (10.167.248.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 23:36:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:36:17 -0600
Received: from xsjmhatle70.int.hatle.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 17:36:16 -0600
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pseudo: Update to 1.99.2 version
Date: Tue, 24 Nov 2026 17:36:15 -0600
Message-ID: <20261124233615.95452-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mark.hatle@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC7:EE_|SJ5PPF000ACABD1:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c03057-ed37-4a77-ac96-08df4a83bc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|261028144727099003|261021121427099003|56012099006|260925021911599003|260925022911599003|260925021311599003|11063799006|261021123027099003|261021135927099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: +mCsX6WB2XCPWu4MP6k5sY5G6hL/oZ5sofB+BZL1SyOZWkAGV10tOVoj+BhdXr5/slMUF6ZVaKLPPxxvcwoQNlOURj2ff1S+HdDU+hLZEg8JjLzCuGtccWu+l0SV8oTbF1ul0kuTAJHwWzrW5j/cCC1KyOAfk0wCS9nz/0rguakzlMsqiNWckQiIByH3jy892f2Uys2+AHLC2jbNgNev61iaHtTjy+PdNGhMICMGjvYoncrhmmbxFbvRp1JyHHWjeXWkw8E6PxXxMTJVMLdyw4SbcP6VbzqmluoipRg2UyiFWppr8KgHISKMlvUcDs42dSK3ulpASEQNR2atCglcHaHpEa4TKNH+CgFt0YRNzaB6+/+voTFW93FtEzYuIkE9bJIBeNz3kbMYmvIu85AI3H/k/YaOWidJopgbWcR+gubMqYHuFPPAhAI7y8MXg/XfIgRG5PLx8VJeyGcwoPql7bAa1rd6hPtHbAOmH7dHse8FghEdYdohNZO/cxo/QRlClgCRMGzMVal9PxW/ZgMDfa+0tgdGxBEkVMIhogit8THvs0k4bXyNKOzrf+G7+ePoTOlHaddUR2lWqpmCi+AU+mxd/QjiY4GMaBara6N2fX+CZXQp4glEQ1dV5uPp6lReaW7k2d8wu6JgNfS8/qpo65iuJ90TfP6Ykz3B8+CqKxMfAq/VtjYTd67eyejHGj1DpgOhuPk893icwT94/kgfhw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(261028144727099003)(261021121427099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261021123027099003)(261021135927099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WBR3oHA5K2AbxRd3S5qWcTRxT3NcqoiJjh7eea0OwtUGW/TfLt+nsYOa8FqXdXr9awfKD57JYT48l3aFJjJ9jfmdPtR8HXb7TgmVwR3lFDnLwl0S99nGc2tOIaIRKmJcD5Qk/5daeCg3Q83ct9YdUFyb6SEyoMZmHw5j27OVYkQy1InGwNNT02o9HwCnB+Nk9+Pkafg0ot+GHyQ+Yd+mxO5f2GVdofu2Jpi10m1TEYAw5JvpNoEyGzJUsHmvO650CmNc02yYXSOt1/JKggQN9XH3kg9yHPnNvKDTEQ+871OXR7hd+WUe3rAG9gGdvPrGBmx0H60Kthw9uRxLljkUXPmsPWkBdHjjWXFapUqjhXi7tDUjo8glM7rsBks6o/HvdA05I4/kqge8K25S4GTHFzdd4hYIdM1JTU0CEsHr13abo9WZupEctu97mUYaWV82
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 23:36:17.2123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c03057-ed37-4a77-ac96-08df4a83bc6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF000ACABD1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 23:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251127
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
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devt=
ools/pseudo/pseudo_git.bb
index f8903dbb63..d0ba863992 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,8 +13,8 @@ SRC_URI:append:class-nativesdk =3D " \
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
2.50.1 (Apple Git-155)

