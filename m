Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E4DCD5BC9
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 11:18:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18205.1779880688906941495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jg9yWquh;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so120412895ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779880688; x=1780485488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkx4Dnjl4/EU+vxu804ez0FRWPrWsar2TRwL/0IZx7c=;
        b=Jg9yWquhMS3ojSusySMt4T2XL5tybwEhuAmIySZtndwkgUTjJalhiy/SkCHzrzriwv
         YbsVGfSZIu+oOw0vMiIFt0OeHPpRCh6cMvzP/xw1pea0SvIovBCYx0LRfH/jHSK2tY3J
         fEgg0vFClcZLtvO7xjQMMfwceK57LyyMonMVjS1v9fBfT3nxI94lIAHFAPULq+5Wzbh5
         3AgPJJ7vpkEhWwnDXRmQMQVE2bT+Md7AKXW0m+9V40Ac+CJq8CryELditLVnnzvo865/
         OhJ1B3hYBd0zhmDT+9uzmeOFxDFNw2JRHOZVWV75HQOS34L7Dm2M80j70iu2bjg3V2VW
         Q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880688; x=1780485488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkx4Dnjl4/EU+vxu804ez0FRWPrWsar2TRwL/0IZx7c=;
        b=MTFVHuO00c6RePv4HdbmBk93jTvWyNAFg6gC+irqBBZ6s2d7u84GC5bB5SJBiN2ZT1
         LoPk/+J6RVzO5jgkVqo+7o+77Av824P4yWwJRAPAflTEnytjQ1RNeWY20V/pgKxzUT30
         EcKwiLB81C68obfKlISkSa5sq03Fw++Rd3MrwcutgEckQO9213vV6m+0ZoEIrU9Dw6oC
         8LwrrBOORoUc4TwLYe6w3ut1Fpcw/p6PQKFMLseMFBZduQTbCFKvrmK8wvA9XBaTxYOb
         4JPPGXQ6u2AYhofxIaXBokMuUJlVG/R8FMBp+VGE0fNA7qT0CCcTLTUMFUgENHQaFV6F
         g+uQ==
X-Gm-Message-State: AOJu0YxiZn6NsS48xi0AHuRpKfYYGd8yEq+FxohC8SsGPpCtFYPR7VdG
	KiLxRxDbVcZPhe37fkbVZx2KqBkAVs7firQ7brS9g0XsOtHf2s48kbUIt/wVZZhw
X-Gm-Gg: Acq92OE8uF8Rc972NAhhcxa/mz1d/l+X/agyxAqcaevCb/q0Lie87CRod8Za57VqV+x
	OkfR2iyTfOWZ/5j5srUwdKgUTATkl4GwZKRSg+mN8CXTz1b+9uxEMlJ8Tvvhwzz7gaf0vS2GeVx
	T2eBWvXyaTOIolQXcg64Zbf2R2lvz3VKprGZZAChYOee19f6fDsYQdKuWKs8PDMwjpWnbvMreQQ
	C72DqyeU1f/i5qTAMtfF3JFzowTZPxWovX9vsXcYKEd7xZb1bTiAZJCBRsI1Cthtxf3oIQpOsTD
	b16XD/L41uRYspOqHADK3oYm1FsosxKAVBndROUU42oZDQiUThymy+0ShQVV+mXzRkrt2hqBpzo
	qec3DWgb4R/04R3RiLdms9Fr5zW4Z4MWugwwOgm7iYOrN22DN6cwyv8h/Zp6kiGNnt4VLP3ySLa
	fTJTUK2Bc4hqvOHVTJ+H4Q2hMKEob2jPZWa8X59sO6new5HrCVwL7u52Pyu4yBYtljrs8=
X-Received: by 2002:a17:902:cccf:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2beb0626253mr272909945ad.30.1779880688038;
        Wed, 27 May 2026 04:18:08 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.21.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm192079475ad.23.2026.05.27.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:18:07 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v4 0/4] Add missing SRCREV check for SCM URIs
Date: Wed, 27 May 2026 16:47:52 +0530
Message-Id: <20260527111756.1306022-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237641

This patch series adds a check for git:// (and other SCM) URIs in
SRC_URI that are missing a corresponding SRCREV, addressing
Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2].

== Changes since v3 ==

- Factored common SRCREV checking logic into shared helper
  oe.qa.check_uri_srcrev() in oe/qa.py (new Patch 1)
- Eliminates code duplication across base.bbclass, insane.bbclass
  and yocto-check-layer.bbclass
- Used for-else pattern, f-strings, simplified name lookup per review
- Renamed raw to rev for clarity
- Added docstrings explaining return values
- Added changelogs to each patch
- Corrected characterization of Corentin patches 3 and 4

== Note on CHECKLAYER_REQUIRED_TESTS ==

Paul suggested using CHECKLAYER_REQUIRED_TESTS instead of Patch 4.
We tested this but found it promotes missing-srcrev to ERROR_QA for
ALL layers globally during normal builds, because CHECKLAYER_REQUIRED_TESTS
feeds directly into ERROR_QA. This contradicts Bug 16051 Comment 3
which requests keeping it as a warning for external layers by default.
The direct implementation in yocto-check-layer.bbclass enforces it
strictly only during checklayer validation without affecting normal builds.

== Note on candidates list order ==

Martin suggested reversing the candidates list so plain SRCREV is
tested first. We kept most-specific-first order because it mirrors
BitBake internal srcrev_internal_helper() resolution order exactly,
as confirmed by BitBake own error messages:
  SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV

== Problem ==

A recipe with a git:// URI and no SRCREV causes two problems:

1. Under BB_NO_NETWORK=1, parsing fails with a FetchError that halts
   parsing of ALL recipes. This breaks CI pipelines that use
   bitbake --parse-only as a sanity check.

2. Without BB_NO_NETWORK, BitBake silently queries the remote
   repository on every parse, breaking reproducibility.

== Why the trivial fix does not work ==

The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
was attempted by Corentin Guillevic [2] but fails because
fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
BEFORE QA checks run. Corentin patches 1 and 2 add the QA check,
while patches 3 and 4 ensure devtool and recipetool only use
AUTOREV when appropriate.

== This series approach ==

We intercept at the vardepvalue expansion point in base.bbclass
using a shared helper oe.qa.check_uri_srcrev() that uses
d.getVar(candidate, False) preventing expansion entirely.

== Design decisions ==

1. Why not use srcrev_internal_helper()

   It expands SRCREV internally, triggering get_autorev() and live
   network fetches. Our fallback chain mirrors BitBake resolution
   order exactly without expansion.

2. Why duplicate warnings at parse time AND QA time

   Parse-time catches CI parse-only pipelines. QA-time gives proper
   layer control. This pattern is established - src-uri-bad does same.

3. Why hardcode git/gitsm/hg/svn schemes

   Known limitation, noted as follow-on improvement.

== Enforcement levels ==

  Normal builds, all layers  ->  WARN_QA
  oe-core layer              ->  ERROR_QA
  yocto-check-layer runs     ->  ERROR

== Testing ==

- Recipe with missing SRCREV -> WARNING/ERROR at parse time
- Recipe with SRCREV = AUTOREV -> silent passthrough
- Recipe with rev= in URI -> no false positive
- Recipe with multiple SCM URIs -> all missing SRCREVs reported
- oe-core recipe -> ERROR instead of WARNING
- yocto-check-layer on layer with missing SRCREV -> FAIL
- 952 other recipes parse cleanly -> 0 errors

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
[2] https://lore.kernel.org/openembedded-core/20260304104342.869457-1-corentin.guillevic@smile.fr/
[3] https://lists.openembedded.org/g/openembedded-devel/topic/115911777

Sai Sneha (4):
  oe/qa.py: add check_uri_srcrev() helper for SCM URI SRCREV validation
  base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
  insane.bbclass: add missing-srcrev QA check for SCM URIs
  yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation

 meta/classes-global/base.bbclass              | 28 ++++++++++
 meta/classes-global/insane.bbclass            | 13 +++++
 meta/classes-global/yocto-check-layer.bbclass | 15 ++++++
 meta/lib/oe/qa.py                             | 30 +++++++++++
 4 files changed, 86 insertions(+), 2 deletions(-)

--
Note: This patch series was developed with assistance from Anthropic
Claude (AI). All code has been reviewed, tested, and verified by the
contributor. The Signed-off-by line represents the contributor own
certification per the Developer Certificate of Origin.

