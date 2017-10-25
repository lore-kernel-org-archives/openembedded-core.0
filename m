Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63425775DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:55:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z55so841475wrz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PkduZOEquFD7jJ5CM8oYJjseGDRhYSvCVMeUjYnp7fE=;
	b=QkkI9fEWjkRK7Hkl44lpOwvSRhTVB1zAcn3jF4YbG/f33UT99PKa6/Eu/eXxF892W8
	5hT0PX+mrHhoj6yr/QP6uDcqGUy9Rmf/FTyCZjKS2mQ135Zx+98Sf2Mh6hNRji45ec+d
	J3G6XrgzA7fgQhLYjyL4BIFh8MjhR7CB2+ZMnJJrjsGPZ9mcntK5ZSEdgKEIr+6605l0
	ZvuSQPFvs6gHjBx1uA6jv9uxW5FLVxnQLt/EqiRVm2k4CKns16bFTrXnU/HPoldFv/G9
	B3FyJ95fdE02rK8MAA8IHj4PbUlGqcB3bAnkpWD//2wZNibH+Pr2jqBwZD1iNEvjL7Km
	fBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=PkduZOEquFD7jJ5CM8oYJjseGDRhYSvCVMeUjYnp7fE=;
	b=Rnts4PLVVZiegMeshNkS+6Au7pnNX8qmlcyNKKeJB2ldXBZW6C7ARCrK9O/brGpp3a
	ps4mg6u9P+78SbskvtR11pl/5LRyQb9epmECXR5Aq09tp1GBrAoYb3TcVenayJOJh8H0
	QN56+HnXnM+Joy9LZ6crMsuZGUhkju/V8RgugH8F9eQ5aEGEVizM3lziTuawJ+aDjmGx
	WNhCkq5Wn0LY5goO6GKd5f5as2yx0vTXLBTTztkereJoZcGT4GaRT+JoaDXTwBqqEmdM
	xLqCGnbj3aTWBWwQ4mP4amqe/76rJ7aJ7H4Ia+MbJPQ94vOzsPboNkgmJqT5ECFxcyUg
	Fn1A==
X-Gm-Message-State: AMCzsaX4mYnreeDXsWjvW5pifSUdmRWIZhqp8Tp1mzn5Kqg+/v0g3MED
	9MLWm+DnZfIRWNDO32DfFi2etb3q
X-Google-Smtp-Source: ABhQp+QsI6PISFaBfNMg2+F2xHi/covXCuLjLOuGxv4qypTfkxOdn08XyNGgj3TVic/ptcu8rXoBhA==
X-Received: by 10.223.200.134 with SMTP id k6mr2887615wrh.159.1508954125069;
	Wed, 25 Oct 2017 10:55:25 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id v5sm2634923wme.5.2017.10.25.10.55.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 10:55:24 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 19:55:09 +0200
Message-Id: <20171025175509.32310-4-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025175509.32310-1-thomas.perrot@tupi.fr>
References: <20171025175509.32310-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 4/4] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 17:55:24 -0000

aarch64 compression

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-uboot.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 87f02654fa..06d293039a 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,5 +1,5 @@
 uboot_prep_kimage() {
-	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
+	if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
@@ -11,8 +11,13 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
-		linux_suffix=".gz"
-		linux_comp="gzip"
+		if [ "${ARCH}" = "arm64" ] ; then
+			linux_suffix=""
+			linux_comp="none"
+		else
+			linux_suffix=".gz"
+			linux_comp="gzip"
+		fi
 	fi
 
 	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-- 
2.13.6


