Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id C8B3F771D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:09:37 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c13so49562519lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IgekQCYSHiTvhPIjeZfMnFX7OQHXojLWPzcSyXq2WFY=;
	b=BMPOmH6kLh6L48RrdME09HPPkN6mzKQViYcZbAqUHOrtmllIUX4wgsKo833ueZxNL4
	Z7tlZJI1PubCRyqRcyQ169J6BUufPJc0389GMstNgvYk3PZgrCzn5hQsNTHu/pO9XNJ4
	aVWtw8jgIQN1zsn9QR9Q0+Orh/dtYBWte6AMHGYpTAUr3mfBmpbXRJYAEDdwu0B605+s
	j1u6efM1WC+0O4I4Gk5GuxznNOmJLKJfGEElL7PMAbknPGmy1RP+Yg+5Q/lounoXfdjO
	OwEAQl7sGN+ZHFr9b5gN9eZdv8Rs7OXvchfYDttKD+JF1G2ax67uyDLR5IAq8TQ775Wf
	Jmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IgekQCYSHiTvhPIjeZfMnFX7OQHXojLWPzcSyXq2WFY=;
	b=KtxrwlDzaflAKu3FMopf7iPWEdnZqZStf4FZKA6lGhJhJU+CALeYhUwx9IBm95JFib
	vObSpeFWJkAqYgHWoAnwf9Iakk5b1kzhXONzT3Txu6mqjy+WiMli8V+rfum2ENOg1JZJ
	2LfBelqvZZ5ljcEDumfvyUy9IcrUScyKgoT7qntK97gHPxpUHwR3e3boSn/xS0ujypl9
	5UoMBJEyQ93EbQCzRD9Dbeaxrdtpui6T26Ab1kqv2qODXVyo0CaKhY52kZ02C7hQRAvf
	wSxR81I0BCxpAE3GeUjLcA/zIeckTIwVt4V2zqdB38CkiU/5TUFFwFuoPge9Is0kuLmb
	4xHw==
X-Gm-Message-State: AKaTC015qnMXGX9wg7VKJTMbSUb9yLgkQAJ+tgNBSEpmxgSoSM403At7T0cXvk0t1hSrpg==
X-Received: by 10.25.150.148 with SMTP id y142mr4254600lfd.37.1482138578370;
	Mon, 19 Dec 2016 01:09:38 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	18sm3629494ljj.7.2016.12.19.01.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 01:09:37 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 19 Dec 2016 10:09:24 +0100
Message-Id: <1482138565-4120-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
References: <20161216144423.GB6398@linux.intel.com>
	<1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/3] Add e2tools recipe, in order to test contents of images.
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
X-List-Received-Date: Mon, 19 Dec 2016 09:09:39 -0000

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


