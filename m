Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id CE47479439
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:02 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id z185-v6so3268342oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=cmton8beMd8ZnhTymClKuHT32qzvA6mN+2ndWziGCFlKW4n6XQ4Liv0twn2jE5Mr77
	v3kowdvIK96g4WvwQ/CQ1FXrR8Ks4fkAiir/qyqF6MTRpHU5Hwz4uRvxjO4AgnQngmb5
	aoI/plSqy8NHLFR8RkYGqpapIolYE4uubI7xrowM6N5zCQCES/jaH2WYETHQ3MHS8fZ4
	hc2Tl5iPFEs7huE5Q9prHsMHdZJ2waSpVvgAQqvlIhvnB9J4FX8wjPeX2usIEaseqC0z
	nTUXHvowwBX98okm3RJBv1Kk9gUJnD+OTYbNgl7UZ6BvEx3Ry9URggNCVLBcd0nQ9mC0
	RFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=C/yWviwUczsk6tsria9p0BCgleeRa3/4RGNBiYM3tfZs/j4qIgmY4ZTjlCCpbbYHmr
	5m5eI2PyWC1CG2vxhdV+nhpsBdAy9LEHl2i8k61DzWMrbNQJKz8GRwTV6VFyWFpCriiX
	RSdBx4gai/Fwvy3WZ8yFMUD0BNtGc39KhytEwIcjIqVZ3flAfabF6KfvRVYGeVCxbaTJ
	ofAlpU+Uahp4QgdgJJsH99L5pWvtKbmpHqC4ja0XR9UXlSfQXZIfOTIhk2L+7JBibi1X
	vq9K+V4B/WQX72BJvLx6XYuURo1DNonvWaijtAb+HBW/YMB3VAOCUY1va/dX8fWd/Z5B
	r94Q==
X-Gm-Message-State: APzg51DfoSpJVZWbmoBefJAr2qz0iX7kH+uN/YJJiAHmx+mqwUTG8mos
	FjT/xWtsUJjCdHtmEsNGposi6E3Y3Qo=
X-Google-Smtp-Source: ANB0VdbDYDgai5its1sQSmyMWRkZkTHbpPJtJZ3MQEdZYo3vAd41kZsxOucdEXiIvpLsK0oRmEqEJw==
X-Received: by 2002:aca:5714:: with SMTP id
	l20-v6mr3385750oib.100.1534950543610; 
	Wed, 22 Aug 2018 08:09:03 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:03 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:20 +0530
Message-Id: <1534950532-23850-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 02/34] busybox: CVE-2017-16544
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:03 -0000

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


