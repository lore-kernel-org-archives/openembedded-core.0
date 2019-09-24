Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA2117E26B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:38 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so296481pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=cokXe9RmtJcTdIzS0+wlIYrg51NZsFu7o51qB4WehPP6Fv3r9QC7Wfvc1czwcRwSxC
	pHrK5xYgTR81R1Rn/ak9+FlqDx4sxQq7bLz//ND3mJkNjS05Ys6qrhDzsGljI+L+tumL
	uimfiEgGXbIa9ILmpexlP/+5Ijn9sHsQxt4dAXPAIKmG/tkvnapVzhXa4rJ8hYufX75l
	pFnWOHQvkoACKF5YYuwTu5L8Zve+hUKzDhKpmI+IRM8LLpGrE152JfMMSGuoA8gHiCLx
	IT2K16/dH1dbam7qjFaMF5a2ua0lFIjLIPc/VVru865rw+8MYyi8myGSr4sZXNOKseyx
	m8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=VmdCSxO0rhIQJq7XjspKZxnpSF1fp8pD6MmApYTQgvZxYe4Sp4s53SrHYYYO6+9RoS
	gHM/pw0t2UaMtQc1qIdizXoItlqeh6cmoQZl+jOubo/I1T1a2R3iDY2p5zKPfu5DMRcg
	LjlSUNtNHPt4hI6YQYmBlih1i0qW3fvY5WucRe/pXAuD5EI1j+cwUp/LMPB8XjTKBWZl
	FfF4nuKYd32jtmsHHCUyvMBuqNt1hNwoH13GxKQ04nHBWz2PmuJGCSsyWKNwZwd1sFLu
	vPP4Pr/yXNUZ1ZsXf+ddIA/JfTy+Pr+gsR+O3b3ppqYkCrf8CR74jCORD1VJqC+ZMOTR
	WkRQ==
X-Gm-Message-State: APjAAAV7Z4IZ/Cf+FPHDr+1sHyqH5YCjShWa8lqIHyM4rwmBZVY7YGWd
	JgBf1bKffTeHyKocwjW4hgDzPGEzaYA=
X-Google-Smtp-Source: APXvYqy5s2AsH/9GJObdrmZw5FnUpm659xuLT9/dwSP89fKvm/KJNoBw0zTn4rftfAosdHIKp8DIog==
X-Received: by 2002:a63:2216:: with SMTP id i22mr783577pgi.430.1569293379857; 
	Mon, 23 Sep 2019 19:49:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:46 -0700
Message-Id: <027618ebbac58a05da0cfd27be113195341f3588.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 06/50] libid3tag: handle unknown encodings (CVE-2017-11550)
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:39 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 5090afc1b07e62f70ebcf63a7abb75b8552f0a52)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libid3tag/libid3tag/unknown-encoding.patch     | 39 ++++++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
new file mode 100644
index 0000000..f0867b5
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
@@ -0,0 +1,39 @@
+In case of an unknown/invalid encoding, id3_parse_string() will
+return NULL, but the return value wasn't checked resulting
+in segfault in id3_ucs4_length().  This is the only place
+the return value wasn't checked.
+
+Patch taken from Debian:
+https://sources.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/
+
+CVE: CVE-2017-11550
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff -urNad libid3tag-0.15.1b~/compat.gperf libid3tag-0.15.1b/compat.gperf
+--- libid3tag-0.15.1b~/compat.gperf	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/compat.gperf	2007-01-14 14:36:53.000000000 +0000
+@@ -236,6 +236,10 @@
+ 
+     encoding = id3_parse_uint(&data, 1);
+     string   = id3_parse_string(&data, end - data, encoding, 0);
++    if (!string)
++    {
++	continue;
++    }
+ 
+     if (id3_ucs4_length(string) < 4) {
+       free(string);
+diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c
+--- libid3tag-0.15.1b~/parse.c	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/parse.c	2007-01-14 14:37:34.000000000 +0000
+@@ -165,6 +165,9 @@
+   case ID3_FIELD_TEXTENCODING_UTF_8:
+     ucs4 = id3_utf8_deserialize(ptr, length);
+     break;
++  default:
++  	/* FIXME: Unknown encoding! Print warning? */
++	return NULL;
+   }
+ 
+   if (ucs4 && !full) {
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 43edd3f..0312a61 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
            file://10_utf16.patch \
+           file://unknown-encoding.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.7.4


