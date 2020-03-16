Return-Path: <armccurdy@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id E3DD260F2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:49:12 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id hg10so4873400pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0ZpAlX1qFAZxlwgwv5N4B63dmrGK84yk2jQ3sx3663Q=;
	b=HICDaAXwZRlDtRkL2kFXuFtAey+vj+g4unyr71SyLQd4/LmVnotpaClA7hNBjXu9hR
	CvrIH78WbFhbPMxzoZ0mVxVHa+I5YYqrsePVo3lR8GG5QrUizc1AyUsOd0h1WsI1BcDP
	M8LaH4aRIxfw5PCoC3aNAHxpZVzm/BVP6IYE5agOj40MrwSj8xRRUcKm3yGGTIDBYoFl
	zEKmNT4EdpMPFdON82sfqTlsrLilm8RhT6FYawn4IHGU4UW2HCKdpfATnHC0SQnWhvlI
	QO50ecAZS9j8kZEQGu+/rOtYPO6kwMuagAaPEjMnG0RyRqGbiMeeZhJsB8TJoObO4B3X
	1d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0ZpAlX1qFAZxlwgwv5N4B63dmrGK84yk2jQ3sx3663Q=;
	b=cJO7sfLEPe76SLUmGZh7cLGP1xjgebvUejh5LVnmWGrZuZdl6G10UZtqHPR5M4rJgz
	UnYMjSNJj0zHHogMYTtb6/2m0mqNjwZxGCLRGweLCwUdmC7xyNl/Buno/oLI0cAdG+TK
	yIoSebOJhK9FkhuLWUr/and5PoKHF/gXiuEwcgenS9kwsHgMpB4vh9geT62st3CsijMq
	13Z6P2gklr8bAoR/0GBOMCN55K3yJ4iKVBVOgjb//RiuZ08GwWytpOq8v6N5t3ED5nEO
	18O9id/zqSMroWqqXls7VMVwGazZs2RoM5lYoZXoGcBKRW7eEFZdTUpYyJKpllpQ+C7i
	SVBQ==
X-Gm-Message-State: ANhLgQ0oibCAFm7dxc6/SJnZc9iu5HnkDkNya7IH633Y+K3f7i/pB9YK
	GNycH776wDwKmT2ceAyWBAsH/cjn
X-Google-Smtp-Source: ADFU+vudv0erjrSMS9zjTQPjyYa9SPTo04rjIWcLF9vwAYiyASdpuJwjhX1xe+CnN2CTGjXwi037VQ==
X-Received: by 2002:a17:902:9308:: with SMTP id
	bc8mr567145plb.268.1584384553751; 
	Mon, 16 Mar 2020 11:49:13 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c201sm632455pfc.73.2020.03.16.11.49.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2020 11:49:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 11:48:57 -0700
Message-Id: <20200316184859.11635-3-armccurdy@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200316184859.11635-1-armccurdy@gmail.com>
References: <20200316184859.11635-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] tune-arm1136jf-s.inc: restore vfp to TUNE_FEATURES_tune-arm1136jfs
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
X-List-Received-Date: Mon, 16 Mar 2020 18:49:13 -0000
Content-Transfer-Encoding: 8bit

The change to TUNE_FEATURES_tune-arm1136jfs as part of:

  https://git.openembedded.org/openembedded-core/commit/?id=ac83d22eb5031f7fdd09d34a1a46d92fd3e39a3c

effectively removed both armv6 and vfp, when it should have removed
armv6 only. Add vfp back to TUNE_FEATURES_tune-arm1136jfs.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index b25995d495..173cb468ef 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "arm1136jfs arm1136jfshf"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfshf = "arm1136jfs"
 # mcpu is used so don't use armv6 as we don't want march
-TUNE_FEATURES_tune-arm1136jfs = "arm arm1136jfs"
+TUNE_FEATURES_tune-arm1136jfs = "arm vfp arm1136jfs"
 TUNE_FEATURES_tune-arm1136jfshf = "${TUNE_FEATURES_tune-arm1136jfs} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6} arm1136jfs-vfp"
 PACKAGE_EXTRA_ARCHS_tune-arm1136jfshf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} arm1136jfshf-vfp"
-- 
2.24.0


