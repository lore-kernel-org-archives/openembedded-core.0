Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 567D571A1D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:28 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 5A92E70B4BD08
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:26 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:29 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:28 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:13 +0100
Message-ID: <1475580681-55081-2-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 1/9] insane.bbclass: Add mipsisa{32, 64}r6{el, }
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2016 11:31:30 -0000
Content-Type: text/plain

Add support for MIPS release 6 of the ISA

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/classes/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2f3f768..b347638 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -87,6 +87,10 @@ def package_qa_get_machine_dict(d):
                         "mipsel":     ( 8,     0,    0,          True,          32),
                         "mips64":     ( 8,     0,    0,          False,         64),
                         "mips64el":   ( 8,     0,    0,          True,          64),
+                        "mipsisa32r6":   ( 8,  0,    0,          False,         32),
+                        "mipsisa32r6el": ( 8,  0,    0,          True,          32),
+                        "mipsisa64r6":   ( 8,  0,    0,          False,         64),
+                        "mipsisa64r6el": ( 8,  0,    0,          True,          64),
                         "nios2":      (113,    0,    0,          True,          32),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
-- 
1.9.1


