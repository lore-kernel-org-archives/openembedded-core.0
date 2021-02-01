Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.36608.1612196783100520278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tyr/rMC7;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id g69so19350171oib.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pWRVc5WPASFPZV8yz24xZ0EsU9AlB3krwPJSrqjbBrc=;
        b=tyr/rMC7nQqzuraPtyj/knyesAC9aWPE6OAyL6it+5o7GwTev8C71RBtkDX/QAWugw
         tdh34Ur57tSP4RlaUI+NrC5O7glPXQbG2pULL6pnpTncUxEW56feLkg/hxPqC9C8DTw0
         KTU0nl9A0jy4gEdTPeSeEtvs5bN4+3TeZhWFGRxJJHyuG5wsQNnk4fUAgQnkldql0IRv
         FBZaMvYS2PjadXlwzem44cjUrhL1qGIs+SlxlcTu7My/w67QfSZusVvk5fUMA6EAr/qZ
         rm+h1tjIqOvDTgAgA5PzA3wf4MbxBOubIMTg4cD5wVVKSN3yA8Y+7iHiZm3g+nEqIDve
         lH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWRVc5WPASFPZV8yz24xZ0EsU9AlB3krwPJSrqjbBrc=;
        b=YS/4vK1+DOq9eQiRDP2EjwqewkmeOGSgm18mb8czE3iIkS3w6Atu2ET/VbqYh0jxA6
         qS9cbMPLyErfMfXgXgPjZTpU7x4pYuKt8be+hFMCEbpRRuM2G1WXJVrJnNbpNVeRRQJ4
         zSD8eHd6qFhhtfVIq3mvfNnOwgj/WX7g+OWM39LJtLCyUrGVF6OxFH9vKbSBn4i4hu7w
         T9U9U33yIi5QvZ+C1u27ySdVokRGU+QuQERW7QXkUJeAiIdeYewh64syPYv54Vr+b2Z1
         YAIwK7gBh89Cjd/E3JUG+wj6/Vai3RpRBZtSG0DXRAfROx0rzQ10PD0Qkt1hyebO8nVP
         mw5g==
X-Gm-Message-State: AOAM530o8k6GnO8rw5UCO/A+4+iqjW4EhwuZktomtPel0mmylvuzMiJT
	kHFNILBCZ+obRQ1tlgoS/A1CnrTEVZ56G0GyL0Q=
X-Google-Smtp-Source: ABdhPJxrzX98bHn288Vjo2TttpAEvTdnXjhAykDuRYbE2kU+BOIvPG2aF2n0kK54BU54nIDcb/sfgg==
X-Received: by 2002:aca:3fd5:: with SMTP id m204mr11733043oia.0.1612196781952;
        Mon, 01 Feb 2021 08:26:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/21] oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s test_wait_event
Date: Mon,  1 Feb 2021 06:24:41 -1000
Message-Id: <cbc72203c82e56ebf4a6a685fbeb27679ed9a2e0.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

The test would timeout on autobuilders. This patch increases the
timeout to 60s

The test will now also exit as soon as we receive the 2 expected events
Expected runtime is around 1s if successful

Bug 14158

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be02aa9283f805de718badd5ea12c4968da8774f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 206168ed00..a51c6048d3 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,9 +100,11 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived = False
             commandcomplete = False
             start = time.time()
-            # Wait for 10s in total so we'd detect spurious heartbeat events for example
+            # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
             # The test is IO load sensitive too
-            while time.time() - start < 10:
+            while (not (eventreceived == True and commandcomplete == True) 
+                    and (time.time() - start < 60)):
+                # if we received both events (on let's say a good day), we are done  
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
-- 
2.25.1

