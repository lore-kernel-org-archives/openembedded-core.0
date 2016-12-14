Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1F22E77260
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:29:14 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u144so24996661wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IgekQCYSHiTvhPIjeZfMnFX7OQHXojLWPzcSyXq2WFY=;
	b=RcGtz2MKV4KCXNpPwJOcHa3futmlWwnG+J4E+1kMIy7ALSH4Yov0fIr4PG9fbQLzhj
	LdV8nP0efUkLLRVMqvGSpoVIvZVmlgfVZcRTNoMfM0cFoUBV9Ipf/DayfJRcppudB1Cs
	gw5d/iOZAAfkKUNBEVojbKkGXTTOjeOAGz9Ev87MOdjIAMlMRvWsX1vQSKUVcAfkBg1t
	p9hJxjYVvhLPgugvDW8ssYSQnbT2/brQIniaUB5YIsk6XRZi0f2XP59szdyIY+O/BsAu
	JVoVwN4y/cT9XuxRHMJkcSsBUmBu7Uftl3mgwX20zfM/ry9yukX8+RATTxL+p2h2fj4Z
	EfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IgekQCYSHiTvhPIjeZfMnFX7OQHXojLWPzcSyXq2WFY=;
	b=iQzXN/9IlmsmprO+gyH+8/bwqQMFqrVEvXemHBALWoazCFqQlb4VFRi58kX6rDXl4S
	S3Lid6jgjRXWeKjQGPJUMiMfG6/mn0ZH6T3Eo49G/x7GT4qYHYfbo9FTiT1yPFGikNDQ
	52G0CpiZ3YLJQBZBCfZl5vEFT97POGFtLJHBQ/rWlOh8V6Xlw2EI8jbzxs7sUCYmk2Bl
	qd20k4JBxs2ad93fcivoP0QlhWDvzLxvsZ0AZgKDYzs+WRt1ed4KRl+OjuGN/aAMwfhA
	8Fh2ANfdosXNRrIRnz2+pm5N0ESi4UXw33163E93qNf3NdYD23IVCwcNRzffnBzY33HA
	0uKA==
X-Gm-Message-State: AKaTC01XzjOQ9W/ygR27B1djnuycULd/gylbn/FfQRwOWJu5iGpLelXZk9r0EhfqmTo8gw==
X-Received: by 10.25.27.145 with SMTP id b139mr30738576lfb.114.1481732955969; 
	Wed, 14 Dec 2016 08:29:15 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	9sm10891875ljn.20.2016.12.14.08.29.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Dec 2016 08:29:15 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 17:28:53 +0100
Message-Id: <1481732934-5128-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
References: <20161128111825.GA16035@linux.intel.com>
	<1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH v2 2/3] Add e2tools recipe, in order to test contents of images.
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
X-List-Received-Date: Wed, 14 Dec 2016 16:29:15 -0000

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/recipes-devtools/e2tools/e2tools-native_0.0.16.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/e2tools/e2tools-native_0.0.16.bb

diff --git a/meta/recipes-devtools/e2tools/e2tools-native_0.0.16.bb b/meta/recipes-devtools/e2tools/e2tools-native_0.0.16.bb
new file mode 100644
index 0000000..5483287
--- /dev/null
+++ b/meta/recipes-devtools/e2tools/e2tools-native_0.0.16.bb
@@ -0,0 +1,17 @@
+SRC_URI = "http://home.earthlink.net/~k_sheff/sw/e2tools/e2tools-0.0.16.tar.gz;md5sum=1829b2b261e0e0d07566066769b5b28b"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fa8321a71778d26ff40690a4d371ea85"
+
+inherit native
+
+do_configure() {
+    ./configure --prefix=${prefix}
+}
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
-- 
2.7.4


