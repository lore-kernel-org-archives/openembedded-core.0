Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 745556FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 12:52:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b14so128701947wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DiQtAvtttt3Dl8zH/amcYgRV7+CiQJeXNcarKeUgT+Q=;
	b=t20TyyPAgU3sTQCe76ccNTpBnaXOl0alvHr8rxhtrCFl+doYnXpJxxiQPgCMtKNvPl
	AlZ3Bt5JETB8bFO/+zwVxwzw9gmHS4vAtmFo6I0FGWfMrzS44plnT0O2Xrno3CRxMCWq
	uJ52CYJnnITZe46PfLvJNCNGXlone67u/pPIeBwOFlgIWIXgWc7YsQFSn2/UwjyxlPo4
	l+LJtduboEttXO/UZh9pJEvejbqeIsT9lGz51/16PR1wYX2EAAA8PoyXJcCTTlwHrQn3
	z4vrP1+HOVM0Ldv7pWYm4wBWKtGGxmK5EbdQKJUzOV4WmAXw1wsc8gN8e5hUMZdWgBBr
	buWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DiQtAvtttt3Dl8zH/amcYgRV7+CiQJeXNcarKeUgT+Q=;
	b=lA5u9EYUEfdcMqzqZ6lJXPji8LyT50pIX6GwfzeG8q32eNGUgJVbBprBLaQE6htmBp
	ZJJzH2ipI7XMWrVGuNZ1S5BtJTPoRw7LodIf4Hr+QizCbkAL/dlLVRkyayxBKBvh9oEo
	s6Nc82qgCmDS0FAr5KuqEPplUm4xoEnYBX6nIS69ivUikxkdFMoWjDcP5/gu1uVEs3cj
	uqduJBskM3+N6R3MRxL+HMTlLyd0WXr0UmCJIO523ySufL6QHiOKOXpOFJApY9gKxc6V
	lmgMd1tJmq20+aO7NTmrxVxVIWVZyRFQZOecx/MMQYPwZIGHZlVWUtbQwOFgCG6XGy/3
	r1Rw==
X-Gm-Message-State: AG10YOQu0FqDWw4EdtXA5pHyCfKoeYWTBDEOpwAG3XUW/LA1C0WyxiLiphBFsAQo33NCDV6Q
X-Received: by 10.195.12.45 with SMTP id en13mr21735852wjd.99.1453812749826;
	Tue, 26 Jan 2016 04:52:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	hm9sm1352596wjb.18.2016.01.26.04.52.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 04:52:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 12:52:25 +0000
Message-Id: <1453812745-14558-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] insane: remove unused variable assignment
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
X-List-Received-Date: Tue, 26 Jan 2016 12:52:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 79d59d6..500a37c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -727,19 +727,17 @@ def package_qa_check_license(workdir, d):
 
 def package_qa_check_staged(path,d):
     """
-    Check staged la and pc files for sanity
-      -e.g. installed being false
+    Check staged la and pc files for common problems like references to the work
+    directory.
 
-        As this is run after every stage we should be able
-        to find the one responsible for the errors easily even
-        if we look at every .pc and .la file
+    As this is run after every stage we should be able to find the one
+    responsible for the errors easily even if we look at every .pc and .la file.
     """
 
     sane = True
     tmpdir = d.getVar('TMPDIR', True)
     workdir = os.path.join(tmpdir, "work")
 
-    installed = "installed=yes"
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         pkgconfigcheck = workdir
     else:
-- 
2.6.4


