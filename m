Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id D269F79164
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:57:43 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w11-v6so12856005wrc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IpA3boni2UEJNx1W53HkzS8gyNkNvwiYIddL4s3zztA=;
	b=LK9F1Sj71QjUXc/ENzhZ3JtcUp+RgfqpHnOIJEZQo3esv6LvNZbOD9fdWThNVOsJLo
	FG4rX7uq1W3q/nSNGWadx1AWMHapfxc9Bfjo9AWqNDz+Ajz8RohollBW5ONBJbFAzwjd
	jCwRcogOg9WyCojjoACCc/nGHM91flnwlajc9PuzjtVqrEmUnrDfC3VP8ipFTnhZ2RxV
	Cy+FDPumJYjm/13DxPxATRnQJk6c+Y1A0TUiFO4O5l09zTtadE+BmvO64Tb1AICVH4IK
	FYhywgWSKq6PWH8+n0WuCOxn7JZe6jWsv67vTZUBzXXnqmbiBYmdK84yJwlk2da0IGBB
	NDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IpA3boni2UEJNx1W53HkzS8gyNkNvwiYIddL4s3zztA=;
	b=Yja19hJzW+8ppT21nqdiBy7dZ0zln08o9rDu4RWLdkVLOH6172CpBLlGNVZNafARCJ
	WX6bNISXMPGXiTfcO7tvoktl6iS+Ltul6d3/MYXrMku1Yi0VYr8LkHXyScIbuseHmfk2
	zaXGuCf3iBPfT8dccQcdsQY0YJAPWSYcxxz568/m3g9nMWceVZVtmTmutcDkrTd6/Ioj
	vEPxxXY+cZH4ZfFLJ8geRMpiEBu02mo9Hu1JNTvPIvTAjeh72LPrG+8oSM9K0wVJbexd
	ymOTnkWGIYlOgRB+nEXM8JgkO3GFVU3ZThFxH+oqzQ4lVjyfjdsRrtJpAVHOpFFFjpAt
	ER/w==
X-Gm-Message-State: APzg51AulUvwiTfkSGMPcomfR5DVvRb3FQXIJ5V5laQ4JOt2apPZ0eJn
	4g1x4c7/LLgYj+6qbmZjOdoiw1ow6Bg=
X-Google-Smtp-Source: ANB0VdYqhpdRIP3AIzaoWxG3c0oLiZX7G/ah1jp6rT5G4kB+OcOC+dOO/pN3WkDOyUSnw4hhsWoSsw==
X-Received: by 2002:adf:ef89:: with SMTP id
	d9-v6mr7814553wro.195.1535360264276; 
	Mon, 27 Aug 2018 01:57:44 -0700 (PDT)
Received: from localhost.localdomain ([80.215.33.180])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm16808845wrd.74.2018.08.27.01.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Aug 2018 01:57:43 -0700 (PDT)
From: vincent.prince.fr@gmail.com
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon, 27 Aug 2018 10:57:33 +0200
Message-Id: <1535360253-28627-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [for-sumo][PATCH] libsodium: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Mon, 27 Aug 2018 08:57:44 -0000

From: Vincent Prince <vincent.prince.external@saftbatteries.com>

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
index cbcbe96..00fa7aa 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libsodium.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e866"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/old/unsupported/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
 SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
 
-- 
2.7.4


