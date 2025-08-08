Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C134C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.17947.1754643022199600425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLJ/A0mt;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2401b855980so13627935ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643021; x=1755247821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFEDeMyDY8E4dQQzQ1pHRBCuQeiD2XocXYO9YNyQhuI=;
        b=VLJ/A0mtUyNmdGSld8lT0YOHVONM5BeaXw/1S8K1aumyk8XCzq+EBYdzOhbI3TQACx
         azefHv1TWBX5misrXnUXN+9Q1knO0xtwyAjqMyTIlJJeY8PhIgx0Utue5vH/CCyBhFqG
         YqfGxmQfcuHEr0Suil2i1Q1AHx4KnbzgKSBEit0jC9zevp0uKaVsSZux3ueKkMiLsx2V
         c8zVip8KTmzWjeS67GenX9rBcrZ3sUECNIyb4bMQTrgUlp8MfyAMG8/39HkMzhyLgWzM
         5khOEKNiB4CArq3ARbg1wa7pb46sik6DgDh9ha9X5t54h+6aAoCpy/6IcGFw04vwxgWd
         nj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643021; x=1755247821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFEDeMyDY8E4dQQzQ1pHRBCuQeiD2XocXYO9YNyQhuI=;
        b=IQSt+VOynrrPdz8HlWPu4UHncSfEbKpNNf4z/2kRvLs3FAEvkOJqTX2XjhAaVOyk5D
         HODQiWi0pvK03dk9BRFmpQqdN65eeHKZ2DXdQQnTAYpMngJyTwn8vtL55y/20D7I6lAj
         qvt/o66ve5vKzLhKiYRbcRDEXLs1li1DaOT71jGKnl/W6pLBdlsn7s7ioC044v8dpzkB
         8e+TgjRtPgVIPFJyd60ZzcTpLr4hKdBx0fUHeA8FYPaFxWnBN7/7SVAJ14Ih83yPaEsJ
         ZUU5sZHDYvQ8NcbAk0bjO29Z04cS4jBpm8Qf/u3C+omVTd2OtM0ymYg1DzOTugq7h9AH
         XMqQ==
X-Gm-Message-State: AOJu0YwjjgJIXihbnn26cR9pBywQ0XtdkNzhHRdY98f3pIXuxRSALzzg
	9psqIxZg5Mj2hcdjpAEY4FjvpOo3Ak4OmWvkRsaUN5hSpM/feAHpiaBE2bjx2w==
X-Gm-Gg: ASbGncsCDiabX2eTqMEsE2kmxh2fq2C5TwKUz6gUCQ6FVW/vKoouYGVNrzm/uZqPlRg
	CoIh5+z9/1Ps2UoCKMd0C/PV8dTtUEp5025Dl0iIFoUeQ6OB8/ZVYirDS0stchBdbfESt3Ozrhy
	DIai20dfkmg/4QPVr62yXh2Ri2GeldIqoAZ0YMPrl9cMfkPwTtiDiHvrHxZ7QejznVkBE+xdhc9
	d4EXznbrPyqC6+Wk7PgAA+xGP9iih4TeaHkrv3z8ukj9oDgVmu9PFFSsYRPTQkxfHXOzqHsLUHz
	r9qXu9CL/KGK1ocG/4cZl2kwX9xorwRWs7gOnERy9UfSrXxA+crbjk0MTHahQat8BapVGdkRS4N
	qRw9fnOaf50BKy8TZBt3o4fgJu4bi+Gbv
X-Google-Smtp-Source: AGHT+IGc8uYyX/dKY1/sJDv1ii8huD6+9FnitbCS/uM5tkyj5RHmhNsJ/NtLZqWr+qNdkl/ENu6hgg==
X-Received: by 2002:a17:902:db12:b0:242:1ce4:e4f9 with SMTP id d9443c01a7336-242c22641cemr29742215ad.53.1754643021133;
        Fri, 08 Aug 2025 01:50:21 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:20 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 16/23] bitbake: fetch2: Use git-lfs fetch to download objects
Date: Fri,  8 Aug 2025 14:19:24 +0530
Message-Id: <20250808084931.2156763-16-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221613

From: Philip Lorenz <philip.lorenz@bmw.de>

Its not clear which exact git-lfs versions failed to work with bare
repositories, however git-lfs 2.13.2 which is shipped by Debian 10 (i.e.
the oldest supported distribution by scarthgap) shows no issue when
fetching into a bare repository. Switch to git-lfs fetch which in turn
eliminates issues seen when using the gitsm fetcher with submodules
utilizing lfs.

In these scenarios, fetching of LFS objects did not actually happen as
the gitsm fetcher parametrizes the to be fetched repositories with
`bareclone=1` which in turn means that the target revision was never
checked out (and therefore no LFS objects were fetched).

(Bitbake rev: 501d3317df5780a5b0e3c2562b26ed276c1dbe90)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9962d198c82d64a1562844f66ba67aba590fa7e4)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index e211f7230e..2b6e49362f 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -506,30 +506,7 @@ class Git(FetchMethod):
                 raise bb.fetch2.FetchError("Unable to find revision %s even from upstream" % missing_rev)
 
         if self.lfs_need_update(ud, d):
-            # Unpack temporary working copy, use it to run 'git checkout' to force pre-fetching
-            # of all LFS blobs needed at the srcrev.
-            #
-            # It would be nice to just do this inline here by running 'git-lfs fetch'
-            # on the bare clonedir, but that operation requires a working copy on some
-            # releases of Git LFS.
-            with tempfile.TemporaryDirectory(dir=d.getVar('DL_DIR')) as tmpdir:
-                # Do the checkout. This implicitly involves a Git LFS fetch.
-                Git.unpack(self, ud, tmpdir, d)
-
-                # Scoop up a copy of any stuff that Git LFS downloaded. Merge them into
-                # the bare clonedir.
-                #
-                # As this procedure is invoked repeatedly on incremental fetches as
-                # a recipe's SRCREV is bumped throughout its lifetime, this will
-                # result in a gradual accumulation of LFS blobs in <ud.clonedir>/lfs
-                # corresponding to all the blobs reachable from the different revs
-                # fetched across time.
-                #
-                # Only do this if the unpack resulted in a .git/lfs directory being
-                # created; this only happens if at least one blob needed to be
-                # downloaded.
-                if os.path.exists(os.path.join(ud.destdir, ".git", "lfs")):
-                    runfetchcmd("tar -cf - lfs | tar -xf - -C %s" % ud.clonedir, d, workdir="%s/.git" % ud.destdir)
+            self.lfs_fetch(ud, d, ud.clonedir, ud.revision)
 
     def lfs_fetch(self, ud, d, clonedir, revision, fetchall=False, progresshandler=None):
         """Helper method for fetching Git LFS data"""
-- 
2.25.1


