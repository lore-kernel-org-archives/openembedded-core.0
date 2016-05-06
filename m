Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7725C7391A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 07:12:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so11661233pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LRCWaH8dik40xbCZjPWGMdkPIMtZ4IcV8lEhjX+jREk=;
	b=GWPE99LvRSEn+CbX8lYKC4R7T//rLW2ooVJNxjfZ2H12FAPpWciXXUVhNFE8mnCctR
	WDLIEL53cq60Hprg5wG7jwYNx+DmauKKkOuMgUDjVtxrtxMNCsB22dmAHTQfoanaWTt4
	Ob+xntF7MTRPehKl69Gg3XDxrRSJQP3BvAY9H/QCkrn2CsqPVJS4lEQyD4v1QLyfUIeE
	zh6ekGiAI6NgRr0ob11r4zwIX4xdEcCdZuM/xA5L+QFoYnBr6E0jfe5OL80G9KCfD9Ei
	oCQoT+p4VwTOeSbvtsEglkvyUQkqOv5+k6laQ1j7GAKB1JzOsV8ZiE90xaHCFz/TQYwN
	qKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LRCWaH8dik40xbCZjPWGMdkPIMtZ4IcV8lEhjX+jREk=;
	b=Mb8+kw3IQQEz12dHbIXyinNV/y9e3BKr6CLbyH1W6lsH/JTOJMxJNJLEhECS3AUk2M
	4vikkWzuLWW6xYVGw/XHfce2U/SwDHvY0H2et7I31hsXBHtmxRdAKmC8yhteMGkPt3tn
	BKeTYd6nWp6+kHw08q2NYpfYXgLS8xb/Pn97hjEh9a8gVy6V1+tLKfozTsJSs67ne982
	tKTHv5AtvAoO/4II6oKdwEfa5s809Y+j4Z1rWneyTXdW4kFU845VZ3SkhOhQSzu1Ag/T
	D0YRI27azyCcoWYPvZGmRZAe/Vs1Vuc+dWcyVGpSGryy9e/Rm0ximnC0u3TZKvom9jGL
	yqlQ==
X-Gm-Message-State: AOPr4FVxIthUUWKuvhGDn6GmRfILm2JIXM6RoxIUGiIdAmCKfbolMjeN3O9CWAhG6590jA==
X-Received: by 10.98.44.81 with SMTP id s78mr17851931pfs.56.1462518722915;
	Fri, 06 May 2016 00:12:02 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q129sm18417191pfb.16.2016.05.06.00.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 00:12:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 00:11:55 -0700
Message-Id: <1462518717-2629-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
References: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [master][krogoth][PATCH 2/4] gcc: Security fix CVE-2016-4489
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
X-List-Received-Date: Fri, 06 May 2016 07:12:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 .../gcc/gcc-5.3/CVE-2016-4489.patch                | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 2ea5952..692758d 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -89,6 +89,7 @@ SRC_URI = "\
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
            file://CVE-2016-4488.patch \
+           file://CVE-2016-4489.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
new file mode 100644
index 0000000..68a0f85
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
@@ -0,0 +1,56 @@
+From 053ec2207203a194d2ae82e2f164009aad3f14d2 Mon Sep 17 00:00:00 2001
+From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 Apr 2016 12:06:59 +0000
+Subject: [PATCH] =?UTF-8?q?Handle=20an=20overflow=20case=20(PR70498,=20pat?=
+ =?UTF-8?q?ch=20by=20Marcel=20B=C3=B6hme).?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+	PR c++/70498
+	* cplus-dem.c (gnu_special): Handle case where consume_count returns
+	-1.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234828 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2016-4489
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ libiberty/ChangeLog   | 6 ++++++
+ libiberty/cplus-dem.c | 5 +++++
+ 2 files changed, 11 insertions(+)
+
+Index: gcc-5.3.0/libiberty/ChangeLog
+===================================================================
+--- gcc-5.3.0.orig/libiberty/ChangeLog
++++ gcc-5.3.0/libiberty/ChangeLog
+@@ -1,3 +1,9 @@
++2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
++
++	PR c++/70498
++	* cplus-dem.c (gnu_special): Handle case where consume_count returns
++	-1.
++
+ 2016-03-31  Mikhail Maltsev  <maltsevm@gmail.com>
+            Marcel Bohme  boehme.marcel@gmail.com
+ 
+Index: gcc-5.3.0/libiberty/cplus-dem.c
+===================================================================
+--- gcc-5.3.0.orig/libiberty/cplus-dem.c
++++ gcc-5.3.0/libiberty/cplus-dem.c
+@@ -3001,6 +3001,11 @@ gnu_special (struct work_stuff *work, co
+ 		      success = 1;
+ 		      break;
+ 		    }
++		  else if (n == -1)
++		    {
++		      success = 0;
++		      break;
++		    }
+ 		}
+ 	      else
+ 		{
-- 
2.3.5


