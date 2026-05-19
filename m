Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F035FCD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:32:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18084.1779186776428677823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JFSEjAKA;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: saisneha196@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-366330b6751so2692273a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779186776; x=1779791576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4vAbX5jGZzYzzSmNjQr+V1fe6iQ3oQ38LLZuM8af1o=;
        b=JFSEjAKAccNu/Uetfva+JkRuPWiVtJM52IDpi5b6jOe81N8emvJ54AMLsSxl7pOkfn
         UFgyfDrtc95/MlN74CDNyrskB5lnG/4bRK7DUmf0SR2dG7tzo4uaKk4TgYBv2TVmWc7/
         v7U9S49ekHcMBQvdDBM0/HeXG/WolE9YmBMHlAATg5IgzwFnkywNtFoltCtma/zUFyOu
         oNTcsm2cDfbJ1794wOtVFAyHpNlge7wZu9GNHaYW505WcOYdDLq8vO4+NB8oGrtaRUb5
         xO/ev8omGd0btWC/7iWA2sJ6s0E+4APsbrQVp30JA2o/WqLLo+2yfbaVUMZ1YWUh1JDs
         FU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186776; x=1779791576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4vAbX5jGZzYzzSmNjQr+V1fe6iQ3oQ38LLZuM8af1o=;
        b=RdMDTNIxazn/+oduADWYF8Ekf+JPpFHPIXLNRLgc9NzS25wYTeSLHMWk0Z4mHgknIg
         4+36NQXOqPQfLRJyN3FtUAle5yQmEZW47lU2dUHBPzEdMhGJPS0D85Md6N/CowuL4J1x
         tqaGmwQtjxfVVQxqqYWh1opaDUgiHJ9sxzBGw9HC7soGBnxojA6UsUyUwkwbn4KDoDuY
         UzB+Bq0kZfocXFKzsjOPjVeiRWpzxB95XF3IJzXTzmFDTRiwyF68VsEQbNZVAmYoA1+6
         4nwgSJW0A2KuWkrWGHWLQRlmNIX/5u+CProBUUA4fQyNg40oynwYfvz0+1NXp/ap41EF
         aEQg==
X-Gm-Message-State: AOJu0YzcqSBhmAFosJtrIj4oO/r8+YqfNbxpp8YwJ0pGQlbgSmUsFH/d
	ZsvPU3cGmpZ0aJ8SvyRB7NMbF7U0jG24mZEJraOOmszE5myBXHyPJlM1iuP4pQ==
X-Gm-Gg: Acq92OFOuHXwAWW+HgBA3kgo6zEg8XJ2qlUp/APQPp0U62q8zMRnqXMubDcj8PJOGsQ
	SvdZ9oImsxMxpsid7xLvorHdV6AI52IHvv5MzW/lm/0QJR8fSh7Ilbk6TAUptaI9JUsEfvETRtf
	J7yK7ewJJCL6nbP2rcgQd/7vwa7//Ijlu/N6pSjKeF2QQZ1wUHzFx2vpWSRTIkq0UQQM23XNOon
	tXeN84ULXrVQrUsnM6T8HWfgA+PVmf7qcthpranuDDKim7DtYwAW0kAnJM0d8CQgfR1D0ZENiqV
	HQ5UnyrADfxpbOlP8RJbUeKSPLmI9sbwdeEgvxfK1j2AngRRy9HwArPB8l53EAkIXivmg5JXy7W
	i6R/cII/afC3iaBgpgSObubP9FBXs04hIozSfPl8VJVdNRNt5SnmBx7NhnjAupKSSNSW2Q+ZMHS
	JVDjlvGSNGN6HgV+gPy/klmJNbosqdTjMgR/6Z4+DtSRLO5Q==
X-Received: by 2002:a17:90b:524a:b0:369:a962:8cca with SMTP id 98e67ed59e1d1-369a9629ab4mr9382278a91.11.1779186775874;
        Tue, 19 May 2026 03:32:55 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06268asm15383709a12.1.2026.05.19.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:32:55 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v2 0/3] Add missing SRCREV check for SCM URIs
Date: Tue, 19 May 2026 16:02:46 +0530
Message-Id: <20260519103249.236132-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237306

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


-- 
Note: This patch series was developed with assistance from Anthropic
Claude (AI). All code has been reviewed, tested, and verified by the
contributor. The Signed-off-by line represents the contributor's own
certification per the Developer's Certificate of Origin.

