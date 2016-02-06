Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF9D77258
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n128so6925754pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0W625vA0Se5E7LmXZWIaNw3Q0TxLTmKg81BnRUPS6w0=;
	b=vozykX5If2zL9gJIukewLtybj5InfW7qNB/FNoIUAWP+TsCNaI4UV4ZdtCASdGOn5g
	ghxqmozQippv2tZsWYiZoVAGQ4Y3ZCfrvTbHpLB7ZaUrR+LqV1pa8BLx7Mdu2bSbzbDI
	p6netJiAc0QnldxiKTZ1gHC2QQGFlQpeMOUwT5D8kjvPlVLTr2E5fxh8sWPbzH+P9sk9
	/ud8mJ9BFK3aXRZGpoRv4nghGPEM8c4mwOBKQWR2Jm7fyDqkLHlQAY4+A8EO7MBObKQZ
	EFnr5B2SB48Je0C9Wzl+5cz3NBQn6s/iOaLhXGGHW5uC1XQwrDCiygxbr6TU2lDvOCOq
	Vo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0W625vA0Se5E7LmXZWIaNw3Q0TxLTmKg81BnRUPS6w0=;
	b=ixQNVhiCm6UN0z+eTilL5VCGW831jtetxPKaiBxW+3YS0zmtQgogU4DKt/xY8tGSOw
	ZXYrBGDAn9bCC6zjx2QxK17FxuwGVkDyeywnwNxHq9acMv15hau0IS0oSKjDZLDBKlv8
	09KM6EcU6V4DLnTVnRBF9CfNeEipmJbEoVkV2ECD6JAjkGnZ7U7zvHAEG4aDkHaB6ZnQ
	3coY9E4u7fxpZ+Z0+4sIjvttc0XBWh8blYH2l6rE5Px9Xe8/CNU81o6VPgTyjdHSEgmy
	OrsRjEyW28IW7Dila7Ptaqr0deRqkYR2BapevzKTxQAHaNCNU0U/tjL7WVfUlRpVqoxy
	jcZQ==
X-Gm-Message-State: AG10YOSM1LCUuGeyAiYRd4wuKY9SeonO/mCxVlgq3J0ot4RB+Z8VTbrXmdYkRfJIfVefGA==
X-Received: by 10.98.34.25 with SMTP id i25mr31097991pfi.26.1454800531198;
	Sat, 06 Feb 2016 15:15:31 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:51 -0800
Message-Id: <259f0c6dbacaa9af2969d4283af639aa7f646b8b.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 10/21] qemu: Security fix CVE-2015-7504
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:30 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7504 Qemu: net: pcnet: heap overflow vulnerability in loopback mode

(From OE-Core rev: b01b569d7d7e651a35fa38750462f13aeb64a2f3)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-7504.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch
new file mode 100644
index 0000000..04e6183
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
+Index: qemu-2.2.0/hw/net/pcnet.c
+===================================================================
+--- qemu-2.2.0.orig/hw/net/pcnet.c
++++ qemu-2.2.0/hw/net/pcnet.c
+@@ -1106,7 +1106,7 @@ ssize_t pcnet_receive(NetClientState *nc
+                 uint32_t fcs = ~0;
+                 uint8_t *p = src;
+ 
+-                while (p != &src[size-4])
++                while (p != &src[size])
+                     CRC(fcs, *p++);
+                 crc_err = (*(uint32_t *)p != htonl(fcs));
+             }
+@@ -1255,8 +1255,10 @@ static void pcnet_transmit(PCNetState *s
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index eaf8daf..bb27034 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
             file://qemu-fix-CVE-2015-3209.patch \
             file://CVE-2015-8504.patch \
+            file://CVE-2015-7504.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


