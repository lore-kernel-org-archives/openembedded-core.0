Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7803E7F2B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 16:24:24 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c9so6119952lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SiLguPlIM2JfnzryFPFmJpD3s27D0B4c1x6HgpPhCAs=;
	b=gbPcFwlUg/mRSxxP45y8pqnJX5hnBcWkjxvLWShYaQwOArmH89MVdE2smeuuPyCxAz
	9Ezusxf7O6qte+jMLWbq+z+R+kDkkIIs6MR8vNsgdBmShDGvHl83YiwHz0MEBt5i8NIL
	eXEkgkXuxu8KOdxz61lUKDjXOhtr+9UQXvX1FznaVzC6CJSUdz6lfKcBdm/V6mKdFEAu
	DfQfuOQ/sJt2tWsFEmnxne6FrgT70Hu9IScsMlkcdVlBmOqv0aerXrP0mQievDzoYOzq
	d+4IlKvVqLnTsxP/D6AaLZEgbA8IHFQlRLI6++NFHLv1LNlZJJDM4Stx+vc/4XRXdjuY
	mDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SiLguPlIM2JfnzryFPFmJpD3s27D0B4c1x6HgpPhCAs=;
	b=gSvMR9meeBKC7FRZEROe73QXnapJyMFmIl2A7eeV4/xAEAo+V4aSidjD6G4Orw9H5R
	d7plUKdn1BWVn3aulKdsrzYBT3a2PdSmjAVXD5LOQ6+beszYkZuou71yiGzHO8Wp8lfx
	cSXg9JvYGOBzd6vpHC65gegrnWnM71kKQ43Y5tUgohqfC5zm6P7q/NbJ772vUlUYs8kz
	Sp2xo4fCuaUoQby2KUXwO42Pq9Tp0mKmQ2941G8u4f/XVSE6BZ5Hce7sGFRkQl38634T
	5J5gEK4kU4Ek9Makw7VEOr0MYHISi1rlKOE0FBu2Aw9XpbxwhbobLNqFfRHIJGJsrHql
	UWfQ==
X-Gm-Message-State: APjAAAU6puUaIjxpJJKGo2Jca4xZk1hnAij8VEkmULvsr7iijObguo7o
	DvMbaJY56B3EEhCCqVt5pp8xnwz7/Qw=
X-Google-Smtp-Source: APXvYqzyiCRDiIF3i1ku5LEv5bh2go6+8VJOCS+KclpGC6Qgdb3xjvLdTC94x/L2BYfMrSfigaEf+w==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr7821082lfm.77.1566059064559; 
	Sat, 17 Aug 2019 09:24:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v25sm1484994lfg.77.2019.08.17.09.24.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 09:24:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 18:24:18 +0200
Message-Id: <20190817162418.3081-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] git: update to 2.23.0
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
X-List-Received-Date: Sat, 17 Aug 2019 16:24:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/git_2.22.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.23.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.22.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.23.0.bb

diff --git a/meta/recipes-devtools/git/git_2.22.1.bb b/meta/recipes-devtools/git/git_2.22.1.bb
deleted file mode 100644
index e0ed146b27..0000000000
--- a/meta/recipes-devtools/git/git_2.22.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "b379ee9b8c7733d01fc49998148621ef"
-SRC_URI[tarball.sha256sum] = "83bf264bfa4573faddb396cbc7f5518db082f9573aa3c8ea08b8a30d23a46adc"
-SRC_URI[manpages.md5sum] = "70aaf2da41c21b0864e9b1bb8231172c"
-SRC_URI[manpages.sha256sum] = "228da34377a6795619e1822a4fad00c87300135b811643bdb816afe4a92040f9"
diff --git a/meta/recipes-devtools/git/git_2.23.0.bb b/meta/recipes-devtools/git/git_2.23.0.bb
new file mode 100644
index 0000000000..1539182a90
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.23.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "203c238ffdcef76f9bd6c67cfbaf949f"
+SRC_URI[tarball.sha256sum] = "e3396c90888111a01bf607346db09b0fbf49a95bc83faf9506b61195936f0cfe"
+SRC_URI[manpages.md5sum] = "90a72e553de712d798d68b15b57bc928"
+SRC_URI[manpages.sha256sum] = "a5b0998f95c2290386d191d34780d145ea67e527fac98541e0350749bf76be75"
-- 
2.17.1


