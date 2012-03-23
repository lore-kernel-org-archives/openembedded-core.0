Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBDpU-0008BE-9Z
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:23:32 +0100
Received: by wgbdr12 with SMTP id dr12so2196375wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 16:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=NmkY52HRcHk+QHUkAhjCFCEUgcW3hBTO6XaqYViRjjE=;
	b=L0BSrBJKsoUm1PFZ2rF1MEtU0khpKVPCbq9CQ/jZirMixGh/lTPftQY9TpOG6+5bL5
	kT6Lo5K1QIhYIuLMpwNwzfCTNjiKPls8Y6PDz9PZBgqwPRDpDwAkVvYHDN5yFBPaL8hc
	9AMkFDn1O6VFaf4aMYFy5Wm8x1F2R4W+xUjHY6nx06uPcVKSp96LyvFHPZAGEVGgmkjH
	Aq7cqi4hhsNMH30v7zvN/pz/2RsqF+ACHi6/6SpEATxCGzAAekQvAki2hJXGHuBHJ/WH
	56IHFpVIdsv2k4YN41HJh3u+1F8GmJHvdrEyg5O83bju8BpigeW0oyg1K+UfNRtomHsA
	e2nQ==
MIME-Version: 1.0
Received: by 10.180.107.164 with SMTP id hd4mr776749wib.18.1332544475711;
	Fri, 23 Mar 2012 16:14:35 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id fz9sm17771991wib.3.2012.03.23.16.14.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 16:14:35 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 01:14:27 +0200
Message-Id: <1332544467-2071-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmF4MQblDebtOnfF12/qeA92tV4cVTaTi8hgnfpKlrLzSHI2EoqS0pSsAsafH4GfzuhknPs
Subject: [PATCH] python: Add tk to DEPENDS
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
X-List-Received-Date: Fri, 23 Mar 2012 23:23:32 -0000

This is needed for _tkinter python module.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index cb0a1d5..6969929 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,5 +1,5 @@
 require python.inc
-DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib tk"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 PR = "${INC_PR}.8"
 
-- 
1.7.5.4



