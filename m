Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C96AC5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10730.1787471365986754469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q01OQE+9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso19499235e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471364; x=1788076164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o76e/9KX3Jgv5hoYO00dyOnzqhqaAayQwy1MA6jVpNQ=;
        b=Q01OQE+9f3hG/u5bThS8ymtB9NQ8aHnzCWhSr2gkQBUFsRqU2j2HVk0cat5BbbRlq3
         ZLxvz9RdCgRXEGbCCA2/zsK9r1NBKHl/c/y4QHgseZFoWIJ6b1qjXZ/tAbxQLB7YmqzH
         o+v4hdG0Dal1kTLj4WC5YTbjhPdquL/9FtzqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471364; x=1788076164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o76e/9KX3Jgv5hoYO00dyOnzqhqaAayQwy1MA6jVpNQ=;
        b=Trg/rQ5w5vuwS8bEnF/uwaKb/w5ob26SxFgEx+BsgFZSJp31XPWMHv/Q5eHguwOvd0
         EL04StwNUgPWfDVyJzCt8norxinV3eXP9ld54e+gN4OpVK8UOHbs1OEtCNAuHx1phxgp
         bWS/6yZsxRHeutxFFEiKutW5wAKC9YWa2N2Y7A8VTOqNYx0Pxphjz4vOGNAR1UuDzQdZ
         srnw7vIceEEv1olGdGg/aiFF6q8Uu/NL9HP8zvEUVKRiCUp/ZtTTUXs7elMv74/xlKNv
         EIOlrfmQyt4iEIYFjVXRrI2n/C99/ogAN7S/qZmjK5Pkbu5Y4p4M+YIbLfSSH+KRH5WE
         mjyg==
X-Gm-Message-State: AFuF++kjirLHgTmcuNONZze3rVZAA1vgWo6Yy7ddds/5VkBFlnU3JZmG
	+y9ktdwvTOqzkMS626bUa+JQ8jC+kjjrSrE5KnN1a6gCEk/xQli15otZxwJuO3BuTRKjCn1yj8t
	LJ24u34s=
X-Gm-Gg: AR+sD12xkq7pFxJhohFULUIH6+ys3p9d0OAmdvaqRQXfg6Cg/+tJ9uJrWGU6bc2L1C3
	cdKdBhhDJrvOYT93OKT9PvmK8yKW8pJz97m2dEd+ZWzesK/k2k5VxWOaunpb8BBDVxUIEU0dtWJ
	SZyHUB8a4dNJNcbt1ZO0ecfM8NVy3YqQ6SSXU29qLEsNOT3B0US+HULbxMzBfkcXMypRnAFN654
	IepH2AouRmuNyuiNnBVIB/ikLvBw/FnWzZz0bUgv2RPSxoTnVB7Z2k18SnIV1UzqKjUF2Mgvk8n
	EdPG/ZQhoeS3KPW2H9omZq+b/xWgL3buxrf78bTXYC4/RwXi2SzIlfklz1jr6IqrdcpkKQthDok
	jPVa1wKYX41hLpW4kQZT5Gdb/DnFfkQiwXawq/MkCsIm15xnzJSXvELtTvimJjy2tOqkj/v5/jl
	RHzkHWYs1oi4tDCo4h79dr+Y89P37ABtwQbd10CYGMsilQ/OX1dopJygP8EsoARV3vLRua/Wd2C
	0f8S9K+/xCuunvhqQ==
X-Received: by 2002:a05:600c:3b04:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-499c19d733emr83590595e9.11.1787471364116;
        Sun, 23 Aug 2026 00:49:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] python3-pdm: upgrade 2.28.0 -> 2.28.2
Date: Sun, 23 Aug 2026 08:49:08 +0100
Message-ID: <20260823074911.1711858-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244015

Source: CHANGELOG.md

- Keep environment inspection working for Python 3.9 targets when PDM uses dep-logic 0.7 or newer.
- Cache the update check timestamp even when the version lookup fails, so that pdm no longer appears to hang on every command when PyPI is unreachable.
- Don't crash with an `IndexError` when listing scripts and one of them is blank. A blank script is now listed as `<BLANK_SCRIPT>`.
- Keep the whole template URL when `pdm new` is given an `ssh://` or credentialed Git URL, instead of truncating it at the userinfo `@`.
- Strip comments preceded by any whitespace, not only a plain space, when importing a `requirements.txt` file.
- Match `--trusted-host` on host and port when importing a `requirements.txt` file, and keep the port when exporting one.
- Expand a `~` prefix in the `venv.location` config so `pdm venv list/remove/activate/purge` find virtualenvs created under it.
- Convert a Poetry caret constraint on a `0.x` version to the upper bound Poetry documents, so `^0.2.3` becomes `<0.3.0` and `^0.0.3` becomes `<0.0.4` instead of `<1.0.0`.
- Fill in a placeholder `project.name` and `project.version` for the `pyproject.toml` generated for `uv`, so `pdm lock`/`pdm install` work with `use_uv` on a project that declares neither.
- Resolve nested requirement paths relative to remote requirements file URLs. ([#3850](https://github.com/pdm-project/pdm/issues/3850))

- Defer command action and Python installer imports until their corresponding runtime paths execute.
- Add `{run_cwd}` placeholder for scripts to reference the original working directory.
- Add opt-in canonical lock input freshness via `tool.pdm.resolution.lock_inputs` while retaining sticky lockfile behavior and legacy hash fallback for existing lock files.
- Integrate `argcomplete` for simplified command-line completion scripts.

- Keep workspace members in their explicitly declared dependency groups instead of adding them to ``default`` in the lockfile.
- Keep the cached parsed version intact when stripping the local segment in `comparable_version()`.
- Make `use_uv` support adding local files.
- Add a Poetry optional dependency to every extra that lists it when importing, instead of only the first one.
- Do not write null values into the generated `pyproject.toml` when importing a flit project that omits `author-email`/`maintainer-email` or sets only one of `include` and `exclude` in `[tool.flit.sdist]`.

- Add Python 3.15 preview version to the CI matrix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pdm_2.28.0.bb => python3-pdm_2.28.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.28.0.bb => python3-pdm_2.28.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.28.0.bb b/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.28.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.28.2.bb
index 23d2f9e5214..7dd74040ed7 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "ca7d21548955086985070d2fe4334a55e59093a466b25eebc6bb0769a0539e89"
+SRC_URI[sha256sum] = "dc31c1d11c2e90564207181f87ca3d6fc16ee6584d703c0a9e0c03ba287a925a"
 
 inherit pypi python_pdm
 

