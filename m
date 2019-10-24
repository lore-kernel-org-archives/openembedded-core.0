Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB0D7F979
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:11:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so20364064wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KvqAovypxngzEACLW9oYEv6MVM0PMcZfg3jSy59+lCc=;
	b=UHwi9TQF5/BCVdPPmQDaAJpgzCEmsf/UXY4TiHkiCgCeVZdWfceQqK9lnDlWkB2Bsu
	7NZGFvUvJYVnnv2Ftk6Hjn7Svg8Jpxn6jvupq/10OkPFddEGB0l7sUgTFDJFGZMpmHNy
	94uTLR/22nuLA4PRrvzILf7kQzlgGOkunUu1OTSDh4ALKeYGUeGPvUUbi1mIWVHWB40/
	KLiCjZsitrMTDNE6xE46UwlXFSI+LG8HLfhbyVvJsnko7jwGX9qJtEb6LQ5GA4+MfSPC
	/OfeWwq0oqKWg429ySu5XQdschMeJzKvIRBNo0qSe0ruBE40ZCfht8kjW7G800O/ILLD
	iffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KvqAovypxngzEACLW9oYEv6MVM0PMcZfg3jSy59+lCc=;
	b=pPbmgl0fcKOdSKiOFjqPgLnkTjg1yA2S4IQ/MPV2cwu0TjmF2uzM1VZdIp0Hstnm24
	xV8FOnIIhI8negaANsxtriUCtH2p32A7YqiyI0tj+i9hukLd6BQOAAv3bp/RsikLGDNq
	45iW4IKTFCB+hLGR1RBZdJkdGIq/IVSR7MIRNhmoDPl0lamk730FpW35WFFTGdSYIFbv
	006+8VgT3azSC/xWTNDGR34JGqb+hnBL2oiz1KBuEMBp/rSLVkD17N2SHcVLjA97bQy8
	l3AVhdOpCcA2y/sTgjHg8HO4SoWHnm0QplsnEYg8JUO3BzVJZgb+7VFv78yNubjSHKrQ
	x9bw==
X-Gm-Message-State: APjAAAXUB+xWC8WxPy1cbGfoWl5cpKxyHxWrmTSTWeLyliF9zVPLroC1
	5PpCbwjbFXV/HqZgiEJnNR7sTkrvqhg=
X-Google-Smtp-Source: APXvYqyX9dR2kCgfLl8E7VtG+APQbTVVYb7J8GDKQhd7NXvc95oz35P22l8VP9b4qHmigFmDiRZSnQ==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr3315378wrr.98.1571915496560;
	Thu, 24 Oct 2019 04:11:36 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v81sm1073024wmg.4.2019.10.24.04.11.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 04:11:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:11:25 +0200
Message-Id: <20191024111126.41198-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024111126.41198-1-alex.kanavin@gmail.com>
References: <20191024111126.41198-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] btrfs-tools: update to 5.3
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
X-List-Received-Date: Thu, 24 Oct 2019 11:11:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.2.2.bb => btrfs-tools_5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.2.2.bb => btrfs-tools_5.3.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
index 6b73c01dccb..12b5c4562dc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "55a8c9626fb906c20c3206f8fd39b9a8fb259b79"
+SRCREV = "de7856cee5907938441f765ebab7cc106b7faf70"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


