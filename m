Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77DEB7E321
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:12:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b18so12451293wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4jfGvJ/YJqE6zhAVXLujrALC7gC6rmZuZ7kgnGyA64o=;
	b=ROKlgYY5CWpDIKSrhHyAo88VBe27zrJuL1QU5GWscTYBFqCcqJjwWn5fxg0K2cCKL3
	NFL5an+fRc7j7xGc7Desmjr4G9qj3yWD4mu8rsdOUINKGlpDjclsCnHuAUCiEZlDNEUn
	HQKaF6sOSyiM+oZB52C3YwzfkYHON2IHNJ+KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4jfGvJ/YJqE6zhAVXLujrALC7gC6rmZuZ7kgnGyA64o=;
	b=mrkkBN8BQZ4NPTJZraRPIIy+C9LpBPs+yx4sHY7o0crSW9ERtIg9zk81PCzl2h1up5
	750EApxmpvIEEje5mnCQ9MAZE3F0AzLCazL75X+MC+lx8KnYgFeRN3tdLK1ZxvZty7s4
	nS52BHrzCuYh9U/V00HpzfBh4EErkf0ESZlQLTs0TldnO985jjYpm80kA9/mqZXEEu7x
	K4YmpWJIueq4ILAJGPDyuloi2gcEiWAfkWKZZ4zoAfVhSHoxVn/DQOiqHrbk3JKNWU/E
	3HTL2V6d8rVWfe7GtQwSktz5AKvhUJv+m0tTj3b7c3E+84W47mLPoc2kzOXVx8meuOjb
	qw0w==
X-Gm-Message-State: APjAAAXcxQWVCcc60HdwU3IdL3IeljvCrB1QEBGSpYrVCz8YsGZOxp6N
	DNnfZ0hmNbr3ttgXvG/YcDGYj6a5AGU=
X-Google-Smtp-Source: APXvYqwfmDztEOO4zKsgnIJTfPYkq7Q8iNYqF3O6A8dLz99E5etnFOUZfNPUeB2q1ipDhYN+FBQ7/w==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr16772832wre.205.1559574723788;
	Mon, 03 Jun 2019 08:12:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h8sm7264794wrt.59.2019.06.03.08.12.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 08:12:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 16:12:02 +0100
Message-Id: <20190603151202.17058-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: Fix missing ptest dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:12:03 -0000
Content-Transfer-Encoding: 8bit

This allows ptests to execute successfully in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index 0695ee9dc36..54b135eaef4 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -113,7 +113,8 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
-RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash bzip2 diffutils perl"
+RDEPENDS_${PN}-ptest += "${PN} coreutils procps bash bzip2 diffutils perl sed"
+RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
-- 
2.20.1


