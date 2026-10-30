Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8649.1793357093365295809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GS0QsVHr;
 spf=pass (domain: est.tech, ip: 52.101.84.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoYRCd2IjGJkdj4foucB1LvcdcOtn5LQ9D3//KT48ehz7unaHSz/LIOYBSyA2GeMCrXZJf1M3uRJSvkkmDBp62DWmLr7RulhgI+jkwxM6T/yRrmDWeTUPYSsJERqaemoUsTlvtXyk84U8F8aLNc1SfZz/WCBXJJ23lz7p9Ee7XSJRs10yFWvG9aZpvp49mGAWWBKnvhqLeFknk6f4bbK0tqECMBnLDtPscih2x9BKp+qL5AlTujFfO0uYB05W0iCc2vKfvoF08CwgtWuB4JLoWu2UCeYR6FWvj9tqABefYWxwU1GUTypvqeWLLOrObnKgJd5wyzQP3Pyb69jKUIZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bFtSofQXNdoN/vka3+yL/06tWoKCeWyPyaweizpahQ=;
 b=kb8EMHID3IjmIa1EWjHWK4eu0H80tj2t8s5WcWIRu+uXuYvvu63omnCozz0WmZvkdvgU5oYm/FDHCgGkH8U2chPR2+jMLZbYqSVJDaqGpXtCioBTFB+HDor5vnK5SaVVvey6hMQHaB5JhsFQUk60pHcU2qTA/1xpqyLpd3eMaOE4YbGZNSgxy1+9aHWxvTL0vqjQQyq8rcvrl/9LTJbEavUJqihWX+BXeYrXE6l5uyOpaFGc3STnKXehXytE4Zs4eH6mHI/bOIlzqTIr1XpmQ4hqmgg0cA+V4FL6/t/2+eorRTREV0YZcuAHNTiDP7+aOhf2FVhGwvuK0+ZgQG12EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bFtSofQXNdoN/vka3+yL/06tWoKCeWyPyaweizpahQ=;
 b=GS0QsVHr5jmKsCq4BEI6rX/DRt9xjTiXv3jB/yZk8ja0eS1/87LWGFFTARrHZdodyPaDUrzBjsTQaMh9rnKsJjlzsZ/0nw/toJ2Boscs7RH0cf78r3kVpA4WVibYKp3p1unAw3GNE1Zps3i+tN65zOMH6d8qVjxiSwAi3sye9V4JTPSrxuT5P+LQKXFXwOxbFIiFv/CDdNNFLScowH1o+lIaub9HacE5l6zb2l13guhkzY2Xs+wGf2f0CfNy7ES4lzhJakOOUJfzL8BaMznVtkdsJ9OhyjY+gtm1xopGIta9PehQeuHX8JmXpbguVVbS4jBgKdPJuoykjsYok5zDcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] qemu: Upgrade 11.1.2 -> 11.1.3
Date: Fri, 30 Oct 2026 11:44:35 +0100
Message-ID: <20261030104439.18901-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0308.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0ad018-6725-4fef-8f66-08df3672d281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|260925022911599003|260925021311599003|260925021911599003|5023799004|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261022115727099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261021135927099003|10067099003|12006099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: GcNSno5Hme3awCp3SsY0LuVGFLmkopXkGbNJOQmTEVNBeNGqdd5Bq8QOkp1Tg/OJECWrGpQQXGXfoaH1GNUGfFs6my31BS3x/4sLQ762yVBWUkiRQnJJwwbQjiMUxX6S5AyJUV0kmsJITwM2OWAmyaRHJTpI0SCo00mtmV+/XZEapRNjMgpeF1IIzNhJKj7aJcERlw02qkZ59fYD6RRI4PE5Mj3pyUNntlMRw1L3ODH09GtsXsaiYKBl21pgyKcjAWN+sSOawfHQ+casK6Gil+OCdwWPl46aXR8lz0a9q1Z/0TikCm1pjRnZeLntn/zxt+Mdc0wWLcTMKwpGEGHUWkjOqmgvTUAahN5oJlLXTIazfrlNH7eTyn1aejMdrzpR2Tm1Bfrz0a0C/DkucJtxM1yT0uxF69RLljun0qshWPWz9q9KdcT63frFoRDd9D+iV5RuIL+iaycApfyc0wTgRXnUtcznYcES9BJR31O4JTnHo6VmYzdqUt7FRJKeRZVjTIdPF4Q6W09yxUg5Edh9x1Q/Dv/2Gm5oxPF8HSTCFzZgwRWYUFNkK1n4iltpq7Jxk38uZGyaW6rtKf0NiiTrVU8EYDLNR5bhHLeG0ffTXC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(260925022911599003)(260925021311599003)(260925021911599003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022115727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021135927099003)(10067099003)(12006099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9s7NN4QiGVyNfsVfWu59KtoZhX8iLF1NTvg2ETOSbg25//0CZEM6nDWca97?=
 =?us-ascii?Q?ec61rZ+KB5XaMeNl5CGsxjQkZrPnNYx0RC+1wOub3MicMcJx1UGvvR7RoOZs?=
 =?us-ascii?Q?P1I0geevrMZ0A2ScNyufgdxN8c4R+zgrmyWIisXGRuNn5qfJb7xVis+swKe1?=
 =?us-ascii?Q?a6z36GBCOXKCC2c6WkZW5FeqqfLPfl4O116koHZkIhKX/8NoYUB3ex4pURk8?=
 =?us-ascii?Q?zJZ6HzbbEidVNmGt2M+F+NvXuczzE1W9QCFrGPb4D78TAz6Cebp6eIAoNt2p?=
 =?us-ascii?Q?IKrEIVM2diYV8u+NNAezWwpC8yxf91fAUxwApjelrYn2xNr1m5D467fij9P0?=
 =?us-ascii?Q?QuXFP9DCnX1ChYVNZS5WWWdlFNSq4IFUi08FcPwiz/E7dn+q+NkurHRLl/CG?=
 =?us-ascii?Q?/Xj1N37cC9iJDIUUifGYfHXtXDVGjjm4Tev5WRwWutCZN/rThRrHhynB2v3q?=
 =?us-ascii?Q?d9oU5S7U1qBCMJDsZIxXLF/L7z17qpY9zZcp+1dpgiil+FBHwRdEdPpV8HI2?=
 =?us-ascii?Q?JO2WmOSNIB1FHJWeqb20ONdilD6CanM44ODIc6O/KAzEe6d6fskbStRqiNiC?=
 =?us-ascii?Q?MJBsEvV2uJUUx6oeybtwFKuffqLGNmlvxdAGZz/E65s0JnpOfsyubmHkbYpp?=
 =?us-ascii?Q?z8MC8inrdym72MDM0RQxKQYrrdJrfU1HfdK2whnBNo30CirXsCrNYFo/yKWH?=
 =?us-ascii?Q?xRdgwAuP4B2oWUsm0ixKXETehg//mJY+N2QII1oFNLggaAHPdZTDlAoKtalY?=
 =?us-ascii?Q?u85I3SOW1FakChVe8CRpr6JNSW/4J2tYaRDAgkSnmkvPs9E420O2g45eBZI/?=
 =?us-ascii?Q?zbBn8P6c21HYW3lHSNRIuVQ+P5olZWq0Nsi6OsH8Ui2ll8CeeawjWKVVm0s+?=
 =?us-ascii?Q?daMwp0r6sMJwygiHQnPx6Ni7uKahTLX2j641GDUagjGpyJFglfam3qDgLNMU?=
 =?us-ascii?Q?jACxJYMgG+bhp2vGY2FIdEiNa7+5aPvtREot1LNxlIP2/qFa3fKLCUxQOUwE?=
 =?us-ascii?Q?RBsAfi7WG1l9YKlbD7IB4Fjr6Dm7FBZ4aNbpuQQaFnAy2fYCibAF+GTanuNK?=
 =?us-ascii?Q?5HIdbW8QpQxoxv1zk2z/XTkgIL88QjRwS2e2k5+mWnzBNohVYXCvS5q+NI89?=
 =?us-ascii?Q?7lKcqLZ+RqJ6nk2ckyYcAcW66lxEdboNz0FZCbEpvzOnseKs+UH2upEEeWqS?=
 =?us-ascii?Q?bFxcLGXSns645BUOARE71g+6B9AVIMR8+9JV0APWN3WA+FOV6RhmymirsHPQ?=
 =?us-ascii?Q?Lw76ode4RBXbKj4kxRs40RWbot4A4L9DzylTAYXchEPylJ9OdGt+RzQfejTq?=
 =?us-ascii?Q?3NVno1yOEg3uDOPhF8HooI26ZrjoB3h6xEpTHuUlrQKqgz4ahtM97pmYY1ji?=
 =?us-ascii?Q?qjeSNB0yVg9aJ+5xt2B4sDDMuGJ1mqXT5MTqWk1wSk7xSgxdOh+Kv74X23/0?=
 =?us-ascii?Q?xprNWXgeM0BOACTebtt1XHFIyQR93kq9r3QA0/T8H38FmQP4mmq0UZC4Sh1E?=
 =?us-ascii?Q?G7tfphrRJBLZ9yrgMbpwq/qFWPpAu4eVSIUY5SILx3x5dao41r8RCZysAeOH?=
 =?us-ascii?Q?w79r6icoL+w4GL/89ajhP/aj49SWTo2pwBXR3H552Lt8RZ2kzDofCI8bgzUv?=
 =?us-ascii?Q?MDEGMCfgPru+EKNhw4Sws4F4QttzP1Cz744vZDmMs0bVCk/1I9KpsPtar2NE?=
 =?us-ascii?Q?qeDi7VxMHuUAnDU/KBxQxoyg2N74Ws8BVqoE0E3y8CX7WT76jgvR9DXiLgdI?=
 =?us-ascii?Q?86WsaEGK9w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0ad018-6725-4fef-8f66-08df3672d281
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:49.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbpQyL2y5HYoXqS0lqzfoq+HZcdVi2K6hiITZgCCE5rWxo2QxE0e5Ua4YlUGgQCO6unXYPDQOyLyqsfDJoYbUefWT+tJKiX+s+EyzPEv96c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249022
Content-Type: text/plain; charset="utf-8"

git log --oneline v11.1.2...v11.1.3
005c61c0ef (tag: v11.1.3, origin/staging-11.1, origin/stable-11.1) Update v=
ersion for 11.1.3 release
8bee8b3dff target/ppc: Name the EBB exceptions
23b370b21c hw/intc/exynos4210_combiner: Fix group register range check
b8eb59ff60 hw/misc/bcm2835_cprman: Treat invalid clock mux source select as=
 GND
d8cc56e9a2 hw/usb/hcd-xhci: More reentrancy guard fixes for the XHCI code
6700316248 hw/usb/dev-mtp: Fix heap OOB read in usb_mtp_write_metadata()
1c3e688b18 hw/usb/dev-mtp: Fix assert crash on short CMD_SEND_OBJECT
2aba176fe2 usb-host: delete bottom halves during unrealize
dc73ad7812 usb-host: free request on libusb submit failure
3f0eeebc80 tests/qtest/usb-hcd-xhci: test interrupt pacing above 2^32
36f13dafeb usb-host: free configuration descriptors on error paths
a2a1a95490 usb-host: validate interface number before indexing altsetting
9369434a30 tests/qtest: Cover OHCI endpoint type mismatches
e118248d9c hw/usb/hcd-ohci: Fail iso packets sent to non-iso endpoints and =
vice-versa
483db5ddb1 hw/usb/dev-mtp: Fix assert crash on undersized BULK IN
5a7758d6d2 hw/uefi: fix ContentInfo detection in wrap_pkcs7()
31e4c99baf hw/9pfs: fix dirent stream protection for legacy (9p2000.u) Trea=
d
2d494acdbb iotests/migrate-bitmaps-postcopy-test: add a bitmap on a second =
node
62f725bd36 migration/block-dirty-bitmap: fix postcopy abort with bitmaps on=
 several nodes
1b4a401991 migration: add QEMU_COUNTED_STRING_SIZE for counted string buffe=
rs
b66ab958d9 qemu-img: convert: flush target image after copying
630d9dc82d block: report flush error during bdrv_close()
34d8b6d870 iotests.py: add filter_qemu()
7819c7705c iotests: add test cases for failing flush after qemu-img convert
7450360e8c seccomp: really fix blocking of setns/execveat/unshare
8a9f2a0b58 seccomp: fix blocking of setns/execveat/unshare
f207638c13 target/riscv: Check Svnapot PTE before updating A/D bits
37fe6b6ad9 tests/qtest/bios-tables-test: Update riscv64 virt SPCR golden re=
ference
278e3552ef hw/riscv/virt-acpi-build: Fix the UART register width in SPCR
1af8e99822 tests/qtest/bios-tables-test: Allow changes to riscv64 virt SPCR
55dd6122c1 target/riscv/kvm: Preserve VCSR across migration
249e18c875 target/riscv/kvm: Reject migration with a different timer freque=
ncy
fb28041443 target/riscv/kvm: Preserve FCSR across migration
6b6a519e4d targetriscv: svinval instructions raise virtual instruction exce=
ption
963eb3cb85 target/riscv: stop translating after WFI
75213859c7 target/riscv: Restore LCOFI handling in interrupt CSRs
ddf0161016 target/riscv: check G-stage write permission for VS-stage A/D up=
dates
e89003d149 hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual value, not =
0
d2dd4bce25 tests/tcg/aarch64: Test the TTBR layout with TCR.DS and a 48-bit=
 OA
cfadd7fdf5 target/arm: Use the 52-bit TTBR base address layout when TCR.DS =
is set
31fbb602c5 tests/tcg/aarch64: Add a test for a two-entry 52-bit TTBR table
3c4032504f target/arm: Clear TTBR[5:0] from a 52-bit table base address
b77e390869 tcg/riscv64: Remove vector min/max ops with immediates
dc0b14e474 target/i386: fix immediate stack adjustment for RET and RETF
621f9b0e99 target/i386/tcg: zero FXSAVE FOP and reserved slot bytes
ae1a7e175b tests/tcg: Add tests for sign extension after rotate
3edfef095f tcg/optimize: Do not derive s_mask from rotated s_mask
64c20eeb99 hw/display/vga: fix OOB writes after external surface resize
770b7d4183 hw/tpm: crb: Do not clear internal buffers when backend is busy
04fb445f8e tpm_emulator: Reject sending commands smaller than the request h=
eader
8bd96336c6 io: cork TLS writes to avoid small TLS records
c33ab7340e block: Remove now redundant bdrv_wait_serialising_requests() cal=
ls
7e6a8d069f block: Fix corruption from broken RMW atomicity
4675afbab6 block: reject a reopen of an unusable node instead of crashing
b2d517fd06 qcow2: do not clear the dirty bit when reopening a read-only nod=
e
4fac279346 file-posix: add statx(STATX_DIOALIGN) support
ef1dbcfe6e block: fix bdrv_next() skipping monitor-owned nodes
318b364473 iotests: cover inactivating a read-only node
3247ea7238 block/throttle-groups: fix crash when enabling I/O limits on a b=
usy disk
68df2cefcf io: prevent unbounded read of websocket data from client
6b85309dde hw/usb: Fix USB MTP Use-After-Free in usb_mtp_deletefn List Iter=
ation
b8d45ea45c target/i386/tcg: ignore VEX.L for unary scalar instructions
6cc067b1d9 accel/kvm: coalesced mmio: check lenght of the MMIO write entry
fac3798546 accel/kvm: protect kvm_resample_fd_list with a mutex
3cbe6da76c system: fix buffer overflow in tdx_parse_panic_message
07a6c20669 target/i386: Don't clear C1 for FCOMI/FCOMIP/FUCOMI/FUCOMIP
cea26d6f83 target/i386: clear C1 for all x87 compare instructions
8230b4093f target/i386: Migrate error code only with an exception
5af7f730e7 target/i386/tcg: raise #GP(0) on null SS load with RPL !=3D CPL
53b291c4db plugins: fix register handle encoding to reserve NULL as invalid
7c5695d0e8 hw/nvme: fix memory leak on sr-iov capable nvme controller remov=
al
7818b0d11f hw/nvme: fix assertion failure on sr-iov capable nvme controller=
 removal
0024528af5 block/nbd: clear reply.cookie under receive_mutex
ac398d68a2 block/nbd: never index requests[] with an unchecked cookie
519986cdb5 block/nbd: clear reply.cookie when the reply is rejected
dd4b12f00f hw/display/qxl: trace skipped stale loadvm commands
8c3e766357 hw/display/qxl: validate replayed commands in qxl_post_load
13ec396242 hw/display/qxl: factor out qxl_guest_phys2virt()
422e508cf9 migration: Introduce VMStateStructMember
5f3dbb56bf virtio-gpu: disable blob scanouts on mapping cleanup
58486a587f hw/usb/dev-smartcard-reader: validate migrated fields in post_lo=
ad
bf66c153ac hw/usb/dev-smartcard-reader: decode bulk-out length as little-en=
dian
67cd05f4bb hw/usb/dev-smartcard-reader: fix assert on pending answers overf=
low
43a624d275 hw/usb/dev-smartcard-reader: fix OOB read from pending bulk-in r=
ing
4823a3093b hw/usb/dev-smartcard-reader: validate interrupt transfer length
c9267a193b s390x/pci: Reject apertures beyond IOAT capacity in translation =
mode
eb77a720b2 s390x/pci: Use qemu_log_mask() for guest-triggered errors in reg=
_ioat()
049f614dcb s390x/pci: Fix frame stepping in rpcit_service_call()
4f66512c34 s390x/sclp: Reject short headers in PV case
8c33176cf2 s390x/css: Use datastream pointer for checking no-data CCWs
c8766cac23 hw/intc/s390x: Fix check after g_try_realloc
ac7504ad5e vfio/ap: Clear error object pointer after non-fatal errors
41d9159113 virtio-ccw: Fix rc check in read configuration path
0cb9e2c7dd virtio-ccw: Do not overwrite existing indicators
163e73e175 virtio-ccw: Limit ISC to MAX_ISC
65edcf1172 hw/usb/hcd-xhci: Limit DMA transfers to plain memory
54d855918e target/arm: Fix WFxT timeouts when the offset puts the count ahe=
ad
6c3dceb731 target/arm: Fix next timer tick when the offset puts the count a=
head
6e97486987 target/arm: Fix PMSAv8 shareability decode for R-profile MPU reg=
ions

- Rrefresh exisiting patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...{qemu-native_11.1.2.bb =3D> qemu-native_11.1.3.bb} |  1 +
 ...ative_11.1.2.bb =3D> qemu-system-native_11.1.3.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc                 |  2 +-
 ...ddition-environment-space-to-boot-loader-q.patch |  2 +-
 ...cv-extract-sfence_vma_allowed-from-helper_.patch |  9 +++------
 ...force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch |  2 +-
 .../qemu/0002-apic-fixup-fallthrough-to-PIC.patch   |  2 +-
 ...002-target-riscv-add-helper_tlb_flush_page.patch | 13 +++++--------
 ...cv-use-a-targeted-TLB-page-flush-for-sfenc.patch | 13 +++++--------
 ...004-qemu-Do-not-include-file-if-not-exists.patch |  4 ++--
 ...ome-user-space-mmap-tweaks-to-address-musl.patch |  2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch     |  2 +-
 ...n.build-use-relative-path-to-refer-to-file.patch |  6 +++---
 ..._SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...-configure-lookup-meson-exutable-from-PATH.patch |  2 +-
 ...e-pip-and-the-python-venv-aren-t-used-for-.patch |  2 +-
 .../qemu/{qemu_11.1.2.bb =3D> qemu_11.1.3.bb}         |  0
 17 files changed, 29 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.1.2.bb =3D> qemu-native_=
11.1.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.1.2.bb =3D> qemu-=
system-native_11.1.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_11.1.2.bb =3D> qemu_11.1.3.bb} (10=
0%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb b/meta/recipe=
s-devtools/qemu/qemu-native_11.1.3.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_11.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.1.3.bb
index a77953529b1..26fa84c1807 100644
--- a/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb
@@ -7,3 +7,4 @@ require qemu-native.inc
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_usermode_target_list=
(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
=20
 PACKAGECONFIG ??=3D "pie"
+
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.1.2.bb b/meta=
/recipes-devtools/qemu/qemu-system-native_11.1.3.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.1.3.bb
index 7947499c5f1..62e8a0a83b0 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_11.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.1.3.bb
@@ -26,3 +26,4 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
 }
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index d441ebe8f3a..e16fd86c915 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,7 +43,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "731b5681e4bb18be313231579b8efd0296c5b015fa36dc5338=
74b639ba838016"
+SRC_URI[sha256sum] =3D "5a8289c7940dc77d3873c81a6c29ba3afe1446fc9d36e77fa1=
658cdbecb84b22"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can e=
xpose host files uder some circumstances. We don't enable it by default."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environ=
ment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qe=
mu-Add-addition-environment-space-to-boot-loader-q.patch
index 1980b2407e1..0d86bb02575 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-sp=
ace-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-sp=
ace-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 76727fef9006b0936846938b6f8bbbccd829a75f Mon Sep 17 00:00:00 2001
+From f6981f9aedd718c2f908a91be70bb58c9473eaa0 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfen=
ce_vma_allowed-from-helper_.patch b/meta/recipes-devtools/qemu/qemu/0001-ta=
rget-riscv-extract-sfence_vma_allowed-from-helper_.patch
index 2ece946400c..f7442f49d1d 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_=
allowed-from-helper_.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_=
allowed-from-helper_.patch
@@ -1,7 +1,7 @@
-From 8507fd6795753697f557d11e144568f1bf8a00cb Mon Sep 17 00:00:00 2001
+From d8aae0e53cee8810167f7718704e2adcd67b1f0f Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Mon, 24 Aug 2026 17:54:21 +0000
-Subject: [PATCH 1/3] target/riscv: extract sfence_vma_allowed() from
+Subject: [PATCH] target/riscv: extract sfence_vma_allowed() from
  helper_tlb_flush()
=20
 Create a new function to encapsulate the privilege/hypervisor checks
@@ -16,7 +16,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 13 insertions(+), 6 deletions(-)
=20
 diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
-index 3e94005d2b..8039df2b48 100644
+index 3e94005d2..8039df2b4 100644
 --- a/target/riscv/tcg/op_helper.c
 +++ b/target/riscv/tcg/op_helper.c
 @@ -588,18 +588,25 @@ void helper_wrs_nto(CPURISCVState *env)
@@ -51,6 +51,3 @@ index 3e94005d2b..8039df2b48 100644
      }
  }
 =20
---=20
-2.55.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-S=
DL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui=
-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
index abc55a4fe50..52dfb2a241b 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT=
_VIDEO_X11_FORCE_EGL.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT=
_VIDEO_X11_FORCE_EGL.patch
@@ -1,4 +1,4 @@
-From bbd0cb5705e5dff0c4ad54c957f6f6d4617ad174 Mon Sep 17 00:00:00 2001
+From b5dd7847f0bd0f527b5ff9c9f69df5cd80108287 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 10 Jun 2026 15:00:26 +0200
 Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to=
-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to=
-PIC.patch
index 974fb3923b2..846164c835a 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.pa=
tch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.pa=
tch
@@ -1,4 +1,4 @@
-From a499a56467f56f362c4a7e31d64265a47faefacb Mon Sep 17 00:00:00 2001
+From 8f0419ee02d265c0c92686b88053f08a99d113bf Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_t=
lb_flush_page.patch b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add=
-helper_tlb_flush_page.patch
index c272a80b085..9b29acb9739 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flus=
h_page.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flus=
h_page.patch
@@ -1,7 +1,7 @@
-From eb8773847363989d9396492a3c9bc517ca04959f Mon Sep 17 00:00:00 2001
+From a6da8e0d87a06e2ed39e3fe37693fb3335a3bb39 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Mon, 24 Aug 2026 17:54:45 +0000
-Subject: [PATCH 2/3] target/riscv: add helper_tlb_flush_page()
+Subject: [PATCH] target/riscv: add helper_tlb_flush_page()
=20
 Add a page-level counterpart to helper_tlb_flush(), and condition its
 internal call to tlb_flush_page() on return value from the new
@@ -16,10 +16,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 8 insertions(+)
=20
 diff --git a/target/riscv/helper.h b/target/riscv/helper.h
-index 4fc2d3a155..652f85a5c7 100644
+index 542b7c264..2b88888f8 100644
 --- a/target/riscv/helper.h
 +++ b/target/riscv/helper.h
-@@ -137,6 +137,7 @@ DEF_HELPER_1(ctr_clear, void, env)
+@@ -138,6 +138,7 @@ DEF_HELPER_1(ctr_clear, void, env)
  DEF_HELPER_1(wfi, void, env)
  DEF_HELPER_1(wrs_nto, void, env)
  DEF_HELPER_1(tlb_flush, void, env)
@@ -28,7 +28,7 @@ index 4fc2d3a155..652f85a5c7 100644
  DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
  /* Native Debug */
 diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
-index 8039df2b48..723a45d181 100644
+index 8039df2b4..723a45d18 100644
 --- a/target/riscv/tcg/op_helper.c
 +++ b/target/riscv/tcg/op_helper.c
 @@ -610,6 +610,13 @@ void helper_tlb_flush(CPURISCVState *env)
@@ -45,6 +45,3 @@ index 8039df2b48..723a45d181 100644
  void helper_tlb_flush_all(CPURISCVState *env)
  {
      CPUState *cs =3D env_cpu(env);
---=20
-2.55.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-target=
ed-TLB-page-flush-for-sfenc.patch b/meta/recipes-devtools/qemu/qemu/0003-ta=
rget-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch
index 36796e34f47..a20a19a6744 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-=
page-flush-for-sfenc.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-=
page-flush-for-sfenc.patch
@@ -1,8 +1,8 @@
-From 858d6d9a587e4ed44f92e017375c5265bc40934b Mon Sep 17 00:00:00 2001
+From e53b203900cd5d04ac938b1ff4643667b6b63efa Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Mon, 24 Aug 2026 17:55:00 +0000
-Subject: [PATCH 3/3] target/riscv: use a targeted TLB page flush for
- sfence.vma with a vaddr operand
+Subject: [PATCH] target/riscv: use a targeted TLB page flush for sfence.vm=
a
+ with a vaddr operand
=20
 sfence.vma unconditionally called helper_tlb_flush(), regardless of the
 rs1 (vaddr) and rs2 (asid) operands, forcing a page-table walk on the
@@ -26,10 +26,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
=20
 diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/r=
iscv/tcg/insn_trans/trans_privileged.c.inc
-index a8eaccef67..8655fa332e 100644
+index ebbbb0117..2b1bb83bf 100644
 --- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
 +++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
-@@ -155,7 +155,11 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_s=
fence_vma *a)
+@@ -156,7 +156,11 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_s=
fence_vma *a)
  {
  #ifndef CONFIG_USER_ONLY
      decode_save_opc(ctx, 0);
@@ -42,6 +42,3 @@ index a8eaccef67..8655fa332e 100644
      return true;
  #endif
      return false;
---=20
-2.55.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-=
if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-incl=
ude-file-if-not-exists.patch
index b4750eb1499..aef0adbb72d 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-=
exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-=
exists.patch
@@ -1,4 +1,4 @@
-From e9a86f3bd5392b12baddb9ee65335c9cda3cad56 Mon Sep 17 00:00:00 2001
+From d0aa68698cf780fac8be2b05a422a85b33b7d57a Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index cfa68dfbd..ab2cecbfb 100644
+index 9f454502c..99d433cea 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-=
mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qe=
mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 7b7c653d73e..76220fa21ea 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tw=
eaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tw=
eaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f92e779a55ab3e5d14884a4ea55369f7a16923d3 Mon Sep 17 00:00:00 2001
+From b0aea2f36b662c3089f509bfdfcfb526a11a5a8d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 =
bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.pa=
tch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 655d7802933..d5f5d0ae63c 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 3186be2d62be9211bdb63fd2c2bc201567c72a2e Mon Sep 17 00:00:00 2001
+From a1e90f7dea2ec307ea7e3360ad83cfcb4198e3a9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-rel=
ative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-te=
sts-meson.build-use-relative-path-to-refer-to-file.patch
index bdfbc7e7297..681f1b0d281 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-p=
ath-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-p=
ath-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ae3bcb46784c43ba99e2e52bd38fea7cbc79543e Mon Sep 17 00:00:00 2001
+From 87302d3f04a325002cb9af880e49c94bf37855f6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -21,10 +21,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index dc3fb954c..914845b22 100644
+index 885df4c0d..588098093 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -127,17 +127,17 @@ endif
+@@ -128,17 +128,17 @@ endif
 =20
  if have_system
    tests +=3D {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_S=
HARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-De=
fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 5686ca81fbd..8e5b39596dd 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_V=
ALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_V=
ALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 0999c002153ab64befd3df4c5f35dbe3611d137f Mon Sep 17 00:00:00 2001
+From cfe68e5df5202b55225a607e85d9929835bd52fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-ex=
utable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-loo=
kup-meson-exutable-from-PATH.patch
index 188f55cf037..01ce85c4b63 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-=
from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-=
from-PATH.patch
@@ -1,4 +1,4 @@
-From 13b84f40e56cf70d0a74a2a9fb51161b041a31bf Mon Sep 17 00:00:00 2001
+From 98b273b23aa857f10a4c27c1e12ff4d682d6051b Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-p=
ython-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qe=
mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index 456833c7f69..24fae81263d 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-v=
env-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-v=
env-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 9b01ec57a976ed9e3b66f2ffbe5547ad9d0b05c8 Mon Sep 17 00:00:00 2001
+From 72842f2d3c17a6fbad4b06c4927a7dc9ba637c85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meso=
n
diff --git a/meta/recipes-devtools/qemu/qemu_11.1.2.bb b/meta/recipes-devto=
ols/qemu/qemu_11.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_11.1.3.bb
