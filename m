Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id F2BD362132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 15:30:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so8664176pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2R9r8Dm7+ZTb5DqM2cZL4Hq9Qs5md5bwv7DZLlJYu+A=;
	b=iQsuZfS7hzFOxqAB1WPz7C96HV8l3WONzxZyTezsDfwgVb1U09mPQ7hneKNtqdJqtY
	bCB4fWc4zlEDHADFp2mrkEm4S+nRXNWSdEVky4WPaCdtuJFjcuBxDsyLXjK6VmVvX28p
	YqDdSJHK0CzHj6a6I6gLoG4fdyQIx0zUZdsVoIJMszaSRWCKjs5OSD2/PaWjJ9CPPjbl
	58BUjP9eQY7u/gvQqMBYzW+Bwok6btKWZ4MvU/qvM8K9IJz7wGMX9GfvuXiDJIecEvVN
	+ZCVZS3gCHObgxuaFZtvoqaOezkv+12OavdH7ygwzxPdo5PlyN/CIEZyPzYJWu6LdjeL
	dWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2R9r8Dm7+ZTb5DqM2cZL4Hq9Qs5md5bwv7DZLlJYu+A=;
	b=I9YM4LJzfFUWooiMBIWiWxEk4FNKUVpHBrXGtVWVAoXLevVLQmYWNkiIBmqMP9Y1JT
	IzJGEo17XD8cWgHOuyWIxJRI7yTxPqtTt2WgXe2nBvDWGoZ7uOJCNqlfEMFB0D/i/MOe
	VKdTasds4oE++2NosYzcKsZbgKMs0bU4mdrSqMczlVni27V8Lw/WyM7op7kXBBKKE64b
	6W/rHID3oyesa2wATv5ptSUgi3EsbMQm4qtFkawTg+Lae7RN5/N2tehIqjEemNKsLRmv
	k2XAqY6MipbKdqPLGf8w9e9b7PrYxKPSYD5VHQoPS7CpofZVKUwsqpSl96sZJfBZVU+P
	5kbQ==
X-Gm-Message-State: AEkoouukngClgXybJX87tyX4zMTWJ9HGx8WcGAilCBl085ghegvg3G+OBxzo7R4F+FGGSA==
X-Received: by 10.98.103.214 with SMTP id t83mr87682416pfj.158.1469979024637; 
	Sun, 31 Jul 2016 08:30:24 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yj3sm27946959pac.42.2016.07.31.08.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jul 2016 08:30:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun, 31 Jul 2016 08:30:17 -0700
Message-Id: <1469979018-18008-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][master][krogoth 1/2] foomatic-filters: Security fix CVE-2015-8560
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

CVE-2015-8560 cups-filters: foomatic-rip did not consider semicolon as illegal shell escape character

(From OE-Core rev: 307056ce062bf4063f6effeb4c891c82c949c053)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../foomatic-filters-4.0.17/CVE-2015-8560.patch    | 23 ++++++++++++++++++++++
 .../foomatic/foomatic-filters_4.0.17.bb            |  3 +++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch

diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
new file mode 100644
index 0000000..dc973c4
--- /dev/null
+++ b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+
+http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7419
+
+Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
+
+CVE: CVE-2015-8560
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
+-const char* shellescapes = "|<>&!$\'\"#*?()[]{}";
++const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
+ 
+ const char * temp_dir()
+ {
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 0cffedd..497d2bf 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -17,6 +17,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca
 
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
+SRC_URI += "file://CVE-2015-8560.patch \
+           "
+
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
-- 
2.3.5


