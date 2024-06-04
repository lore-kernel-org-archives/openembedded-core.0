Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B931CC27C5E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:10:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.16155.1717488631379417710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIiNtf0z;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so5800926a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717488630; x=1718093430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1dcfzOYRPxqPfW9BIF1VeHokxpP5vE88X/AUsxnT5s=;
        b=DIiNtf0zyTPFZWNTQA3dJH8nQcILPdUIVEKlDw/MQIemRr2dHFqiFe7TDFLAYlQ/6K
         /TDN3Lvbzt9ddbpaPzwZuJeVO8widrg+lTe5pWxMh2GMWAje7ECGJzme6na5qDT9lX3B
         SO5JgieNzzD1iiRuORUo91QRmJLR3j2JKmKbIL1IRoMoqdOlhjeHhx9frCjkKmYGutxY
         qoJFi1GTAuw2/Kkekbdm1LiDvJt/OLrT1++G/RS46XxAKpQGKi6mhVihKHnLw3mztxW+
         HwamLDeX6Y0Ev9OCcTk3t66p7sYeikciXgD2dJWpcht9Wc06TP6MrpPfAla7oS+mVxBH
         0T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488630; x=1718093430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1dcfzOYRPxqPfW9BIF1VeHokxpP5vE88X/AUsxnT5s=;
        b=ZxYS6ZsprS3iZ2ceI+yh1nGjJWGKmyo2EpOZ5kQLUrQ6lGlRRwYx64F22X83CZ8ZmW
         /uuByeXUK5oCL/ifRBCb525Qo27Gm4/2IYlu8lliIMryiWy8CJaZHn5Yn8clg+8c9D6k
         n7KftlzrxQstZkH2JKdRKoT+Dv8mjAsa+JZmXZ+IKNFyhu1mwt8txcMelB/+b47JuH5Y
         3HjwEkvTTlR/fBiCg3HX6Sswa60aVNVLN7FVHr1h3C0QaYpLdNaD6uEcVYIVi/pXS9SA
         IYAZXf4SMFCjHkH2mrxJQ4bd4aJKgRdPIrbfGd/bSaakb/lZ2BeNl6IY4vYQGGNVT9u2
         lpUw==
X-Gm-Message-State: AOJu0Yxsc3Q+iFzMG1Vx96ZpyAHZ1fIpNLrciPtyca85f4jFCOLwLh+S
	v69xahFhn1g1qn6bWhCBrla1ShCPKpu1+gk98iPvaJI3tt554R5YkhN81Q==
X-Google-Smtp-Source: AGHT+IFbiGsYhpbTR/Q7OVYMuK7AsfuJNnQPQwtyLy96gBjW9nhL/8Guc6gjJVTXG6+03Vmn+I7OmA==
X-Received: by 2002:a17:907:b010:b0:a59:bae0:b12c with SMTP id a640c23a62f3a-a6821c6e6c6mr793147966b.48.1717488629689;
        Tue, 04 Jun 2024 01:10:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a2fc7707sm490384466b.98.2024.06.04.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:10:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv3][PATCH 3/4] selftest: add few missing Upstream-Status found by patchreview
Date: Tue,  4 Jun 2024 10:10:22 +0200
Message-ID: <20240604081023.38549-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604081023.38549-1-martin.jansa@gmail.com>
References: <20240604081023.38549-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200306

* now patchreview complains only about missing SOBs

$ scripts/contrib/patchreview.py -v meta-selftest/
Found layers meta-selftest
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/recipetool/files/add-file.patch)

Total patches found: 13
Patches missing Signed-off-by: 9 (69%)
Patches with malformed Signed-off-by: 0 (0%)
Patches missing CVE: 0 (0%)
Patches missing Upstream-Status: 0 (0%)
Patches with malformed Upstream-Status: 0 (0%)
Patches in Pending state: 4 (31%)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../devtool/devtool-patch-overrides/qemuarm/arm.patch           | 2 ++
 .../devtool/devtool-patch-overrides/qemux86/x86.patch           | 2 ++
 .../recipes-test/man-db/files/0001-Test-patch-here.patch        | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
index e33a2753f9..f7f729a86c 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
index 1a0a175fa8..0aa1affedd 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
index b1d5eab2b8..d4d43904df 100644
--- a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
+++ b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
@@ -4,6 +4,8 @@ Date: Fri, 9 Feb 2018 17:37:48 +0200
 Subject: [PATCH] Test patch here!
 
 This is an invalid patch used by oe-selftest
+
+Upstream-Status: Pending
 ---
  README | 1 +
  1 file changed, 1 insertion(+)
-- 
2.45.2


