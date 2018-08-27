Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2B59D78EE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:13:31 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id r69-v6so28010967oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I4iGAOvVXe7GKepebvPVOFQ3XN+k1r0uNFsQPPHNzG0=;
	b=x5IuULDwZxdW6Idy52rtBk87cv5ykQ/46AO6L9DmMpYJbnUtHiQemsJYAtRV0wYz/U
	GpGBSL0Bx6k9HeugLh+rD52xTmRsDBB2TvV6XngXZcCgflm6qSht9qDjxMlTVujqk0kK
	HxVMxdf0qxklakIUBSw1tEZ+dKgCaQhgiiBu9gGFjbqodjzGBORlx9cUAAnSX8shYbhL
	YAB/wHCDhS9Y/lcHjjrVJOcDtQo8mwJ/Pb8cSH76UOf0gT98gBSDnfKzACvcfWqRWIXw
	6xzhx2hRJ8F6xodbMkBZ/akhMNxR5rEtUVb0yNQXc6p8INSnQq7i52bYpAKfVRjmadjj
	DQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I4iGAOvVXe7GKepebvPVOFQ3XN+k1r0uNFsQPPHNzG0=;
	b=V5RP20JQzQw9kwj/DyNwQR9NI5oHBzFkQ4EFSsRChCxcrSla1KnPIOmZx4eqKoWcdK
	AVBGcjyQbbjwTPQmQYWmLefW44mY2o0wFpr9krDXWkR7b4grTYm2IAil14py13KwhhVl
	z95HkvGQkuwWjDeWq2OzQ0bDjyoF5hnYDcW9CiGLrSomG/oqabCxC7zF1bVCYcrWvRI7
	WpMF8vtwwCfNM49B/ttnqUY/8AJ1Mii6cnYZ/xidQMZ0zb/gxj3mw7HE3pI2G6wPdOsz
	qP+gwSVxugUKRM9c1YclKiYcZmh/PAGI/JsVu/bYm9IISCKOvPw4buzopKlvmPeD1G0d
	oo8A==
X-Gm-Message-State: APzg51Avk6h7wtYmai3fGN0azehCLWPjH+pbdsFW5Pc0RUsIdKhp8Zx0
	sBxf3g3RsxJJqoyUQGIYrKVspFB9GL8=
X-Google-Smtp-Source: ANB0VdZ0hnt3kTebjEQVOGuttqH1faeJ3u3dN4aEWcUlNnKiNRGtQIs6usnXioIlU/t9YHmmwRYeyA==
X-Received: by 2002:aca:5b57:: with SMTP id
	p84-v6mr13595968oib.20.1535390012218; 
	Mon, 27 Aug 2018 10:13:32 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.180.62])
	by smtp.gmail.com with ESMTPSA id
	y85-v6sm15109448oie.25.2018.08.27.10.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Aug 2018 10:13:31 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 22:43:20 +0530
Message-Id: <1535390000-7057-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535390000-7057-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1535390000-7057-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH resend 2/2] libcgroup: CVE-2018-14348
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
X-List-Received-Date: Mon, 27 Aug 2018 17:13:35 -0000

Affects libcgroup <= 0.41

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libcgroup/libcgroup/CVE-2018-14348.patch       | 37 ++++++++++++++++++++++
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch

diff --git a/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch b/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch
new file mode 100644
index 0000000..d133703
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch
@@ -0,0 +1,37 @@
+From 0d88b73d189ea3440ccaab00418d6469f76fa590 Mon Sep 17 00:00:00 2001
+From: Michal Hocko <mhocko@suse.com>
+Date: Wed, 18 Jul 2018 11:24:29 +0200
+Subject: [PATCH] cgrulesengd: remove umask(0)
+
+One of our partners has noticed that cgred daemon is creating a log file
+(/var/log/cgred) with too wide permissions (0666) and that is seen as
+a security bug because an untrusted user can write to otherwise
+restricted area. CVE-2018-14348 has been assigned to this issue.
+
+CVE: CVE-2018-14348
+Upstream-Status: Backport [https://sourceforge.net/p/libcg/libcg/ci/0d88b73d189ea3440ccaab00418d6469f76fa590]
+
+Signed-off-by: Michal Hocko <mhocko@suse.com>
+Acked-by: Balbir Singh <bsingharora@gmail.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/daemon/cgrulesengd.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/daemon/cgrulesengd.c b/src/daemon/cgrulesengd.c
+index ea51f11..0d288f3 100644
+--- a/src/daemon/cgrulesengd.c
++++ b/src/daemon/cgrulesengd.c
+@@ -889,9 +889,6 @@ int cgre_start_daemon(const char *logp, const int logf,
+ 		} else if (pid > 0) {
+ 			exit(EXIT_SUCCESS);
+ 		}
+-
+-		/* Change the file mode mask. */
+-		umask(0);
+ 	} else {
+ 		flog(LOG_DEBUG, "Not using daemon mode\n");
+ 		pid = getpid();
+-- 
+2.13.3
+
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 7ddc81e..92d7261 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -11,7 +11,8 @@ inherit autotools pkgconfig
 
 DEPENDS = "bison-native flex-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2 \
+           file://CVE-2018-14348.patch"
 SRC_URI_append_libc-musl = " file://musl-decls-compat.patch"
 
 SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
-- 
2.7.4


