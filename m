Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3C0605AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:09:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id s144so6424965wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Hy12neHZNAG/ZGCfWGj9U7P5NgNMltX4721WYxFtTus=;
	b=QHIudKoAzycWy0g6xZGIvGZdI+n4jUVzL8CrI/nYNH+iV4/jw/3PBduZTHUZPGpL7O
	He72bZ+WDx14wo0ZmmmcHj0fuJI7GBmgxyKkG34yfZbWnPwTbv8SEyze5YAvAUyJA5x5
	2vKtoZW9z3AIIRvxh2nePIt5qlkPQFbyS3EqoGyxCHiN9UkKs3GQiWTGUZKirM3YeQZY
	ilcxCh2AkQBuqt4/WRvffKH0rsJAW2sdB8jlSj8YkwH0gpHeX660GjWnwA1B/U1SRzQs
	ENH+sRhkMdOnIqy/OSCpzLRhx8zetXt9Zbp4ogFB2UTBrNYAWkd6HQ0uUY2KNnPKted8
	w8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Hy12neHZNAG/ZGCfWGj9U7P5NgNMltX4721WYxFtTus=;
	b=oPMsphc3MO28h8J/Hb1f6fPwTUXUxRsj6cU8DKGQTGkC86oru67UEXgn6Po1qWIEDr
	55swvFSuxsakgSTNJxc4OwWrL1iED2acbdl3rGcaXXw3FHO2SypWJrhhWqYpzbgYMD3y
	jLENSXU7uKeijv6tSGSbe2kGTFfYGJPE0h34JZFvFjYR8aCf0qL89o7BEdslQsNzYPbz
	GT9o2KQUDqyYclIc1Q+eVr/VJ/zDV2vr0UO5e2422KmA+tC6ohvXyoGUKbdQgXd6OfgW
	UDInO003HghLJ0JO7Xat2tcRgoEZ6MQJWoKICRRCXX6NUkx9N17mlFj1s6FxnNITEC5F
	iOSg==
X-Gm-Message-State: APjAAAW+qTELdJMQv+ZMp10N1CEAMNsqavFbSJKxrLqqDafFLKDyGvL2
	8CdImzhOjf3IPDrTmspVWvCADrZb
X-Google-Smtp-Source: APXvYqzXJfYxpHWVAs+LO7C+EgTS8h4ABJYC3vptxmL/cDivg1PtAJD0VNaUZdnIfx1m3qa3Z3X7rg==
X-Received: by 2002:a1c:1d02:: with SMTP id d2mr10750463wmd.185.1580288901100; 
	Wed, 29 Jan 2020 01:08:21 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:32 +0100
Message-Id: <20200129090738.1398-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/24] python3-git: upgrade 3.0.2 -> 3.0.5
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-git_3.0.2.bb => python3-git_3.0.5.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.0.2.bb => python3-git_3.0.5.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_3.0.2.bb b/meta/recipes-devtools/python/python3-git_3.0.5.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_3.0.2.bb
rename to meta/recipes-devtools/python/python3-git_3.0.5.bb
index 9dd753db4fc..36313ef8b9a 100644
--- a/meta/recipes-devtools/python/python3-git_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-git_3.0.5.bb
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ccec14a5c9f18702406122983d80032c"
-SRC_URI[sha256sum] = "d2f4945f8260f6981d724f5957bc076398ada55cb5d25aaee10108bcdc894100"
+SRC_URI[md5sum] = "7555ad89a22f663c25cced5f623bdef0"
+SRC_URI[sha256sum] = "9c2398ffc3dcb3c40b27324b316f08a4f93ad646d5a6328cafbb871aa79f5e42"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.0


