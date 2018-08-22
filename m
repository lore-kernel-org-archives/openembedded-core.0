Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id C511D60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:19 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id z185-v6so2044953oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2dwtxnS/G+E9P8NJ+dybZKV8j1I6t+zInrEIlkfTi5o=;
	b=SXHEWI5ftfeCpcbPL6g3c6O8cnIpd/gWSN2svXnzuaFggQLr0EHuTNSvMBGA7Hs46U
	PnSoTumEAv3L/meFASBvX1bD5OUmdpxtKN//HI7katj5UnlwaXqf7HmQnn+FAR0xSPoR
	OlmIGFpgFeKMj12kkCXkzyeeifUCqprk8+t0NNmr+eIyljEklMooNUq+bKR0426PeQZs
	ZtSJz5iOOwNC1kgXMj1H/6GZT4sMLcMw978KiC/HGYfzps9wSMfaof3ApMjeyG1qBkqc
	g5peojkSMpzalTQKlwB+DSi7CdO8eU97UFzxpdGfD4gNiHl7pkvg0Z1nnBbIAEIfjd1W
	Xv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2dwtxnS/G+E9P8NJ+dybZKV8j1I6t+zInrEIlkfTi5o=;
	b=m7j2pMKE5qBNXx9sAG9w98PkQ9yDZ3jj3wFl4EM25NUw/u4JBGolGe5E/D47cTK/Ea
	hqoZe1jf8Ck0UnpwhMc9FGrTEpL8nz8jtOw2qwRhucz++5W16YYDJl7mg8xot4d3BJsT
	oHJX8Avo/o9Ylzylg+cCHf+2EnJUMrG+jO7VrtINbGumktOeJwXQ+PqQB+O5cCkHAeOi
	GCwylfZYObWzyE38SULkyOnV1+Rla9GpHZLJg8rokhN/+Paoxuh/0d9WJyHivx7TaAty
	3EERfyYojwWjDklS3zh5GEdvS/pgL5PdVHsVeOOABbgQ6J2ofuV8Q7uOMtVT2NwDStz4
	uRVQ==
X-Gm-Message-State: APzg51BA+C8O+Yhjoy2ilSbt8HHPzw8FkecqwHPloJhnEa9NLu977soo
	hMLrMNdA/cxi1jHq2hf31412wtR4KEk=
X-Google-Smtp-Source: ANB0Vda1lDp3iydHHS1Ya9WYcaGtRhck4Um8qwA4pWIvzhYw8guU4jePRXsExy7sdYgxe6dHG9aVFA==
X-Received: by 2002:aca:d44a:: with SMTP id
	l71-v6mr3602714oig.199.1534936700831; 
	Wed, 22 Aug 2018 04:18:20 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:20 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:39 +0530
Message-Id: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH 01/34] sqlite3: CVE-2017-15286
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:20 -0000

CVE-2017-15286: Make sure the tableColumnList() routine of the command-line
shell does not cause a null-pointer dereference in an error condition.

Affects sqlite3 < 3.21

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../sqlite/files/CVE-2017-15286.patch              | 34 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.20.0.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2017-15286.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2017-15286.patch b/meta/recipes-support/sqlite/files/CVE-2017-15286.patch
new file mode 100644
index 0000000..954f8d5
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2017-15286.patch
@@ -0,0 +1,34 @@
+SQLite 3.20.1 has a NULL pointer dereference in tableColumnList in shell.c 
+because it fails to consider certain cases where 
+`sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure 
+is never initialized.
+
+This CVE patch applies neatly on sqlite v3.20.0, hence applying
+for sqlite v3.20.0.
+
+Also, removed hunk of "src/shell.c.in" present in upstream 
+commit https://www.sqlite.org/src/info/5d0ceb8dcdef92cd; as v3.20.0
+does not have src/shell.c.in file.
+
+CVE: CVE-2017-15286
+Upstream-Status: Backport from v3.21
+
+Signed-off-by: drh <name@hidden-address>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+Index: src/shell.c
+==================================================================
+--- src/shell.c
++++ src/shell.c
+@@ -3799,10 +3799,11 @@
+         isIPK = 0;
+       }
+     }
+   }
+   sqlite3_finalize(pStmt);
++  if( azCol==0 ) return 0;
+   azCol[0] = 0;
+   azCol[nCol+1] = 0;
+ 
+   /* The decision of whether or not a rowid really needs to be preserved
+   ** is tricky.  We never need to preserve a rowid for a WITHOUT ROWID table
diff --git a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
index e508258..1b82289 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   file://sqlite3-fix-CVE-2017-13685.patch \
+  file://CVE-2017-15286.patch \
   "
 SRC_URI[md5sum] = "e262a28b73cc330e7e83520c8ce14e4d"
 SRC_URI[sha256sum] = "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0"
-- 
2.7.4


