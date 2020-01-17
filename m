Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id E860F7FC59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t2so24066010wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9CIuNNYNIxzRebvZvTNASAlDqRyR9XXmZ+Jl7hQhVbw=;
	b=BYASypvljDo7zjZMHDaLVgbGdgYL2rz31+M5BJV8jd8qUTcC7KDU/Xp3WuLGYQg+8C
	/u9rO5lWEWUdxpsf+Lm0ZV/q4HXpBV+2ceky6q07AZccnF92b255RtBF6Ge8YpPt/Wj9
	n107J8rtQl69DZSEcJUz08+fuwPaa27q2rfjKYzHFNIk7t3LePZ56S0ZKTxt9DwBVUow
	nq2bZTpTRMu/B2l0yT3YU//Vy/H0k4CrAnomgXJiV61PZmFkiPfI0sGGpiPayJS2DOwo
	Ztkl+LN28J0auIlyJZene59edwkdd+nlizR4sPxHBSVqIa4WbGop/ZZcDYhQS68Sy3zB
	BwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9CIuNNYNIxzRebvZvTNASAlDqRyR9XXmZ+Jl7hQhVbw=;
	b=mPHyVjU2KRSZCqztbmoKYhN3G1nPlYM/XvfSxLSST6/4V1VI6gEg6zYx5G+fY7WC/4
	pGvZP9HI2iVLV5XrAWLP56DPUAgWiXsKS7U5YqEQ7JqVze6VYTkM54vDuRGIPQUsJsWY
	8vm+KdwreS6XSzJv81m7ySX1JGfmp5XMfCgkjVtdp9XsGhDVZtdQylYkpNdo9oyFpfdx
	tVn2PaqzUT6vK8FPOG1veFzpQhK64OPynN7YodbN8WwyUuLO0RhAKe9TtfyTd3/6sVjE
	vywrPXCgOc92bnXSNIq9eIgC2GXJLTFBUxKqPVNWvGCk+LZXxvG8QDOfxqvbFKg9BXnA
	kIXw==
X-Gm-Message-State: APjAAAWNb1JwvW0zouVV4FQsWZ8ufAvQiycMLnvNoM9llwdblacmTPK4
	GleSmM2tbGq+9MmVWh3eyXaiyS3tpqw=
X-Google-Smtp-Source: APXvYqwa15mJKY6YxPY9F4H2M2VyXuYFVs7jk5bZlNhbDExQA++j+11WlRoqEpm9EZ06edwtqOGu6w==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr4942299wrq.37.1579296562367;
	Fri, 17 Jan 2020 13:29:22 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:03 +0100
Message-Id: <20200117212908.32647-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 05/10] insane.bbclass: introduce a warning for mime missing in inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* looking through layers it looks that usage of mime.bbclass is somewhat
  orphaned
* now that update-mime-database is called once only at image creation time,
  costs of mime.bbclass are limited

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 723348fc8e..a2d9318276 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,6 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
+            mime \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -185,6 +186,17 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[mime] = "package_qa_check_mime"
+def package_qa_check_mime(path, name, d, elf, messages):
+    """
+    Check if package installs mime types to /usr/share/mime/packages
+    while no inheriting mime.bbclass
+    """
+
+    if d.getVar("datadir") + "/mime/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
+        package_qa_add_message(messages, "mime", "package contains mime types but does not inhert mime: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
+
 def package_qa_check_libdir(d):
     """
     Check for wrong library installation paths. For instance, catch
-- 
2.21.0


