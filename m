Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128A0C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:29:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18781.1780381789581952088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KH2zZGTq;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3184c71so14892355ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381789; x=1780986589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkFawwUuTFZHCGvlYqPJGtOC3tj7Sj8I/P1izjxn5Cg=;
        b=KH2zZGTq61bF10qzPapaaJbOx03UynGW4t3IIWA7EyZhYfL2GK4eDLc8UO9IuYtJ9K
         xyWgKNdq4l13Y2D8Q9ycnsuJZjU9VZUh2I4l2Cv7MmC/aT3Il3j8RwSH8/5m3x6NbrUS
         neBSPyZdMNFzv3mWNwMTu+FgpwB86n2suJeVc2eYw3d8HjC68hU8gnKnWhS2c0MAl5nD
         W/kotyiE89itvh4kYHmbJnCtq0gpI2/03dTuGvNN4Zr3UIzpxMhqtLjWhRZ9hwGbPgh8
         dWuzWBj/dyhjLBW4lBMxTGmOwI11dG4BYu3d2VKOoRf1NNxcSnH2nnQajrKaLfTNj+dd
         LmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381789; x=1780986589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkFawwUuTFZHCGvlYqPJGtOC3tj7Sj8I/P1izjxn5Cg=;
        b=Ml1hIZEE+nEofNjWPYeggHCj/IRCjCZAcJuxdPrX8zGQmpuMOJyuMtWJkjOiaT0Upi
         msbwXfFy4IbE8AGFnpl3De6DIao7PZdiYMz7sYqiEjJsm3ncF0CQ9XDmNaBfbr03xNGR
         jbOqiPRLS1nf56OoOYLzcxwrWcJ5+kqPQQPrzuym10O7cYj629T1tyEjrInER0d8/IY5
         HJ+LnZKVD+AbifHJS0v0y+hW81UVhYxjAKO169p4BJW7WBURKIARh5YMC1H5zVvdHpOA
         3iq+bLOjIQ2JLcYhYOjlI+o5T1b2n8MWH5SmL97QjlF/9gqRM+MqFwD2xSLeEbVS9FZJ
         vbYA==
X-Gm-Message-State: AOJu0Yz4hrSzS0R3z87Q8LUnFOc7WR3w1FEnd65jkHZlF0dosRB9+g9s
	QVY3rQqpH1c7D/2y1lFd2zSejM9fdBCDoGmDk3IbYJKpZZU86PExGPb1k2l1kWfw
X-Gm-Gg: Acq92OGFHjinpkVcppUFeEeGv4vjQtgmO0nrCHSLr4SSAJ7RMdrJk3sBtJIfnWRXJuL
	4E52nDXTPcOtXzrY+k+e63sjZCapvQIUX5BsPw4t7wOIXaI6VqKa5sgQTQFNF7Th3lC73MDpVTD
	2kwVevd4Iqpr4P1P7+nFtoGumub/eI1QAD+ZRHPR3YuRlpr4LWSgsnUwKjNXwPlgRaLHK/+kAxw
	VfA83hFwrxnjcFWSeinWVVo+aJItOB5ycd//OzK3E7C/W+kJI8UUxMBBuaDUyhQ5AKQlazCk7Ur
	oIA3FRKRQ/2aFC/mrxOx6JxFB/IiFKdAJePZ3brfTIC6B4uAeGT76lSAEOToL4YB354aSL/eW2o
	V965+chNRo12Wd+ebsu6DT9/ZUlM2u6loMMqe5K+AATNnmKtwVm25ICWvv5JvBSrS5WUQh5BWKz
	Vp8B3iSAWqX0Msw/YkGP6qtGH0MNWP8nfmsvEY+o1b/c9j1N/BgJTBEC4v
X-Received: by 2002:a17:903:1905:b0:2bf:23ad:858b with SMTP id d9443c01a7336-2bf367aa890mr166889465ad.9.1780381788888;
        Mon, 01 Jun 2026 23:29:48 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.118.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm128280255ad.76.2026.06.01.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:29:48 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v5 0/4] Add missing SRCREV check for SCM URIs
Date: Tue,  2 Jun 2026 11:59:36 +0530
Message-Id: <20260602062940.3107241-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238000

This patch series adds a check for git:// (and other SCM) URIs in
SRC_URI that are missing a corresponding SRCREV, addressing
Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2].

== Changes since v4 ==

- Add tag= to skip condition in oe.qa.check_uri_srcrev() alongside
  the existing rev= handling. This fixes a selftest breakage
  (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand where
  recipes using tag= in SRC_URI intentionally leave SRCREV empty.
- Update docstring to mention tag= parameter
- Verified by running full bbtests.BitbakeTests selftest suite:
  32/33 passed, 1 failure (test_image_manifest) is unrelated as it
  requires building a full image and fails due to network constraints

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

