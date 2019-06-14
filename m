Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 644437E920
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:33:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w79so911645oif.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m/tYMnH+ebEobvpRebvfY+zv3WAfQo7Cj2NWBwAGZRY=;
	b=YztwCd8w2HdxkCLQN4kUnu5ASeBOXmdtG4QiJZjK+chkejZdGh4b/HECWSfMrjO6po
	9CZxdceONCgVvPBimnJXIgTpMwOUMlfD+zn2FHAvdpBBTadV/NMuGb+fR3XN2sVdAV2Y
	2p2+mKtsUi8AQaKfzrpX6sB4NkpLibt8S2TrR4CsmZSDl/C5/IRcKbd+8Cyf/CeBia/f
	P50r62rBtnKDBpZBsurbiy3gdTa3j13wyyC+crvqZcCY4OMieJySJm9e3RWb+0gP0iUS
	q225ON8SUeegNrZMuqzPnZbHnhnFxpJOQPRRzI+QX0QQylCzv8Oxh7u5rLwKpNLUv/wU
	US0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m/tYMnH+ebEobvpRebvfY+zv3WAfQo7Cj2NWBwAGZRY=;
	b=uEt4eDOBXR2gWrHcyEG5/1tKaF6ofRaIZv8et+RWU4cx/8MJ4aUVkm2MVTj4R8nXin
	2+EnYJkRLLcK/6NGRE4dSOm4BDZlx/XvqyJUfWLE6RTIPRtHFFrw01sgKtrSL+Fresmf
	iHdU/yitcNRiLJdGYl2w6q+G+vRowPP7o1/jQIWnTI8jC0sxf9tIpDitTnXJW13UmPiZ
	3SXfPPcoRSJznPc2peYfxfsYESiUpNDDCGdC1u/6LLf9Qw60ykWT8y/2TG9UCx8mnLfW
	h/mgwzIaxFXVYheUQ+jlpTTkRBJYOCpbovXoVzrMcLWuBniF3UkFQtoqQNuYkcLNed5o
	wzIg==
X-Gm-Message-State: APjAAAU3Ta9qN1MXr1Mu9KDVtrM+pbWpyV8LZc5m9Q8WnE/hnB8DUmVA
	F48k4ymf3OKwfnAXlkkpzBDneHMA
X-Google-Smtp-Source: APXvYqw/IznT7LU858w1wp4A3m5yfHhjnlP4WnaI7tdxKwxad4RrcDN8ftSdM9ShHFQyKqYO3junFQ==
X-Received: by 2002:aca:b9d5:: with SMTP id j204mr470641oif.116.1560483182207; 
	Thu, 13 Jun 2019 20:33:02 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	q3sm708383oig.7.2019.06.13.20.33.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jun 2019 20:33:01 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 22:32:40 -0500
Message-Id: <516ed740f966e05eaaa349d47d9b97d7dadb2790.1560482696.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560482696.git.just.another.mariano@gmail.com>
References: <cover.1560482696.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: Stop udevd to run ptests
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
X-List-Received-Date: Fri, 14 Jun 2019 03:33:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The util-linux's ptest uses the SCSI_DEBUG kernel module to create
virtual SCSI disks. The automount feature of udevd will try to mount
these disks by default. Because udevd controls the mount of the disks,
the eject/mount tests will fail or be skipped. This change will stop
udevd before executing the util-linux's ptest and start the daemon
again after all the tests.

This is for eudevd only, systemd-udevd doesn't present this problem
because there are no automount rules.

[YOCTO #13301]

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |  4 ++++
 meta/recipes-core/util-linux/util-linux/run-ptest | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index df1d1224dd..1d279a58aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -318,4 +318,8 @@ do_install_ptest() {
     sed -i -e \
          '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
          ${D}${PTEST_PATH}/tests/commands.sh
+
+
+    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/run-ptest
+
 }
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 03248325bf..e135ee583b 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -1,5 +1,14 @@
 #!/bin/sh
 
+
+# When udevd (from eudev) is running most eject/mount tests will fail because
+# of automount. We need to stop udevd before executing util-linux's tests.
+# The systemd-udevd daemon doesn't change the outcome of util-linux's tests.
+UDEV_PID="`pidof "@base_sbindir@/udevd"`"
+if [ "x$UDEV_PID" != "x" ]; then
+    /etc/init.d/udev stop
+fi
+
 current_path=$(readlink -f $0)
 export bindir=$(dirname $current_path)
 export PATH=$bindir/bin:$PATH
@@ -27,3 +36,8 @@ do
    }' 
 done
 
+
+if [ "x$UDEV_PID" != "x" ]; then
+    /etc/init.d/udev start
+fi
+
-- 
2.21.0


