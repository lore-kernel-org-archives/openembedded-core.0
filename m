Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id EA7B97FC4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:50 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id a10so5592914pju.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QdsOFFcf55iHwXrkU2ltyExxXfLppv7Vff65Lo+JTvI=;
	b=VRYaVwcf2ZzgdXA0x377nCXoQasmsGxVH2xLTZNZmobcRNi3Dci4cLMBAZJoTRD47T
	IlYbJDrtbGBK4/ZHh/bKl8HuUa9sRlsp9eA/jupsbwZ/PbI5JNTMQNJcCgrwy+zzAcL7
	+P+9PMekWSWRcOCS4cHOu37V9uQFxB12d9UhTsH3o9+FmDRcGsG97XHk6u66Mpt+9qzH
	nb3c51Oiust895sfHSEbvBPQZYevlIqr3Wx4b6nwqeSavB5qdpI7yBptMNHALgeMkUA1
	VbT1hfuHPCywtwKUGk/m/riF8sGqnCLvMBioawl3cVrOxZ/+fb4CrKKGdfO96jt8sbl4
	M8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QdsOFFcf55iHwXrkU2ltyExxXfLppv7Vff65Lo+JTvI=;
	b=Y56FGNHz0iPfl+S/J65h1Sz1UICo1yeAh/+M5zCdfDSmd6fc7en4WXXygVp+9v9fJ6
	mC+Y9uOThW3iGfkGUW7PsauR5Wl/s2znTznlXsdqwhpe6P6/DYBlyTmRmMDnMlFs7PJz
	cNqVwzqcbXKngdeAQOTifs1aK4qU13HF32316eu6t9kpMk2E+sEX0Q4NSNBgSCFW7ruh
	UKvRBwKgd2Wruk08IM3jEs80I31hpYN50PlgrGEudoWp2G80Eu4cGAmS3AnlILTOJER1
	JQ7DNIUPgC1lMS9lggsEAyZI3LZA4g5RJhYVqQ4WbL/wFLDMPrElu7QnR+k9JJlBUlOF
	CqKg==
X-Gm-Message-State: APjAAAXgIg5HhF2VKGofKRe9UCs+he3UekLFx4iJDsdNuy8L7hgzAmWL
	SV5W0WhvD+Ci/8yhcpN7eBRepTaB
X-Google-Smtp-Source: APXvYqwpJ8RSu8haDjZ7oAQe1hfzx+D5IK3ggKOOik6XatNnNaxRQLyL28WxhuTnuZO6o9DxJDuqmA==
X-Received: by 2002:a17:902:b118:: with SMTP id
	q24mr26197603plr.232.1574639451767; 
	Sun, 24 Nov 2019 15:50:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:14 -0800
Message-Id: <31a9adf5432c43f8a98b979f5f72956e1fae1592.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 09/35] cve-check: neaten get_cve_info
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:51 -0000

From: Ross Burton <ross.burton@intel.com>

Remove obsolete Python 2 code, and use convenience methods for neatness.

(From OE-Core rev: f19253cc9e70c974a8e21a142086c13d7cde04ff)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c1cbdbd..e95716d 100644
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
2.7.4


