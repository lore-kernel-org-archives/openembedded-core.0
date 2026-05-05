Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB7CCD343B
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1083.1778000337924390637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YxhjlCGY;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so79602955e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000336; x=1778605136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIJKiOW4RPCZMIvf386K+dMUkuZv5p40nY0kcYwRfVo=;
        b=YxhjlCGYCkS9QKOEXusjc177Gz/HcgRt6R4pcEHPwjFMJ7+yxulMbWz+XlWh4fuwh/
         2tWKSPGS8a4ZNFJ1jw6XafuhmzrFQ6NCgEMvWyRKA82e5MxJoXqitXf/KUtsyiNeqVWb
         3RIYojqEODdKKViHqHevDC8m9q3El400TH0pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000336; x=1778605136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MIJKiOW4RPCZMIvf386K+dMUkuZv5p40nY0kcYwRfVo=;
        b=ECq5/fDE5TNHEr5ulFuVLQmCUETlcoWno9fGcfsDGZ/ba6pTkrZlK1SrUGk1Vqlezj
         wOfwNnf68GrtQC9+fAog4DSa1BlTzHb5Gol0ezfRI0p3xbmA530qe87ryb1vxTJNoDbW
         MFnal3OhzjcoIkkrQ6RsgOw3it3j7FiYLyl0yhdGOwXNmqrY4aPFCrRAs6TcVCNH2Vjr
         OJPkjgest21vjMZBSPXW6ckkUb4/7HJqd3aTBJSkgV3OclZ5s6XUsnuFePGxZ9HDKjP4
         MQswIBhvQgoUO6659L1wbisC+ztttZiUZFvV3PHPgLyUjHvryHIlad1KtTKzJ155+u8r
         ln0g==
X-Gm-Message-State: AOJu0YwfQg1BEazMzYw0iEJMnTEY7iKKZIjOCF5DDIR4D2ovXvIn751C
	L7DbUm0JBY90VTdnYtkv5steZ8KSCYb7qr5hy2kvt2qwpG3ZbQAiY5hWZBiwrYVYq3NmodxNltS
	PBZ+zbVw=
X-Gm-Gg: AeBDieubtd3up/hvAnoSa4HUg+dQ3gdowdOWS4nYqWnJHwqYFWfKD92Kt6jEZJxMv+R
	F8WxnI34tup8gX44zfel7iZA+++y9lHo1YLr95FKbyXTvl+6QnpE0UW6QUXy4ogJnAmC653nBeN
	Arr2asqQU9j5hMIswNoPMEQAwloVJJdWSwpHjoEERdMGlnJ/N+7o/3Nh/8vMo5P9fHesTDLtKor
	W2KR8y9Hz18PjopeDD34UyBLUHCvoZYa/62PW2JHZwliNCjd6ZAFGewfzdXt3ZsgEnTDRUQklvH
	Aswh8W1FcrR5EU//1+uJuNr4tMTWJwMSlU4CcviCamnBjAiqIXjZtiGOqLvUaaG9oEW/3eT/5dY
	oHWmcmwuBggo1++6qmLxcArG0/p/3+/Rn81qbdoL129/9NS1r6NRg2xz20ItqiC25mGcMAFLrtS
	joAvEmeoX+aOC1jsw4pPAPfvOjA83YR1VRm0WA0/iE8jZjug8svE1RnKCV7CGZVK+BpBpom2xQW
	r321kdf+QZSnnkUFZqzlwvQIzaUZ/xUlikL
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr199745e9.27.1778000335967;
        Tue, 05 May 2026 09:58:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:55 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/23] u-boot: fix CVE-2025-24857
Date: Tue,  5 May 2026 18:57:29 +0200
Message-ID: <6f69c878896b536f5f7b16c566d420e188c82c7f.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236503

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1], Improper access control for volatile memory containing boot
code in Universal Boot Loader (U-Boot) before 2017.11 and Qualcomm chips IPQ4019,
IPQ5018, IPQ5322, IPQ6018, IPQ8064, IPQ8074, and IPQ9574 could allow an attacker
to execute arbitrary code.

Backport a patch [2] from upstream to fix CVE-2025-24857

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-24857
[2] https://source.denx.de/u-boot/u-boot/-/commit/87d85139a96a39429120cca838e739408ef971a2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../u-boot/files/CVE-2025-24857.patch         | 42 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch b/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
new file mode 100644
index 0000000000..99acd5bab1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
@@ -0,0 +1,42 @@
+From 15a46d72515c04d0eeaca19bf0356a39efc9cf93 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@konsulko.com>
+Date: Tue, 9 Dec 2025 15:23:01 -0600
+Subject: [PATCH] fs: fat: Perform sanity checks on getsize in get_fatent()
+
+We do not perform a check on the value of getsize in get_fatent to
+ensure that it will fit within the allocated buffer. For safety sake,
+add a check now and if the value exceeds FATBUFBLOCKS use that value
+instead. While not currently actively exploitable, it was in the past so
+adding this check is worthwhile.
+
+This addresses CVE-2025-24857 and was originally reported by Harvey
+Phillips of Amazon Element55.
+
+Signed-off-by: Tom Rini <trini@konsulko.com>
+
+CVE: CVE-2025-24857
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/87d85139a96a39429120cca838e739408ef971a2]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/fat/fat.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/fs/fat/fat.c b/fs/fat/fat.c
+index e2570e81676..f6dc7ed15fe 100644
+--- a/fs/fat/fat.c
++++ b/fs/fat/fat.c
+@@ -215,6 +215,11 @@ static __u32 get_fatent(fsdata *mydata, __u32 entry)
+ 		if (flush_dirty_fat_buffer(mydata) < 0)
+ 			return -1;
+ 
++		if (getsize > FATBUFBLOCKS) {
++			debug("getsize is too large for bufptr\n");
++			getsize = FATBUFBLOCKS;
++		}
++
+ 		if (disk_read(startblock, getsize, bufptr) < 0) {
+ 			debug("Error reading FAT blocks\n");
+ 			return ret;
+-- 
+2.49.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..5f6bd44ab7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2025-24857.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"

