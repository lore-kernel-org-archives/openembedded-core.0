Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5D437D3B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 15:48:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so2640705wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zOSo/p/C6mYMdyrXY6/rHoQ9l3XVvhW2wyHBE7YmPaw=;
	b=S/er8K2D8UEH41vtHIF99brDfmTFn53R/Ebb77rVkg4ImwNckSWOt4lUtGswZ3TmS8
	ir8c4zLK35ZKif2rBgiRW6kSzSyJjNOZtXGilYboLt+0pM7QXETNDdrMpDavLnHaRzK8
	3AjODOFIJXXNsfXgzEQsA47aHBEIcoi5ZKlPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zOSo/p/C6mYMdyrXY6/rHoQ9l3XVvhW2wyHBE7YmPaw=;
	b=lvJ2993hJnGpOeTHmNejilotmr2U0oFsNP0l5bn7T6187gTYXegG5Y9kADMLgqiyc3
	QPSXrXjg/hS9QR0V5WfSd6vAToGQPjv0dgpLZN14M5ALKOGn7wQeipRgv19TC4UMLBOY
	FdrlXCt9ypxQAr/smt90zGeQYk3BVkXmZ73g1VU9uoLMTn+VEbJj3Ikffn1+9dGXvCS0
	wXiQidQG4d8RL88OUVnEVoJ6MF1OWr4ZMX4NeokQ2WWZSu/O5wyLkT/sOIBqlM89sSoT
	d/0SVsSc3Hq5qEVTA+qCTdJpCKdziKX/7bl1us8VjGz6Sh3OsQ6wJLN38VDwVsD/mF8l
	NcnA==
X-Gm-Message-State: APjAAAUNYdLE7ncbM5RArqhOQO8l5fmNWLIJAAp/RMzNst4YByPfsOZG
	p5OGbu74z7sbaiX0hGr1NfUSNynJe+M=
X-Google-Smtp-Source: APXvYqyJBaxrt3oMRyEdfsydddz+L8tbcY0ZkQ13m0o5y4O0XwAblZ2QY93w7nzliQUI1GbWgIRuqA==
X-Received: by 2002:adf:c982:: with SMTP id f2mr5968632wrh.235.1559922487296; 
	Fri, 07 Jun 2019 08:48:07 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b203sm1833512wmd.41.2019.06.07.08.48.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 08:48:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 16:48:05 +0100
Message-Id: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jun 2019 15:48:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/multiconfig/multiconfig-image-packager_0.1.bb  | 2 +-
 meta/lib/oe/sstatesig.py                                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
index 3dbc0f5d155..a76a6bea1b8 100644
--- a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
+++ b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
@@ -8,7 +8,7 @@ MCIMGTYPE_virtclass-mcextend-tiny = "cpio.gz"
 
 MC_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
 
-do_install[mcdepends] += "multiconfig::${MCNAME}:core-image-minimal:do_image_complete multiconfig::${MCNAME}:virtual/kernel:do_deploy"
+do_install[mcdepends] += "mc::${MCNAME}:core-image-minimal:do_image_complete mc::${MCNAME}:virtual/kernel:do_deploy"
 
 do_install () {
     install -d ${D}/var/lib/machines/${MCNAME}
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 417943db902..13af16e473c 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -155,7 +155,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         else:
             def get_mc(tid):
                 tid = tid.rsplit('.', 1)[0]
-                if tid.startswith('multiconfig:'):
+                if tid.startswith('mc:'):
                     elems = tid.split(':')
                     return elems[1]
             def recipename_from_dep(dep):
-- 
2.20.1


