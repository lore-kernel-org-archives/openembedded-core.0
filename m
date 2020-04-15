Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.78])
 by mx.groups.io with SMTP id smtpd.web12.20970.1586976004974749648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 11:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=cvieldLp;
 spf=pass (domain: outlook.com, ip: 40.92.75.78, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0umfn8iQ5rzogaC57Enpekbgahk27Fn2ljGPXWxHG4SemZXIBf1aXZ5xlwoiMgb/sg18FUt9DOzgTD4+0N4vOmnL5w/Ex912IA20XRJg74vS9HywDSg9weGcLNwvW24FcjvfKhClmGyGFEznWJys10uoIWOAsetcOzGSb9S9T19ASgYoBxgirza5URXB7lERZ5V1i0duTOrbZNSqy+8NkTtlK8brjO2UC0VY33C18iDJhABNiRvSQdg6eeObKCfQFB6D7LcKMGIvctNgNHvSji4eNai+pvW21tm6Fdncm4raAVvtdZ2IxDyxs/WIcDol+zrhMQIXuueku8CNaTpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=GxiHyXCTqnyoRZPK2bexBP9B0bdgEDyE8QmTFHING304QseFbEYaUR2O/OL5ucudlGi262hluB2cpBjXmqrm6C3AxLah+ut2K6v5lKHnImJYoK3BweCRTcbKAq5rX27bORsirvtDM4oCvVoYrUOm5YXYvjY9UseKlBqxZqQajiUPMajR2ABZj8Z0SuN5fM2pUTenGj9IZNBgCCLYXo32gfRC+l8YgyUQmX6wJZhmzveauQc1Ru9RfVzRnEv1nuSPzA2PuoHoaXkG1bRpVRczdmXvyOCEA5d8hd+cZU4XsBTVIPSebetnmwmJH2ZrPr2vCEl/tCMWZNL9xb8hJ3bxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=cvieldLpHmEzhhwqxCW0TCyCU/C35WhFl8f7QwIhfHaDr/skXdjwgJ5lPHJTiL8TmO0YyIUJYFVgbzMbpCk++C5P/vbOn8qBWGpyU2Chvr2Rh8LW2Nwy3pXZmpNtud54m1amTr+IimOYkeYNCTgD1fXj0kpmNbGUF4PhMRZ1y9+NA9hU8ph+iAdKZL/2IILkhyMzEgFGmumUun9Xl4p6lv7Fkp7XiCIFopgRgasExX+96z4BspMaeLsgXjNhWjcV1sgvHhyEK/0xlezqe2fJaA7Z9pB5izDGiMhsOI3eIKRtaRwx2E/ScCfGxOMVRb1Vl1xke7Q61fd3NnbVZP8s8w==
Received: from VI1EUR04FT019.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::40) by
 VI1EUR04HT144.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::297)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 18:40:02 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4a) by VI1EUR04FT019.mail.protection.outlook.com
 (2a01:111:e400:7e0e::251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 18:40:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BC69655A70BD4B86610B55383487E9DA0793AC465091305E4348A511AF81F178;UpperCasedChecksum:EEBBFE2BF782AC0B04930629341320BA66F38B8A36D60970AC34D84C5A7545AB;SizeAsReceived:7446;Count:48
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 18:40:02 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] runqemu: add QB_ROOTFS_EXTRA_OPT parameter
Date: Wed, 15 Apr 2020 20:39:31 +0200
Message-ID: <VI1PR05MB4286038FE74783BA7818D225A8DB0@VI1PR05MB4286.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21)
 To VI1PR05MB4286.eurprd05.prod.outlook.com (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200415183931.25967-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.0.168) by BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 18:40:01 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200415183931.25967-1-kweihmann@outlook.com>
X-TMN: [PL5VH8Qk7uAx8zZrOJRCbzyKdWiva0JR]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: beb06708-9b0e-40c8-a124-08d7e16c685d
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyIzIzlzYPem7vcD/JtSvPmY1sC8z5xLjla9Q1OOvxo/Ac4sxRGRINs5vh2HWR7GFQKrO2qNnW0QwuwDDfd3XKPDudnogjqy1uL8QF4U4A6rkZQyIdnGZ94E+ziSKsoGH2+KFxe8NLGQlklQ7O7+fjUP8PfSci1LB5wMe1pTN504ffe6l2evmS3ztLYoXDZbEpteLkPfxHtGF+sBQFo6ljB9ioA4s9MjrwIKNRsMy5MMWqvro+qDBNcl2DbDQZ5gN/e3lUNxjf2pzo8ZZVFInsjRuE15UNzJpHFx5UmHPOxgPZX3Cqdx7SV/KTR6STvdqQfSngtQ9v6Zq6//8vPSB60DDDUrCDVk6k7Hd8G42gCpswr8WzexCjtvQptiW+tD739z1JeE7kc8Qf9Y/XLST0Z79PxQZRJv/reLXwsy0VQgSAVVnEylTWzKa+gdPxi4fxUO4fzM+tcKr63PRakKOUQZZeNgXRRJ0if9TIGkaVGlyTdJIilOK2XRfNrOIBBJt2IPEGy7Xyi0ejGE2zraXTqjXQ2jQw437O2lHVcBfLRRNatKlDTJkNvDfnrFWwDwt4VtiIRJHReeA6DRnFV7oqP8NBjQL6LlTLNKWyOs9Y2INDdfpgEKwuJFfCe0C+BMUcXYivYq8RuLJSHCMhCl6vYoNHRDgpxyAnsZzyWn6Rz4pXS2WNjVWPNuhvKUSGZw53TNFiP7pPXeJAfknpx7gUNNaMCcE6a0IjzNlcbSX5TWSREzFZA905GwhNakuvYvV18=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT144:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bmT+I76UHjS2pRnq+QDAcZJcV4TR+aCDYFoE2mg4SmIEQPQAo4NVd2Qx5cNoWuKuDOJXE1pZcetAPJ1bbTFbFMhrhI/skKNAYxFhuabuTLnr1k3HxDANtuw8ryirDwIV0WQtEaXBxfMlkyQPw4ybj7U42FCHm8r2UWAaNEmlVrLciGPYgeLgVEgDDEcfeqhv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4286.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	riXaCx4uSN7d2aRmjfSF03t/ZzLQq75uGma6vHrY7BJe8ovHn9mfJhg3JQyQw/WdHRqUqODiE2Uof3+O47CkyrSLc2sOi4Q9ENnH3fhZ2c4MMcr4vTatSiImRcn1QyM3iiuJ6/4rNHaMUmxKj0to5g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb06708-9b0e-40c8-a124-08d7e16c685d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 18:40:02.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT144
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

