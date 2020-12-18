Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10882.1608302621117261162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 06:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EC591FB
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 06:43:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08D953F66B
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 06:43:38 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/qa: handle the 'no specific instruction set' ELF e_machine value
Date: Fri, 18 Dec 2020 14:43:35 +0000
Message-Id: <20201218144335.1189805-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/qa.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index ea831b930a..e8a854a302 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -156,6 +156,7 @@ def elf_machine_to_string(machine):
     """
     try:
         return {
+            0x00: "Unset",
             0x02: "SPARC",
             0x03: "x86",
             0x08: "MIPS",
--=20
2.25.1

