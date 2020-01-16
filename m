Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 80B067FA13
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:08 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x184so10369222pfb.3
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2uaDPMBdjlrAHQ+UQCtps/KbKX9QWFlXtELbjDA3WcY=;
	b=NtzXG7KDsJs+5hwJ3VBL/hX9IBEfKPl9nkOyfBX/PGU6xxf0jo6i842hDFWRmGFX3I
	86q+VabA8YASDLZiAqgqz/MC5tqJ7Ld6CSTzI6YuV1fw10U6Tw7n2oIyzvozYwj9k23K
	VYxVjXrM6n6MgLUHeGTbjhQ4BVwLlRfdTLyvPu/C/asdTNjq3OCl6kkVTWz4EyQqce+o
	5QfMARfDKBSN5WYrhfQ1SvwIS4CDUJ6wwSaanRSid8t3hYPm9Kbo0tDwhTO9QedCbpdP
	tk/KXZOveusYI27HUsmiFwlh/vf19Q/tJo/er+xULPcxhM8v2lT7qLYNvUGoR0cOfvG1
	peOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2uaDPMBdjlrAHQ+UQCtps/KbKX9QWFlXtELbjDA3WcY=;
	b=SqWHYysJntAqMD76CQvtciKyjp2Sk/8+hwkbINgHw+ibLV4miMQ0V6UJUQpn108dkd
	pdqHLL23M9lheDu0R6+UEGnL8Pg09Wslc+ycGb+EgOgJk7NgYoq+h28oCeV0k9RBvdzP
	GdGrdP4yDEk0F7fMGfGq6bHIvV2OGip9g2YxHEEBN4+O309wsRH2EzGrqRl7vvJIX+Bu
	qYlyMGnqt49kJuPBUtL1IC+XFzKGN+XLiSz1H0OjRyOKdaI155kuKYBp4eT77BMIjc5t
	gj+nSWis3YMM4M4ft6zWk4zs0FOGXH3vw8ybBnQ9DRsnAjUrZZm7snM5wLVswyhNkgem
	esAA==
X-Gm-Message-State: APjAAAX++GxKmz8XMVladzAtk0b49ySCrqL6pi1k30fSea131+4NuqQk
	tS4+BgHBI9zXnkOKRb6TJykYAvmm
X-Google-Smtp-Source: APXvYqy1e09y0BktOzvtqdhmkPwHl5hQmVzEU7acRIeWwyo2bGXWqTKCLaOIl6vPz4Yldxyi13cb8w==
X-Received: by 2002:a65:4381:: with SMTP id m1mr40594882pgp.68.1579188069500; 
	Thu, 16 Jan 2020 07:21:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.08
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:35 -0800
Message-Id: <0ec6843bec3e817c3bc62d04adea5fd385307b32.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 26/32] cve-check: neaten get_cve_info
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:09 -0000

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


