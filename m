Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C319772A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:54:33 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id pv5so7497874pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6PO6rjGpiQ13S/M5fJwGzXGnXYnjknlHQ5BCvI9YJS8=;
	b=zPohKPHngDZr6CCTg2kBhaI6Ria4jlZaTh076AsBoysyVd/od0FIW0c/oNHpjWPtLH
	AxZAltwvaWDI+F9vKgiifcwOJfl7UF5zmkoASnOB8jd8d/2SxepJzbHxe+QI2PauDBli
	D3ZtO/J1QFMXztnI6L4uLqFWxCYGs/eplLS1NdKQeSMZ9FtP6d4PmuXFPHZ5TQjI10si
	M2uWk0aWmB3T7fS2PQmvYaA3tPwla+7Y1yZR2jaGoryeJ8mdSt8bxrG5BsFY8wHpsEdK
	s03eqOvEVBgrMAElWtOLselCo6CqQavakHM3rWgqb6Dj/FYqHKccAGZk/1Qhl+4Mgo3U
	gSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6PO6rjGpiQ13S/M5fJwGzXGnXYnjknlHQ5BCvI9YJS8=;
	b=MAESiPnFLAJW2joOZejldj/VWeHSDNUViSvHL9mnbqPipjNW8uCqQvzymAk5f2d1WV
	uDpH6tyt5P0dnjSOL2Y/Rig0KuErvL2HxjcKyieG6h40WpMjMH7EVeaypgrZ5sOMqDjZ
	ZGNop14zq9zx0Dz36CCcDSAFj8yEr4fdtQ+tzehS8UgHc7Xzy0kdIZNinvbJD7Dio9Us
	7QJ92BpWllNAcZ1UhzGDsddcDGzOWAy1EGbmZ329bIHGZ2mgENIbDAE3dvV30hQPWzZB
	15XjI7g9k2IjTDa0RJM66/AE0Ya6CM091Sc0xb03RCYQBjJ/CNrumdfcL0Vn7jD4T2g6
	zNCQ==
X-Gm-Message-State: AG10YOS3WajHxqxAMpTB/fOgZ9Z7cnIoqaisTfpGJdFadCJsjjFlhrGH1XKwqT8b5JDpCw==
X-Received: by 10.66.182.202 with SMTP id eg10mr40468821pac.50.1454349274399; 
	Mon, 01 Feb 2016 09:54:34 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	85sm30790130pfl.18.2016.02.01.09.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 09:54:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Mon,  1 Feb 2016 09:54:22 -0800
Message-Id: <bc752de2910aed6928d9ff5c9d83b061e05e891f.1454349039.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454349039.git.akuster@mvista.com>
References: <cover.1454349039.git.akuster@mvista.com>
In-Reply-To: <cover.1454349039.git.akuster@mvista.com>
References: <cover.1454349039.git.akuster@mvista.com>
Subject: [PATCH 2/2] foomatic-filters: Security fixes CVE-2015-8327
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
X-List-Received-Date: Mon, 01 Feb 2016 17:54:35 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8327 cups-filters: foomatic-rip did not consider the back tick as an illegal shell escape character

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch

diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
new file mode 100644
index 0000000..aaedc88
--- /dev/null
+++ b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+
+http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7406
+
+Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
+
+CVE: CVE-2015-8327
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: util.c
+===================================================================
+--- a/util.c
++++ b/util.c
+@@ -31,7 +31,7 @@
+ #include <assert.h>
+ 
+ 
+-const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
++const char* shellescapes = "|;<>&!$\'\"`#*?()[]{}";
+ 
+ const char * temp_dir()
+ {
-- 
2.3.5


