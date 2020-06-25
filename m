Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.92])
 by mx.groups.io with SMTP id smtpd.web12.3179.1593116003142169803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 13:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=g6xrybaR;
 spf=pass (domain: outlook.com, ip: 40.92.66.92, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjJquNNmQoLn8xkVEZgn3KbIulHtWjcReCpbSgR/4UqhlLYwdAGhld1kxo4FAOyC6OThhfthGzgeGcLvJIpQx/crJ7ikVLpBTUfY+h6kXmDIg9MQHoacv7X8A9Aaed6SFK4sX4+lCDwWor7XIehox3/CSOFpkuRdGowRK5G8Y/ZBNOqXObalbbeRO4HFpPhoQsLhv8icIfeBDynSClQqHQ7Q3r0FZsAjWcerpECy19XmPcg9PG8wdEJ+bW7iCUJ9Zl8g+7Kseuvy/7JymDs8uOfjeg7eq0xymZbSyfb8fD/0e00jKwCT20ggjOLVL5qGvmqxK+AzX1TKYUpK3kBDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnW0WvO/JZhJki/QN4DvprNQHNuKCJ0tYr3+22EuO8U=;
 b=nn8ajpuHu8CNLmtKAQrj8JjdI7453BVEmt29/rTp4NYxxQihhZTStJfpIpOEST4vcrs/jM3YFr5EeNKlhsTGd+pS0YqZ6VSZXe+Nu3yd/ZyMyQAX5hzcbRCqiukl3kYOnoPukFNSHrv4e7Zr0/Zh10NrgB6nLM4B2rN0ijNhts0LUmqt+r8EAYXkAgHapsmF5RgIQwyQOl8N2hWakbW5JM1ykND03II5PtStrI68NMtwbAPM/ocA95xIiIgbmcoVLSNQ53Zu3C5qkWIhtsCpkMhp3g0A+Y+iCtru1n8cMDfGcC0kTo4enDIXZLSwLHn2WBwWF8xvF91l6cUPUtVyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnW0WvO/JZhJki/QN4DvprNQHNuKCJ0tYr3+22EuO8U=;
 b=g6xrybaRG6ereSsHmwDx3l4xdfGUomzkrMFxBidkbaadBqRjLKGJj4ZJMO2Z4n1HqE4QUBjkTSxVGJXE3QUqp9yKOs2n0kDvwJT6gwVLaFL1MRcEbzeB3OzR9BNtrE/lzyzA8RJUKDPeCz4Ki+UONQq5mg4XYYB/cPCWEY0QiemCO7Jv5AvRm4TwygDOfs1yS5kjH9s4D9Iy68+zeAgYtOa9rSCHUF62YJB3yKxwhT6HDYsene2IFEMH07/hS7T8y5TeQyruxPi4zK80HHz5NNMdWt9N6Xdjwnck/d1nSyHsKoWZDunnDc/3asklqckDGckMvbCRhq7y/tNQOs7VbA==
Received: from DB5EUR01FT064.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::4e) by
 DB5EUR01HT162.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::313)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Thu, 25 Jun
 2020 20:13:21 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::4e) by DB5EUR01FT064.mail.protection.outlook.com
 (2a01:111:e400:7e1a::339) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Thu, 25 Jun 2020 20:13:21 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:462B117DDABB9E4A35AA44D0266FDA026E8BFF3CF9E87300A66DA101DD3E0276;UpperCasedChecksum:002B34C20B5D2C1F728F47B8306CBF79CCF23A3E3228CFE11CEC7A2775C7523D;SizeAsReceived:7469;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 20:13:20 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] testimage: enable ovmf support
Date: Thu, 25 Jun 2020 22:13:08 +0200
Message-ID: <AM7PR05MB6881A57B38A9343FB4928E3EA8920@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:206:1::48) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200625201309.11441-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.47.161) by AM5PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:206:1::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 20:13:20 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200625201309.11441-1-kweihmann@outlook.com>
X-TMN: [2EytzRReNi+iIe6g0Tw5jkrQCHAvDX9S]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 851ab1b2-fe1e-450e-3b97-08d8194434a6
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiRs85NybYSQmnTOa5obFT8M85Tr8iRIA1FLOT7/3whqeyi3AM5Gh+k8A4hs1X+25DxhuFFBbcFffGuzKIZXWcOGWxgxNUOVkhxpKVEmaS3TGI2nc7LqZapkaHeNKy7X9tPIzyGisPiYeiNjrdBaUy9SPfw2G8BMvRVpPa0K54nXpFLtDb4OYPbexT7XS+TRkYOqq4ev7Gao3tQqGuQOLgSLjB59f3DMyf2pgJueLnS79y/JlV+Ea6byW6o21phsDvSGckbq/+6srMN+jLymz1JGOMcZA21xXdsUrp4Sgab82sIVrdjC3D3EPCVRb2TuxhCH1ygUwFJuMrpv0g2H/ePZ8iYXSy7coY62SYDu7+KCVcbJkyUETueuaBZNdNo5uSqgR+px1eXO1IXpGipGzyFj9dQ8vsY8ezk3JT57MT17iPyRchY/nn7cpey4ylwh+7uYzChD5zZVH5D76RaWwXc6kOlc0Qjm5e0b09bkrQcLP7pDKHL5kj2XtVvmQPi0ULLwvwQFPSxfmuM4O/uD6zLNdJQ2fI+Ot5NbuPJVmHqSKH/RqkWIDT/N177OA//NEfWMQVJlq2Q/LodWbUH8tH3ptFthQUz9j2ZlwPY0sYrFk+MDoJoIj+sUSu5veP0hyq3/A81aVqPUfCMy0I6964/KkviJiI3bQgR4eHGwmDbzU/HOQdXW8tithKTGc+/lTckAapS0Qx4Rne+/qatBNUPqEQqzWKvbFZRzNGmLpEIF3YL7HspUe96abRvf1fZiVyI=
X-MS-TrafficTypeDiagnostic: DB5EUR01HT162:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LVpgZVlKWrXmELrKOuj/B6ioYBJjZZ4/fE8uSTeGjgYSwhFFi5qXLGi0SNyNPoWd7BKV1v0XAS3qiY3kQDT2Y7VZdQGj+KHda0R2UnFzYeu7gPp9skbBoeYd+IWxGv3FzUlWgD7MJ4VhtdX4ZjY51CkhMhe/PhpAFxJYp3j/abnnpzA9Sdx1hym065jHDe4C1iPVJpKa7fEQO2qHfcP6wQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	sQFrqEaICpC3CFWtJn331femNIaGTILPhyDCiUju3nvn2UfOD8RReHQlNH9Fn8rqmyrcXV4It5aOP9EFUzODeFwwD1bjoN37g1W8lf+S7AKxHvA1ilMsZOjTEhfg1JoHTqpLofE9oNIUpd3jkTaz9w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851ab1b2-fe1e-450e-3b97-08d8194434a6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 20:13:20.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT064.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT162
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add support for running wic images with EFI as testimage.
Introduces a variable called QEMU_USE_OVMF for configuration.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da0ab97f6104e63aa5e822f57eef8dfc3b524941)
Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/testimage.bbclass    | 6 +++++-
 meta/lib/oeqa/core/target/qemu.py | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index deb81bc256..53945478af 100644
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
index 77ae08ebeb..992fff9370 100644
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
@@ -56,6 +56,7 @@ class QemuRunner:
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

