Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.17498.1590940418295370860
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LlC5xunK;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m21so5383357eds.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MDUHWPRrOsWAMQfaF+4coIzNhYjSgOMmojH2/ldqVoE=;
        b=LlC5xunKCg9Tfr1ONNjhTjS6n83Ob2HfxHGqneb6FboyCcVLfTsM4AAe87vIsRyiI1
         wY/bct03cQeiDxWXexha7JJX8jHEIe9FbhfcIzP9c1gpcwdj1vpoUzXnzmSuUtCbKPSg
         MgJBaORf+sX8p/mQTWxsqDTDmBzDo+bpKOV4ewuMizsFO1Vt9N3qqOXJw/rj0bgb3Fpu
         4KVMND+N1mQxZLoHjzIHQ1oGdIblFMVENNc5PCMrcQSBGkyOcC8BMKEZjiYkIDwazVY6
         nurdFxNKTi+p7slsULz4k6zwqMBZv9s52c8hNB1KdVvBI5jJu4XzZG+OwiNwGKdanAjp
         TZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MDUHWPRrOsWAMQfaF+4coIzNhYjSgOMmojH2/ldqVoE=;
        b=chZ8IqU9OX1bcFLc0gZYGjiygMQQ+o6HwaNt9j5H74bT/i4uhjXLvgWWtZZDHHyt74
         Oj0ndR3nxecWUkF+KvIHies3G/lkLCFG1SOkYhRnZ4cTmw6AJDhiel6QuGL1Ht/SIR6n
         tgBjPNqt4i+HIl26w/T7etQAGXyD4feSCk+SNASbUwLD8Gd0D0gGBaMt7ZdqscZpjxH3
         1CwXnzKuVOfs06cUn6brfGMj6WreINndbTlD8ER0paX/A9WX6sQmr5sZFH7+ZYs4BOYA
         OTaEqHcmnhYgVKxIG0ku+jEgaa3NH7ZXt+qGJdvv5nZsdMao1ZR6nymZNPCYIuIcoveQ
         jm+g==
X-Gm-Message-State: AOAM532GqlBZjTB3SBRvuhgXV4044jLf9sCm9VTIu04hpSn+7kWLMbqe
	23oM+XhWI0oQHSTcq5MwMpYUG7aS
X-Google-Smtp-Source: ABdhPJy6LXYMZM5+9QpsqykXWdnUOccYp31ww1ox7YVYl649cE5b+bEfx5mGVxZv230B9NsWi4jjTg==
X-Received: by 2002:aa7:c790:: with SMTP id n16mr8185324eds.54.1590940416641;
        Sun, 31 May 2020 08:53:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/70] python3-pygments: upgrade 2.5.2 -> 2.6.1
Date: Sun, 31 May 2020 17:51:55 +0200
Message-Id: <20200531155254.10283-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pygments_2.5.2.bb => python3-pygments_2.6.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.5.2.bb => python3-pygments_2.6.1.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.5.2.bb b/meta/recipes-devtools/python/python3-pygments_2.6.1.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-pygments_2.5.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.6.1.bb
index 474b95494a..bffef59e69 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.5.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.6.1.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1d7b7bffbfeaa14083fd2bd3236aea8"
 
 inherit setuptools3
-SRC_URI[md5sum] = "465a35559863089d959d783a69f79b9f"
-SRC_URI[sha256sum] = "98c8aa5a9f778fcd1026a17361ddaf7330d1b7c62ae97c3bb0ae73e0b9b6b0fe"
+SRC_URI[md5sum] = "a48c5219de92f12c41acba814730b31a"
+SRC_URI[sha256sum] = "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.26.2

