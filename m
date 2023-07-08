Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D826EB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 09:26:49 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.15073.1688808406385498050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 02:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DXdSapOT;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-783698a37beso109397339f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688808405; x=1691400405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSiWyJVV1kVqHzNHEMFzbcj2ajxe3fzXFrDNdBvQ68k=;
        b=DXdSapOTq9H0Hno/CnQQ130tHnNuqFrmni5KPsSbDlALHRMj2/WBqJs21D5LoDzY98
         te/n8z3tLBwu67wz6wA6bWZLLXZhWip4e4YUYCmdSx/Xh9Qima8vIb5sL6bpuedTi5mY
         LicbCpYK3qZxNmB86IR5go1o4efeAgIzJlP7+SRgRnLOemKB01AhGOq2cFblChjaYoPj
         d8DMCBSyyRSD3HZXTWC2qosz/ypYJTu9RpdXmOa2zKZFZei5mq8jIRq3KzK+wI8pam7E
         h99ycVOciXMw3mHQrk/qrP8kfKVW9/bwDOED/VRzGL+KjIycsetGFPf4hoCORjYb4eWp
         RUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688808405; x=1691400405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSiWyJVV1kVqHzNHEMFzbcj2ajxe3fzXFrDNdBvQ68k=;
        b=RcQH3jLzlG1fsRDpqP8zFFZHxbTofSM3f/vDO4QpTQDmP9k2xiBDODaANNIkRhHSZE
         4rmeb0F5SGWrLiiFZyyI0OYd23W9vfMIYLYhJZIGpfVTW1ibaL/kHJJNU85oI60h3iNi
         yaSsBIfOJPpB84Bl/OReZF6plCOiO5uFNIrtm2qLQCxnMSTFzE6UNJRfh6GY0iTikfl0
         G3msn5FFVXWtEVU86bK3VHM9CJOcQKySIXjTbT2S4ggwiT9t/J9iUwi+Kr9c88WNpSAe
         qen+HbLkjsWwoj9mbf8s49xANcj9gamqU75mWwwA/kHF/GmBNvx5A1ZnVrNQBzmllBy9
         pI3A==
X-Gm-Message-State: ABy/qLZRCoG/PNjg73uuHS5X1YecCn3aHQvvTn6eoqWrA0ZJN2+RaFMh
	ZlKSMCalI+xFZI0hTWHvxBvhP5ruUiAWYMj0zxw=
X-Google-Smtp-Source: APBJJlF3jg4TSpLEjymdUM0EBqiuwlF9O95XfkrnKX8e5UY19XCpIUjoT9QUqnlNg5Iv84iggvYudQ==
X-Received: by 2002:a5e:c002:0:b0:786:cd9b:1cd7 with SMTP id u2-20020a5ec002000000b00786cd9b1cd7mr11186337iol.9.1688808405141;
        Sat, 08 Jul 2023 02:26:45 -0700 (PDT)
Received: from lons-builder.int.hatle.net ([76.164.132.203])
        by smtp.gmail.com with ESMTPSA id dj15-20020a0566384b8f00b0042b1d495aecsm1850976jab.123.2023.07.08.02.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 02:26:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-importlib-metadata: upgrade 6.7.0 -> 6.8.0
Date: Sat,  8 Jul 2023 04:26:36 -0500
Message-Id: <20230708092636.96729-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184019

* Require Python 3.8 or later.

34fd736 (HEAD, tag: v6.8.0) Finalize
97084d8 Remove reliance on typing-extensions, only required for Python 3.7 compatibility.
b74d2b2 Merge pull request #460 from Gryfenfer97/main
ec7bca0 Disable tests on pypy due to #463
ee4f84a Remove superfluous includes
f862e3f Merge branch '2023-handoff' of https://github.com/jaraco/skeleton
23ed6b1 Merge branch 'collapse' into 2023-handoff
c29955f Collapse skeleton history. Workaround for jaraco/skeleton#87.
cca49a4 Prefer 3.x for Python version (latest stable).
74ba8ac Leverage pytest-enabler 2.2 for the default config.
8e83c3f Expand 'finalize' to commit and tag the change.
f5a5617 Merge https://github.com/jaraco/skeleton
3b7d8a9 Require Python 3.8 or later.
07a87ea Remove tox boilerplate, no longer necessary with later versions of tox.
cd145f4 Replace workaround for actions/setup-python#508 with 'allow-prereleases'
5ca761c Merge https://github.com/jaraco/skeleton
45c03bd add typing for simple functions
74b0d39 Adopt towncrier for managing changelog. Fixes jaraco/skeleton#83.
2963377 Merge https://github.com/jaraco/skeleton
241541c Remove inclusion of python version for docs
e7cd730 Add badge for Ruff.
6f75480 Update RTD boilerplate to new issue. Ref readthedocs/readthedocs.org#10401.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
index 5ad7ae81ad0..b8dd4bb7014 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "1aaf550d4f73e5d6783e7acb77aec43d49da8017410afae93822cc9cca98c4d4"
+SRC_URI[sha256sum] = "dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545bd53016a3e9d4654743"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


