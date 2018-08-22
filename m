Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id BF29A79258
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:22 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id s198-v6so2452096oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=c+ztgvyjL/Lo9f51MYQTG9MISTrxyRR8KsXCx/Y4wxOEYZnQKKDJBeD7Hx2/HtIwxm
	62obcdHVNqJePJrV/maIWr4Mq0nr4jfscjiU2u+j+0dFDx6eY9Lq+yt+rA7JNl+w/gv0
	pgSOTEnkFSWZpXw0YXzObNHzvhd3G6wtS0WfhVWjMdGqt/WchdJFbnrYTG1XsoL9Cilo
	EO4LpapAin36QTURFYxRfjkdM3+D21vMY9/+LHGhAKdeVBHaDEZ69HRNF1pMK0MwPmcq
	E3BuuplSIR/+T6QUrHmPBNap8GZL1786b5VTqjId3SBuSGEruVbXqxEycPg6t5NSoPaS
	6+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=Sdkr5fWyuqSSqhz7V05f+rAtj2lFjbwSTetB8XGeRRD8FJzwJA8ul27I6FkmPUhlXU
	WMdKRRmsdc3zXCLxCa45NxvRJz+zkhgEKWwGZZFhT5jl8fUHgAm7YtNp1SS9Gxnvs5RH
	nCK19eRxjcL4KM3zsd+F3iv0hGvyFXGNOFK73+bhfFmySP8Zg9BHXqwGVIYMOOJn6j0X
	rXzuPYB4WVqK4Wx6Bh+hMaIKrOXncKNFPZmG6NCc09wkmt5Z75btGf48qSwxT4YT37Qr
	nFbbWquYwFCARcvLpQ6ceN/HCgJ+GNIX7RKlIfa7d+svUac5Gg1gbe7cu4B7cz5J9nR9
	eA6A==
X-Gm-Message-State: APzg51Bonke8Ek700xqjyZYazwyzIR/emn/aJPqL7HP0QIEDW9bXdc5y
	ER74jHqFfQSplnypMHbj1Q+YzbOyiyE=
X-Google-Smtp-Source: ANB0VdbqYTYkCPbFZIxEufxWVeNctJPS7Bh0EIzMu/Z7OBnjkbSlcTRH1Ta/Z4nlfQTogkfrrw66RQ==
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr3674671oih.70.1534936703668; 
	Wed, 22 Aug 2018 04:18:23 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:23 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:40 +0530
Message-Id: <1534936692-11736-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 02/34] busybox: CVE-2017-16544
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:22 -0000

lineedit: do not tab-complete any strings which have control characters

function old new delta
add_match 41 68 +27

Affects busybox <= 1.27.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../busybox/busybox/CVE-2017-16544.patch           | 44 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-16544.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-16544.patch b/meta/recipes-core/busybox/busybox/CVE-2017-16544.patch
new file mode 100644
index 0000000..8038886
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2017-16544.patch
@@ -0,0 +1,44 @@
+From c3797d40a1c57352192c6106cc0f435e7d9c11e8 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 7 Nov 2017 18:09:29 +0100
+Subject: lineedit: do not tab-complete any strings which have control
+ characters
+
+function                                             old     new   delta
+add_match                                             41      68     +27
+
+CVE: CVE-2017-16544
+Upstream-Status: Backport from v1.28.0
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ libbb/lineedit.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index c0e35bb..56e8140 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -645,6 +645,18 @@ static void free_tab_completion_data(void)
+ 
+ static void add_match(char *matched)
+ {
++	unsigned char *p = (unsigned char*)matched;
++	while (*p) {
++		/* ESC attack fix: drop any string with control chars */
++		if (*p < ' '
++		 || (!ENABLE_UNICODE_SUPPORT && *p >= 0x7f)
++		 || (ENABLE_UNICODE_SUPPORT && *p == 0x7f)
++		) {
++			free(matched);
++			return;
++		}
++		p++;
++	}
+ 	matches = xrealloc_vector(matches, 4, num_matches);
+ 	matches[num_matches] = matched;
+ 	num_matches++;
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 1c85808..a2c0aa3 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -61,6 +61,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-tar-add-IF_FEATURE_-checks.patch \
            file://0001-iproute-support-scope-.-Closes-8561.patch \
            file://0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch \
+           file://CVE-2017-16544.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4


