Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id EBE0F6AC85
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 18:50:03 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id fp1so2827560pdb.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uekgas1exLAYaRbjCxXB/0CExScnMs5UmiMdtB+P5AA=;
	b=tJp00FlSCkngDhHdjIzwgzYMc4utbLTi696HmMGVtk2ZR2qJzZ3aUkdLlhuoEoskF+
	UIVt8+6bE1BT/EEfq1NgHNpKOec3S5eGVcWXhpDzKcYHkC+tgycAbm5mjya+HY0H70N8
	pVfzfs40YWu6UjMuvCXNO0ioMTgHb+VHoH6lEYFDE588S7DGRpWcu40A0YO7wslDiVlx
	/kZ9Z6/74UvYtXwamNVH6lxqDnRL3ycUSrruijxww1E56i54aEzFAEjViXcC9wlcyP6N
	AWbxBHUZvGHZPjZFNmneZezNazghyiUjG8DQkGg8htJ3FgUivpSjjIWAQLbMudkiejEH
	DWhA==
X-Received: by 10.70.140.193 with SMTP id ri1mr25685748pdb.18.1409424604388;
	Sat, 30 Aug 2014 11:50:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id c2sm5123927pds.32.2014.08.30.11.50.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Aug 2014 11:50:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Aug 2014 11:49:59 -0700
Message-Id: <1409424600-22218-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] tzdata: update to 2014g
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
X-List-Received-Date: Sat, 30 Aug 2014 18:50:06 -0000

For a full description of the changes see:

http://mm.icann.org/pipermail/tz-announce/2014-August/000024.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014f.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014g.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014f.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014g.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014f.bb b/meta/recipes-extended/tzdata/tzdata_2014f.bb
deleted file mode 100644
index caad383..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014f.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "f333b2e8f876221a97871cae0c188aa5"
-SRC_URI[tzdata.sha256sum] = "eed690a72124f380bcb14947d398a7a482acb9ab792ae78bd4554e52c5ca2001"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014g.bb b/meta/recipes-extended/tzdata/tzdata_2014g.bb
new file mode 100644
index 0000000..e831833
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014g.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "f9f59425e55b21d2e52bb3a95fc17b8d"
+SRC_URI[tzdata.sha256sum] = "5547d5b7a982f7f53fffe68cb2a13692553f591a17d58c8ef15b20679d82a270"
+
+require tzdata.inc
-- 
1.9.1


