Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AA1CE7B0D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:23:55 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.34912.1725629031725698372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D/DTysdg;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20551e2f1f8so19769505ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725629030; x=1726233830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNpEb81H7VpS9V50XJ5/o/muoEXuPyaRKZOGeNSvybo=;
        b=D/DTysdgHcoBnHyPzEic6Io3bHMlr4uqzdYZHAe3UNLmDETO6Z3I88ebBYMqrCs4U9
         o/SY9e1QU9aJ1w8rE8YnSZDYkD8jvfiRw0PpRKhawJv/qHcThdyk/W84BkZ/5EqqeNsE
         haWJzWvBlJiBZAqGOu11hVqgSVnqOHA7vww84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629030; x=1726233830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNpEb81H7VpS9V50XJ5/o/muoEXuPyaRKZOGeNSvybo=;
        b=uz9ayL+uNW5s+GhQHh9pbDFvb8OJc2GPFu1d6ViDAWSV2O7GTaoEdSArMFh7ch3cyp
         vY9u6XAOSbAIrNPH7EmEKtVHiSjJKHii9XSAC2DDsFZ+BAgJUIsioxwlKUyEgbKh0Opl
         gHoIaCTi86S+wNgLLE6GRaSYYfXqmRYV3qDrlxpC7OyJyydmK8bFbKiqz69RG9qkbFt9
         aUx2Ddo5dP8IMyW88B2xT2IkP/v2Ub37rr4DfDKS6IFGEK2/X06Sqka+rxf9XSbzQPID
         aXT6n9lGcTEUg34p/JwZTl2Jqj+Dy6/OYX/m9cuZ5DZi/sC1SCr1mi0vPNLLLlQaHeUh
         Nvlw==
X-Gm-Message-State: AOJu0YzSGg8+YVoVF3+ZnkzkbO2q6l7kCB2aJNG8fc5lumowPXoy9byr
	Ow0K89mv2gvIUgRxKQVXuSyOMpSHqh0+SlB1QNWMmX2A39VpdWCH1i+9kP6BoViU6GzThgRbfXB
	Dd5g=
X-Google-Smtp-Source: AGHT+IGhSTvLnP+tKW0tVpSB8gm/f15rxzFp5YgnDFD6Ase4om+Eu4X94bDKnwQSAWdy2NsXrdWLag==
X-Received: by 2002:a17:903:230c:b0:201:ffcb:bbbf with SMTP id d9443c01a7336-206f04e934dmr29719115ad.22.1725629030383;
        Fri, 06 Sep 2024 06:23:50 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882e:b9ce:65d4:d87d:bbc9:eb99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea56924sm42732525ad.231.2024.09.06.06.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:23:49 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] python3: upgrade 3.12.4 -> 3.12.5
Date: Fri,  6 Sep 2024 18:53:39 +0530
Message-Id: <20240906132339.1721751-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204263

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

Include security fix
CVE-2024-6923

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-6923
https://github.com/python/cpython/pull/122233

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 3ac83166ac..5c3b7a92f8 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
+SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


