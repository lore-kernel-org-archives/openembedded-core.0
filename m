Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.7956.1603974613782323086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oesTdjfz;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id o9so1489111ejg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TzJqn2t7kfUQsBgKeI3OJEePUcCLJCO+LmJoL23bO34=;
        b=oesTdjfzOVis+WTmGn5BXUOycqQ7HR5p7hhr2hUt5YGpNMCEJOJy8yGeVrcGSg67Uo
         B5FoXYvWHVH6haEtBYWkFwiB1nlOdEhldQUlJett7OplCJn4o5WEQl7dErJKusyaRtHr
         wQQfdlfaQw2nLCsx3TwoYoYsU74oXNu4eB145BE109QBzLHZNq5D8dkTMp5uJ4SClWIh
         ZBsHnDVJuaMkM/4/Ac1AamBX2h5tY70ZDz7STnwmU917E96vWHuiSgmsy7Lvf9oDlU8F
         fLEqZdqih9BVUAMDBmtodDPGrWZQXMJNbXueIY3pju4533XbV/CSNNefBCdtI4iUNWze
         J0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TzJqn2t7kfUQsBgKeI3OJEePUcCLJCO+LmJoL23bO34=;
        b=MnLd6qtAD9yYfnx7UiPGDUYtaCZhMJ0AGkxr4o1l/lyZbrKGs9qNEIYHKSYPjlhYrD
         bUQZ72mHIXWY6HihS2VWgvdPCzKgLCqikOWum6NkVvvtBpY85wuagjtmNpHs9P6YDMpA
         xs6TYhC2CGpJmodzN8N+96ehJUR10N+kJUajktSFQZpNKRQcRMkilobMWzpDNuLnmrY4
         2hfEV03rHBEXg65HMqrU1kkAbLIb598MY4uWk9RnqAMCoF4PLGYVYVAOT7P6JT2MQKeX
         XGV88h7XIzaulutgXbl7TWvpyOiTL6KFNUx0Vhtc17TAmX81yAt+sXQGsgJP5IA5owKA
         6lCQ==
X-Gm-Message-State: AOAM531IZe5fnO20ETJcpep6HUAaZGOLz6m+Gm2b0k9Lm8o6aL+t+cDe
	MZzPyCIJezhFF25ymwi2JDWtjlJBU3LscA==
X-Google-Smtp-Source: ABdhPJzCXYsUP7Vc/8BTqT/AFfIleeRDcbuVysHc0JM37eyfQ650zOYVMh1sh31OhmAR9se+aU1hAA==
X-Received: by 2002:a17:906:1955:: with SMTP id b21mr3988090eje.42.1603974612041;
        Thu, 29 Oct 2020 05:30:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id l20sm1412229edr.56.2020.10.29.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 05:30:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] libxml2: add missing Upstream-Status and SOB to a patch
Date: Thu, 29 Oct 2020 13:29:58 +0100
Message-Id: <20201029123000.21044-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/libxml/libxml2/fix-python39.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2/fix-python39.patch b/meta/recipes-core/libxml/libxml2/fix-python39.patch
index 76a35d9f10..32590f9ddf 100644
--- a/meta/recipes-core/libxml/libxml2/fix-python39.patch
+++ b/meta/recipes-core/libxml/libxml2/fix-python39.patch
@@ -10,6 +10,8 @@ expression before, but that's not API to rely on.
 Since Python 3.9.0a4 it needs to be parenthesized explicitly.
 
 Fixes https://gitlab.gnome.org/GNOME/libxml2/issues/149
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  python/libxml.c |  4 ++--
  python/types.c  | 12 ++++++------
-- 
2.29.0

