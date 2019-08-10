Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7144B7F2E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 17:18:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c9so71652196lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=qCdS47TlzPfwKL+yk+gQcnSV+0Nwtx+AXxL4nwnPVxA=;
	b=aN199XrZIClEoCl4dNqCxZZ7TuDlktbYtN/xm5327eEJ6DYcuOz1m4zOvNpLq/YylM
	mXRq/2Tof73fPmYb9Q2OFALIow38iCnt6sVeSquFGQuPUEj1tWJZ7pGGekmO0RdyCrUa
	VUWO6iVgQMtI33KAgC+srhVnHlh/790S2PgIcDuvScunGRIfj25B2s7/2bZTKDxMawLW
	8oFXWhxosv8sPyZHntLL79MkwONuuMBQZ1+UluEbjcZsujCU0jVs89uuxe65ig69eoPZ
	sPYt6P26BUulnz+3LpiJgONs1YUQkJwLQIRyKrYFTqc0xX6e7xA4lz+7kUOMuzKnsJRX
	/1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qCdS47TlzPfwKL+yk+gQcnSV+0Nwtx+AXxL4nwnPVxA=;
	b=MNIztBY6LSSYAl6sMaA/0JXzZb9g6waki2KqqEhri31GmqBdV4sMGVLIqc/pz7jm/z
	k36/MU5CKIfy3ZzWUcr81uB9ufj6qavuGKxh7UdeYAKtRQQt2x8BH3fmNEWi0ZRePo+I
	jLB/jvmzM6fMLZ0stIs7v5oRDfHE8fUqVb3Gkf4SIeMcOlhxtITDgFmon1CgfF1zdW/E
	7UyTcLn0F7b+vC2KCmLsb4OqlRz37PAJYgyp89SFCY3S5UFyy0D6q7HMucBiWcwzwz/0
	yM4QNCC5FVn4FIbRxrReFC5LT9/WyAW388ZSxLCXneZq7lh6UCGTkFF/TX3VzmOsJK6p
	f2ig==
X-Gm-Message-State: APjAAAX3Svji9so48rtuKHdYw4nYpp+YPPzX5S73hmINcIUNCECuQPTM
	wIYq8C4KNfXn83VmCSiN2bvs7XmWNu8=
X-Google-Smtp-Source: APXvYqxgdg1QfgqmYw6wPLqcOzRxfnrrR9O6vFXF1sDv1ReUQoJdO4LcgDS9tGleIqWPBuHOWKngVQ==
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr3119797lfm.33.1565457501851; 
	Sat, 10 Aug 2019 10:18:21 -0700 (PDT)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id q4sm4242858lfn.54.2019.08.10.10.18.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 10:18:21 -0700 (PDT)
From: roman.stratiienko@globallogic.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Aug 2019 20:18:14 +0300
Message-Id: <20190810171814.21034-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] glmark2: Upgrade SRCREV to latest
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
X-List-Received-Date: Sat, 10 Aug 2019 17:18:21 -0000

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Fixes QA Issue: /usr/bin/glmark2-es2-drm contained in package glmark2 requires
libgbm.so, libEGL.so, libGLESv2.so, but no providers found in RDEPENDS_glmark2.

Fixes missing libraries listed above at runtime in glmark2-es2-drm.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 7ed5cd028..605417634 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,7 +15,7 @@ PV = "20190205+${SRCPV}"
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
-SRCREV = "0c90dd48df43a6b0db1d9aabca6298240f4968f7"
+SRCREV = "c17fd14505f30d9e4dbad276f7aa956fd21a637b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


