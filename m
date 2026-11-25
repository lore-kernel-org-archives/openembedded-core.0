Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1783.1795641568367297234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=LiVx6qNv;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 52.101.53.36, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0t7905bfDN89PdrSn7i9mVrsCK3MEHB8jVf5GLPJ4nVBqPMmjHkqZ95IuBBOD3/qT+11k0FKikGExDwYKOGF0jzO/YHEJfb5j5vwWj/EwPU0OGfUz2Li6UbEdOUjRGKwAp1VtJqtHoKIMZBQqQ2BiRDrWWYhrkTAEDGJj4BIisd6pWTbgKnE/NXGPDCKRTe1DVTnMcOkF4J6RiC0UElk3/y6tUq+scYtuP+q95kMYopBOqDJAfssjxVkDGabF0FMDWYy0Rwqdud0jSHZHhb//TWOJrz5n1f88YPkKGWGrwrgBdAp5g5y70IHoWncn+qDMFUmW7Dro84GErdQO1XKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKFbJjbeUmJOnkal93xCInmGaoBaN9+A6jWdgsc6DgI=;
 b=yQF98BQqf2ORXmAHXzdaXsgfa8k96uhvEPCAvVF2TCrEOKV/dB3F5vBRYvvZsZm4uBXibG3PeFoGy/2XwIvnTNvefKD9GQeBlKvtBA6Ns9sd/V9QH69rPUJwCq/uVfR9nKT5WKpsYUAWt9bl3eS0qE3gOdNtPlPJRogLWbAVCOavuRnTF6QeKzQxu+2o1gt/3dJZYhaFHhOQ61iKgnKRjj4iTygeVn2elqfKrloBOyExkSj+n7JkQnbmDEDrXk6Ibyf+M7vYwEJegpaqZKHioEhVaO/juzhL17uM/nFKtEgGWT5IN4u0IFkYzuJm4yJVsmr7hrRPufMYSkqNvXmD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKFbJjbeUmJOnkal93xCInmGaoBaN9+A6jWdgsc6DgI=;
 b=LiVx6qNvN5qToeXF/Gb+mMS4zLTexDW3JydN9rFk3kQJofL3hUCJv7ckHfc1CRzoOO+3qMkw55sy0hDDsz6UnoLHkhFnRpNkrLx9L4llFBsUk17/1f/S0MQd1LkQS1wBaKeoK986ePLvmWyMbMBx1PUH9wiNJ1dvqjvPiXCqYbY=
Received: from DS2PEPF0000455F.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50d) by MW6PR12MB8915.namprd12.prod.outlook.com
 (2603:10b6:303:23e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 21:16:20 +0000
Received: from DS1PEPF0005344C.namprd04.prod.outlook.com
 (2603:10b6:f:fc00::2f4) by DS2PEPF0000455F.outlook.office365.com
 (2603:10b6:f:fc00::50d) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 21:16:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0005344C.mail.protection.outlook.com (10.167.23.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:16:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 15:16:17 -0600
Received: from xcolc230100.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 15:16:17 -0600
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] pseudo: Update to 1.99.2 version
Date: Wed, 25 Nov 2026 14:16:17 -0700
Message-ID: <20261125211617.1158515-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mark.hatle@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344C:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fa0fc9-a81e-4e62-fa88-08df4b39599b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|6133799003|29003799003|25016099003|12006099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|18002099003|3023799007|13003099007|260925021311599003|56012099006|260925022911599003|11063799006|261028144727099003|261102123227099003|261026121527099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261026140227099003|261022105027099003|260925021911599003|10067099003;
X-Microsoft-Antispam-Message-Info: rRDseP1Hqz+w5WEODLpqlLjqf58ks7TWM+Q2EqGBz9epPYVD4dfgIiPmhnyyIAHL/LRg17GYqFRxF9cJx+5XH82BzGB4XCDuisC7ircCHD8MnZOvBUzRPjpybXZp8CT4SMdIgXGbMhO3VTbZsQ6Y5y1vTjLwj0CVBa1/mCeU27pRy0+UYZx1/qCc9wBVi3dot8AE7AfmqtauERQMhhNLmU2OHJVDfjTIt0cclnTt7G9tHEYKnN8+ES29jyCNGQ5uaOURNc5Hh1fR7k8qAnRBYe7FmMXMuRzuzyaXs4G1CvWptHEZClWwUXmLd5yB5GwmZ1tTbohBb7ObdYbFT9pjohcdsG7HB4ZqtdrccI3yT5GX/PvyHca/nmWxZPnk/IQbXtcPD9ws9nG78/vEBB2UUkT7ywtwSZMwyukCZdr3PhQxFZ+dq5/AyV3lMG48+2bPvM8mqNdn7XrXKFSUdTQ1CjsfI0p3A6FXB48HS+N7gYZSAniUcY9xcZ0zzhQ5ke7mA2sffWnKMhrOHGRtMdPO/KQYcsbW0OagQVigPNCDVVBK19IgmUws0VGO3a6DsR725wZB7Jso7gaymASnhF/Rs4buKX+ElPpWHq2PJsg4VumBKecQ52NVng269uKTX4VTloHL9mbPVguHeJzVsIxBKIztRcUdBsN/MOT0lXZQC00=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(6133799003)(29003799003)(25016099003)(12006099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(18002099003)(3023799007)(13003099007)(260925021311599003)(56012099006)(260925022911599003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026140227099003)(261022105027099003)(260925021911599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zEql63a5kx24UTcfv/wAzRPFtpo3wY1rkNWm9oy+pwo3YT76QkFjaNH5a6YGTAWzjcRQTaj64qnDI0PLyQWqThZKhhdykUC02wZl9dygmhTCD0eQ7xFM0PoA9KQZ1DTaIMAV9T01lK6lhvzDDneh3sA3D2b600EzvYJgNIUaXVO77IQYlFF6zuFUUVMXLnvquFCJYUU3Wq21bI7ctT2/ckf7T70cVkJU1riGkgbpLdmNO7jHiiIM6s7D82DNG06ye/uJfYWn2irrGIAYimzshStMy6zmi5VpSA9lJZ5I6sl+QNSlgcQv1PxukCljLIj2V0Oct7yu7RjLayDDkXiN8Q/twOYHGEPhX6XuzqcfEurULrFWVjIFNucTiAz8n31jf/eQTdKkrrAqd8siQjoCz8Fd/bPas51UYftc3xLxB6lbH6AC3WUHFd+Wk/Fnz41o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:16:19.7682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa0fc9-a81e-4e62-fa88-08df4b39599b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0005344C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251249
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
Corrects the V1 by removing the makewrappers patch

 meta/recipes-devtools/pseudo/pseudo_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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

