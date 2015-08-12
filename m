Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 19063734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:39:52 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so107741651wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ShFXFVknRqFkvNc9NMap2+hXqrKKwGKq6UNRq7bPA/Q=;
	b=STh5siVNzdG8wgJHJd0MKeGRJ7veHKnMAZJLEJAF7V7/jE2Ob4hvYk10ECfYa/djhi
	6IPuJB8y3Y7Mo4LOTB29dDMIyv7NDwO7XOBk0/x8aOjiDqHrVaQsGcNL6YosXIKUxZyk
	NneH4nQuDpXo3WgSCPVcm8F+cpLh7xqNX4UF9DhWQa6nw2P+4ZkxiWFF0pu09yTUZRoz
	d0bU7K8+WOBGLenbi9LSqNcUG67TfUxINHTGh6Y4Qcrt0FTgnbHHA+g7Xck0bWme9IPF
	Bp9TP5/G52y/tIIcEupW2Cm74t3IaBmaVWnqWurUQ+6ECqrc+lDR49OP/gC9x7PdCNF7
	FOzQ==
X-Gm-Message-State: ALoCoQkYoc7lSuzmbSSD6FTkewpWcbiDDqgc1cd8PK3kbBkH/3M9F2qy7fP/438w/YXJh0sUhahk
X-Received: by 10.180.105.98 with SMTP id gl2mr50297824wib.56.1439397592266;
	Wed, 12 Aug 2015 09:39:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	di8sm13575354wib.5.2015.08.12.09.39.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Aug 2015 09:39:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 17:33:40 +0100
Message-Id: <1439397220-23119-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd: update SRC_URI
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
X-List-Received-Date: Wed, 12 Aug 2015 16:39:54 -0000

Upstream has moved git hosts, so update the SRC_URI appropriately.

[ YOCTO #8181 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 83e4bce..e187cea 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -29,7 +29,7 @@ SRCREV = "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
 
 PV = "219-stable+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stable;protocol=git \
+SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=git \
            file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
            file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
-- 
2.1.4


