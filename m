Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC5D792BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:05 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id q11-v6so3105974oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=igtZ5yLvwFzXL0q2IDqf8nwTrbcDjg3wyp8cNs1oREK6zzbwDay1U17xnhTP7wPtZu
	8fyphKhyw476POWnPc1cccdADgNSSvCBPGTZVRbOPbBibXAIebbfX0FJ72ILVHrS/b7E
	UvpB3LOL4FE1BSkKUt42OKjY7q0pifnCXm2mjnx245Dy/HRrn3wWcGuKpDPZNmTtzbPK
	3Urr4pINHFMsFo/IKvbt75VJ07ABb9rV5+6RK2wX9JItDgC7Y5fG98ZCZeIqhvEHsiYz
	Xr2aZzECELF1hzr14WCqPgmDKPEp/otfmhwttR3tb8f1CyungweGvAemhVC5yvI1En8z
	MKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d1aSwXMIO/XmlxBdV790Q5kjkUt747gcLsbjB032iMM=;
	b=Us03SqrZYtPENDbpQQEaJgTNexECs9xNWxvjfGoPW3nOykqqczWQ3Ze7Dy5/WsrOLN
	mIuNPncplzZS+fVhkQ/ZkSyda/Q8GsLqGh+b4LEhZ3lR6du3va1emMN9MoWsjQuXxuS5
	7VsTcTvIxgeMXKUZv0ypKX7m/GP+7sAs/ld0zwDIkmAxEK70Qqc82CIeirFZx+0ttEPK
	pMh+uHR27RZS0z+TBCsPD3bHsIC9y1+7KvXFPuYDTGDaXjnrgf5+m/0ILYd6mGrOnuKf
	R4sB8b4wtcwf7UVNPu0u6juSLs6db2s2LXM1+qMBOwoWCKvM683JJG2XdjCH2eTArDGq
	oeHQ==
X-Gm-Message-State: APzg51D6l5o3YVuXbwsn6Z3jUcmNB/4YoQ/GNah+XNmwMzWzpPwEVdOJ
	QHnw/t4LJWZHOrrFX/s1geKDjk7fZAs=
X-Google-Smtp-Source: ANB0VdbjDJkveTsgsEK456ij+vSbCqPa0yyD5zYegwuNoi9laTQqbSkTICkgKQRUWiD7rCWT+CJVVw==
X-Received: by 2002:aca:df55:: with SMTP id
	w82-v6mr4175096oig.355.1534944966841; 
	Wed, 22 Aug 2018 06:36:06 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:06 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:08 +0530
Message-Id: <1534944940-21566-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 02/34] busybox: CVE-2017-16544
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:06 -0000

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


