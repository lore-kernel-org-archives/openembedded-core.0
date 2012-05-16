Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUTBg-0007R4-H1
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 03:38:00 +0200
Received: by mail-ob0-f175.google.com with SMTP id x4so342561obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/1zEHgHHiTz5vl+G75X0xD6hheo4eSzbX3NVlckhSw8=;
	b=QAjxj6eW7GsTwfMycKoQ4h/Csdjr9tpCnWCv2fWMftT/4e0qDnVVAUnFK+in//9kMb
	lY2b1gKHBsPT/DCikF8noAYlp7XEx+woKGSODbU6/rR9sHFVdZ38Fx8ixct4EFRX83bS
	TROx3+GTmKWytPw54oxCnLEbci88ICJViWQbj1sXpIObzYs+mY6kxzJlWRQoQvNTZuhB
	HU8Jdjw44LRZHsDsjl9qhzYfd6aLDZQNz0D2eDjXR2okIpQ8SZot23QURUW1+mEi7Pbp
	5QEyv3kg7M0963QxKDb929SLPC91Q9S7TMk7t+6g91fQ1dDt/tIwgHONGH8QQkfVTJKT
	tCyg==
Received: by 10.182.31.47 with SMTP id x15mr917708obh.76.1337131681780;
	Tue, 15 May 2012 18:28:01 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id rj10sm935676obc.22.2012.05.15.18.28.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 18:28:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 20:28:24 -0500
Message-Id: <1337131704-9285-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] csl-versions: fix bb.process.CmdError reference
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 01:38:00 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/csl-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index ec7a6ba..0790b8a 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -83,7 +83,7 @@ def csl_get_kernel_version(d):
 def csl_get_gdb_version(d):
 	try:
 		stdout, stderr = csl_run(d, 'gdb', '-v')
-	except CmdError:
+	except bb.process.CmdError:
 		return 'UNKNOWN'
 	else:
 		first_line = stdout.splitlines()[0]
-- 
1.7.7



