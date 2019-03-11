Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF1E87CF71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:16:44 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id h8so3118722pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 22:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2MWEreaZPieiUH4e8VEdtPUCxdmnqOb5lPR/tEyXLnY=;
	b=lpKuFZHTEYbqzBZv5gSEdKrzQa0hHLzwy+lJEu7BiNq4xrk9GGgmiVnk+LG/r75pRb
	z8aX7GNUCaf+9yZazavoVaOrxFBRBBf/o1vtoGLyTODPXbG2sXTp6m+6L6zKiNqMcGtu
	zDacEl2G+8iFh4QoCRJuQLnWtYd6djrnw9YXZFBnNqKbY2pOn0VoudAm3UgX0YfqKY3D
	vueN4rt9OHwbIbSFSC3gtnSRH3yfoOIdOdRE9Y0JCtHEr+g5xPNwM37uqN3d5EIy87is
	vRNOT7hI9AL1lTpjQEgI5PweW1IRdIa91C3tli4b9ppkYTMefAc8rcPHmq0BxnYZXoFD
	m0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2MWEreaZPieiUH4e8VEdtPUCxdmnqOb5lPR/tEyXLnY=;
	b=dapLB8zLW3OBG2Aa0pq7FEQCF4N9WvhqmqU4Cxq/m0qyr2lfRutZcII2Srz0WQuXqN
	0FJ9tjkHCVAVoZ7BsI0EyThIq6+8mG1M55rZrh0L/LfQ0qSFgbEH7wf7jYP4rM3Pjg2q
	auk68R1mzIKEjthcayQaesjoBKo8msELiWTQSLJnGLv6tdYMvFwOwisggGo1VsF5kn6t
	HWwmqoZNg/g7zXi5tKdvnAR3N49BeoSrlS20SgtCflT/9t/ppSJg46w50XtaKKHG59P6
	4k0m6QxRRCSHOd5E/FZrNsMd4bcblwabeTZI+T3fY0pud+YgUyww/SFjnTIhZdEqynLk
	YjLQ==
X-Gm-Message-State: APjAAAVqi/KyIDJunanFecEXPW0sM6hZBlcR8jBunQJ6eZquOJzPZx99
	ujFBv+D/8LftpaIQa75/h9Gah+pr
X-Google-Smtp-Source: APXvYqzZ8wJ1/uFfhB+4M7ufllg5ww6GN7+L0YrU9vSYLvxpe6kavQqk4wVz94T6V+h0Dl81MPV83Q==
X-Received: by 2002:a62:f54d:: with SMTP id n74mr30868769pfh.98.1552281405880; 
	Sun, 10 Mar 2019 22:16:45 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-139-177-static.hfc.comcastbusiness.net. [50.196.139.177])
	by smtp.gmail.com with ESMTPSA id s6sm6215239pgm.90.2019.03.10.22.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 22:16:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 22:16:43 -0700
Message-Id: <1552281403-31669-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552281403-31669-1-git-send-email-akuster808@gmail.com>
References: <1552281403-31669-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] libxdamage: update to 1.1.5
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
X-List-Received-Date: Mon, 11 Mar 2019 05:16:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxdamage_1.1.4.bb => libxdamage_1.1.5.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.4.bb => libxdamage_1.1.5.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb
index 530da05..b201124 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb
@@ -18,11 +18,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
 DEPENDS += "virtual/libx11 xorgproto libxfixes"
 PROVIDES = "xdamage"
-BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
 XORG_PN = "libXdamage"
 
-SRC_URI[md5sum] = "0cf292de2a9fa2e9a939aefde68fd34f"
-SRC_URI[sha256sum] = "7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad"
+SRC_URI[md5sum] = "e3f554267a7a04b042dc1f6352bd6d99"
+SRC_URI[sha256sum] = "b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


