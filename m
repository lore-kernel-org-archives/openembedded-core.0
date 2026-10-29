Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4576.1793245550745351692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Dog9yqWm;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365f9a04c5so25249001cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245550; x=1793850350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DjIR6d1mbvxBt4eSiZurhzj/4VZt9kehPSGKU/AmKxQ=;
        b=Dog9yqWmi7KCvrsj7LS1YKT2SATG6t/9P8Mc6CriBLwix63Ev4zPu9gTc0S4qhYI8f
         HoLvREccglsLCR4MFeB3pdoE3PUXhBdqEd2b3b4D3WSNMHeqWOG5k/S4SjFzKoQfPHqe
         ZMAN+dRPs84Gjn0wtYOHGamtBCzqlde/ZcKd/2RZhCSTrSEzVrJrK/Yyjc1kyljzc4WU
         5/g/Ltwknv4wkAOvj+ZgEPmnifzDVUsvAHihaFbyLD1J3xCIkKv+zDFlfaNGzpXL5Z/s
         jzT7FzaQIS2KNM78+4+2XWny8A3ZR5tYEiKaoWI1jFLmWOvQ7Hymr6Wdqt5uwi0t86MW
         RCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245550; x=1793850350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DjIR6d1mbvxBt4eSiZurhzj/4VZt9kehPSGKU/AmKxQ=;
        b=Q6C3EAzQWbTy7X7JCozq/A3fY12mw44mSGQObT6EWUxV2nxLvNfMDEUUdTsYdCxdBk
         G8RU0KRlulm0XilTapckG6s8tH87EPX7HZ+4kaM3FDqCYT32fZlI0KTvgzWCLgCq4NL9
         MhH335hoLFAydsPEvUj/NTSs0Q6iuvXhwbikOZ6hZbb/VXrM7NmTjRB2lmVUSYu6mkQz
         jXoXxinQCcD6SsBM36KeoO9hPn7ZLGGQ4lxCHYqMRdIQTeiXl4Y/7ZywI2ogLO6r3ArY
         WLm0kq17Ap3xqEK6Vc0U4naFmq7m603QiuY8ko0CcBEeF34+FPet8uV3CDOFvjVowSoC
         qG7w==
X-Gm-Message-State: AFq9FYJ5P5q+uLuDqEI/6g1tq4DXSMF1ucb4Gvr8WqLTZQYdL3PSNM9x
	HjONSXzjg0B7oQjwi29sfshQND7dU0F4CXryCxJiBlAEUQ1OqhOUtH2PBAungmFz
X-Gm-Gg: AYBFou2AZ85rJ6tAVgt2pY/j/WHlmBMyvxaiNX9Czvrz5SemU9+v/aj7tgBE2H6K0Nf
	EqirgN3T1WFQGENwF1PIvZW5J34lDwCmVmRr5RQ3DZdQqWYffzHEqMJl+Fxkn3fvB+w2SCmxxdL
	YmW7vbaSg3WFlqkB3J9fl7D7HC8H7T2O5nI1rJBp1Z/Wg4N0l0zOrSRnuIAjjgJVLRHgp9Xw2mQ
	NFmvotaT4bUYPkWZNZZjrTZY+pXZCLoTCKqlErVPuPZlnPMiVq1cc46qlPSAdTUsr/kKvE5ds/q
	HRSQPlKP76EN+jKLNklb6kdg2gpU4wlDU8kj42CyXcZ4T+HWCR6oixNcuDnUNWEkn34Yl8Ds4/6
	ju4QVGVIE6eWVNzD0/EAqUQXCaCi8neyAUUTUtlMHX4DB+i1UWCQeMOUhN3YbuFwXktoAk+yKxH
	8YVopfMGkm7ZP4DCtRRTgScfYq29B4yCjr5cAztWLHZFYCDUUx+K2z09gkejW/AnWfHL3sNnHVZ
	/ZpTQrCVd3RM9EzbetpefhGKvXRMa1MAH/j0TP4UoouARjUGPi/qoZe2OuRp3LChzqYXBDsUOMp
	ZByVKhXBBqcfOBmaHokqWJYQsk+9MhkNDBUADq2i44DXmg+dnOXDi9Wf92k2TKq8efQym7Sv2pv
	oxrfC7PH/w/UMXfMLRvSwMuLw2LFytpgHvrdW5W3BLkHT6d51x7U6kObRrnI88t8Q/HX0UFc6Fi
	aUsvO5hmDMatYLxgfTLr38zB4+X2RTo6+LTqwEdrNG0zy42w==
X-Received: by 2002:a05:622a:4a8f:b0:535:e0d5:f3ac with SMTP id d75a77b69052e-53fcbfe1ce1mr70196661cf.54.1793245549539;
        Wed, 28 Oct 2026 20:45:49 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c16569sm147542096d6.18.2026.10.28.20.45.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:45:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][scarthgap][PATCH 06/07] yocto-bsps: update to v6.6.159
Date: Wed, 28 Oct 2026 23:45:02 -0400
Message-ID: <20261029034503.3153661-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
References: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248882
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    cecd39af8a1ab Linux 6.6.159
    742f73df544e0 ipv4: free inet_opt and ireq_opt after an RCU grace period
    a65f69e0f38ff ipv4: validate checksum_start before completing checksum
    33aa3b7f4afbd netfilter: nfnetlink_queue: unbreak SCTP traffic

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.6.bbappend    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
index 3f33ec991d..7196df5efc 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
@@ -12,10 +12,10 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:genericx86-64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:beaglebone-yocto ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:genericx86 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:genericx86-64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:beaglebone-yocto ?= "297689603c5961261abe13480351a125365ab025"
 
-LINUX_VERSION:genericx86 = "6.6.21"
-LINUX_VERSION:genericx86-64 = "6.6.21"
-LINUX_VERSION:beaglebone-yocto = "6.6.21"
+LINUX_VERSION:genericx86 = "6.6.159"
+LINUX_VERSION:genericx86-64 = "6.6.159"
+LINUX_VERSION:beaglebone-yocto = "6.6.159"
-- 
2.43.0

