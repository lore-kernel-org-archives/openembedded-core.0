Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E549978982
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:50 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z48so5526918wrz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5FI8KzroMjDs/C8BvoxKMx2Th7gLi4D6RPaPmoLkfTc=;
	b=vKZMQF0tzpb3fYH9nYhtiweSyaiSNvdkM+Gtbk6GcPq7WtZQvwHwxWS1yBpsAFCjUB
	fJ+8amR6+J7wAimrjwx+2mU+IYAz8jrTiQnxgfo+t9affGTnKeoQlJlB7o6VThIGaH2i
	fA1YCh5ARxgSmhMJClwcE8lEVIau7H4iicqZgKzGR8weFFqq8GbG2lm819AOm9JsGtCq
	ibuIrwaaEWsHjvdwiw5d3r/w4Vt4OgmKxxq5RZA5m+hKgP5APi3HeVDjTxFLnWiS5dp2
	AvhAkmEkqFo9sUaFv7Tiybx4JLPJS/hxMNuRoj7ExSZE6H3NVwnjowSFhzsRiuTf3i16
	Npew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5FI8KzroMjDs/C8BvoxKMx2Th7gLi4D6RPaPmoLkfTc=;
	b=VXx9CLhjL1dPKxSlo6wVdh62bLGSklOszYpMdNu/hqigw086SmyldrZ1kNVSbmFH+h
	9zlTz9zrADCwkom/pJ3B1Ela25uG2xUX9NmepQz19y4jpMfpmffEO2dIyceiCLbXXCGp
	LTJkI1GbqQzLEgB6FYJf8fwLqH26U2UMwuWFMgwL23LkTmuxPA1+rmDpfy0HAshJy0e5
	2Zk8CPET742nQ/+vxGN1FV8oZ0mplf/MSasHqMcuuWYoGXPSEAq6Rspp0QyNh5Pd//Qq
	9NksgGOHEPf7WfI4eBgCLPxgh1cAcOUvvS9Ei+TXr/JxjFa2/82TL4BdDeRGrb7VYhe8
	Zy6w==
X-Gm-Message-State: AKGB3mIgJLIS/L7BchyyrqP8vsMsaCcmxIj5qf2x2GsZWbrCfwAHIeun
	N75a8fhAtWjZB40EwYWtCSB6sI/F
X-Google-Smtp-Source: ACJfBotOiqJr00RHpZ4IFyXHmVaFcY1NBy3qDni56WWv8kgw2jGyH2yW6wI38v1upBICqWy8vRRW0g==
X-Received: by 10.223.189.13 with SMTP id j13mr10519350wrh.19.1515427251357;
	Mon, 08 Jan 2018 08:00:51 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:18 +0000
Message-Id: <20180108160021.4715-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 6/9] m4: merge two .inc files
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:51 -0000

Now that oe-core only has one copy of m4, there's no need to maintain two inc
files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc | 31 +++++++++++++++++++------------
 meta/recipes-devtools/m4/m4.inc        | 10 ----------
 2 files changed, 19 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/m4/m4.inc

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index d7c86485771..7790a88d759 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -1,22 +1,29 @@
-require m4.inc
+SUMMARY = "Traditional Unix macro processor"
+HOMEPAGE = "https://www.gnu.org/software/m4/m4.html"
+DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
+compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
+GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 
-EXTRA_OECONF += "--without-libsigsegv-prefix"
+inherit autotools texinfo
+
+SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
+           file://ac_config_links.patch \
+           file://remove-gets.patch \
+           "
+
+SRC_URI_append_class-target = "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+
+SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
+SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
 
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 	            file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
 
-SRC_URI += "file://ac_config_links.patch \
-            file://remove-gets.patch \
-           "
-
-SRC_URI_append_class-target = "\
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-	   "
-
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
 
-SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
-SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
+EXTRA_OECONF += "--without-libsigsegv-prefix"
+
+EXTRA_OEMAKE += "'infodir=${infodir}'"
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
deleted file mode 100644
index 2002594e899..00000000000
--- a/meta/recipes-devtools/m4/m4.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Traditional Unix macro processor"
-HOMEPAGE = "https://www.gnu.org/software/m4/m4.html"
-DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
-compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
-GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
-
-inherit autotools texinfo
-
-EXTRA_OEMAKE += "'infodir=${infodir}'"
-SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
-- 
2.11.0


