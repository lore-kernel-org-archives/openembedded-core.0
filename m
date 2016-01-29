Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A91A77042
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:29 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so4027423pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=blcTtUmQ0juwpDvNlUzsFHw3OZ105yc1V0Eu6Z5/9X8=;
	b=m58y5jZeQDsrAdE4DpJSASf7FMdAERwsdrsyQCkC6qcRjeLlb6W01qBF3FG54PIAxp
	ARlnZG7ZM4547V2/0Q0+sxZN7l1NyJ1I1p/Y8Fc8WfLEIjXareVWnwgeKTvvITa5abAO
	PeEBvxpoWpUTh8WR3aZe9e1qRJ+rrLc8laPcDO0dTHfUqm1EH0rfsNAjhIJSOjAIsbOI
	B5ODFDRqsCctIzd2ydUwo1bZMS59Y4twT0kjSzZ11f+eXl97V7cgS113wFPRrPRRn7r4
	2nW+FQOxQAe55I4lIojhWdxsgFDh1OsmTPvNr2tGyrdBT6TLc7zXoolHqlp1iIacuYDj
	oUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=blcTtUmQ0juwpDvNlUzsFHw3OZ105yc1V0Eu6Z5/9X8=;
	b=aV4X32zAU+jSrOtNXKMDQDRdvQue5OmMWFE9RXObfasa4hJiRERLhlA+oSv9q1LZu3
	dsw9un0pbedGa/2p8oeDlanAzVlBBKQ/vYhPsMuZV56HAsXYJlXZS23vrtgnBbR7JWGQ
	4PZiPv5oL6r5rBWNd2DZbOjEXybNPaNjkS31VbCntU6wjgtyz0vYm+9v2XPFIp+RIqoJ
	w7oJ5JBUE/Bdayhyq/LdbucH11ox1SA8/fGYb/C6YzHZWabZmZ/XFLGzshXE1iUYolis
	Xw95D4980SQive9ZdGKA/kksQwepc4BuUl3N8Waq+dyRa0gm1u3LVSGicEmozNyum8E8
	gFQQ==
X-Gm-Message-State: AG10YOS0OzOJbHYKohlMs8Om3zUZU50mcNYgmT0RCtwoQDQb67uIDeYNJOc5z9l+Pp7rWw==
X-Received: by 10.66.139.234 with SMTP id rb10mr16347437pab.82.1454099730151; 
	Fri, 29 Jan 2016 12:35:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:17 -0800
Message-Id: <615fe8cc0ba2b9d62669c2ef4cf7aba7582d5fe6.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 2/6] qemu: Security fix CVE-2015-7504
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:29 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7504 Qemu: net: pcnet: heap overflow vulnerability in loopback mode

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-7504.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch
new file mode 100644
index 0000000..90a7947
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch
@@ -0,0 +1,56 @@
+From 837f21aacf5a714c23ddaadbbc5212f9b661e3f7 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 20 Nov 2015 11:50:31 +0530
+Subject: [PATCH] net: pcnet: add check to validate receive data
+ size(CVE-2015-7504)
+
+In loopback mode, pcnet_receive routine appends CRC code to the
+receive buffer. If the data size given is same as the buffer size,
+the appended CRC code overwrites 4 bytes after s->buffer. Added a
+check to avoid that.
+
+Reported by: Qinghao Tang <luodalongde@gmail.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=837f21aacf5a714c23ddaadbbc5212f9b661e3f7
+
+CVE: CVE-2015-7504
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/pcnet.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+Index: qemu-2.4.0/hw/net/pcnet.c
+===================================================================
+--- qemu-2.4.0.orig/hw/net/pcnet.c
++++ qemu-2.4.0/hw/net/pcnet.c
+@@ -1085,7 +1085,7 @@ ssize_t pcnet_receive(NetClientState *nc
+                 uint32_t fcs = ~0;
+                 uint8_t *p = src;
+ 
+-                while (p != &src[size-4])
++                while (p != &src[size])
+                     CRC(fcs, *p++);
+                 crc_err = (*(uint32_t *)p != htonl(fcs));
+             }
+@@ -1234,8 +1234,10 @@ static void pcnet_transmit(PCNetState *s
+         bcnt = 4096 - GET_FIELD(tmd.length, TMDL, BCNT);
+ 
+         /* if multi-tmd packet outsizes s->buffer then skip it silently.
+-           Note: this is not what real hw does */
+-        if (s->xmit_pos + bcnt > sizeof(s->buffer)) {
++         * Note: this is not what real hw does.
++         * Last four bytes of s->buffer are used to store CRC FCS code.
++         */
++        if (s->xmit_pos + bcnt > sizeof(s->buffer) - 4) {
+             s->xmit_pos = -1;
+             goto txdone;
+         }
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index fec1061..58ce3b5 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
             file://CVE-2015-8504.patch \
+            file://CVE-2015-7504.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


