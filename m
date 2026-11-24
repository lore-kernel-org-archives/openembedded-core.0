Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30988.1795560765520283712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eKWq2oSZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4782629f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560764; x=1796165564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aMcW3NJ4OMMIDk9Oj5zaSztK7ul1ano941wk5jrHVyk=;
        b=eKWq2oSZi69P4VqcY8mT6on9a7Nfg2gZzEV1bVxDHcPwSP/bn9RAzNkMjX3sO0nHGt
         3EYCorl6+OJHOHzInSwv4zTrdpOyidwAsf8EZEaiIhJ/FpoaZ49TLhk9sOjO4ZK9b9yR
         wov1C3XkGENr6KNWeEL5Jv+lybpXoBKdzQ/44zE8+rL41zYvIIswz+AOVMBEMD+1Y7f8
         NCjJsYkLdIGDh0qkAAKzqRtRVubsYuBOvUgAUMM3NiW9yjkfuVpmnE4AxlgyESc/5zJl
         9CPifcTdAi9zAsccJYD0CkTKhrC2blF8CV9+dAQz8poGo8zux7SILPbVBuuMdcMj7/Pu
         g3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560764; x=1796165564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aMcW3NJ4OMMIDk9Oj5zaSztK7ul1ano941wk5jrHVyk=;
        b=Hrdr0vvRZvrMmubrHefPhVbO4W4VKilFXXzNQMh5mWVqNwqXRmbiOHkmsJvOCWXF7d
         dy5vkDmCR8+PlBwgueaRA/BhcUek+YYrTUmQQiVBEzgrj4GGJgEwlZRMbefRsqcs/VT0
         0jMbK9a79bzbWV/iI15or60Yj0bX96/6rVR/wydTmIhZLMQM+i7pMlQyXvoge7xcOhoP
         aYkzAQQBNQ/x3GLNUrBJusjGbvVDVrzWJiMRbWb5qdRziTzXeqEz8h1J1AiIFqJfaE2o
         f/hEE24Ri9bWOx90PaiJ38e7kTh8QOeLRjveLlmzmAazs7S9QnE3mJSck+TkVr5Zk0QD
         wYxg==
X-Gm-Message-State: APuU4Z9oJtL38yQiuDwJrnLuR6R4f1E/JqLsMOaZgCCekB777ZsNPaGJ
	SbDG3RZ/U7nrrTBZ35ueWFytUNkW6guGPPNXIkG4BV7gKQCEYohCTQZOa2A9LAICnshi5ggYZPF
	bGQw/05Y=
X-Gm-Gg: AZFdTZdEbitOrXV4YzgJFeOmQCn3aV9HbIAyZW5RtZ7dU/xdP8QphmX8vf00dMFcCDz
	k/sDzVQ2NwmE7sKIug87e6sB9byQKtwLLQwmeRu3ulzlQI3+sX7zPRFJl+l3yyjc9prGaow7z0Q
	bUUOTcBCfdao1K4Op5mQN/pW/svNvMiYJ+PhFqglG2vpmMcr/iYUMs1E2q0G9u6WlSF1Kypsx7I
	+PM6cJW3LhvUr5dZs94G9cGIhXh8GW9Jf6gUsjHK1uEK4msiwMeOQ8yHEiLH4Dbguc14ajtiW1i
	genwsVpIGi5coIrFZVXpL3vUHNeZ4zRxD2LacxpTYUFBBVCjhmrUMFVDeP/plX98lnsbf5JQJuQ
	srA/XwyzxnQMrO3NlELxYx/ZBYQjtFu2ZCpITPvBmyrfPJOVrPI0qL9eL655oi3XHstNiDH9K1e
	qeOeEpqcoF0yxtRH14NKCqgou2kBJNmHbNSb0jk6w065Dm2Iz6qaZjkSOfbvDJ2TAJaxsMImd81
	2dNHQydCro0iRwLqMGIu+eFa47acSto/KCDteFpwens2sfFrzoNAr+GkRh92OxU5WwcR3I/Z4JU
	yrWN3nJJdjqdxxVPUhGP1u4fIzzJApLor8SNGqTYcW3RzETs/7nSGsHm1EOfL9pF+9StXrLMWK4
	7FxziF2cQkoVfnXC41h9jOA61ieI5
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29711510f8f.32.1795560763726;
        Tue, 24 Nov 2026 14:52:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/21] glibc: stable 2.43 branch updates to 124e9adcd4
Date: Tue, 24 Nov 2026 23:52:19 +0100
Message-ID: <079c5e3000f990bc6541d0e2dbfec8ea3655b1b5.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251104
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Update SRCREV from 562cd7badd to 124e9adcd4 on release/2.43/master.
This pulls eight stable maintenance commits, including fixes for:

  CVE-2026-84243: LANGUAGE directory traversal in gettext
  CVE-2026-100290: double free after regex allocation failures
  CVE-2026-115819: extra NUL byte in wide scanf conversions

Record these CVEs as stable backports because the recipe version remains
2.43+git and version-based matching cannot identify the fixes.

Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=124e9adcd407737f0462aa4ba38a37678e8941ec

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index e8e6bb665ae..ec079d9127a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "562cd7badd3f9edd74b68316439f910f6f7c4c1f"
+SRCREV_glibc ?= "124e9adcd407737f0462aa4ba38a37678e8941ec"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index c962171cf3a..5d2344389ff 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -25,6 +25,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
     CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 CVE-2026-86805 CVE-2026-95818 \
+    CVE-2026-84243 CVE-2026-100290 CVE-2026-115819 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
