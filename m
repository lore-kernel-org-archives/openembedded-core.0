Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by mx.groups.io with SMTP id smtpd.web11.4255.1593164438498027528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 02:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cetitec.com, ip: 212.227.126.135, mailfrom: johannes.beisswenger@cetitec.com)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MmDAW-1j6ebU1JQG-00iDD7 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 11:40:36 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
	by mail.cetitecgmbh.com (Postfix) with ESMTP id F35DB650242
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 09:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
	by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmFAFg1Rmeul
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2020 11:40:35 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
	by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8D41364F896
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 11:40:35 +0200 (CEST)
Received: from p53jbe.corp.cetitec.com (10.10.5.239) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Jun 2020 11:40:35 +0200
From: johannes.beisswenger@cetitec.com
To: <openembedded-core@lists.openembedded.org>
CC: Johannes Beisswenger <johannes.beisswenger@cetitec.com>
Subject: [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
Date: Fri, 26 Jun 2020 11:40:31 +0200
Message-ID: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.10.5.239]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B6C756B
X-Provags-ID: V03:K1:mO2umtw8fxrcSMc/0u8PLExHQdsQwapD+BeFq3HY37Oii6Otjfd
 YWbZaTUK/IvikkkyvwTzKOebpfKfdZ3b18gCnk42xIrYmE6QlUp7auIUZabOGrCBP7/omsC
 djm1oAE759IRWmj+X7QDByzloNw/bEejtLj4Xqd3ZjZvSEvH4CG7MnCrxEWSzZkuL5EAifd
 qRj2XisHOKIVoVPaUNHhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dleXCluyiRs=:6h2pPq9vjiCeqUGeyzB7UJ
 PObokJFpkPKTHpcMelRz+R3xm0Cl4hetso+wahBsluqBgfIG7vMlUY/Xfd/JnAauNY+2lgm8f
 W5C6urgOhx360vyoVGCk5AJ0etc69NigE+LY9JR4Z3E+YZrpOCoCjOOMwWgRObrr9ICS2MBk5
 lcQD0pt/ZBPOR4CqhTZzXDkXtz43l20fL9TRt6av60HUU1SWJGNWEfULig41PEK3kf2nV19Fj
 HKZ4vyT5VcV7deU8udnJbQCiHgHBYb4jUiW3rGV/g0QEq9Kxd0ThqhUKkbTY+zDV/lb54n54P
 ahdnYe6zyYdGEzctlfqGgNgGllY2sKpLgi7yuX3zaywu5QoSB+X7fy7m7FHtQSi2RVmyGEiop
 LLFQdJEWQ3mqdzHwd4vpsB0yzA0C126A2ktqSjiyuF/lm0GrYazHKGk0sBDqddjjkAjBMktSE
 gjrfMVkBGz1HmDNbNSp2rLvQuILY+hdGxuqxzKyxgxV97tMIuPlgB33MHYLBDFFoqVgnOK+oO
 XuZzPZ9l+r4OMuS6l7MOh4SSNkTLP2o1p/sE8G5aoaFLlbJ5kxrpho9H9GAxygRLjc2mTBnnt
 QZBt8r6/M2ugeI2i88B+hX9kPbMOj3Wa4qG2Y/EVKID0vxuq0nKy3fiWESdJmPc7vHx3FWKqj
 lJGDNAGsApgFYATlUVJJmyqkamTNApLiwu4dBWF4b4lRuVTgTWkeAIcxCmHzOpOjixj7yWNbE
 EqgbDszgvwOX7xfgzuTIGEJqaMs197qnYCtLd4ZusU00GEJCap3sbYPkPPIJr07qFRo7OfyiM
 9UDcR6l55qWJP490l7eWdqdPCb80VWt6YLLH13T906rMbd3JKekDMUWhBVJWyAzQGHdKxG665
 4MGWtj19O0N6sltTnXGg==
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The file mode was accidentally overwritten with only the permission
bits, causing the server to falsely assume that the database was
corrupted (because the msg_header.mode did not contain S_IFDIR
anymore) even though it was the client doing the corruption.
In practice that had the effect of leaking the UID of the user, into
the pseudo environment.

This fixes Bug 13959 -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=13959

Signed-off-by: Johannes Beisswenger <johannes.beisswenger@cetitec.com>
---
 ports/linux/xattr/pseudo_wrappers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ports/linux/xattr/pseudo_wrappers.c b/ports/linux/xattr/pseudo_wrappers.c
index 590af30..3e122d9 100644
--- a/ports/linux/xattr/pseudo_wrappers.c
+++ b/ports/linux/xattr/pseudo_wrappers.c
@@ -197,7 +197,7 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
 			mode |= get_special_bits(path, fd);
 			pseudo_debug(PDBGF_XATTR, "posix_acl_access translated to mode %04o. Remaining attribute(s): %d.\n",
 				mode, extra);
-			buf.st_mode = mode;
+
 			/* we want to actually issue a corresponding chmod,
 			 * as well, or else the file ends up 0600 on the
 			 * host. Using the slightly-less-efficient wrap_chmod
-- 
2.27.0

