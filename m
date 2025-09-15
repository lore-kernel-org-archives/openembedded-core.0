Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027EDCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:02:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.28244.1757926933272933081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AqCKFrPI;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso6777941a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926932; x=1758531732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDUzud1d7RCnk1mGlZzlLEEAh1Q5VzoB8QDB5NntN+E=;
        b=AqCKFrPITfN+ES2V77mK2jgGLaB85Boym+oz7UmDHMU0h3k1vLaS8i2yXm1gdSmU83
         zLChd9PMoNuuprcSbu15ZMpcW/bIt5YwG5TUwU2GUQrko5A71k1QZ4b4yGcTQnG6cUpQ
         mNortBDe/29aYUCWzBMY2iOSrCLgpiL+myfurcU8mtaofKgHXlj6sfPdUx2n26O4Fs1K
         VjnuEYnSha6q5MKw/yXvOyG1/JsipBHcDqduvs1KQj6gf86K5DQdqvGMWb7VsicUsz3y
         f1a1sEyVli4caIyAzxY+xJylRR96391Q84qUjs4kxUrZcmGfK4vI6mXufF4inHqSe20f
         E3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926932; x=1758531732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDUzud1d7RCnk1mGlZzlLEEAh1Q5VzoB8QDB5NntN+E=;
        b=HLblm07aKWlBmX+pfV3b4M2jTx20BAou+GtRKNuQDmtxmnJETD844SKQccZXgOfa8x
         VOWxL0+ArBTUFQ/2RumDQ6BZSeSAimKQXR5mlE80N3DVHzQITariWvfBnpqluE3mzD9U
         2YK6tEpehc0oZg+yLEoVal0zRJGnvHpyHKZsFJqwXmMdQcqKh9cm3KiyjhXY8bh+Qfoo
         AF1WwWFtn8uCh9BIJ65zuj2VCy4I/zNAYWTqxF/phd5op3OD82udE9YBc0ATF/m1/S72
         DJ1Ya65VdtsFN7hZw21HAzxEtYCTngqbou7wGFXY25EYJZi4LFI4X8Y7smlzwFBTiMhM
         2LSQ==
X-Gm-Message-State: AOJu0YwTmSqJXhSQ57Er+7Ow/9iHkNbUtxWSOu5f6vAzEWbbXWjFaELT
	0rahlFo0UJwIxV4XParGaoPJlneOd1vqqoSzqZVyZMFEJCwHRjEtLVy39FQHbg==
X-Gm-Gg: ASbGncu4ODuucD060+RQyOTBIXsp2KiWk+zYpAh5OZDv1pxBskSZTE3n8w7zKKSyicd
	Wx/LkNomv4uY0llzgfongsW38zl1wL00pkxZXVOjZEzWTnC/8XqyrBqsQybn9I8Qs7knJAtFq89
	XkNDVVkbHlg5xTYpvgZPmAzdBWpHB/7MY9migNkbRorRCfMIBvPOjiJK6iat3Ti8zfHx3Wmb0F5
	6ndMTC21yA5d2Q8Ce8OEvj6eV6ju1QygpFy/5iCJC8mjI31j4af0c32xw3yIiqkd2nTp0ByQqi7
	l7VRyxiknVn/inPMy6lsiQGd/pjFlk9fj0FbY5SGSbZX9mNqhL+RRyhGAEha3D6SsCvBEIoOzfi
	OIyjdG3+F2kI3xBmPDw4PKr7PyezluYw=
X-Google-Smtp-Source: AGHT+IHGISc85bd9LRnAw5IvEJU0H0gNfJMEmt95tkweE9s21dMRFK7TDmbXpl+XpPq4w0NDVySbYg==
X-Received: by 2002:a17:906:d54f:b0:b0a:aa7e:a193 with SMTP id a640c23a62f3a-b0aaa7ea8cemr690934666b.21.1757926931480;
        Mon, 15 Sep 2025 02:02:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f22b1sm914691566b.86.2025.09.15.02.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:02:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] patchtest: ignore patch file metadata from SRC_URI
Date: Mon, 15 Sep 2025 11:02:07 +0200
Message-ID: <20250915090208.2007216-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915090208.2007216-1-skandigraun@gmail.com>
References: <20250915090208.2007216-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223393

The test_src_uri_left_files check prepares a list of patchfiles SRC_URI from
before and after the patch is applied, looking for dangling patches.

The name of the files in this list can be incorrect, in case the URI contains
some extra metadata (like patchdir), because os.path.basename will use the last portion
of the line being processed, which is independent from the files in question.

To avoid this, try to use only the first portion of URI, before any extra metadata.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 63d01819e7..30da8dbe60 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -150,8 +150,8 @@ class TestMetadata(base.Metadata):
                 "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
             ].split()
 
-            pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
-            test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
+            pretest_files = set([os.path.basename(patch.split(';')[0]) for patch in pretest_src_uri if patch.startswith('file://')])
+            test_files    = set([os.path.basename(patch.split(';')[0]) for patch in test_src_uri    if patch.startswith('file://')])
 
             # check if files were removed
             if len(test_files) < len(pretest_files):

