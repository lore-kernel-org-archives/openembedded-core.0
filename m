Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F2DC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:40 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19476.1789465955984714700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=La1ntum8;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so12362845e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789465954; x=1790070754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/eqfOiW7r6tBMeARe+DLIRMOvYjOz6mxrmZNQMRjNE=;
        b=La1ntum8ktbTsalyykNI4z230zIAkX/gFbmgh1irl/bAKF8w/nlnTYyQvPyWQzhK/8
         nl71Cdi6Hpvw/IgsuBrbSxTwCpjngSR/0yUHNBXyi9xO00qzRFlH+UxWunfWgKAowm1G
         mcHMTKF0Xm/lkIm3MhXwZMu26Of77KzXchtUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465954; x=1790070754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/eqfOiW7r6tBMeARe+DLIRMOvYjOz6mxrmZNQMRjNE=;
        b=zPFThVI8hpo+K22OiUxIai0BA3n2hu334iY/j2I6Dy/SuNCxBioG+B2JSDghGKVpEO
         6338yomgF3Z5phrJE9DBRaQQK2xsLZ6i7K+2gyNhx0YDjMBgA9M0BP6MfiUs0ZXRAKtn
         36UznP+3UtIO7xjkMYNIytfDFLp41HkOPPX481v9ryZOxicZ27/hA91JGZOdIiS/ytU2
         zw97vhMN5IHBhF6Ry1ruHgo7JguvM3sSbHYwj56MFcKLtCgequV9+ZiqJJEBS0QcpZ0f
         ef56UHt8bhGilqevfEDVVbj+wA6RECaOJRDNiAoNtsP/GemtmF1528c0H+L5tAixtzI1
         9QGg==
X-Gm-Message-State: AFuF++lsdGXcN3ttZrYZLJpChe/cFNq1HPmVOj5h8aQbJWJ6Q6iQXReg
	bm+cIl1T4qBn7eew2iDM4z4jPaPKxpST22URIDx8AyL1gBMNsaUFcD4Cr9m6aLE9ppp5exQ4cMt
	uu4zhOoE=
X-Gm-Gg: AYBFou3WTYWMk2Ncdi3S+vR1PrJU2grnhiM98aivjdNuIwxF5pME3XjtKuvYOTT5iug
	/RBgTJNkj/EcKBoxYAQivUhhjr5EByR4U07MEeJ/8/zWPC69WqRFQbh0aT5Qcne7FT7EFcBcG6e
	9z01Z+TuE18Bme/XRHc5OEyiScjVlerABH5mtL3llPJpU29eF9ryVQ/ql4gya7EZpXIloOeBS2b
	lLeL+VWhmFRBLvtiGqINPVlfn+FsksskOm51NOS8Sl5FolCKQQXjygdzLhMS5op7ClDRcKtg5nH
	otgmJcn58YafNRvcyPN5+EHb5Pts2cyC5dQUxY31KDJcpj/MJT5/w8UORo4W+8xk1y22N4aAFOH
	a7kgZ8lnoZp0ZiQzs8CKBMWI7+yJ2lCX5krUoPFLtpLV0v854lxBvbY8719o9ed6VCUqoHkVlur
	g4vnqfKcdzKUexhRkXbZE0eqe/aCcp04N8LVM5NVWtdrvBtFDbJ3T95cBdImhrrZ0VykdWWZtfz
	6SP/aVvGy3m08l5vCc09/ApunAUu+YGMSxm5wo=
X-Received: by 2002:a05:600c:a01:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49e7d722a87mr40678145e9.2.1789465954184;
        Tue, 15 Sep 2026 02:52:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm62617775e9.8.2026.09.15.02.52.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:52:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-pdm: upgrade 2.29.0 -> 2.29.1
Date: Tue, 15 Sep 2026 10:52:28 +0100
Message-ID: <20260915095229.2292237-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
References: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245834

- Explain missing lockfile groups and provide group-selection recovery guidance when installing, syncing, or updating groups.
- Allow package-specific overrides for `exclude-newer` resolution limits.

- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints.
- Escape glob characters in the virtualenv lookup prefix, so a project whose directory name contains `[` or `]` can find its own virtualenv.
- Write `pyproject.toml` and lockfiles atomically to prevent interrupted writes from truncating them.
- Resolve the workspace root before making member paths relative, so a root given as a relative path or reached through a symlink no longer raises `ValueError`.
- Replace the destination of an atomic write instead of unlinking it first, so an interrupted write can no longer destroy `pyproject.toml` or the lockfile.
- Report the version part that could not be read, instead of blaming a postrelease for every parse failure.
- Keep quoted local paths that contain `` - `` when parsing requirements files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pdm_2.29.0.bb => python3-pdm_2.29.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.0.bb => python3-pdm_2.29.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.0.bb b/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.1.bb
index faf9b63a3d8..4520e677ee5 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "28c520267a15d7a3921b934ec4bfc2d1dc18379fbb653bb20d8e840b2788be6b"
+SRC_URI[sha256sum] = "6bb5d893d301edb2b83d46042039634bf36c96c57cc7edad22a59521a41df9f8"
 
 inherit pypi python_pdm
 

