Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.458.1600122868712451187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ba40yIcV;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f142so2140301qke.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfbYJhNnbxj6IxvI6cjmujfyJ+SHpdSdv4iwmQMMZO0=;
        b=ba40yIcVoIF628VwPV1oveG9cjhuJYOU7fehNk42Uga84HblwbZDe0itb2vMPlwTmg
         o43tmk0kvUrGKJ4v8+tWqg1xKpqEr/uVLAwv817TwYweerUJ7wcFl5PuUtPWeAD+vvVp
         1v3PFj1fpMdyFncZVMRmQxtnv20uQ+SsLQ7dISBP5q90HIbz7iHhSpB3lK+hC7z1lDj/
         flX+hsOX19h04Y+J9Kd58As8om1MiJVKB8qiGdYbrcYYfHslqSIu+VTg7maLgWCfOAXN
         0pUd+ztNaMJelU6umftf1NknDmEIvprfz4SJqKE2ab87xmQAlRjDYSuFSBFT5WS+A7/H
         cZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfbYJhNnbxj6IxvI6cjmujfyJ+SHpdSdv4iwmQMMZO0=;
        b=kszggWrBlhcNoTO+2+oHWKwD8cVdsfHffGiHZdM6CXfRMJv2eE7qrpzVVXoonohrab
         D6rjPSRJCJlWPl4tPVd36nMf+KSc8RU0W+QkufWkZPk/U/R9YGLLu9S+OosUM6nPAAUU
         YasuVbwxG1Y+26lftnT87Jw5yn/8kf4WId7v1Gp4fbfjikJLO9+pWgknILGqXr7q79Of
         SDDmzMy0B0NjRnIWC+tAL3GVP/PgcuMMcHweAD+qpQ/inwlCpfSePgtR0j01iQFE2JAH
         CRmcvbi9gRK6K2kLSwkXlA6IvziG987vEnXsin1rqHvKqxxEl2yL9LSAY5381Vi1WNex
         7wKg==
X-Gm-Message-State: AOAM531JfjaXkyiAskNKJ9XlbtxQUP3hoMO0Qjoqf1QrqAWuOWoGTBtu
	ynk0MfE3Mn7BsLV3DA47HnA=
X-Google-Smtp-Source: ABdhPJw+KPBsT/GYpMQTJlkfV+9WTKKX2hgNBNhHJlLMtqwvi6bYBgRvkQusPjjYfSKKPrsBTrU+hA==
X-Received: by 2002:a05:620a:21c9:: with SMTP id h9mr13835606qka.79.1600122867831;
        Mon, 14 Sep 2020 15:34:27 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v131sm16355770qka.97.2020.09.14.15.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:34:27 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/config: configuration warning cleanup
Date: Mon, 14 Sep 2020 18:34:18 -0400
Message-Id: <8a804cae682f160e5a95c2748c069f6664d989b3.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1600122415.git.bruce.ashfield@gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    7d52eb95f6d ti-am335x: Clean up useless and badly formatted fragments
    5fd04e4da78 features/nf_tables: remove duplicate entry

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index e3a483fbe4..ec8060c945 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
+SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 26f34289fe..2461254fb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "14a8e34bdcc80797e7b3355241625f13d3396ed8"
 SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
+SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c232614c21..a0a55ac569 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "542471b271e827808692640e58f8771ff6bc67dc"
 SRCREV_machine_qemux86-64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
 SRCREV_machine_qemumips64 ?= "18d9d696a89282b3c7b9d3a0b4bbe9d5500e9eb3"
 SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
+SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

