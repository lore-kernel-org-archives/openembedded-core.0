Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A10CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:22:20 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17209.1779182083087943529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HUOjkSUJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: saisneha196@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43496e6a964so2422087fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182082; x=1779786882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdC2ZMQgTU/wA9yLZoJVEmDnvopQ7g42B5yw8JMOBdg=;
        b=HUOjkSUJ2BwWBaerr5w92dL+beZ8+2GjoKx6wryHosHfbja23BfeI0lcGEbR8b5tO/
         jDfS1ImqndWTo9MiGlRwULdkquy1abgiCZwpP2+3bwcojUWzt7/GDDluChc01R8HaHsw
         e1QxVZQtT51JSYoUOlJU87SYa9qgU7uJ2Wg6nIL4ge/xCpFDr6l0PHOS1mxrCf6PrEbS
         2AuHVjNK6bLjTS7DhbwBCxl2Wgqcdw62MVBM1RAso4cctsUFL21iDvPAH7Ys9Pf619sM
         W1QF4yMGu+sxOJayQqTwQGKVIItzsKHR49mKy74Ql2eDlUgpk/tSsIvqiOAKQ1JZjx+p
         gd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182082; x=1779786882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdC2ZMQgTU/wA9yLZoJVEmDnvopQ7g42B5yw8JMOBdg=;
        b=P6H+iudxhZdqlemT7ddwY+gFcPqerrYUFulT3EKjDCUDg4cJeyIw9KEUL+Gt9jm/Nc
         pydFQTbEQBFQ7skGinAbEgGUc3YKffMTkhMZB23xLZdIRDyYSAbC4/BGRZQv9cvQGlJr
         XcTVvlFEX9Dg7H0bGo7X5WFmK7Pg1PbeOsRCeUeLqGDiibv6rmLUK6xNKvhUdZrzdaET
         3ofROTq/EH1tiuM8oEXMCcsKyJyXLJaNLSo85egyglMOMjqXKA68KwsTFHeqtD3RXBwn
         9ELLNM96ss5yzO16bsFjw0uN2xNwtYxDt4gA491mBSxzvXSD6YAQz9CuaooxCvviM1Xf
         xnXw==
X-Gm-Message-State: AOJu0Yz8RIyRWobDmPUjZ98QF6WRj/gPONjTt/aipxRZd96QH6hflb6J
	z6whOk3XRhKyLyT1Tk6+pXyPXtiUFGA2GgTAxeBpbk02uJieyY1qQF719ETZ+1uJ
X-Gm-Gg: Acq92OHz1PhDeWklcz2IerC+UbciO5UwCVmQsT3FfQJw4Du3yoBVXg+x698748KM4+d
	/ryR6lFFER4Q56OTFk+1rzBmw3neMD1oeCA+kc01Ynv3Va/g7+mxxawzV4r0L0emWp3KC3ARs14
	EwpdK39tACv8qwe85pDQ3lwzPu7ot+sGvi2s9T+eSmzO8W1Q2HW5Pq/0xWDG6PXqRo9qaIlNB+V
	XMLYAgatd6R9TrVs1S/DZxS6oekR0OK7JnemB65NaXcMhHg3u3LAO05k37ewOhjQrhrVEUC7bkN
	VF9VuTcGiF9qmizDh8rBHadaWlx1Muk93XSeb1XtL1gQh4Qcr3tx2AVU1Lim1ujtjv4Fg2SFe/q
	LdgogTqlIYbu+TmqvzzPbflgk2SfBRnBkLgObQrx7HZMrYGAsGmKvHzeqmhgVsGIsEw/ktT5A1+
	B4Jv49FiqMupNf9zF5o0KBmo5lrcOKorFltpw6WU1NTPEYPlE=
X-Received: by 2002:a17:903:1b4f:b0:2b0:6f21:8289 with SMTP id d9443c01a7336-2bd7e8d0d1emr196199215ad.25.1779181766023;
        Tue, 19 May 2026 02:09:26 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4935sm187342225ad.42.2026.05.19.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:25 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH 0/3] Add missing SRCREV check for SCM URIs
Date: Tue, 19 May 2026 14:39:15 +0530
Message-Id: <20260519090918.235880-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237313

This patch series adds a check for git:// (and other SCM) URIs in
SRC_URI that are missing a corresponding SRCREV, addressing
Bugzilla #16051 [1] and building on Corentin Guillevic's RFC series [2].

== Problem ==

A recipe with a git:// URI and no SRCREV causes two problems:

1. Under BB_NO_NETWORK=1, parsing fails with a FetchError that halts
   parsing of ALL recipes, not just the offending one. This breaks CI
   pipelines that use "bitbake --parse-only" as a sanity check, which
   was the original motivation reported by Ross Burton [3].

2. Without BB_NO_NETWORK, BitBake silently queries the remote
   repository on every parse, breaking reproducibility.

== Why the trivial fix doesn't work ==

The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
was attempted by Corentin Guillevic [2] but fails because
fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
BEFORE QA checks run. This triggers get_autorev() which causes:

  "AUTOREV/SRCPV set too late for the fetcher to work properly"

This was confirmed by Mathieu Dubois-Briand's autobuilder testing [2].
Corentin's series needed 4 patches including devtool/recipetool
workarounds to paper over the expansion crash.

== This series' approach ==

We intercept at the vardepvalue expansion point itself in base.bbclass:

  fetcher_hashes_dummyfunc[vardepvalue] = \
    "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"

check_srcrev_set() uses d.getVar(candidate, False) — the False flag
prevents expansion entirely, so get_autorev() is never triggered and
no network access occurs. This solves the root cause in one patch
without needing devtool/recipetool changes.

== Design decisions ==

1. Why not use srcrev_internal_helper()?

   srcrev_internal_helper() expands SRCREV internally, which triggers
   get_autorev() and live git ls-remote calls — exactly what we are
   trying to prevent. We intentionally use d.getVar(candidate, False)
   instead. Our fallback chain mirrors BitBake's resolution order
   exactly, as confirmed by BitBake's own error messages:
     SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV

2. Why duplicate warnings at parse time AND QA time?

   Parse-time warnings (base.bbclass) are necessary for CI pipelines
   running "bitbake --parse-only" with BB_NO_NETWORK=1 — they would
   miss the issue entirely if only QA-time warnings existed.
   QA-time warnings (insane.bbclass) are necessary for proper
   WARN_QA/ERROR_QA layer control and QA framework integration.
   This pattern is already established — src-uri-bad fires at both
   parse and QA time.

3. Why hardcode git/gitsm/hg/svn schemes?

   These are the fetchers that require SRCREV. This is a known
   limitation — if new SCM fetchers are added in future, this list
   will need updating. Noted as a follow-on improvement.

== Enforcement levels ==

  Normal builds, all layers  →  WARN_QA   (warning, build continues)
  oe-core layer              →  ERROR_QA  (error, strict enforcement)
  yocto-check-layer runs     →  ERROR     (layer validation fails)

This matches the graduated enforcement requested in Bug 16051
Comments 2 and 3.

== Testing ==

Tested on openembedded-core with:

- Recipe with missing SRCREV → WARNING/ERROR at parse time ✓
- Recipe with SRCREV = "${AUTOREV}" → silent passthrough ✓
- Recipe with rev= in URI → no false positive ✓
- Recipe with multiple SCM URIs → all missing SRCREVs reported ✓
- oe-core recipe → ERROR instead of WARNING ✓
- yocto-check-layer on layer with missing SRCREV → FAIL ✓
- 952 other recipes parse cleanly → 0 errors ✓

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
[2] https://lore.kernel.org/openembedded-core/20260304104342.869457-1-corentin.guillevic@smile.fr/
[3] https://lists.openembedded.org/g/openembedded-devel/topic/115911777

Sai Sneha (3):
  base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
  insane.bbclass: add missing-srcrev QA check for SCM URIs
  yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation

 meta/classes-global/base.bbclass             | 40 +++++++++++++++++++
 meta/classes-global/insane.bbclass           | 32 +++++++++++++++
 meta/classes-global/yocto-check-layer.bbclass| 32 +++++++++++++++
 3 files changed, 104 insertions(+), 2 deletions(-)


