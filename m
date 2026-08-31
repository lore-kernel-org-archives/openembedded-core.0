Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D8C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25597.1788167074758183034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aqIkW+77;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 153404E41464
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D72E960231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 275E011C78B30;
	Mon, 31 Aug 2026 11:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fjZWvqzNOiNkVo+MNn8S6CQLl0ESevlFkCdXha2oS+w=;
	b=aqIkW+77mOTC2B3MbiJ3j2ZcZIOhB3FE9uOkS7XRqlpTIYieM4ITN3mwpYt4kC6af80g3F
	XkGaC4K4TYOl5XxWK5cNKsVnYSwogtVN13DG443vHpn0k8C/JC7LuTwTSZI+K04JYXGn8G
	2cQ1Y6S6Ljioq4gs45BYX+egmQvn7wpKRiLWxrbZ2BRQ78XZlnF+lg4Bhtz3TnD7aXAoph
	qepEl5svjpGacFNohrjr0XZQ2rCL3cnBDKPSzpBGzjKNj3FPv8yOYwmtvjsuUpwOSeSY2m
	69yjLD12xh39fBFsGOtjDNuC6JDCChjt767YfeYk6pMYAcGpkWLPO4x0NKt7rA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:40 +0200
Subject: [PATCH 8/9] python3-pdm: upgrade 2.28.2 -> 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-8-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=3195;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=3bBIKE/CMTqoPvwtdrj0lBNJlzkoTnD/zEVu7RFqCm0=;
 b=YplEagk+68y7REhgSin2vkiAUGWKcg6DjcZK/7b1vHpFRbBsjYWwMrNxjr7EDFXlu4EzXCJEY
 DSvvI84ox51AC7FHWw7iq32pfEHRF5n379gY+qoUc3H8YLILYtiMitJ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244750

Source: CHANGELOG.md

- Export editable local dependencies with relative paths in requirements files. ([#3294](https://github.com/pdm-project/pdm/issues/3294))
- Extend `pdm run` with `--env`, `--env-file` and `--working-dir` options to set or override the corresponding script options dynamically. ([#3829](https://github.com/pdm-project/pdm/issues/3829))

- Restrict a locked package to the platform it was resolved for when it doesn't belong to every lock target, so `pdm lock --platform ... --append` no longer adds entries that get installed on the other targets. ([#3261](https://github.com/pdm-project/pdm/issues/3261))
- Keep Poetry `include` entries restricted to the sdist format when importing, writing them to `tool.pdm.build.source-includes` instead of dropping them. ([#3854](https://github.com/pdm-project/pdm/issues/3854))
- Accept `--no-verify-ssl` on `pdm publish`, which was misspelled as `--no-very-ssl`. The old spelling keeps working as an alias. ([#3857](https://github.com/pdm-project/pdm/issues/3857))
- Convert Poetry tilde constraints with fewer than three components to the bounds Poetry means: `~1.2` becomes `<1.3` rather than `<2.0`, and `~1` no longer produces an invalid `~=1` specifier that aborts the import. ([#3858](https://github.com/pdm-project/pdm/issues/3858))
- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints. ([#3860](https://github.com/pdm-project/pdm/issues/3860))
- Keep importing a Poetry project when an author or maintainer entry does not fit the `Name <email>` pattern. ([#3861](https://github.com/pdm-project/pdm/issues/3861))
- Skip `requires-python` when a Pipfile `[requires]` table has no python version, instead of writing `>=None`. ([#3862](https://github.com/pdm-project/pdm/issues/3862))
- Leave the version and description empty instead of aborting when a flit module cannot be parsed. ([#3864](https://github.com/pdm-project/pdm/issues/3864))
- Respect dependency group selection options when exporting to `pylock.toml`, producing a single-use lock file that contains only the selected packages. ([#3866](https://github.com/pdm-project/pdm/issues/3866))

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-pdm_2.28.2.bb => python3-pdm_2.29.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.28.2.bb b/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.28.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.0.bb
index 7dd74040ed72..faf9b63a3d8c 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "dc31c1d11c2e90564207181f87ca3d6fc16ee6584d703c0a9e0c03ba287a925a"
+SRC_URI[sha256sum] = "28c520267a15d7a3921b934ec4bfc2d1dc18379fbb653bb20d8e840b2788be6b"
 
 inherit pypi python_pdm
 

-- 
2.47.3


