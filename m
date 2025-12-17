Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09793D65544
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 10:34:46 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11354.1765967680344581839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 02:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+iWFU2o;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso434263866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765967678; x=1766572478; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmQ8qW3X12x/1QiKJgBt6fMF8w1GCTzKYqJnPFYfZ0Y=;
        b=V+iWFU2oDU33UvsNIFyJZnVNa6uJCdY/RFt3Nx1Tox8Z1au0qabiQP/HlffGGsNyyN
         O0+gsyS7o2/tDi/3IupMRGl+e4UH6UZ0d1kwfyu+RMVs9Kq85ZUnp84H9EttGfggofnN
         IXvKxFiiNAJUNLfMAHeDDgYckWgj15FsK77eQkuKr7hOsu565PEqZ+fop/0vvKYRE2Y2
         l2S2OgsWXG88vkKzmxVBea46YS464yG+DMUS6HG7DDi2AdeedTInxs3WsdoHx5DMFb26
         BTgsjLgnX4rAhRgHEaZfuDmAJ+6kFPKu/TeDnY4U5hJGFMKM9nlN81iXqJq7XdSzAvLf
         0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967678; x=1766572478;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmQ8qW3X12x/1QiKJgBt6fMF8w1GCTzKYqJnPFYfZ0Y=;
        b=PZEXygZ81CWVcbhaIdoxIfw+m0CLWBumwdz74p+1mDgKQ2mqCiTVVKUrct3n0M4IMF
         ArZVqUdPPWvGSj3gGy0NPd0nFGqOegIBhyQ3/dMratUmehtTMjIp77X8oLKgTuCVem3R
         MyOx2Kc8CUj0/5d1QMvDm4kS577AZvpBssG0pl6Ji96VhQcJcFkr5C5Uuyz9xnmx7XWN
         EflwQdq4q7ciIyTIeYqQ6xiU/aHshL+lGn2Kj/uL43Trbx1rntfIPvRCfi5B+a/DO9o9
         UqekwXJ4mSauvRdNj8Zpj42P0Kq6viIZpsMNbDotXHmxWRd/YBFQIaDOPYtSjkrjNEib
         7wAg==
X-Gm-Message-State: AOJu0YykdyDf5DpQSw0Cs7IT6xXErnRYhATy3blwse78f0huQ9EKY1xi
	QD50YMvX34D5t1yFN5ztVz01KJOw2xf/uC6zphh+co08ayWSjGxpYaMe
X-Gm-Gg: AY/fxX6ebJWsXtQBu4nsnWVOVCAwKqUAQylFskteQx1hs+7HrkIfz56F7L1hbC5x84K
	VdDzURBbfvUgOQbbv9LuHpCfKuJ1s8ulywkdNozFCmi4IU2rCxufgN0IFjH/tST7RNBilAFkOVv
	buZn9IFKfkvxJ82ilbRYHtWtIM6bap5K2nsdG/jpY+RToPN1iruMDoT77NfFzyTQsqKthTh7uW8
	6wEms14wolcyzvPls7J41bEH7PlV+vO6Vj4GHZ/Dsx1+fC20YXIYZ8ETKMVKrZvIkTuIfbIuDAX
	s82WzfBvfp1P0j05Qxe5Y6a0tnd3zI5/6NkmcVUZEgL85qddrk/6WA8DuEqIbauzpqggtCf1NgT
	WYUxseMzkCK4+T45YhezNE+IsjOewrLpCupQINGmb3DJPe0hk+HgzjsEO4upLbONXSmMWgWgzoK
	SKdwuUulic88fFzW8+Yg==
X-Google-Smtp-Source: AGHT+IGq2BtWU9BCQiYf5EJQTFhyWKF2CJ+B16Dz1iiHsk3igIAI5WU7FgzXMmDjiKxtr5ys2VPUUQ==
X-Received: by 2002:a17:907:3da4:b0:b73:7f1c:b8d8 with SMTP id a640c23a62f3a-b7d2324d9eemr1869215366b.0.1765967678343;
        Wed, 17 Dec 2025 02:34:38 -0800 (PST)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:6a8e:a97d:451c:1fdf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f56ac0esm2066300a12.24.2025.12.17.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:34:37 -0800 (PST)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 17 Dec 2025 11:34:27 +0100
Subject: [PATCH] buildhistory: fix handling of RDEPENDS style strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-buildhistory-fix-sortpkglist-v1-1-7b652f81c897@gmail.com>
X-B4-Tracking: v=1; b=H4sIADKHQmkC/x2MQQqDQAwAvyI5G+guFEu/Ih40m9VQcSXR0iL+3
 eBxhmEOMFZhg3d1gPJXTMriEOoKaOqXkVGSM8RHfIYYGhx2mdMkthX9Y5YfWtFt/YyzK3z1aSC
 inKlh8MWq7Mm9b7vzvABLNDC2bgAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765967677; l=1315;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=l0uZ0FYC6pnubgQO7CAY7uX1BDrwZVNb//OAtx5qfDA=;
 b=z/OoxjtLy4VWhwsXYvhmnfxzXEbrmsIDQuzd5lWBIMOES6SQExkbyGQZ8R/hxgyubOlXagddI
 TS5JCuCuZstAeOwU28DxL4GdoEfQJrwh2YF2atsZIqXtJeHQQ5DpXP6
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 10:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228021

RDEPENDS style strings are regex searched for entries matching
the usual, allowed package names (plus possible version flags).
RPROVIDES however, is also allowed to contain actual file paths
like '/bin/sh', which get broken by the current implementation.

Use bb.utils to handle RDEPENDS style stings.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes/buildhistory.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4a380c10c6..78037a6462 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -187,10 +187,7 @@ python buildhistory_emit_pkghistory() {
             return None
 
     def sortpkglist(string):
-        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?', string, 0)
-        pkglist = [p.group(0) for p in pkgiter]
-        pkglist.sort()
-        return ' '.join(pkglist)
+        return bb.utils.join_deps(bb.utils.explode_dep_versions2(string), False)
 
     def sortlist(string):
         items = string.split(' ')

---
base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84
change-id: 20251217-buildhistory-fix-sortpkglist-8adbcccffc7e

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


