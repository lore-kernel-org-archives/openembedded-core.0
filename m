Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 85D056022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 10:48:03 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 58545C9F10FF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 11:48:01 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL03.hh.imgtec.org (10.44.0.22) with Microsoft SMTP Server (TLS) id
	14.3.294.0; Thu, 29 Sep 2016 11:48:03 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2016 11:47:53 +0100
Message-ID: <1475146073-47073-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] mips64-linux: set ac_cv_sizeof_ssize_t for mips64el
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
X-List-Received-Date: Thu, 29 Sep 2016 10:48:05 -0000
Content-Type: text/plain

The fix for [YOCTO #5935] was applied for mips64 but not for mips64el
Patch it for mips64el

For description of issue, check OE-Core 7a5b6b96

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/site/mips64el-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 8b61eb0..680171d 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -35,6 +35,7 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 ac_cv_alignof_guint32=4
 ac_cv_alignof_guint64=8
 ac_cv_alignof_unsigned_long=8
+ac_cv_sizeof_ssize_t=8
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-- 
1.9.1


