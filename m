Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 446177F21B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 00:34:52 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t24so654476oij.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 17:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8I5ycyST5ZJ0ZzRZEsnKHEL9Nj+ju4OtPi60rHWMQ4c=;
	b=eI44CDm+ZVRA8Uw8az23z4JqwmtAovSUa5pfpL6ej0ArC+nYs0j9WMfU/5YtPs90Ka
	eCFwqpzoFnWD2crrYv2pvVcu7PL1HEt3qGwXBPqDaTtuydLBt1Ui3wkW1BRa427CTglY
	RPnQFkzw3ZuOl1H+z6ZQbuj/8Dqh4vKkUvD1QzhfKg8ikWGtPvW6gRtORZEkeYnTKo4r
	r3L5PVZXA+C9667wAz3oW/1CGWug++ZLYQw18PAsrPT+7XkIL3SKk4V4cMt5auXjUaFh
	TrVz/srEp7GB7zdQQu6NezZSbj/KaLKuJnhE+am2ctZJWYecZf0lF7YSoXOdVw48s6aq
	oBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8I5ycyST5ZJ0ZzRZEsnKHEL9Nj+ju4OtPi60rHWMQ4c=;
	b=g5lV2eL/zEY9ErUe0BFPyW9BZ/m/zTHfNGNXAuh061c5j2HLhQQnEUoClmShK1rOJg
	NoswIhVEmHCRCFjiV2htHnglfNGqo/FhMQ5uzqmxJ6V4TKPvZQTvwsz+j+r+p7e9eBxw
	VWemd7sspqsQUZiK3CL2385NFG8SWgWiDeEkFVo8WTGAqUnVpNovXDY4BkgSFCS2qjoZ
	G2LrPIbIochpiRpyD+O/WS+T68EED0hEeu5EEYNhdh4Yito4seA080vD/oaNNwWYRj5s
	s7AUd1/midFttqQsuAKguLSEu5x/5V2c5XTMpeHtv2nbStjEklhEvQCJnFs85JNrkGFL
	i1ZQ==
X-Gm-Message-State: APjAAAVglKDuqmeWCL/bmn4hr43v28io7g65qZ7OFmixbaQZmimHjN5/
	Eqh2vLfUMheU3YGk+sS8+EI=
X-Google-Smtp-Source: APXvYqxc3HP/tDEftGMSWfG46fHuVd5xSXI/oi3UI3a9EL0PqKt/yy5NDRjF0mh8XMmQBTDk3N2eeg==
X-Received: by 2002:a05:6638:143:: with SMTP id
	y3mr2250183jao.68.1565829292872; 
	Wed, 14 Aug 2019 17:34:52 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	r20sm1906662ioj.32.2019.08.14.17.34.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 17:34:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 20:34:50 -0400
Message-Id: <20190815003450.8341-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.19: make drm-bochs feature available
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
X-List-Received-Date: Thu, 15 Aug 2019 00:34:52 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The other active kernel versions have this feature available. To
consistently enable the same video output for qemu, we can cherry
pick the feature to 4.19.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 52deb3fc86..8d4545039e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index be25d075de..2255a7b959 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 7704bd3e55..1a542d81cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemux86-64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemumips64 ?= "ca47368b698795cd5cada84dbfcceda1f47da1aa"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
-- 
2.19.1


