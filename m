Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDCBC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 18:24:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76904.1701714263946132058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 10:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFCE1684;
	Mon,  4 Dec 2023 10:25:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C0913F5A1;
	Mon,  4 Dec 2023 10:24:23 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] meta-yocto-bsp/oeqa/parselogs: add BSP-specific ignores
Date: Mon,  4 Dec 2023 18:24:19 +0000
Message-Id: <20231204182419.2455488-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204182419.2455488-1-ross.burton@arm.com>
References: <20231204182419.2455488-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 18:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191767

From: Ross Burton <ross.burton@arm.com>

Add machine-specific ignores from oe-core to meta-yocto-bsp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../runtime/cases/parselogs-ignores-beaglebone-yocto.txt   | 4 ++++
 .../oeqa/runtime/cases/parselogs-ignores-genericx86-64.txt | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignor=
es-beaglebone-yocto.txt
 create mode 100644 meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignor=
es-genericx86-64.txt

diff --git a/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-beag=
lebone-yocto.txt b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignore=
s-beaglebone-yocto.txt
new file mode 100644
index 00000000000..b0d98418d17
--- /dev/null
+++ b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-beaglebone-=
yocto.txt
@@ -0,0 +1,4 @@
+# These should be reviewed to see if they are still needed
+l4_wkup_cm
+Failed to make EGL context current
+glamor initialization failed
\ No newline at end of file
diff --git a/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-gene=
ricx86-64.txt b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-g=
enericx86-64.txt
new file mode 100644
index 00000000000..9a655564cdc
--- /dev/null
+++ b/meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignores-genericx86-=
64.txt
@@ -0,0 +1,7 @@
+# These should be reviewed to see if they are still needed
+Direct firmware load for i915
+Failed to load firmware i915
+Failed to fetch GuC
+Failed to initialize GuC
+Failed to load DMC firmware
+The driver is built-in, so to load the firmware you need to
\ No newline at end of file
--=20
2.34.1


