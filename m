Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8132A7C9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id o17so22977951wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0CT3UWGfO05tOFP/tl9Khi1ZTZM35jyfVZ/HfSaZflQ=;
	b=WCi0NqY9UvvJQ5aVFWkk2bB31LR3QcVnreT2DMv6cR+H3XoSE499n7AM+hJ1tN0SOO
	G+buu0cfKt3lwobJAmhL5JcMgtxkfNRWXRq40jmKV+PRm4aCXhIzTUVH0QN6wbrzK0o2
	6l81HNPDSzvt8Q5FdB7qRVaJ5gfCs3Iu+vQ5sV6YKgbgX69Gw8k/ygFSFwoiVpq3h/xm
	zELiRsIdAAiY5YMgvWbLJ9ln2CgMeCxamtVQ+bwrCluJ8hNxDDJCnNQ83JJMCzakWwXy
	zvJlschqWGsQBY1JFMtdFO3cBw2IVkGNOVNlVgfVTktQo213Zy7VwGaGJefiBVKQOCff
	J6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0CT3UWGfO05tOFP/tl9Khi1ZTZM35jyfVZ/HfSaZflQ=;
	b=bZeMfUmarJ9MzYMAxqaEolFPtpBOSTYFb6OAI6Q5xYCB4d+BSvNg9vZwgEU1+G3TOh
	gZvG+JXbpCCyf4gTq1GtwV4z/0GEB0gcXAgtXVPeYwgaDr8u7AaDYWx5eHiMhz9c9g/r
	fEXDhYxg771Lk1nnI+fpTvm40IdjNuiskfDuXtvJqAgqx211PGUbf04+wRR/pg+BCScT
	k8rD0qIgllb31iaVW9Zs7NXXFePOMzH7jZ5uVRPLQeDjcpdDWMmD/CBw4rEf0AAg6SCS
	6zgshI1uRLJJr9uOD9DiHkbf8SzrxS2idJ8BVogPgg2ShbJZQSCs7rFfWPEz/Xp3/hsX
	QpLQ==
X-Gm-Message-State: AHQUAuZVQPGPgId1s1jcju++23QzEHJnNxxSxrYkBAjK2suAqdu6Cg9t
	dILVRrIP8YAl8O5BOVg/TJYvycKr
X-Google-Smtp-Source: AHgI3IboRrnhkbb6qX0wlwWpFpe2m+oV9dLcEd/lCURs3LexvszK9yyXr5NR24ZzEI6g2+9gjSDqaQ==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr20810604wrn.193.1550598450001;
	Tue, 19 Feb 2019 09:47:30 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:01 +0100
Message-Id: <20190219174712.60694-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/20] libcomps: upgrade 0.1.9 -> 0.1.10
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libcomps/libcomps_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 500d412340f..ff6820851fe 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -9,8 +9,8 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.9"
-SRCREV = "58be208122179ca6e4edc0635a26f02bf733d6a9"
+PV = "0.1.10"
+SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


