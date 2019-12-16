Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D22C07FDA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:25 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id j11so3174267pjs.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ff/S15i2jB8nQJDaYpdbvIQwA8T9LvpAqbxfrmOPTVQ=;
	b=p+BTI0jFHOGFfSLnyA2IFU2lbuBAs0pa7/cujAXaGWiTS02iuxTir+plwozcdWWZ1s
	/l3izxVIgYwj8PEq4rnNRBhxCy7X0wgVIIOnhMYt/uu+h8qOUF6NUhGebxPLKviKdz3O
	RKkLGNnPQJOekWXeVjRFdHgTCDunlQ0XCYVLzNqGZMVPF4AwElve+PHbTjPTzrdrPNyY
	nk1uyRIa9pFHusbaocn9ytm8p5y/UcHZYILot69tj2l3yfiJMatxFOE77MmEelUdTtsL
	SoOQtTLlOXjxrNqRnpriHE2obVUULmCnPx88I25PWIptAGdeqWLHSa1txO1tMgBR/aid
	pDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ff/S15i2jB8nQJDaYpdbvIQwA8T9LvpAqbxfrmOPTVQ=;
	b=msdc9p2yD17Mlq8NaF9haR/Rywl/Bj5CJ1SO3SfIZGAmFZLLvfhrKcZY1/pC6DNQfw
	2HLD0fdt87JUrVEh8XRJR6FIDohSxUt3w+SyGf+VBeriCWVDUsQJEVBwIlMeq6q6GzzE
	bjR55mKFSICzKc6+YCctIlcwQwOVxz+iTDTGCDRT/S/6qnLG7IAyCNLaPU+FwZfP809K
	WK5JDhwc0Olj5fMxXtCRpWgVpa++zddpQy2T8maUBgtJ/y7N/tF1EBW2JrqLc6YLH4mL
	Cxv5om8KWU7bZLqRHTvEyHSkYqyufe9PwTodp0Tknl7lxXXaR8MyTo2wbIP1cwXHJLrs
	xh9Q==
X-Gm-Message-State: APjAAAWj6H5BJ7ti9p8n+v/iyNxy6/rvXTUIAB+ilOkrs+QXq2aYZLyb
	0oMTIIr4zhD5z/b3Hgi/V2EJU0gXV5E=
X-Google-Smtp-Source: APXvYqzYCarwZ4qtd6COZrZ7bFf217PZhWFnXCK12YTiXrM6JQmzEOXIke5LCxoBw7qudFcoGjed8A==
X-Received: by 2002:a17:902:8601:: with SMTP id
	f1mr2802420plo.308.1576512026494; 
	Mon, 16 Dec 2019 08:00:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:05 -0800
Message-Id: <1f3863bc31e03207856f55591cbf17543e188587.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 15/18] cve-check: neaten get_cve_info
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:26 -0000

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


