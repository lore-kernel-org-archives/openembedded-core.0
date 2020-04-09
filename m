Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.33])
 by mx.groups.io with SMTP id smtpd.web10.15319.1586455417021313185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 11:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=MYPL6DPf;
 spf=pass (domain: outlook.com, ip: 40.92.68.33, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc9TJUSXZUi7UmU6qE+qKgnYToac3cC7ErFumkqKPGlZsCdt7Ap7s+rnNYGejzB4zQm+V+rxKfnZs97dAcSFnXqueeWsE/9zj2jge4IE5WenqLPhZKvYch4eVv9lp2hTddWO2ApHnysbszrY5AjvIcIvdE37DgVcELPb9fFteKu/1DoQ3dzO8RrL3FiZXkO1qNdPgl24QEw6HF1eXyRAVtZcveRccNlIvTKXNvUT15+snKtPdpJwcMqgUoI6lLa3r6n8OYozbE7pelQsJGHW567TWLzWjxC47iiu0cI2jXbN2/9hYD+vz3M+YxSqtPW7qTxveoE5wemCa7wW+zVWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Baz8++Lv8dSPHS8HwAsjyGq74W4WN8uIfelvXWugogQ=;
 b=WAaw9KsvdGvL0tJcOGZooH0pm3qTHnqGBxh3h/Q2I5g5pY3BcIo0heTZ3WA3FvVVGzBLPr/cDyEISqgvvtjjsktYFgGQWIGvz6V3i7XCFSCISksCGKt9o3VMtD6HzH8fcAiHQ+0Ijw+JI5LnOEeq0rK8HAAMXv6fal/ZtvtsCD+BXtD2JEyAuAq7sprc3EQDtQfi2updLQ5PWjhsM5fWO5YswwOduApcxSdax5nextLl5GQD15wQ0tSPJ/ER+HXVAStu9/AKBMO+i+RW77LpGIAY0GP1TkdJUybHrLjyQP/jDXl7TpaYsyGgrUafFeW9RU7TcisFVmi6OMojo7Nz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Baz8++Lv8dSPHS8HwAsjyGq74W4WN8uIfelvXWugogQ=;
 b=MYPL6DPfEfwZql52wP2auQ7bLUhNwYfrbI4jgjUpyLT1Y/K9WeXCkTg/HHUjtFjqueQKjXNTAXHat3UkXq5f+E39bWj0vifdywcflJZO3CHj3e+N2+MOmLPQ0UU34HxrhGWykU7xCaTXN1kqCC996MUI/Yv8kzsbqFp/Kks6Il/eYRsftqkPVkzIzVfUbHIgjvKRkN9AiEd8ixL63IXs9rmcKBJcxxpIRZ5GEqMkybciRRfLny8BJ9RA7Fl9FTNzFOVWzD15Z3Xn5BNgB2cgPeXVVY2+QsS6uceo9pN3kX8eb9Z0wrNsOrJF2zvCk1TkArPelYhuh20Uubt/lWO0iw==
Received: from AM5EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::40) by
 AM5EUR02HT194.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::483)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 9 Apr
 2020 18:03:34 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1c::46) by AM5EUR02FT039.mail.protection.outlook.com
 (2a01:111:e400:7e1c::283) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 18:03:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A1CAA76DA101D4ABA8CF286F91CEE1CEDD0F07DEF6147ADBD309D0EBE40E3DBD;UpperCasedChecksum:2B1C9524AAD205BD52A468209A30F196126902D0A8B25FF6CB60ABEDD2F2674F;SizeAsReceived:7490;Count:48
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 18:03:34 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 1/2] testimage: enable ovmf support
Date: Thu,  9 Apr 2020 20:02:46 +0200
Message-ID: <VI1PR05MB4286AD3C97C490D1D1C4372CA8C10@VI1PR05MB4286.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0701CA0071.eurprd07.prod.outlook.com
 (2603:10a6:203:2::33) To VI1PR05MB4286.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200409180247.17781-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.7.49) by AM5PR0701CA0071.eurprd07.prod.outlook.com (2603:10a6:203:2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend Transport; Thu, 9 Apr 2020 18:03:33 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200409180247.17781-1-kweihmann@outlook.com>
X-TMN: [2tGQTwVHUWq2ZfGdrJ99Qsx4bPfYgufh]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3be16b35-95a7-4dfb-d4fc-08d7dcb05170
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCty8zS2ey8+JmvzAALIJhV+Li0IemGXRwQl7pnaLKrj6hBHUM3kQk0ocnbj9HX6a53sabN7Qz/WFwL6JXl7fgGq0jzrPRKvDTlxO0uctMvaO7oXme1FYoJu+P1O3Tt5wkX579FujB2QqoNWQs2RM0C0upI2Ok8z963WGDasI+D6A1+YRnnGm13OiKkWk3zfxotmG6vsqDekEn9Ev7tALfv9Ul25SCzFCl7o78fwIWIfnw6hMrNwJdPxIah33wHD+LAu93hslUq1ZjO70Bx7RiDrDRbxA/SDMGCU0Tt30TNTHvPHiMsZOkGwoYBVYviUXrQJOXoByQ+Jcwfx7l7d3WpMAgG0WyUIsq11l/o3nKCPz23z3Q/SxHohF8dkt46jG+eYB3YOL2UYn+zfNI8VYv16YPLYnFKoLQumNFXTL70mNy0B0ULhH2tChZGysMSWINeQ2X24xDC3ZXCd9IKGGZZfLOMdXf2p0akZjhXFPx8qCI4rLfpJRaSXwNsL+sC1DLcx0MrsM7TZt8x/3RmC/CMuDP9wDLGcoOaytgElwE+j1Z6poiu/CjcAXVWWLEjt6mcEK8EwoYotXx6kt091L1lqy/2NwL2aw+aWB01P4bOrATv+5zt5Az4go85nqWO93uryzm+l/AkdK6oDVaBQP90HHVrXWPw+S5FnuTr9TC/FOKcclmT3k793GmUQpvQDsRVFm7Z8+VGr5G18t8cp3HEiM798yTXqhOMpbuAYITRZK5w==
X-MS-TrafficTypeDiagnostic: AM5EUR02HT194:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wnY9ua6Ef4hbQB+BAzyQQoat+RBSX9v7AUkYzpd7M79olP6qwRDFt4plFbWk93zaGpI45HQJJ9udco6sWlERCDW1++zDk+IVVxcVkPLH8CsNgU/lwU8O9i65qRAxruzSoCp3sMa5CJV5E3Dqj9ZC01p4+dtWlWT6HaUxK9pX8BEnm/oMBT6grV/+YAftTXBU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4286.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	ddszDGnZjhvTv3jfZ1EZs+Sx2uFf/IWIxxoh6p+dhcx6pMGGOXwRbpA4wzNA4r/J01wBokIlIY0qYKGkHvA7gTinoVpC5gY5GP+N7Mm8Qx7T1dk014eDlHXGEHt7S6F7bRKGi+2W9qFmD/uJzTzv1Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be16b35-95a7-4dfb-d4fc-08d7dcb05170
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 18:03:34.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT194
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

