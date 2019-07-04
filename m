Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id C63377DC1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 15:19:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p74so3070941wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FfW2G02OYnJ7TuAh8IXEO7xxdzwbwqtEkjNroaeGR+g=;
	b=VPrPdL2Z9Rv7mdz68YACH518qJNwz3rX9AachmQ+KVOLBqhg5r+Au7A/eCvrHLoF6S
	gevsS8u24nczwFZgcOjzbibfhtajaUNb4eu4UF4q5NFiqf82jTFEUJ8mWW+Zm7W2mV/a
	F7dzi14IucWG5Hi2fKZjTGuNEoj9eKHWyw9uCehkQpb4kPHLBkflC8WC0rB+pt7AFibi
	LUb4gyQOezusksF3pv12w58KlC0VM7tf9kVIgmcyab1bvbpbqJqL9T6y+hTJ0H429Gp+
	jQjNe5PuyvLWTKFDrlsTc10Pxzff3rpipQfCZzX8bZUeNBy6ERiR6g/WRjAMmgyEuzKp
	D16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FfW2G02OYnJ7TuAh8IXEO7xxdzwbwqtEkjNroaeGR+g=;
	b=Pk7N2wiwQGuXnCK7+4UreweavTUDIgvwCP5oWfCO8zXm7tbwr42coJbfnVsrPxX8GD
	CaIS6pJHOg/YYZ9dPwTI0lQOsMLEDOsAfavW8RZ5LTCzvhAbVEOldM7JrNVnGvOKG4TK
	XnWR2ndUyGCHsKdmgXI9IGWgLHuD51gVS+M2wsu0gQYpScCvwzglJbKIQl9Ax3zAFM8/
	1d6sjGQHcewEtc36gJOfYseR38zrwTdKbEiSo+C6aAfKjHqfKXA1MeQ9jeVQfQGOhOR0
	a+K4q4DQrVHt2EAqMvlMnf6NGgDK5mJoMakQTNjpd18oszl9dFdzQ4u1P3FsVm3sA4ci
	uc/w==
X-Gm-Message-State: APjAAAXi5uMsrVBE34hnKw+kwMN4FVxfkLH3hX3rab5K/BuYQIsS3SG/
	gb65KGOfmX3XmuS+0Mlc3K+/t/Z9
X-Google-Smtp-Source: APXvYqz9dz2tvVQCw6pi24VLhBbogfrTZU8zld69wT+xuLszStkaREtHUcdjN5hndiSgsrRIUW+pXQ==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr54835wmh.151.1562253576117;
	Thu, 04 Jul 2019 08:19:36 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	j189sm5430264wmb.48.2019.07.04.08.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 08:19:35 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 17:19:06 +0200
Message-Id: <20190704151908.5094-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/3] cve-check: Depends on cve-update-db-native
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
X-List-Received-Date: Thu, 04 Jul 2019 15:19:36 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

do_populate_cve_db is a native task.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass          | 2 +-
 meta/recipes-core/meta/cve-update-db.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 81071e3f19..6ffa0c4688 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -63,7 +63,7 @@ python do_cve_check () {
 }
 
 addtask cve_check after do_unpack before do_build
-do_cve_check[depends] = "cve-update-db:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index ae8f1a958b..8e553b4f9b 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -141,3 +141,4 @@ addtask do_populate_cve_db before do_fetch
 do_populate_cve_db[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
+BBCLASSEXTEND =+ "native"
-- 
2.11.0


