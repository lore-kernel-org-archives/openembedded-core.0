Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 614287BD97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:47:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q5so4840127pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=K6ss2NPiybPoUXsRpSz/8ehqDEfwJEWnF9ZoN2DFzxfTHL53rJkbLzU1tiu2BeW8Vz
	Q5mYAiVDnaVp0w3k9ctecQVzv6PcOTFwfvcmTWOKwtkTfD/bMGq0SEAya9STR44864ZQ
	3M/ioCg9im9jrFqyXFPVVFbIYqkSLznxI7OtptgPhGl+baR1BPdVrQqJeLLuwg56qmny
	CrOe2LSsT1Uc7YB/EEcB3RjpImmqZ/fq5bmXp/ls9nlC8/YCXcLAq5DbQvBywCh+tu0c
	yeyXR6st3iipuMxoyEMDld2ta5rLeuUvhFGWmmVw5rOFBs5t66b5QUbaxDgvAtdbgP3M
	1RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=jYzimQ9a3IbQFfklrdhIzHcXt/hnsOHGDmtQMh8WEt9B4qxEgZbAgM5DSWijf7iI4Q
	3X/Ri15970VHeSGU5l/1f1/ASy2N4TSCqw2BAPh4bt2Llp/h0LzGXlXJMV+cuyzE3nw6
	79cRzhd8Ka2Wj/07J5EhKLD1EOKFWpjC4IJHGBSLFJBxG5LyC3JSxsFPcJW9tpo7xsqN
	ahmhyu4iOt6X2WsP104ncl2nuoNvowLSoThKrdcxyXEr+V+RmguvgeQfhNKRjLoTZrwn
	CLVYlPCWd/lrkhRBHJta796GEvRHhGSd2kCfa4fvKN3l2VguR/qsUjbZWbpBJosVCjJK
	kM9w==
X-Gm-Message-State: APjAAAVxs5Tq4x6FKhwe8Ynvg+m1IcdilCbRcnCGm+WBsbwKY3HtnaV1
	MFx1cN96fHcORjUBQbBhF6VDY9ynYrI=
X-Google-Smtp-Source: APXvYqxh40zZThy8FWtneQXX+kMHqAqOAcF/girOS8dWB9rx5vjiuf4JLf2BEjx3jpXZHsOwBE7o+A==
X-Received: by 2002:aa7:8813:: with SMTP id c19mr19123011pfo.101.1569818880450;
	Sun, 29 Sep 2019 21:48:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.47.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:47:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:01 -0700
Message-Id: <9be34806ddfbe0e8d214290e0623f2b9779a14b7.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 06/54] libid3tag: handle unknown encodings (CVE-2017-11550)
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
X-List-Received-Date: Mon, 30 Sep 2019 04:47:59 -0000

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


