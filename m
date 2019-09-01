Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id E6C6F7F41E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:29 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id i18so5923171pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=R+kphv2Of8iJlstmOMVmzZpJZXFCyzu5LEsVh3H9srdQcR44YTg9LwyxeY1zqt4Hn4
	X8ztYKGQTOujSFpttQC2DXf81uhMo/ED3zVqmmI8pT64wZLh0TZ+yGIINFq49YrLCpAA
	MY083o1WBJpB5bQdX1+uHyRLBFQYHQiTwVZHA++uULdk4fJU5yVk2p8XiBD6506P+T7v
	V3SAO/HXS/KHA6U+D04WdJcHnh1B44q3tbdoy8+lsWlsD+337PXvnU6EeS9qIPDZL2V9
	iuEkONNe42eaV921IA+s8ePkEIqcR2hbOnTJ2e3r7LadWxVwTJfrVYZwq7RXipOOoKNY
	85VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dQOskvLO4+Pm/JYq2/qiTkf+C0DW09nZSD+JVJDcubw=;
	b=hsiaozFMkJkXhuVg21/XCJCLSdA7AHOwW5Kf+qUZiVPjfgaFlwwMS/uMCmzSXuSLXJ
	wo+Fesumnu936xuc6jCzD7TIUjpKND3Put69IA5PAt8Hm3r7crbK/P3PVGRwh5LVkA2G
	E+MoaGTjdiCj4HkBBPAnKj3uo5W3Kt9nTlXdhGtFjAKLO7F3z9JkOwG/Ek17dnBbVrHt
	btHrhK23poPCuBCOlW8SpOhbW23PWC44XaohyIiIXm73xFN036IPQLC+rDZY0jc8XCAg
	ZFLedrsiylsJS/Hy+ecTO3B9poqeU1dhSaqSxmPskrtR4+AKo5D343dXOJKgcoJpQvJl
	FJVw==
X-Gm-Message-State: APjAAAUFkCaAaVxiw97JwIq+koI2Uj1FLRSjG0IzFK70ZDRhVfi8VzR3
	P0XcvgCFST5QQcwInpI+KwgA8S33
X-Google-Smtp-Source: APXvYqzXphYYP+d7D6dOMaZ7hL/KpmsJMfka0LGjF3KIQfrrMJB3QMVfRwRL559iFff9o7bfaqWU3g==
X-Received: by 2002:a17:90a:c501:: with SMTP id
	k1mr1998410pjt.37.1567348590866; 
	Sun, 01 Sep 2019 07:36:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:44 -0700
Message-Id: <027618ebbac58a05da0cfd27be113195341f3588.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 06/43] libid3tag: handle unknown encodings (CVE-2017-11550)
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:30 -0000

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


