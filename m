Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32F9577D7A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 05:14:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so12879876pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 22:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IqnY3BhJD0VO143jqHI7hiTdK19Qht8OJlTXVb7lHyU=;
	b=Imzc+y6+uzbXS5Ouz/7aZjdbSrrY0L2e1y9r+iASM7SS6y0RtrOd30idHIjKGO1ioB
	mQrU9vNSAETWUDS4x2QovNgA+1D7ej1mtkzc+yAE5J0ltbh3iP2NkEm/eV6EQ/vvGwfY
	e0ck26VYtcbO7F85C4i3O38wd2lpVP7lWxoKkiVPl0CCt3ok4EXRNOD+zUYSaBrZKG3U
	tMX04Zw5TZECbTc2RCw7H49dgQ2czeYW/e2/U6bkY7E4I+aIVGu2JpuOV6bS+/if5N5c
	66s+VjTA1reu5AyEeMeOpLR52Oxa8fv+WjZdF03MNXwGV6zEuaOezh8ylYXVAttE1cVy
	GBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IqnY3BhJD0VO143jqHI7hiTdK19Qht8OJlTXVb7lHyU=;
	b=hK29TBXMI/3alZ1JOHts/x/XTXsCJHlB82/JOg9e9z/Pqu/qdT16VkdWOchomVZA1b
	eqRSQSWqnCCoRibCbei8sP4DS9xCzQ1Az4Z1VqsO9tXlR7ypr65VtHcWyA7l7Ti24+EH
	LBGY/Jo6IhLRHVybrCdQc7G6sJSVpoq1QQC8KEyZO1E6F50UX8zE6TKWCZ/w4twvIuFA
	v0zSSFroYU4qk09jsapSiMDaQqd9HjeppBlEHE6VnOCY9pOc3iNCnZCD3mMsEJhdof3U
	XCJJCECJjnBfIIcdosawYxC2uiy+VNT/yVITeAuL79gvVC8s8+b/7auYh+xUqcZQohEX
	XAKw==
X-Gm-Message-State: AFeK/H1DkdHRNZcpiI/nNPAmUOJ+n9nUVCkB/DpH9Kke2G3CwTbXMNG/jEMHh4/K8RV1nw==
X-Received: by 10.84.149.102 with SMTP id b35mr47601997plh.3.1491542061270;
	Thu, 06 Apr 2017 22:14:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o194sm6646123pfg.66.2017.04.06.22.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Apr 2017 22:14:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 22:14:09 -0700
Message-Id: <20170407051409.12795-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] musl: Upgrade to latest tip
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
X-List-Received-Date: Fri, 07 Apr 2017 05:14:20 -0000

* 54807d47 aarch64: add single instruction math functions
* b6e1fe0d fix strptime output for %C without %y
* 834ef7af fix processing of strptime %p format
* 85dfab7e fix off-by-one in strptime %j
* 9571c531 regex: fix newline matching with negated brackets
* e6917ece increase limit on locale name length from 15 to 23 bytes
* e4fc9ad7 search locale name variants for gettext translations
* 16319a5d make setlocale return a single name for LC_ALL if all categories match
* 0c53178e fix dlopen/dlsym regression opening libs already loaded at startup
* dbff2bb8 fix POSIX-format TZ dst transition times for southern hemisphere
* 74bca42e s390x: fix fpreg_t and remove unused per_struct
* a393d5cc precalculate gnu hash rather than doing it lazily in find_sym inner loop
* 8cba1dc4 fix threshold constants in j0f, y0f, j1f, y1f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 39745f5bfbc..a88bc4d424e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "cb525397bb053ea49cf160965477a17b17286eb3"
+SRCREV = "54807d47acecab778498ced88ce8f62bfa16e379"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.12.2


