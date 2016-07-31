Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BFF1662132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 15:30:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so8627503pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mDwIVlM2CcL1fOPWMwuevjdz+3BKgVubUnjGjXHvLOM=;
	b=FqfvOr6xE0Z18THqNc1GiwBN4BtXJSlx25OLyk4pRGmyjzxUxywfY3uOqUml7Whwwf
	nTRt+JtXVAjdAvGVriQt6btkQOYA9h6LcL6fP24faTcS8qW9lIbMtQxHuTgRvMgrgfEU
	rGST+rPuQqsQMZYO7oaGOL111MfVx6YSMK+dOzKq3XOTiOQKO9TImzGZvUaEIauH0Yx7
	9EZyE6DUdeZ7aidJFBMGp+dQ7ZdjWTgEtdAiuxX1SNwllJer0waYGXm0MDQ+1icbl1KA
	nB9BZgb426dDgoLaDIJjXMjTeCKusGt8bK4mnCqpPlxNa0RErwxZOmHh9yY1pflM4Fgf
	Sxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mDwIVlM2CcL1fOPWMwuevjdz+3BKgVubUnjGjXHvLOM=;
	b=Xe/pFRcaT4nDzCL0afW6tLMIVva3b5bLJhj9pB1uXB6FuCh/nPbTIwoNM77ax0I9TY
	+PBbw9b7BqC2NsP0TTkmKnApTrGzxQL4y0euRa0LlLtBTC/pbANgvVoDiDy6qVc8GELV
	kdDiucC/ECyPo1s6SQN5jMIWEJdaUPXE4/ycmrQ7uzLK4VqDS3YNtmhKbY68gkQwy2Kb
	q8xWpmA9PNOxiTzpha/e0bFmw8uFdqWZvdi6pBRM0sIke4/Xjt6YZhPqgvZx687KqBIC
	I6VFjd25YSn+bMAhMrMX7UnugHtkmzls78PFC1r9AfLCUQGkq7occHdtRZGTDJ3vHiiZ
	Co3A==
X-Gm-Message-State: AEkoouuOUIUy8kMF8qHWlEo2vFaklYaw1Eldd/B1cZe85UGwTuWyOTSwl0XT5dZwjq2fHw==
X-Received: by 10.98.17.152 with SMTP id 24mr87294411pfr.13.1469979026300;
	Sun, 31 Jul 2016 08:30:26 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yj3sm27946959pac.42.2016.07.31.08.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jul 2016 08:30:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun, 31 Jul 2016 08:30:18 -0700
Message-Id: <1469979018-18008-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1469979018-18008-1-git-send-email-akuster808@gmail.com>
References: <1469979018-18008-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 2/2] foomatic-filters: Security fixes CVE-2015-8327
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
X-List-Received-Date: Sun, 31 Jul 2016 15:30:25 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8327 cups-filters: foomatic-rip did not consider the back tick as an illegal shell escape character

this time with the recipe changes.

(From OE-Core rev: 62d6876033476592a8ca35f4e563c996120a687b)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    | 23 ++++++++++++++++++++++
 .../foomatic/foomatic-filters_4.0.17.bb            |  1 +
 2 files changed, 24 insertions(+)
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
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 497d2bf..3f439e7 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
 SRC_URI += "file://CVE-2015-8560.patch \
+            file://CVE-2015-8327.patch \
            "
 
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
-- 
2.3.5


