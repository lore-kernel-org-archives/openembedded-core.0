Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.575.1795888074569686076
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 09:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nkxtaPeF;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so12999055eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795888074; x=1796492874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2facOhrhy4VpOYJq5zKvuw1mCjg7wkfaxTTs/vRuzis=;
        b=nkxtaPeFoXQMuuj+vwU2tWuJWAVna6n+wZCLcAClonUlRY+RbQa1762f8M1iXMNXWX
         La2cS4Ey+qCGgGxlTEmVa4jrwoNDU3qQU5/qHyjqTtP+LXg25alhYgMYkpBrkNtPJLud
         N9unH1m/BA3LKBF+yF8BqUbWREbmixAQLbLSt7x1xOuZM/AsORu5P1b00W0yVpg/Qx1M
         Mebxa0mFidsuaaoQ8G5v4aq0HfJ+M2TOGNZsQPtCMMkWxlSf4IA065InjAy3VOHtZVcQ
         +3Jlh/Rlv3U7k5Xe4MRhVPQsir3ra11u+CsmJLzYLllpwUS7jEqZ9VcN0Ed9en6H7qhT
         x09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795888074; x=1796492874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2facOhrhy4VpOYJq5zKvuw1mCjg7wkfaxTTs/vRuzis=;
        b=P/14vEJMQVNCnLU6BhfJwbP10wiJ9zE5GmiuC9QSRdWz9ZzdVwWWs3pvIrIECny4h7
         /y7JtBhPdV1BtdVgSpPkloK9PfD312PSQwUTCeUnw8kMGQFO2tXA9udy3Y3ySAUP0DpE
         tiscNPDbspmvM1YuwdbHa7tNWKmkq3JHi2gxhA2yrOqDFICr/H/KCi+YEGndvG/Geqj2
         DyEwvEwZkaX7+Gg1OXupBq/+OL0HZgDjwyEN85/jkmEfAu5ifyyXkW/HhOZrGPRVRZJY
         3W4A4fezItvfGw01cdirKeceJnnZU30Yp5Q/7hInP3Wo3EwA13w5YM7Mv9sWB1fDn7rM
         E4lQ==
X-Gm-Message-State: APuU4Z/l2N8PN4YeZBKRicKrkKxL1dnVkn6MSk59+F+D1RTC55+NiQIE
	eh7kPaRmvAwQ38I7SmgwAfCqWQlyhdXbHIRZpfI+21v9ofr/7feceNlXH7lAYeFi
X-Gm-Gg: AZFdTZfyblH+FUI/WtflemT+8HO8uZSxtTbz2TSnQJiC98Gw54IAsaTdKR7/6q3Vl2h
	fw86g7cj9o0KVOdiqcYL8Xi3p/S9KSL0joJBO3znI2C3QfrVWtGCRP20cI5N9sZePrUgwDclT2S
	7+MXnFvKNozlHenjkN8Vnxtc8QoNagyoWk3YszrArdW+fsyQ6IscWjlRXngvV2KQLX8G4T7QrY2
	tg0UtTkkoSNx8HqVNYMiF7WHnZJ44YtC0E9/csaDYdZhXNybMVLPc/ZnA+lvc/hT01GT65LvcYe
	4uEVP3UkE6Y+ym0hhDThAIgWf7B4BvTagDB6/Ai/UcIpWnlWBlt+M+E5tMDZAVOJh50eH/7y3DZ
	E7Gjus7zzt4/ixbIY4KFt23REQCKJgdOe63um7xPfURJTZV2etoUkp5CAj4pydgdNRcv6uSVQdb
	WOE+UzQX4n/eGJ5TBnXbWzGduLjONOQ3xVNnwl4KbtDOGclarezRROO+xx5rx8zXQ6rcZNoCEGQ
	etzlrqSqDbxyx9CPnLxjjhsmT8ByzfhhmM1DAquW9SvcTN7fLd7It8EWQDGHaGvod/TgvtETXZv
	vcoWLlmRSVG3wmv+OmcF2P+BcZGs7XUFYrrC3WqDGXszSOVhX/TxVRhJRf7wUsIp7p8I57i2aJu
	4ywTDTNyktM8ogzqAkaljaAK4fwRJaag76KgJRrzd+B4hlulFisTMcZcSQ+InM+1iM8NqQdUiy6
	OxUPjBAAwMtXRAQhKPFWu676W9rvlwDIuYIq9CcU0fkzNwFtptOUwWRmEKW6FkUH0Tn1vos00+2
	PbXZ5W8UxqdfUPkIeOErhYVKF7EvryJ8g9fkOQNRv/dDF10Je09iJrn93mz3cexQri0SFv3Z8j8
	ScMXKnSAfOV7TD5M9soe9RYhzg==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr31751764eec.14.1795888073700;
        Sat, 28 Nov 2026 09:47:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm99402147eec.5.2026.11.28.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:47:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] avahi: Mark the upstream version as unknown until 0.9 is released
Date: Sat, 28 Nov 2026 09:47:50 -0800
Message-ID: <20261128174750.1470765-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 17:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251502
Content-Type: text/plain; charset="utf-8"

avahi is built from the v0.9-rc5 tag. The git upstream check ignores
tags that contain "rc", so the newest version it finds is 0.8, older
than PV, and check-upgrade-status reports UNKNOWN_BROKEN. Set
UPSTREAM_VERSION_UNKNOWN; once 0.9 is tagged the check reports
KNOWN_BROKEN, which shows that the recipe can move to the release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-connectivity/avahi/avahi_0.9.bb
index 72be13885c..d5f8cd8ae9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -30,6 +30,9 @@ SRC_URI = "git://github.com/avahi/avahi;protocol=https;branch=master;tag=v0.9-rc
 PV = "0.9~rc5"
 SRCREV = "71b640e686964efb27cb708f4457ffaed183c319"
 
+# The git tag check skips -rc tags and there is no 0.9 release yet
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
 
 CVE_STATUS[CVE-2021-26720] = "not-applicable-platform: Issue only affects Debian/SUSE"
