Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 087786BBF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 10:26:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y139so5135221wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pmRR0LloNZSuze/NvgkPezbYpK6I6FzM6TiDD9/yPzw=;
	b=CxWITPBYa3ya3WlUO852e6U/eXeefqcmKfV21nSIQ50tglzaLnzy6Ah9t5v/bYW5+f
	4dTPpoMp3uV83k7ZwhUZGtSd86a3iihJDO/5oz5MYAmX+u5oiWBLu1DmiSK4xyWKHJ1Q
	jouQB2jcTJlHr1lX0JXGRN0PJxZrnU9ceeBo+gv5amRtRFevpaWXgCJi379lNYuv+jUG
	Z9gI1oh1rIgjjvigNUuVNJg+bTnFW3RaFyBpG5Et887inrsj/eTzn/cnIVBcjetcmXag
	mYMG7Iz/EajiEyTLv96gnFSgCbSZoXFg2zN4XqBXv3LRe65tahZYBguUxqnZbwNjAE1m
	teqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pmRR0LloNZSuze/NvgkPezbYpK6I6FzM6TiDD9/yPzw=;
	b=a4nVG4dyX5v2kRY5UVux5o01Rig61yrdUDvRB7QA6Jt6JxYb7d7mIk38xbucgmGe4e
	hCZxESluFDUP5nPqqUU4GqJzMaBLzkYfvtAoeOLLAX0EmkudbSUt87mpNWVc3QKd1Qg1
	qkqBmK69VBLKJXZJjvxEufZlIMElJvXJdQYrknONmb0bu6rhV/Fv8MZ1xJjfIiD9zM+P
	MMKp5LNs2diUJ22Jh15jFzlRCHdwRfUmsUZW9rRbRqTtE/g65kvggTNn6os+kg8AmcIH
	KafrQ3BegvIuIouGNYu81Qgg1Gzjp/eUP52vzh7xk7uoJ6GqU7AxggmjEkn7gsiTgF1h
	YJiQ==
X-Gm-Message-State: AA+aEWaHCSoXnLyQI+iv9MX7VszGgu4oDtN9aCyRzQDGz0ZDVqDj3Gyh
	wzMB6Iq5SAYQjdOFEP0oXrb12jcZtq8=
X-Google-Smtp-Source: AFSGD/U8YwDiJSMsu4pEMYVEFbBc3oIG3hCC4tYsX58iNdy0V535nqFJ9H+dVjrtmCC7E7bc0PZqOw==
X-Received: by 2002:a1c:f112:: with SMTP id p18mr7172662wmh.83.1543832797501; 
	Mon, 03 Dec 2018 02:26:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k26sm2977930wmi.28.2018.12.03.02.26.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 02:26:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 10:26:34 +0000
Message-Id: <20181203102634.4850-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181203102634.4850-1-ross.burton@intel.com>
References: <20181203102634.4850-1-ross.burton@intel.com>
Subject: [PATCH 2/2] mdadm: add back lost Upstream-Status tags
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
X-List-Received-Date: Mon, 03 Dec 2018 10:26:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch     | 2 +-
 .../files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch | 2 +-
 .../mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch   | 2 +-
 .../mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
index 72368cb17b1..12bf6a59207 100644
--- a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
@@ -8,7 +8,7 @@ its possible that build host gcc is version 7+ but the
 cross compile used for compiling mdadm is < version 7
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Upstream-Status: Pending
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
index bdedbb2d984..6293f9b2b37 100644
--- a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
+++ b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
@@ -25,7 +25,7 @@ Fixes
 |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Upstream-Status: Pending
 ---
  mdadm.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
index e10905c63b5..a1e7e59323b 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
@@ -14,7 +14,7 @@ In file included from policy.c:25:
 /mnt/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/bits/stdio2.h:145:12: note: previous definition is here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Upstream-Status: Pending
 ---
  mdadm.h | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
index d279fddfb6a..0bd556d4372 100644
--- a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
+++ b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
@@ -10,7 +10,7 @@ compiler warnings
 This works in cross and native compilation case
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Upstream-Status: Submitted
 ---
  Grow.c        | 4 ++++
  bitmap.c      | 8 ++++++++
-- 
2.11.0


