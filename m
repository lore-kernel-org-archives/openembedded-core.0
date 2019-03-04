Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2B27C927
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r5so6472447wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=knMXwA09iYeaJw6Llkxvonx7f+d92JU+n+Lkj3ipg+U=;
	b=CO7H10SFrfvhdIZDAzkPOnt+W6INWhXoM/HvInLzSWev7iEO6aiAwoHCINB9/AqacH
	ejU+rRdyffflHSxC7+/Bo0ydoljegNat19YHKqmNsXFwsS37Uispt91U43nxY2EHM1Eb
	ORN2VVgPm0vUOZbFtS6pKVvk81FQndhTBUag39ozOneNyn58qPnTjtTslsC/96CXWsR7
	CYhFvt14mnWKQgtujg6n79xre7ACRd5B5s5i76TVFVWxNgT+wYIrKlwgPvgEzbEs3XuH
	HKUIQ/xwhSYQDzTtUh6IrUgdqFLJkqIu5l36mx0Ar6nghU6Z1MIhBqcGS3p0utXyMwnS
	ovuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=knMXwA09iYeaJw6Llkxvonx7f+d92JU+n+Lkj3ipg+U=;
	b=qS4ELvrFe4/1vBe0jKwC548Z9LFIvBcE0H2DN+WPysRHxdt+jHMMP2ohILU12kYwfi
	mva+WJ88lQ1VahIwSJ4539kuMGnShNX8ktEc2MucYF77408+I1SW2NV84Kp59c8OpDl1
	HSMQ/F6oHWDPEkXy9+4OvW7enVxQeGfOrTQw271C5m5+7vwa2KDShP3TUEzLafSZTfID
	zHoA06R1h8LdyY27qjJxWv6hz7OGAL1TXlUBb/sL7ibcp4iXu8nIJQcrfSTNlvHHfQC1
	n9qd3Fy+qG7VCh/n29UVoXcm5VmEPwG2/kSJ+vJVSWcuw//rfAMAEgRY0udbf1fTzaLl
	ioDg==
X-Gm-Message-State: APjAAAXoRx/vShQv6A99kU6sDh8gJ94qyyVxfHCS8cOJY6ELyIhtT02z
	0gauUXseZdN4IBq3aO3E6/KSVmxBxG8=
X-Google-Smtp-Source: APXvYqzNHjv5g31wRo9KIijJwAw0qB1wqm38hGJfep2/QQB6eGAYqHzXXQRaqn9+IrsQaXG31fYTFg==
X-Received: by 2002:a5d:4945:: with SMTP id r5mr12860197wrs.295.1551720709757; 
	Mon, 04 Mar 2019 09:31:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:39 +0000
Message-Id: <20190304173144.25675-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/6] pango: fix markup-parse test case
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:49 -0000

The test case expects that printf(0x0) is (null) but for us this it is (NULL).

Use case-insensitive diff as the rest of the tests don't care about case.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/pango/insensitive-diff.patch             | 28 ++++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/insensitive-diff.patch

diff --git a/meta/recipes-graphics/pango/pango/insensitive-diff.patch b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
new file mode 100644
index 00000000000..faaa96133f9
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
@@ -0,0 +1,28 @@
+Do case-insensitive diffs as the test is sensitive as to whether 0x0 is printed
+as (null) or (NULL).
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/merge_requests/44]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/tests/markup-parse.c b/tests/markup-parse.c
+index 633f3e89..36d2c776 100644
+--- a/tests/markup-parse.c
++++ b/tests/markup-parse.c
+@@ -217,7 +217,7 @@ diff_with_file (const char  *file1,
+                 GString     *string,
+                 GError     **error)
+ {
+-  const char *command[] = { "diff", "-u", file1, NULL, NULL };
++  const char *command[] = { "diff", "-u", "-i", file1, NULL, NULL };
+   char *diff, *tmpfile;
+   int fd;
+ 
+@@ -237,7 +237,7 @@ diff_with_file (const char  *file1,
+       goto done;
+     }
+   close (fd);
+-  command[3] = tmpfile;
++  command[4] = tmpfile;
+ 
+   /* run diff command */
+   g_spawn_sync (NULL, (char **)command, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL, &diff, NULL, NULL, error);
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index e181bcb5005..d3357f82de9 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -16,7 +16,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-"
+            file://insensitive-diff.patch"
+
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-- 
2.11.0


