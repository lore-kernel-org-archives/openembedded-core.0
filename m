Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.41])
 by mx.groups.io with SMTP id smtpd.web10.1488.1586891990786013412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 12:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=SQNgbnht;
 spf=pass (domain: outlook.com, ip: 40.92.64.41, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkyWJs76uroipBBnjDST6AETY3XQ10yQgNiWnHJTNTLyVlGQpQFOtVCjw09DJCLGj20Y3zS575DSRWLXLv0lc2rKCgQbQ0FKvZfeIriwewMh1syW+5Gq6xuhMaQRr7zg+oonwGoaqhafftiM29T/ELjPc9AgJmzkO1v1EJ/ZmLYY6vDalxwFseeQTk81CoOWmT+z2M7DCxmWRPsOtIJ13cGzUSIacFjGkxhQ7JSa9NKVJPhUkcbZPxTVhSf42JX6w7yqR9hP14yQGZ3WhpSAKO/yLweTW2dDpA6OG++CR8yU1uc0UYdkotKsB8FGNy5ULM5QlGGjx+pC+wM446vn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Baz8++Lv8dSPHS8HwAsjyGq74W4WN8uIfelvXWugogQ=;
 b=e/DeStHg4/GT/idFt+TDboK+SY5Ze1hyXO/LGge4DT7Q5NKvZAvGGq3+p/3Z4mP3Ei0aWlXhEVLRNsGmSW4zLmiZerx+Lr6MYKlvumRVJPS7s7vVTRGPs8WY8Pwios3BeuUFC+B/M6dX1P9WM6QIcvJ8U71Dg/9Lh+ai6AS7fOhV+SMjPCQYDusgM6+gmyVJjwGZzMWssGMGpsfKFIxrsTLsX/PeSVrSgmEnZQRnec4xp5U2XAx35j/+KSb+oqmfXleo+8WCrrFu+9x3b2dwBcyX+xgYKUkUCrOZia7RL1PJv88oA3ZsBJLUmDftMAal1DbUKfIXCsZyTI1MFbhPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Baz8++Lv8dSPHS8HwAsjyGq74W4WN8uIfelvXWugogQ=;
 b=SQNgbnhtR3ny6oU9JvNj1g9Q+SCBTIJku2qDaqkKhkhcnExagfpFi6y7QVXGNvnSR8TGt9bVqTL1+Jp32M8sz8ikXAA56BVgb12CKt7PBaP/E0MFn91Rks8BkqMgkPGRdmv/Fv3ZBqqczfbNpJKYdlfyotiTvneYChRAVDtKFx4tpDwG3KMiVCGGRe8Ylo4rZKKxjzAyKX2Nb/cE0ac8U+O4UUVfE5nA2N7zc4104KIaXHW+Pz8Djuzsb7gVBrVd0JvkYN41VrtFgC9jQ1d7Np1EfjCl5CzG+NOg61hHzSW4SPZK94lkTrht90Xx5Xh5hqZnTZT5qAupEYObWThFOA==
Received: from VE1EUR01FT019.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4c) by
 VE1EUR01HT005.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.18; Tue, 14 Apr
 2020 19:19:49 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::51) by VE1EUR01FT019.mail.protection.outlook.com
 (2a01:111:e400:7e19::231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 14 Apr 2020 19:19:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C76043DB356B9D2BD841FE898777EA61C206CC819B0E47794CF1D0A5CAC65985;UpperCasedChecksum:FCFB10CD3EC52CA0E10F4F7451A288907B1C5BF86B43F0D735239057E063EA28;SizeAsReceived:7443;Count:48
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:19:49 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] testimage: enable ovmf support
Date: Tue, 14 Apr 2020 21:19:14 +0200
Message-ID: <VI1PR05MB428659762F44A1D6BB54A98DA8DA0@VI1PR05MB4286.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P193CA0063.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::40) To VI1PR05MB4286.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200414191915.772-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.8.55) by AM6P193CA0063.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Tue, 14 Apr 2020 19:19:48 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200414191915.772-1-kweihmann@outlook.com>
X-TMN: [3sgSYPCFLpjbKhUt45p7ibL9bMSm1ip8]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: df1f2d12-f6f4-487b-1d97-08d7e0a8cc6d
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3roQqs4zoykRuzrLluS7BZXvvGCaBCUf3izLsQmZdfmjYmVKD3Ou3m5hygTh03UDzSuZyY9NjGY/XicX0h+4so7YbEazGVCN+BfkBVoxoTdOTOcoere0QdL6GNLJYbCAjj8MqKH2EAF7+S4EwhEC2l8LasjGX362oUy0aGt4brXsgumtVe/vS2cSSW197N6uAWS0O55EMMaINDM19+eoKoMiDCWa3D3UskYzrbtPCfeMoCvHFvEG+f859JAjj9v5A9L6X2AL1y1KmCkm8Us4RILO/qWGPKbMvsIIXqp81JW+S6rmKMsGQBcnS79gPXX6VE0kVq/eYco24Q8U8fByr3qn1gEoMi0Fo1dv+swXzdwaOa0pV0rR8XXrG4RMcPJGZ4KWPGI6BSgYhae7MnSflo3N3m1V0TGarkGIgCUKBIjts1dNWJFtkKlCIgB4pbna9FinWXneFBP8h5PqhmE8zcDqEP10+cgapz/ii64nBjly4N5ik6iiIzRYPnwdMIzGflfjy6TZX7oUo7GJcsLlgkglkWxUX8Zjl5lvacr37Ata08CIg/DeDm7INp64ml5PYzh9PnSuuFCw6GCRmXn+kxTmPhUl3xv1JfWGef9x/WtHoojTmVMUMmqzOshTt4OySc1m2wJu3NAASnI+Z/VncYjcWqPpLnB+exuRFjMnIgkJ0KKR9VUU3SG3RGRcsXRi0jT1wYE41ZTA==
X-MS-TrafficTypeDiagnostic: VE1EUR01HT005:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gpS36xTwLbmXVRuTmz9IJqs/UlC9I/B64DvPffNfD6YLkJfG1rEUeX8DZpvIfvCO0zVObpvHgp9o/OkD5qeGR+CcnX6zgIGH0EpOOCBq+UBvg3DqK4Nc1b748loKEahufjThi3dJiOaOTSg3o/F5TxkEV33WheLMCIwRXeSrIJJYS5yVyNY8TdWHg1TKl+SF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4286.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	/ApQwXNIx9bc9G0RHsNex0MsRs7ifStUHm/OlCW80r9upDzHwkz0IhGPRZiYCL2lloIEqQ3p1ByUZpN2I6nylvl2uYDClsCTMwx2QdZNfK9U9bc2jw2L8TLpH9qkJE0C3UVf1lgkpWSj4O+f0kf8pg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1f2d12-f6f4-487b-1d97-08d7e0a8cc6d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 19:19:49.0262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT005
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add support for running wic images with EFI as testimage.
Introduces a variable called QEMU_USE_OVMF for configuration.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/testimage.bbclass    | 6 +++++-
 meta/lib/oeqa/core/target/qemu.py | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index 01d8598604..c1669f133d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -275,11 +275,14 @@ def testimage_main(d):
     # Get use_kvm
     kvm =3D oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARG=
ET_ARCH'))
=20
+    # Get OVMF
+    ovmf =3D d.getVar("QEMU_USE_OVMF")
+
     slirp =3D False
     if d.getVar("QEMU_USE_SLIRP"):
         slirp =3D True
=20
-    # TODO: We use the current implementatin of qemu runner because of
+    # TODO: We use the current implementation of qemu runner because of
     # time constrains, qemu runner really needs a refactor too.
     target_kwargs =3D { 'machine'     : machine,
                       'rootfs'      : rootfs,
@@ -293,6 +296,7 @@ def testimage_main(d):
                       'slirp'       : slirp,
                       'dump_dir'    : d.getVar("TESTIMAGE_DUMP_DIR"),
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").spli=
t()),
+                      'ovmf'        : ovmf,
                     }
=20
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/=
qemu.py
index 059106e915..295e8765e9 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -20,7 +20,7 @@ class OEQemuTarget(OESSHTarget):
             port=3DNone, machine=3D'', rootfs=3D'', kernel=3D'', kvm=3DFal=
se, slirp=3DFalse,
             dump_dir=3D'', dump_host_cmds=3D'', display=3D'', bootlog=3D''=
,
             tmpdir=3D'', dir_image=3D'', boottime=3D60, serial_ports=3D2,
-            boot_patterns =3D defaultdict(str), **kwargs):
+            boot_patterns =3D defaultdict(str), ovmf=3DFalse, **kwargs):
=20
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeou=
t,
                 user, port)
@@ -31,6 +31,7 @@ class OEQemuTarget(OESSHTarget):
         self.rootfs =3D rootfs
         self.kernel =3D kernel
         self.kvm =3D kvm
+        self.ovmf =3D ovmf
         self.use_slirp =3D slirp
         self.boot_patterns =3D boot_patterns
=20
@@ -39,7 +40,8 @@ class OEQemuTarget(OESSHTarget):
                                  logfile=3Dbootlog, boottime=3Dboottime,
                                  use_kvm=3Dkvm, use_slirp=3Dslirp, dump_di=
r=3Ddump_dir,
                                  dump_host_cmds=3Ddump_host_cmds, logger=
=3Dlogger,
-                                 serial_ports=3Dserial_ports, boot_pattern=
s =3D boot_patterns)
+                                 serial_ports=3Dserial_ports, boot_pattern=
s =3D boot_patterns,=20
+                                 use_ovmf=3Dovmf)
=20
     def start(self, params=3DNone, extra_bootparams=3DNone, runqemuparams=
=3D''):
         if self.use_slirp and not self.server_ip:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 7ae309845a..7d9b36f811 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,7 +32,7 @@ re_control_char =3D re.compile('[%s]' % re.escape("".join=
(control_chars)))
 class QemuRunner:
=20
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image,=
 logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=3DFalse, serial_ports=3D2, boo=
t_patterns =3D defaultdict(str)):
+                 use_kvm, logger, use_slirp=3DFalse, serial_ports=3D2, boo=
t_patterns =3D defaultdict(str), use_ovmf=3DFalse):
=20
         # Popen object for runqemu
         self.runqemu =3D None
@@ -55,6 +55,7 @@ class QemuRunner:
         self.logged =3D False
         self.thread =3D None
         self.use_kvm =3D use_kvm
+        self.use_ovmf =3D use_ovmf
         self.use_slirp =3D use_slirp
         self.serial_ports =3D serial_ports
         self.msg =3D ''
@@ -158,6 +159,8 @@ class QemuRunner:
                 launch_cmd +=3D ' nographic'
             if self.use_slirp:
                 launch_cmd +=3D ' slirp'
+            if self.use_ovmf:
+                launch_cmd +=3D ' ovmf'
             launch_cmd +=3D ' %s %s %s' % (runqemuparams, self.machine, se=
lf.rootfs)
=20
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3Dg=
et_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
--=20
2.20.1

