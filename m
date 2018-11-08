Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE2A79CAC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 16:15:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w7-v6so1842031wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Xn5NYQQmTlI33HvM0L5QhD6jVBDtb0c5ypEZ+d0OjMg=;
	b=LOVGHANwFGfTHz74007abOdWhbYfGFtxCqzEvt3m4Db8+JVoFw0W9C7v6OYfir0pxl
	KFaGy5XQ9Kb6nVXROvtOq8chkxSwW4Hkj4gx6mutHNJ+utsnFN82cTHvUrrO8Vb08uBu
	f9xfh69y7Ch65tMji2TxPTbuZNWQJrW/3rKRzrf7AC6MvZaQMzZTF4OoQuKQTOHVsyLF
	kbj0fLDTBqf3lL/cliiuw+O0qSvQsySeaUUn5eGeSLBApAltBo0w/KULktv+e45z5NV7
	RPWUWZu2c2vyRcT1rDJbfSJ5ZmopTN0fLHr9RRoKwiAQ4Upo+KmmE1Ak/7nC2FIqc0qV
	FX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Xn5NYQQmTlI33HvM0L5QhD6jVBDtb0c5ypEZ+d0OjMg=;
	b=CjBVv/MTBJsQ5NpRlXIzx5Wf3H9D8jbqx0AuLkh1T93Sr57/eX+J4CJMbKn1B1ZTjq
	LLWYvYxxUM4GNvS6KU4N/F1X3p2reTcfP6ph2Bk47IWruJKVgjn4Nb9t8uK3Yjwfstaa
	C/8ZIy/EeuoKiryABRNYjjs7+c3+U9JSv/gnRO8Hf4HEtjA4lZiQKZg3i+x+aY2ONk6p
	1Tb1JGlCN03U9Tq10IMkA12obo+RPP5UY/HRvKXt8bq+G5fJyasKMWzLMZU6haCJUQPF
	/ezEUdivrBFciujQFsxEFtwxUeOttFfw5KlUJR6PNDtJbbilt4+xgKTbbef/WLG6Mfen
	c9HA==
X-Gm-Message-State: AGRZ1gLXyv9mZG7+5Jqw2DYG0kgZd3WxlXpba8TPSq80kNEiWmJqBxJ6
	U7SaXi4HsR95KliKaAWnCMp0CEKf
X-Google-Smtp-Source: AJdET5cEiYmYUYOtonSghMDg8OgBm/56M9Gn8Bz7sqNYndNXnV/LsDfO3DzzsXv9YrqXf7AdBrbDwQ==
X-Received: by 2002:a1c:f514:: with SMTP id
	t20-v6mr1787311wmh.129.1541693727769; 
	Thu, 08 Nov 2018 08:15:27 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	t129-v6sm6685747wmd.14.2018.11.08.08.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 08:15:27 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 17:14:51 +0100
Message-Id: <20181108161452.11592-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH 1/2] sqlite3_3: Update to 3.25.3
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
X-List-Received-Date: Thu, 08 Nov 2018 16:15:27 -0000

Update SQLite3 from 3.23.1 to 3.25.3 for UPSERT, window
functions and improved ALTER TABLE support.

For a detailed list of changes since 3.23.1, see
* https://www.sqlite.org/releaselog/3_25_3.html
* https://www.sqlite.org/releaselog/3_24_0.html

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.25.3.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.23.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.3.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
deleted file mode 100644
index 3755761d76..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  "
-SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
-SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.25.3.bb b/meta/recipes-support/sqlite/sqlite3_3.25.3.bb
new file mode 100644
index 0000000000..a7cf6d1b81
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.25.3.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "06db8206bc8febf07141b78ad58595ea"
+SRC_URI[sha256sum] = "00ebf97be13928941940cc71de3d67e9f852698233cd98ce2d178fd08092f3dd"
-- 
2.17.1


