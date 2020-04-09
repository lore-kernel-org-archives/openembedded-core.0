Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.69])
 by mx.groups.io with SMTP id smtpd.web11.15241.1586455423337592361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 11:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=oqDoui3u;
 spf=pass (domain: outlook.com, ip: 40.92.69.69, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj/JnsPjIJqdUTEHhskyA22ZxUHQblwdKfbQWlA+JlB6JeOJn/91+V1rdFbgMrkdlHUfihinRJxqvf5T0aMVA3zefZAFPnT7CpXygLqV6MSdVO70tLrvPdadivpev/yyn4n1LFZZ/YC57BZ8gCwp4HWE5Soll7rpsD8Ndg5r8vnEJWD+lWmIgGcC+tDpnL2Q/qDuP3g36xY15UeGocnBD31s1XPbvk+snrJPmnZrfanH083w9D16UzgslR19j7qSKB14GZvUUMJPo1W6iUkxUN05RPyvoD7zDcQUYDiK8ZENunqMWZ4ogXPNBBTQGya0Yeda1iLV8b4VNRJxpwG0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=RxotpSYmwQndiJUMkmd6DjsZzWLuPC0RHbcaszbbxStciCve+778oBHyRvUA+38h3Wt0Q27K072Z7wo2jUFZI3/OhID/yZoZ+jLlxAsZwgJeHVB3Jub02TgQDx1RDASfNSWwQmuL1hv2cCQeMNz1G+j4XJ7925/PXw2cNzTBSEWcje5HcRejs4warFcMIFlWMO176WCWGpMK6PCNDisLVOobg9BhKQIRboTTaynVKFgbQVKitKUShC2PqZEeUd4EPvtkbWWQOIGbiunUJFNSVG5Fx2oGmL3oQe2rNtW1XCWHbDns0vlHeWPtpnPfob2sNLAsnEwqxXChuQogZ+Hd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=oqDoui3u8srD523UpmCxXud5/4IPjcNcVYlO/KeaegnhcI33lUC22qaG/j7faZijYw1RiGHf+yI3g5v2osy0IHr6kgzNqqU8QOKHaF/Ykwi4Y9YfCP33XSAF2UQiLOcW0zQhXOyPNRxHnSgHK1ZRhA6kyGSMW22XED4OC3jaQBgbELio5q60h2c5+wx26fhN5McVGlNBhHUsRE0B0+DeUhY9UW5n6IupbkoMt0xxhWuZuPMwc6fSGE1gQ6czeGYEJ0my/YqFR0l2loA6Y8ab5P95CjFTZxf/xTlhGNbt4zsYiVJbcvw4f8OEds8o3aptEh9RJvKHTBFnF0tfyThkPA==
Received: from AM5EUR02FT014.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::51) by
 AM5EUR02HT140.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::321)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 9 Apr
 2020 18:03:41 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1c::49) by AM5EUR02FT014.mail.protection.outlook.com
 (2a01:111:e400:7e1c::175) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 18:03:41 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B565B9D427E329CAB13F55C867E5EDE15165E5C3F6AA28C56F2C39AEC734D063;UpperCasedChecksum:4C8D78FE8005AEEDE9B1E713B262449B44AE7A2782284367CDBB08F433F49AC1;SizeAsReceived:7580;Count:50
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 18:03:41 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 2/2] runqemu: add ROOTFS_EXTRA_OPT parameter
Date: Thu,  9 Apr 2020 20:02:47 +0200
Message-ID: <VI1PR05MB4286DBFE61B56382A35227A2A8C10@VI1PR05MB4286.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409180247.17781-1-kweihmann@outlook.com>
References: <20200409180247.17781-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0701CA0071.eurprd07.prod.outlook.com
 (2603:10a6:203:2::33) To VI1PR05MB4286.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200409180247.17781-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.7.49) by AM5PR0701CA0071.eurprd07.prod.outlook.com (2603:10a6:203:2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend Transport; Thu, 9 Apr 2020 18:03:40 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200409180247.17781-2-kweihmann@outlook.com>
X-TMN: [UAmM1n1sXCGhJn/0LoyqM4Uk1zBV062n]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8b1b5634-2eeb-4673-19e4-08d7dcb055ea
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLS9ikIbzYZ7l6qOU1Yhmffk6MHUx00YJTfxyRLQQiZCCJtyxRYB0rpSKT1Z//sUKhaQTR/vvnbZcTmn09fOPBa+7w/Q+3XjTkPJp5/nnaXxVY/TXU/nuhAOFobsHmXhfVH5fy8B8iys2n0fEZfuqwTLIXSn0RN3sTiBiAOirBolhxgmzwlEWxCeFcB3cYpB2De+mwD3fQ3tuMgBaYShYYThS4RUPwq2niNW4lzl0vwWGOqFa2GUedsti1Zhpm5FNzymbHLsAunIz0LrDZ9kKOVCjXjcVI2qlINlkf8b47GeP868Pm4iFgscSkeMfT1MpHIUYCviyTJRF+zCfo+BS+6i7NdHujhHv2Iqn6PQOuNyouYX32hPHqH4Cb4O+JTnSTVuU96pMBYtUNtwaQWLl88GHZs6/gKuxuEtvh21JmNLlmO/PLBgemacu5461JsjpoeAi4LPpP5e4iRHCzSR1wdbTuiSnZx8WN9tUIegQyby16BNQwEOIMBmJ4f1dl5GQHayJW6sTOi1cAz36jl4XPrx3z/gRk7+Kg2PLSZp0ynQH7VFahzOBAxG0A+HZc5JCfalUrAseFrSCwe+ms2aHJwKXJG89xvuM4IRZG35vZ2yBs3Dxw2E31TNWP/h6uQWeBieF8Lbbr6RgqJhtHxZG1gBoGhqe9a2sUlxh3Bi7EPkwfDXe+QK4z2jH/+VS4yEv+OTztEdc/Sa7ysh9LllPqN9vlxW7tSvJ00POlFfZDgbbxiGfFyOXOqLfUM/U7BoEw=
X-MS-TrafficTypeDiagnostic: AM5EUR02HT140:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2G1uHI3SG7HeAlztLypAX2DF/M8zK7VgjXrXcCyjVXIK9cMgmGnGAH4cT51CYpHmaNZs1NPJ94yWitLL8/6Ix47CI8GZ13tXsF/K0/c6DzoNQUNDGjnWvPreZ1fyCT+5EMG9NoXGDcyX/MWnKL3Hz2ZreZDMLzp4K3B9hTq1CG4NTinAP3qYTLLE1A22O/ZX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4286.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	dJN0UuuoQqNLOrbl6vS9XULUOr3lJ3HzA7Kqpk2ChXA9qDzPDKe5eBz3ZT4KN+E5ssGRfUmS/UsqzS1IlvxFdCQd0DK73yzSY7ZPL+Di4VOB3GkdLu2rZ386TSzIBtWu2KFO6wZ26nGwhWIGXqycpQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1b5634-2eeb-4673-19e4-08d7dcb055ea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 18:03:41.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT140
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Content of the optional parameter will be appended to the rootfs-device
in the qemu configuration, in case QB_ROOTFS_OPT is not specified.
By default this is empty.

Example use cases are:

Defining 'readonly' when using squashfs, so multiple instances of qemu
can share the same base image, something that cannot be done by just
specifying 'snapshot'.

Defining 'bootindex=3D0' which helps to get past the EFI shell in
ovmf-binary. This also enables the use case of running WIC images with
EFI bootloader through the testimage.bbclass.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/qemuboot.bbclass |  5 +++++
 scripts/runqemu               | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 68f7a03619..3162e7a8eb 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -65,6 +65,10 @@
 #                   " -device virtio-serial-device -chardev socket,id=3Dvi=
rtcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon"
 #                   Note, runqemu will replace "@PORT@" with the port numb=
er which is used.
 #
+# QB_ROOTFS_EXTRA_OPT: extra options to be appended to the rootfs device i=
n case there is none specified by QB_ROOTFS_OPT.
+#                      Can be used to automatically determine the image fr=
om the other variables
+#                      but define things link 'bootindex' when booting fro=
m EFI or 'readonly' when using squashfs
+#                      without the need to specify a dedicated qemu config=
uration
 # Usage:
 # IMAGE_CLASSES +=3D "qemuboot"
 # See "runqemu help" for more info
@@ -77,6 +81,7 @@ QB_OPT_APPEND ?=3D "-show-cursor"
 QB_NETWORK_DEVICE ?=3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
 QB_CMDLINE_IP_SLIRP ?=3D "ip=3Ddhcp"
 QB_CMDLINE_IP_TAP ?=3D "ip=3D192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.2=
55.255.0"
+QB_ROOTFS_EXTRA_OPT ?=3D ""
=20
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?=3D "/dev/sd"
diff --git a/scripts/runqemu b/scripts/runqemu
index 6a77e3db9a..310d79fdc5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1196,6 +1196,10 @@ class BaseConfig(object):
         else:
             self.rootfs_options =3D '-drive file=3D%s,if=3Dvirtio,format=
=3D%s' % (self.rootfs, rootfs_format)
=20
+        qb_rootfs_extra_opt =3D self.get("QB_ROOTFS_EXTRA_OPT")
+        if qb_rootfs_extra_opt and not qb_rootfs_extra_opt.startswith(",")=
:
+            qb_rootfs_extra_opt =3D "," + qb_rootfs_extra_opt
+
         if self.fstype in ('cpio.gz', 'cpio'):
             self.kernel_cmdline =3D 'root=3D/dev/ram0 rw debugshell'
             self.rootfs_options =3D '-initrd %s' % self.rootfs
@@ -1208,14 +1212,15 @@ class BaseConfig(object):
                     drive_type =3D self.get('QB_DRIVE_TYPE')
                     if drive_type.startswith("/dev/sd"):
                         logger.info('Using scsi drive')
-                        vm_drive =3D '-drive if=3Dnone,id=3Dhd,file=3D%s,f=
ormat=3D%s -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd' \
-                                       % (self.rootfs, rootfs_format)
+                        vm_drive =3D '-drive if=3Dnone,id=3Dhd,file=3D%s,f=
ormat=3D%s -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd%s' =
\
+                                       % (self.rootfs, rootfs_format, qb_r=
ootfs_extra_opt)
                     elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
                         vm_drive =3D "-drive file=3D%s,format=3D%s" % (sel=
f.rootfs, rootfs_format)
                     elif drive_type.startswith("/dev/vdb"):
                         logger.info('Using block virtio drive');
-                        vm_drive =3D '-drive id=3Ddisk0,file=3D%s,if=3Dnon=
e,format=3D%s -device virtio-blk-device,drive=3Ddisk0' % (self.rootfs, root=
fs_format)
+                        vm_drive =3D '-drive id=3Ddisk0,file=3D%s,if=3Dnon=
e,format=3D%s -device virtio-blk-device,drive=3Ddisk0%s' \
+                                    % (self.rootfs, rootfs_format,qb_rootf=
s_extra_opt)
                     else:
                         # virtio might have been selected explicitly (just=
 use it), or
                         # is used as fallback (then warn about that).
--=20
2.20.1

