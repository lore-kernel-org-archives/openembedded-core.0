Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.87])
 by mx.groups.io with SMTP id smtpd.web11.3182.1593116003480592664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 13:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=rAwDBHOc;
 spf=pass (domain: outlook.com, ip: 40.92.66.87, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf9cvyFI657mriU9PfDorWG8duJTi7NHqB7v3hnXTp8ykuvH929EF8BaNrwpecUNLCClp///cyjIrt+RH0csckdjsgNoUa1keRkQ8e5N3QeiZifuNaSvelKxvEoKiADYPvvyNKs1XE8PL0EKnu5KcO2KSzJaOmPQ5+tx1UxDdizcy7LbELvcZtRdeZ4yIyK2zx0QgvgJEbFkqFWK8Vr2rQirYd5FWC40yjrGUM1iZO83ZRzAijK5Ch/ErZvUB5tg2hMdVSjyMRAlRo+GvLpPZTdI6/RBNVz5sAUyigiOWJfrBVSTBeh6wiXa3mV5UmT2LUG0Pno1wY09dbRpOtzi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1Mlp77sL1fVnPsErhBgHlO5kfp9FjPN02tVfYFXA0E=;
 b=Pp8B7iwFir+kFed4396Tj6dqRANPA2UsqBWaQfcqCjaYyYg6V34lk+g55hMpxNLF8Gxl7RQjsUtoD2dho+VmrA7PMrmqDrfGeZgv58aTtNP0RpVc0JTv4yu2UBZ+gNDvhpIP7edzGNKV1d8NIZBKl9D+E9eXQb8LLK4uTAAz9CaUgfgqDOhf5nR6n16TQASNb5b59taoxZsCa1vh0xoc/6isR0OxyUQO2ZkrTjl+8908xekvgW5kweneh/y8T5rC3xCcOU0XtsEPNzq04eOr0F6MgkOcNCJXvWYyJJU6vcq3/+KnyKZp53//yQsB0BPtOg3HkV0a6QgTD2Q5cTCd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1Mlp77sL1fVnPsErhBgHlO5kfp9FjPN02tVfYFXA0E=;
 b=rAwDBHOcGiNsI7MWWbzRR3UlJM9tOqlFC0AP26Dm8UdF9xrsqEKWkX1JJumO2z/3PgKlFsZGytmvjdSc0weZZVBCrTbfh4igH6ufkSfLKWq17inln+lhtQTJLZGeYYqqIxqfzjbmizI7Kijj+xCRt4vnM2hfdZg9LeDol8F9HSw0l4EjPZuYyoSnv8POx1+1/icRyAfM0EnG60pql0KVJMW9kPReqZH8a2oY0+GjvEns6fzI7OFGLsK4Wm3KLlM/plNY18c2JN1polmNN3/hnWh4MaISQaOYx5jvAnyzZYse7DimCSeCZ+oKFwOyDxLev5WjwFpJHKqOkkJFCKLWfw==
Received: from DB5EUR01FT064.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::46) by
 DB5EUR01HT064.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::178)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Thu, 25 Jun
 2020 20:13:21 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::4e) by DB5EUR01FT064.mail.protection.outlook.com
 (2a01:111:e400:7e1a::339) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Thu, 25 Jun 2020 20:13:21 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:31E48F3BD712CF7ED7D70DDD05E6F96D8C64F8C3696C1A551860701FF03ADC49;UpperCasedChecksum:9B780471E284EFBD1811BE94C50487FF266348674EA8B106CF99552620E6F0B9;SizeAsReceived:7593;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 20:13:21 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] runqemu: add QB_ROOTFS_EXTRA_OPT parameter
Date: Thu, 25 Jun 2020 22:13:09 +0200
Message-ID: <AM7PR05MB6881D824F6EBCF87975F4FBAA8920@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625201309.11441-1-kweihmann@outlook.com>
References: <20200625201309.11441-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:206:1::48) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200625201309.11441-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.47.161) by AM5PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:206:1::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 20:13:20 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200625201309.11441-2-kweihmann@outlook.com>
X-TMN: [p9z8enjq/Rg1zP+e40eAKq9wSYL3hRMi]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d0bcf144-d904-4cf8-c0be-08d819443502
X-MS-Exchange-SLBlob-MailProps: 
	+LiGfBxqLEtaDav5KDaKmCqMAxFSGoUbuOAEBCzxLWXovgLeKd2YXuv4v49Q0ElsTX2EYRnnNDM7nCqDYGYdUkGwsrXjwGBgxe8re2vdYSeLkou3XyfVHxiXIRmtmPe6Pt6VJ0B4tEvzdQQszZHYAQW5oENRiDRpdaIUR5GaKncCxFUKlqbKyuvpsJwyeqBtAD/DHhjMM2tSmuALCGh+tsqRdX/DmNnl2vVmtJajd4qsUPHToxysYlFy58L8UY3wz0bpxtAjmk8fsTE/TXFkEPFJa58lIVH93ml6ZjeJ+u8OEyhu/iy9Gyfl5VAQDuqjOX+lzr19PWdbAJk2UUCijIHjrHdnZhI7aqFge9k8nWXMrgEFxIpZjjzfCBxpF2SWygVJBEwUXAx0q0hzF/5d3/enXPIUy70a8G1dc08vgIrg5tHXxooT4Zt/FjPo5EH3uYFEi1lZDrCr3H9F4465TYJ18Rh/Spe02tT/k8JFPTe4gV7NCLbeGlHFLYepE9X6RM98qVUhJtYPuJYnvqIjPYGiq3CVNwXKM2oQHvZeqaeSTUwQ0nYzL0p19hRfC0wYFGNf0YO/kEqCt8D84+Ja7W6irkyO6GKlNHhNWosYrZjcXcdJULRHf/pxBumygvzTpfA1t7kEIBYx2eBuEBHZkSrHtRhuhBfr8dDCcjSjgFTMUrn5dvNjpd97l0e1+t5CnhBIwl2tI6oSuSJxsjj4nhPHkZPsMOR7IKqd/BtBlIr4VoeAvJqKVVGcjagd4kTQHb+F/3nmwPv9Na+sx+v5KTjJVO8L1uJd
X-MS-TrafficTypeDiagnostic: DB5EUR01HT064:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oIvAd7EPpelSZpTvbN60bA4UjPGdkNMKylVNbrjahr5iwcXk0ogCxmaiVZAN9Z4Ocy/yaY0yCDmUJuFZREjFLMGXSrfDccdrq7Kn4VOOYy+Wo+KTsMYjCWDt2GEohGfxtuyBhzGCN+S6N9pI6fnBshseF2lCKZ7CoSCKdfGKGY9scPtomd9B3zJa+60i0fDVPpr3QDXM7BcKia/Ct2kfDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	IlRUazIwSt/dVPVe4H+JYsED0VXjP9oC9GV16jCsOPVvJ/4/ZZCL1BzjRmqAyer83hYJENMplZu4OLNSnIYzKV5Glwkt5A6fLw1e3ErZTipdv+AM64G8a/RqMgvjpih/7+jSzlyZ7keXFE4M50Zltw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bcf144-d904-4cf8-c0be-08d819443502
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 20:13:21.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT064.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT064
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8361b47d7ff190f84e8bd81507cde01d74ca7c1c)
Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/qemuboot.bbclass |  5 +++++
 scripts/runqemu               | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 54044c38da..99da543f9a 100644
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

