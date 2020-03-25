Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.15438.1585153046065831534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6LA8LOP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id p10so3890762wrt.6
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cl/jhAFBsu6t0unMz5ayO/w1sRjlOCv8AEh0jcrr6F0=;
        b=a6LA8LOP/3B4MUGgAfz275LTmPBKMV6+zCFEA9gJorixMfZnF/+ooPGcoeA1s+EHvf
         cL/R4Im8CzjkhEK22QeiXBj/CSD8UaivkxG4QLv1/HW1v//AvxJ2iC48B2Yn94fZJqiQ
         67DRnT6A7w3xfvNauWvOvsNpCq+LheJ+NhZlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cl/jhAFBsu6t0unMz5ayO/w1sRjlOCv8AEh0jcrr6F0=;
        b=lI7LYc0bc+LX8/SXZx0txyl4PhlMbEqpzXT9XKM3wrEx3QE2HNZoqZAC52sa2yfvhY
         vpaGtVBbvetdb68RLPmrHtYO+tUuUUNcLlutGLcf5vUmrZ21Uy+8ZB8mUXapKl78Emdh
         atEkXI35jo1T7HjwPhZ5oA6vcCtmBB/I7ZGOLnsbiPCt+Y5MhvHKoV20PkS+DVwKsbNb
         4yS6UU2BPNTaLDmBVBhdOmG2Fjf6exWSPm5KQhQl8Hqfeoq38p91K2TLCh5fF47a/VF6
         YE8sm3CbdVJrEEUF+b0vEOxJHJyJvWJOey8fY1gH6PzMr0N3gU/IPXerGWwvBpGLykze
         HqpQ==
X-Gm-Message-State: ANhLgQ3GXYXZPGdHbTJ6cPs7nKvOFqx8LCk30iUbzpryKo+4PmPRIiXa
	sSyBieNbQdEOJ8zZiIV+4RyboL9+erE=
X-Google-Smtp-Source: ADFU+vsMVFuJyb2tGBgANMUcHcmuLGSFz0ID8ibvWGNRLaAGH/FNMl7+Zm6+NX5OYj1GzA3zor7hlQ==
X-Received: by 2002:adf:e650:: with SMTP id b16mr4058996wrn.328.1585153044054;
        Wed, 25 Mar 2020 09:17:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l12sm33507593wrt.73.2020.03.25.09.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 09:17:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oe/recipeutils: Drop obsolete GITDIR reference
Date: Wed, 25 Mar 2020 16:17:20 +0000
Message-Id: <20200325161720.498276-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325161720.498276-1-richard.purdie@linuxfoundation.org>
References: <20200325161720.498276-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fetcher GITDIR variable wase dropped a while back, drop the
obsolete reference to it (thanks Robert Day).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f53c2b71267..732420e46ff 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1061,7 +1061,6 @@ def get_recipe_upgrade_status(recipes=None):
     data_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
-                 'GITDIR',
                  'DL_DIR',
                  'PN',
                  'CACHE',
-- 
2.25.1

