Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77902CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:09:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17799.1779185356405889776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dHglEcOh;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: saisneha196@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1456746a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185355; x=1779790155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdC2ZMQgTU/wA9yLZoJVEmDnvopQ7g42B5yw8JMOBdg=;
        b=dHglEcOhZsAvWKdMPo5Z71g7aMhd8o7kTCLHWECl+miLR/9H6yAnKbkVe61UKeZ7dN
         Dxbb1OPyR0B2sZYIJouaFFGToric7eRpd/FwyEXM71U0KBBtm8fg1+apT+UFqgH/iIVO
         xVpABSMQTbXiFjJsPUgMLxSWWM/XB/UgoVNpgaeG+WVJFyJ94vaOCr42fK/ZUolqo61/
         dMwTW31jcfHWZ9kmtwS9X9VcRa7y06ZPQYPtPnwYMLfXuOxUzEi54ckuRImt55UQdDH2
         pfgR7P12yOfjxMSV6t6n2V94wYUwRp1bQSzj3nENtIPtAYqNYuPfqeYsbs+UQk5gYDFI
         cHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185355; x=1779790155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdC2ZMQgTU/wA9yLZoJVEmDnvopQ7g42B5yw8JMOBdg=;
        b=EHLm35OwtAzY4C4GtNWPMYep0djMLIVozLoMxP7e2WE6jj8XyVXz+rwWOrgySu76yg
         VHMZlTiV7MfBhsmjGa2wFvxTRgnFkmkIsB4xSBewv6Ax3lGOGmGl3Y5iGW2GGEev3OZ1
         xDMzJRI4GgnrNi3ppyGlytLTEQwzwE55h6GrstlmtMv8sxdDgvDRR+Ek3/shfcgpr3ox
         Y5oCY/+v/dIdET+gX/nHfbMoeU7D4RPhS9rMxRk6tPaA0RyLuAl1Z1GoSoDVMbv7XfKx
         LqXU6J2CVt4iZnKL+bK8SAfOu6kdgl0tIPHAFOGOqDcB04KlrCyehX2Xqktsjn92bQIg
         halg==
X-Gm-Message-State: AOJu0Yxafp1HXHA55ZhDRPotL9S1EsosZ4K4OGtR/VvryLSO58TP8CJ/
	u8VT/X2eucGwPXKmS2FkVWPE2sEtHGKKuQrotx6AImUTubPhLixVSqlaMCHwrLkx
X-Gm-Gg: Acq92OFwlmFmWuDyFtRLuIwqipaIu875VXWGOX+eCbzTeNbtj5hmtzPqmhzaAQ6rsAx
	SfklA1YMhmqlxub5EQrOK/vhB2Q64KqDPTOT6O2ME12CTQvKaygtYghkkOv3xRnTJIT+ph8pMhZ
	YQ2fdMibc9pIo9TEx/utReYPVQJDG5qPQo2AJCWxvUyqU/UMUKZ5Q+P7XlBk/EeQivuNj+5wOIk
	GBtkLs/pQoY8QyBzxFHe+nNV4ZlWqzMLAU05Qh8vi0rryPpDJC7u/xkYPKeOyoK0koUu8ZjsghJ
	cVrb6QAZuTcsSOFlug8UEsMFxIYOaAY3fIKGmgFkwv6xp+o5R9mLArEHcbtJRPkDtzSz3Jivq1X
	ZgObKYiFdhHq+pLEu+NKpaswE9u9q8uugauuNy6NSe7YjE7uMcQ6/yViZexQL7CxVgh0j13QAuq
	uoppykYdLAbhHT4ZZpJkdfp/AZv/je2mD50YhrOxWu8Ad80A==
X-Received: by 2002:a17:902:7083:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bd7e9381bdmr144370995ad.29.1779185355218;
        Tue, 19 May 2026 03:09:15 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm231081355ad.63.2026.05.19.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:09:14 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v2 0/3] Add missing SRCREV check for SCM URIs
Date: Tue, 19 May 2026 15:39:01 +0530
Message-Id: <20260519100904.235971-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237300

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


