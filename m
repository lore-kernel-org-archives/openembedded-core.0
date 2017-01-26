Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8700171E0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:06:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so50005732wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z1zpWWuxUHMLzg65mDkSQh0ld5CZTccVW3I78XruinQ=;
	b=CwowyDh4qBO9XyjgMx8T9uO8VrYPUhpGdhtwQ81aUwBZLbav1sJsSWzuDjaqDVyNSR
	m8wRfQGRTOCCJ9jB/cf/H2jx3svLqHtKn3DjLd8mCjA4Q/aCpb50fCJ3obkHtbfqhYwG
	fUWGGx70tDnD8yTicEz4UQAHsNfQT5lkZ8U44ApOgVhI+ucpmcL+dkPd1yZt5UsPpuOW
	VUOIhfosnpfuUsG8kYIB5k6MpKKIAKKxuIq3XEjdbhKzD/vY/Xaq8/vLeyn0cCkC6eiT
	sCCkoQt7HufYyJZRcfYGRaylLSwMb1CAZhmi8lpETgXXQelZJUrq+GzvdBJnTvbyE1oG
	z5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z1zpWWuxUHMLzg65mDkSQh0ld5CZTccVW3I78XruinQ=;
	b=DR/gdSj0p/cpChzztUbsZ0p+ZU9N+aMJ+gr6oxQ05Ob7HUEpXzN02hJdm118/ZydWq
	AXc+TRf0TiBGkbObrU5qgjIxtXTtq5mdf3gsODBtGjsDJ8RwJsrHRuWv5wVe/ggnhmtF
	bm/X6bkObfqH49YIiQIEtW2FxTPb0/ykoHMS9yC/Hegz6MRZt64+A6Nzrw/DDgQfSwfW
	nA8ZOT8WJtEWRxElIC6+SOAFLVeSuXY6lFx55E2IpxAaLuuOWBqsjUTn5PeYzqRhxRxS
	pWCOCEngAq8av96vxiG5LFRbn1UloDSckVK8xAROtTkNKnkndT1LhDSxblMeVt14/qS4
	E4uQ==
X-Gm-Message-State: AIkVDXLsRtoCPxFbTOFuPjsovBav9OQMXk5GqhmczM7pmEHLg5+D5XE757rBaZstwneStg==
X-Received: by 10.28.68.6 with SMTP id r6mr25559363wma.57.1485432405459;
	Thu, 26 Jan 2017 04:06:45 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	t103sm2230620wrc.43.2017.01.26.04.06.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 04:06:44 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 13:06:37 +0100
Message-Id: <1485432397-10548-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: remove remaining True option to getVarFlag calls
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 12:06:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is a complementary fix to commit 2dea9e49:
[ meta: remove True option to getVarFlag calls ]

it intended to remove all True option to getVarFlag calls, but there are
still some remaining.

Search made with the following regex: getVarFlag ?\((.*), True\)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/lib/oe/data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 3956733..80bba2b 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -30,7 +30,7 @@ def export2json(d, json_file, expand=True):
             continue
         elif key.startswith("do_"):
             continue
-        elif d.getVarFlag(key, "func", True):
+        elif d.getVarFlag(key, "func"):
             continue
 
         keys2export.append(key)
-- 
1.9.1


