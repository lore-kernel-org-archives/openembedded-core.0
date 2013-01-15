Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDH2-0000Fw-6n
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:20 +0100
Received: by mail-ie0-f174.google.com with SMTP id c11so1002544ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bfKs6gPsmdSL1wfrFnz5id8Tp7iPYKDSBxr7ZvDkLZQ=;
	b=ZVL9nZBSQdW1uL0ERmLEvZY7K6v2ahAjEd+Z3JZJPzsVxBCEyudck4Upzskd6Af/MX
	Gpa6L4OllffMha0xLS8Z4cIOTo1V54z5seU6B122vlsaXYkVfaaOPSzrXSl8nzfcZFJh
	a3Zaxvk/eeWHN/uM0ucBZ5JnXrW85d6oS6cKUZV0NeBUkEWvUOXZQmZRmCjilUDCECkR
	c+e4lbyeUyAnJTnj7Y7+k6gF2aY0fRzMfklRTwUTCy/ANo2lBNgtv2OVhrs7xNwPY9ML
	AjT7THpKU/yCbhNg2H9fiGe1NRpu+ZrrhE4p4HR5ucXkyHeVYYlwE1LE9ZHN30CeVfTG
	22rA==
X-Received: by 10.50.179.73 with SMTP id de9mr2790188igc.85.1358281379153;
	Tue, 15 Jan 2013 12:22:59 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.22.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:22:57 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:46 -0700
Message-Id: <4ce8e013303b307a6a2fa549afda16e2897d3fc8.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 20:38:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Recipes define the latter, as that's what goes into the binary packages, not
the former.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 68f45f5..c8a8c63 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -215,8 +215,7 @@ def incompatible_license(d, dont_want_licenses, package=None):
     import re
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
-    pn = d.getVar('PN', True)
-    license = d.getVar("LICENSE_%s-%s" % (pn, package), True) if package else None
+    license = d.getVar("LICENSE_%s" % package, True) if package else None
     if not license:
         license = d.getVar('LICENSE', True)
 
-- 
1.8.0.3



