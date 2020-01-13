Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 865B57FC99
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id k3so4869899pgc.3
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2uaDPMBdjlrAHQ+UQCtps/KbKX9QWFlXtELbjDA3WcY=;
	b=vOpUtjb09PfIcAK6ynGnQwuNFe1on0yZihsGQCW3tIgdiSiqsa5PGYu8J5shZsdhIs
	Zmf0vYdDlNFopiiTe7Lf9iIVgpz6+xcBS1IDH2U8oi3dvoOxfphDZIHkuzlnO/IBMhDe
	S1kBE41NzVFZLADUM2JhR9T8qWPHSTSmK+53cGaOkYAOgZ8OF6ENAuUGwgLf0l98FabP
	R7OB73XOr+i5yPo++OSJhbEhRI+KsKQQCvlWdLWRd9kObpCNc0aGsVHpR/AjUBBr5rEw
	qx5Pv3ep6VOQermx4VOp1sqDtOR/dXerAFKDwqTxbWAefi9qdbMsLLwvXXZ6b9/J1Vla
	FrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2uaDPMBdjlrAHQ+UQCtps/KbKX9QWFlXtELbjDA3WcY=;
	b=uk+9cFGZg0YeO+/np0wVme0YKUo8u4xi7+Sz6XWk1MHxydRCJ9LP+1J2+PF5GPjA4z
	kuHPSifwaZLQ/Kv870vu9oPKi8XavpqEbkZg4gEADDDHmgwzNeH9aoQARRjIRYw5Ag7p
	SKls8+oWdwTgUbWsbDwQvL8JipN3fKG3HqJ91s/zmwqLPmekQE5RNYGk2+awZ72py2Ls
	L9wnUKvisAGmDRkMjkfC0PwkiCwIXYzc27DsWhBEaz3ZbUnA6RAS+Ovb+Kp0+7I8ugOE
	/C8Vg83r7DiUs5ekjJ4pLAIFEeJeBR7z0prrpRjd2KV0dIwbEMb8UUpAfpVmCrzywjpY
	9TNg==
X-Gm-Message-State: APjAAAUVo7caB5YPf5Yi3TOQDhgov9+CQqFkNhgzuEmIPjtfn1UUYmIR
	/ZnGGeAE3g9KrDLT+O/4klntkhmS
X-Google-Smtp-Source: APXvYqxcVFPg+CexY9vKk/7TNX3PtigZcoceanhpuYwwvLqRb1INQtd2Iu4c4CGpI5BH46a8TlQICw==
X-Received: by 2002:a63:6704:: with SMTP id b4mr21986918pgc.424.1578929458431; 
	Mon, 13 Jan 2020 07:30:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:21 -0800
Message-Id: <0ec6843bec3e817c3bc62d04adea5fd385307b32.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 22/28] cve-check: neaten get_cve_info
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:57 -0000

From: Ross Burton <ross.burton@intel.com>

Remove obsolete Python 2 code, and use convenience methods for neatness.

(From OE-Core rev: f19253cc9e70c974a8e21a142086c13d7cde04ff)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c1cbdbde7b..e95716d9de 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -261,23 +261,15 @@ def check_cves(d, patched_cves):
 def get_cve_info(d, cves):
     """
     Get CVE information from the database.
-
-    Unfortunately the only way to get CVE info is set the output to
-    html (hard to parse) or query directly the database.
     """
 
-    try:
-        import sqlite3
-    except ImportError:
-        from pysqlite2 import dbapi2 as sqlite3
+    import sqlite3
 
     cve_data = {}
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
-    placeholder = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
-    conn = sqlite3.connect(db_file)
-    cur = conn.cursor()
-    for row in cur.execute(query, tuple(cves)):
+    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    placeholders = ",".join("?" * len(cves))
+    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
+    for row in conn.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
         cve_data[row[0]]["scorev2"] = row[2]
-- 
2.17.1


