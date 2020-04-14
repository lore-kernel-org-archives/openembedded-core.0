Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.64])
 by mx.groups.io with SMTP id smtpd.web11.1465.1586891997605371908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 12:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=A2frqCUj;
 spf=pass (domain: outlook.com, ip: 40.92.65.64, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeesJ0royvcN9pJWJUo1a6peIMoFo+NpU3AHbWRcURKf21q3Dt27bFi5hTccwXhnlSjSdqloh5fd7Z3b+umT9f94q/0lq4Pjo+Lv/j4CJThi3MtP7/GOfjFwckaS0g9nxQv7XSVwthljEaVk4SSV3e7RMw5RJ9wy8rwTfNJ2CtpLOoRWO6IqwD3OT8fRap/ZZjKFCp6IOK6rnaZgCt5p5VHPnSBAAe0VDuPB9VLmCz0z7VkZu8oky13qD+dTPPVMWWR+HFxcv+mi2ys3XKJ8s3iAYYT/mP/Mvi5hYkwFceojq9uGJmQSOJdzqAq3HzbfVCqZGwcodDI2qWsfdu3E3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=D+VsfHkOjaY0izsddtPAhwYxEMLam60dp9RJLLcPmSo5nVD4dTLqqlJAFx/+i8pojXp3h90iCgvUyYFoSVjfiScIp2bH4Njj+uxbh5li+0CB7HgJoIqlnIkVTguJmT8X9aQrh4kYoUjuUVClIjsmRgP8OyOTZlRFln3ivxB3GiExaXK609IJHVzAhjlikJcujuh4PFaPFKiYep+3eEwwCi/+HuuzbJGBqIpmRZWK6HZKdIW5BvgQPIcYZhWXwwMBjLRi9ayljMr7g3J8x1QNbarWolMBdFNKGgHIayzaW0mOrHeJ/8VOHZT6R+opFRlMKByNnMuZLkJ4QlBNVmCUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smzmVg7zm0as1uqpxTpxd14Ck9d5HDrDYsOZkw1dtAk=;
 b=A2frqCUjkSjme9ER2khJ+l5nk+8jzCZQNBOcJH0zX1cmCq/eogtylh/7ZnJCeh0yqvMtvkbBcEi53m6QmzWOjreHHzDvdVjcB4ZHKLvjnUirKY3xzfTz2kmcLNhfBqJV8HNFo9IiHTdoGKJI57D7ng+JSgxRO2kYHe5wbHWgz9dkAW1l5Kv4qNwqhiLNb41ONxPhiFgvKQt9iytZwCQRxZyYLmnURd7F5QuJEUrmBwtPXx+eyHYhhUUQ21tQ4h9/sS/KV82horR6xCBGgRGyXM8zsxie/0g3CQhl95IIQ4eADzm+vh4RCNvp4QED4wyl5t+QjPN+V5hHF7NNGbp/vg==
Received: from VE1EUR01FT019.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4c) by
 VE1EUR01HT005.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.18; Tue, 14 Apr
 2020 19:19:55 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::51) by VE1EUR01FT019.mail.protection.outlook.com
 (2a01:111:e400:7e19::231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 14 Apr 2020 19:19:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:41C000527DAB9EC9B9DDD2180EF270A272809DB3D3EC9E49044D7B8BD2AA1F48;UpperCasedChecksum:57AA5BF530ED0E89BEBFEB12C0E2B4359529BEBA4A7BEA090A45CF1EF9E8556C;SizeAsReceived:7569;Count:50
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:19:55 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/2] runqemu: add ROOTFS_EXTRA_OPT parameter
Date: Tue, 14 Apr 2020 21:19:15 +0200
Message-ID: <VI1PR05MB4286CB9872D15C1FEC21AA3CA8DA0@VI1PR05MB4286.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414191915.772-1-kweihmann@outlook.com>
References: <20200414191915.772-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P193CA0063.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::40) To VI1PR05MB4286.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200414191915.772-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.8.55) by AM6P193CA0063.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Tue, 14 Apr 2020 19:19:54 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200414191915.772-2-kweihmann@outlook.com>
X-TMN: [jFKNgWyJspgVwkoxYkoQjWwMeKgRnpz9]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 41a1b855-48dc-4111-260c-08d7e0a8d039
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyIzIzlzYPem7vcD/JtSvPmYnQzkJoo5t1hcWT1ockVGZVkAam/Hzh6evOEIduIDCylCDVWyavbm+TRFb9/1Czc3J5qnNeoWf/UmOgLrLB2m70NyknDQsePYQS5B8EQ7ymG1R/MeOaoOBDTo3capO/Yb9/xw2i3JbePzYbdnSXw109egJAHvx46u8bJxMGKm4oobLRASMq5i6Q9iDaMxzAjZ7Do2ClSG3wrCPKJveuRoXwQ4JYFaGmhOcv8fUYXUL5wO1IoUSbFwqHk9tmCaVhI/B08RLHIG5vvmvBRoY5IrHT4z0R7BNL2/vpyOFR2VDzgp45AXFWHskLDM8RDVIvJBdfy0xkPLGRwda1ak/PW9rOsNbmvtOvehOdYRVPCqhWex/3MP+KUBki3riRDIx+4f6pc0NeuIVHlmL7zRK6xcSzyrjyiCvAmVc8AmHGNHas2/gprz3eICMUvQYPjjiwqwE3MjA6PWoNMnV/1AyBjbJ/brrTHQBaVpWCbnLDPcJPkkq5d89B8bamhgzD/eRfktlZmUM38SvkWgS76tmrrrCct7soG9qkHl6/NPrJynbVDKla0GNy8sqovrzUFiPFpHXZdMT834BIr90XYUmB54QQxnGC0M02k1oLeEaTOPHBKSNaSLbPbTg0V/cvwFwvVIIns8yJNUWwdRfOc11MDpiauayKa32DCIfBdJSQy6JEM8/a+tzZ4zsW7Z46EybvO1J0aCg0neCSZaOWwtKfF9R6vXrbST85kYUUx1SZ07RAg=
X-MS-TrafficTypeDiagnostic: VE1EUR01HT005:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oyvsTKB/qgzAl9VUmeXqKdAaelV2EbPi9uEYXTQf/1ZW7TJahjIgTeklZa1tSbta71huXiYrSlaEWEp2lDW1l+lVcXXprZDYX7lLkxA7twObG5GtaaVTeHfqJJQbc4ktfh9+mDIL9+sp0qlh9zalL4wyuIwzh2vscNPjNVEeaEufxcs8+A9qreIH+B7bHQy7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4286.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	82yKUfyC1eHghzltGXjDVH7kTfsFR12yu7TDMd2GyUpFs8k1SnhMLzKz2P+qUEF9oxqjrEXjIVCMjwN9wYLnE1sQ3wK1/jLYs0kMsnTOXljOfZM7AllUQiJT+cpYtI04DS+aW0mJqTMN2cjyqdzKtA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a1b855-48dc-4111-260c-08d7e0a8d039
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 19:19:55.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT005
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

