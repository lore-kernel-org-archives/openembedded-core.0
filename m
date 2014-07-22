Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 22BEF60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:29 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so6554120wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QXQopZiHM7jHZP/rXhnPTNzz7Q7zkaaiFrJnovsuf9I=;
	b=fRsD+WIVvUdLv7LuTxRF7n1aHLu3mCuBoRaO9eS0sCqOdfAedgULxpX9HVZgjgCm9t
	Ve88K3M9mE8fJ6fUmO+HQUqzPNSHpde5LyassXiq2NFmOXV1ukaVIaiV9PRtKNqcgjBJ
	+2I3NYza71aFS1kxdwXQBUwcXX74HXTQ5oSxpsuVNoKEDHOHfxxOSckB0g4BzOUCBnyP
	vQ0G6HNyPE6kvVHuX4gJj4BcAhQ085FAI+HS58p7pBke1P+RVYwLvBjRPCo4ne85ewY/
	4FhICVvhbkw1ZVclzwupEVjLvtpllD1bWGPxo3ijLmymXPwRUmW257H+38RJ0FvuTRbD
	MNwA==
X-Gm-Message-State: ALoCoQlbeWeZjqiIHEp8nbhCYSx5dv6EoGk3D54VKsLSxLBvxDKKq0shCKgbaAcmsqdr8dlapDiN
X-Received: by 10.180.210.239 with SMTP id mx15mr14014228wic.65.1406054310141; 
	Tue, 22 Jul 2014 11:38:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:11 +0100
Message-Id: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 01/11] fontsproto: upgrade to 2.1.3
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{fontsproto_2.1.2.bb => fontsproto_2.1.3.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{fontsproto_2.1.2.bb => fontsproto_2.1.3.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
rename to meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
index 4b9101a..27fc281 100644
--- a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
+++ b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "c5f4f1fb4ba7766eedbc9489e81f3be2"
-SRC_URI[sha256sum] = "869c97e5a536a8f3c9bc8b9923780ff1f062094bab935e26f96df3d6f1aa68a9"
+SRC_URI[md5sum] = "36934d00b00555eaacde9f091f392f97"
+SRC_URI[sha256sum] = "259046b0dd9130825c4a4c479ba3591d6d0f17a33f54e294b56478729a6e5ab8"
-- 
1.7.10.4


