Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B424ACDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 15:25:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.220444.1697556327211183385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 08:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qe/Zglt/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so34151405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697556325; x=1698161125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJZzyOXbRCeodBneqL6NnUwonSUbPIQpMmcCHMUHAcg=;
        b=Qe/Zglt/VX3jg8PxRJ2A4aGq6XhZiWVx736+vNDQoWZZYAtyHshlbvFtOPCBghg0Sp
         7UNo5icvSMVhV1I8ftLNVN7drAmSOSQwqnq9MEGl/tI65AS/Nqywyo5orh+wJlPxETsi
         EVg4e2JjtwIKhM9RMnbZk71mfMG3UBlwpBPUJKj9lAZcOPqUZ71YgoO5M3E5IJe0IXQJ
         R0q1mPXWouUcmhpBBD5qXwCjjZlt//zKfHVq62yHBZblE77eS6xJKQ31iNujPhaTTe1c
         +r3hdzHCGTR06mXdBLSMtZdINdwR8chLBM9SeAH/RzWfzb8tomEQVTPETF9AbphHH+NA
         AAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556325; x=1698161125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJZzyOXbRCeodBneqL6NnUwonSUbPIQpMmcCHMUHAcg=;
        b=Cwvz30Rz+gIDM1sUNiXHuvJB0fm9Z/DCmKR5sowh5Y2tkSKkW9DiVeir7l+jW89rrw
         LL4RbM/z4MZltOc6gOE8RgBDtJbB3Cxl4/TbrJKOOeo2p4tTsyL1s2SjUKXDooH0G7c1
         kCz6tlx398BZYzAkHvD5X4uj5wy4AbOPUvMtgQjUkSfKI4HRWuPQ5raZeZW8FjFw/ytH
         xa0FjPZ2qZLVgtFy2lVQMLdM5L+yNAXkroekLC7Ozk2ta7g5WF7kXqSPOWNtYTtyO9mW
         9VivkjigjYx0Xi4Rd0S8df6qRfRt2DVzQ9QBIRnNEKNJw2s1rz5LZQjZkR6NG1E7Zm43
         //yQ==
X-Gm-Message-State: AOJu0YwGmin/ox3QCUp2gGs7BJgdXogcHlQuAjyfu5AQ0AV2qSuBhDGM
	b/JfUkUb515iE1thdfIVOyHGCSw8iWk=
X-Google-Smtp-Source: AGHT+IFnW5OQOuwZoMeaAMTAWl+ATdUIO/NsWeX6xCG8IKKg+35fz77MaOEpBZHONIxpXN0eCvVnTA==
X-Received: by 2002:a05:600c:45d3:b0:401:38dc:8916 with SMTP id s19-20020a05600c45d300b0040138dc8916mr2079694wmo.10.1697556324807;
        Tue, 17 Oct 2023 08:25:24 -0700 (PDT)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id n34-20020a05600c3ba200b003fe61c33df5sm10292971wms.3.2023.10.17.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:25:24 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] Add SECURITY.md
Date: Tue, 17 Oct 2023 17:25:17 +0200
Message-Id: <20231017152517.26675-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189341

Add a SECURITY.md filr with hints for security researchers and other
parties who might report potential security vulnerabilities.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 SECURITY.md | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000000..900da76e59
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,17 @@
+How to Report a Vulnerability?
+==============================
+
+Please send a message to security AT yoctoproject DOT org, including as many details
+as possible: the layer or software module affected, the recipe and its version,
+and any example code, if available.
+
+Branches maintained with security fixes
+---------------------------------------
+
+See [https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable release and LTS]
+for detailed info regarding the policies and maintenance of Stable branch.
+
+The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains a list of all
+releases of the Yocto Project. Versions in grey are no longer actively maintained with
+security patches, but well-tested patches may still be accepted for them for
+significant issues.
-- 
2.39.2


