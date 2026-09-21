Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93279C982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:20 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43675.1789974438855115518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dHAW4SZ4;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso21985445e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974437; x=1790579237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HzVP4ApqaXLl9nOOJRUI/gUulUC/8+NbnvsKNAzf4UU=;
        b=dHAW4SZ49TIdXN7YcJlYU2EnXMaoHD6rUJqHPnhmXtS+GZuG7tG2jxC/NWnzP+98YV
         6tttfiWIYUnGpvEE8OD25ti9Vr7RS2s4G2BeaZOnEnycDfTV+zEB3GN6Qc5rid4w7lhM
         pY18PJvtPZ4m6tRQbCCCRSqGz2GT3G9jstJDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974437; x=1790579237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HzVP4ApqaXLl9nOOJRUI/gUulUC/8+NbnvsKNAzf4UU=;
        b=NBMJTZMWJc9+AqhzLY/m86GZNxlyf223yQn/5HXkQWU9h7O1H88pxd4qEPBEnzHbNB
         f+nIO59rT5ZoKzNgRS/592rQd+T7IuF2Az92uMkOqF7f+JM3Ag3i+muHr0LQiFuqWhBx
         uetslSUYJi2KUxRb+o8TnuInJ5U85e9IAFxI5fpgFp9HfYtF3NsiLQRrlyoSps7YggDt
         JZJf7U2OYgQPZYcpMuN32NDkIegHjDbWEHWt26c0FgHSrwAzURC3O2l7P6R+mDBiRHhj
         /CD7Dxc2BdCzNY3UIh9JLQ0m4YO5bhHfVS/aIkI2KaQRAlp29C3PGih0rCAqZVmYC2J+
         rPUg==
X-Gm-Message-State: AFuF++k6QNPb3uVq7XhJ2oPWZJwMzNvthCp2Jv4yH1cu/qPOEUmnD/cc
	QMx16TFyVuwJygp5gZTjzOVbLfM4Epaf4pAizF/b9vyTyxk71HPGMomCnbwOG+/Z7joMMA+iTEa
	TcbN6+zA=
X-Gm-Gg: AYBFou12WJOLXsywX72nnL7tqyM+8phSme2WRsAnYzWSeUxNdYBUF95N3RXJThnM5u7
	xzdcVklONlbaopD5DmYTyKXUHp0q/qJDzZQDhrfFN2h2jfb2JrSHnGEaD23LhlU6Pn+7SYQEM8Q
	ji0Bw4aqZQpgPQKo/6IryJtjGrRuRVEmO4nqP/FQU988QAb0p//ZseBFye5vSjNA4bnZEvdQTbs
	wSv3JY8eyy5bd3KqzYA47yZklj4ZL39ItkpxjUnvbeUGn+GFr6qAzmFTfeAoaksjufT/f7F4nsA
	qZK3ahAq26hnVJyaSEn6bIpKN/3H3vv167juf1ce6s5BScgTG4x8K80BBG0NBuKAszsFQ57cGAT
	tVWsgrw7ai1vvIMgpvkPDliXepAXjSImWL5mSIwZWx1ao+7BUT0udj0utJcjduRvU7Y6WBHlRkm
	9iloINV62fnbw5M4bTBRl1iKudZrm0OlQ74rOB06iLVJO0jKJO/aAWBZmqXDPYHBh9e1mcS3cg8
	Ocf7dfB0t2VRXKceUwFwjVM3N8=
X-Received: by 2002:a05:600c:4e46:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fc585e9edmr131669725e9.33.1789974437127;
        Mon, 21 Sep 2026 00:07:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/20] python3-vcs-versioning: upgrade 2.4.0 -> 2.4.1
Date: Mon, 21 Sep 2026 08:06:50 +0100
Message-ID: <20260921070656.521680-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246301

- The error raised when a `.jj/` directory is found but `jj` is not installed now names the environment
  variables that actually disable jj discovery (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`)
  instead of an unprefixed `DISABLE_JJ=1`, which was never read.

- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539](https://github.com/pypa/setuptools-scm/issues/1539))

- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped.

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

  The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
index e66a7ce7b03..36bb2856a0b 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "cc4b66c02ae4cfb51e843910024f7142464c3391bb1f7e04608578b45046891b"
+SRC_URI[sha256sum] = "d4575de3115ec9434393c87c80ffb0eb98a16056bfe2b11ce0f3a97aff67fe0a"
 
 SRC_URI += "\
     file://run-ptest \

