Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04B4E79FC9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 13:12:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f1-v6so2990082wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Nov 2018 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PdQkdTFSHmM09b0kFkUO/Nlo77kIyxz+Me3e9EYWtP4=;
	b=Hb4kTkdC3pFMlsw2tbUMnIjdqJj+h5GYWjafg/CTFb8W4N6620vRB+AdgNc52xtJze
	OxxMCFWCXGW81vPMtH/Y3C4YbPVwFuu2JMiQnRJ6ivqAvBKuThoFPwVH0E351dBw5P/E
	kjKOCWSUAjDVrbba0xP9xIqxgDrxPLhSG1dLDJ8ovO0uA2iFeNqf404HmZ0DQEfIxmXp
	zAIWlAg3VbcyE4JnF97Jf/LtJMkbQ1glZMfCj+wcF4f26mg1/NTwDbGV1419qukvsUOg
	kEr2gKazgIE5ncR6lKKn33MjTDbTvN+vKp7q2qv0G/apBci8JgKJqUMhSa0/QpuZEs/5
	Avcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=PdQkdTFSHmM09b0kFkUO/Nlo77kIyxz+Me3e9EYWtP4=;
	b=KaTYRvEiIjoYY+jR/NMkqnUKyDLKlSHqJCiSCDMeG34dbSSWMqQEPVmx8SaWmmwFbg
	XMeicubuXiH6NKpEFCK5Fmt11zXJBmPDhvQUbwB/4jcyrdf4UH/jykUEydM7mdq9kW60
	D6r+mfFewLZI5Re/5U/uBa8ovSp5fvQSyFA2FyNUZwH7uPdebBXWyGNatomofLKRb+sv
	NRpTdKp7Gd0mC6tdYgbT4UbhbMD9hOURsbogSg9vnCBL/FCiWYacJc7wkef9aHjsQY7e
	ACF3/dz440lh4+uesAsk130ec2cDIkZNjVhOZbNs+4acX0ELXEZJF+eSQx2yoZORW2CJ
	Dthw==
X-Gm-Message-State: AGRZ1gIZrrsJcZozFdKLVuo7HYPu0gQYOgyjErl5dWuc4M3JCBfrkQ+Q
	sQLiVsgQtNf3UccKPYJ7Eaj6DFZG
X-Google-Smtp-Source: AJdET5fSLpV/boYLk5sjSRplb0tHNnWTMubMLcXLx8Siwta4OL1S8t3f96+4WZdmoUD3UJUhdMVzMA==
X-Received: by 2002:a1c:38c5:: with SMTP id
	f188-v6mr835222wma.19.1541250749388; 
	Sat, 03 Nov 2018 06:12:29 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	z17-v6sm4022638wrm.65.2018.11.03.06.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Nov 2018 06:12:28 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 14:12:23 +0100
Message-Id: <20181103131223.28268-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Sat, 03 Nov 2018 13:12:29 -0000

Update SQLite3 from 3.23.1 to 3.25.2 for UPSERT, window
functions and improved ALTER TABLE support.

For a detailed list of changes since 3.23.1, see
* https://www.sqlite.org/releaselog/3_25_2.html
* https://www.sqlite.org/releaselog/3_24_0.html

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.23.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb

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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.25.2.bb b/meta/recipes-support/sqlite/sqlite3_3.25.2.bb
new file mode 100644
index 0000000000..31c9a6f2d2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.25.2.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "bfade31d59f58badc51aeaa6ae26a5de"
+SRC_URI[sha256sum] = "da9a1484423d524d3ac793af518cdf870c8255d209e369bd6a193e9f9d0e3181"
-- 
2.17.1


