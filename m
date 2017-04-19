Return-Path: <armccurdy@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0FF5600EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:04:52 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id l192so2159689ybl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/HxHw3PNCKggI667KgizUMTok23OdVau+X07IN1rCak=;
	b=iEMBuka1w6wHFZgyYlAjiOweP05V52QpoHkzw8NMA8yq0rgb/AkjF+SFmqFEU7PEHn
	f3XDpYL1J0eODS5DWWwD24LgePkLszRA+OSx5go8JhcRWWpBBN3UfS57tG7lUPJfMIUJ
	phOcUvMQtR/EggWfP1LQv0hPs+q8nJRFbRNMkhbltSXUYMHBcFBUTb+RnNENjhwDlxIt
	Kp/aX1+ModCIKQHbebKr8K7E4R9wQe2x4gRI3r3LfTXp+3LCA4pbLpn/PvgeNtVyVinC
	3VQJrRa5DrKhzdKLcSaGuxTS3t5ol/rusYz6qaRSYb5dJlG8fr8ximBDJW03t0QZ3sdv
	G2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/HxHw3PNCKggI667KgizUMTok23OdVau+X07IN1rCak=;
	b=jU0JKk1Tw+rwMpg28ZKgxiE0IEMvrJ5epKkq13+7eqbxr4qdLxc3vSVPcFEkllEs7+
	DMkcCgI1fW94V+noLtWGtcPkmhJHiVs9oq4C/UhdAjq5Bvn1hCtYNIAFzOvnZttBu8tu
	zqZU55JR/ZWbrtMRrTqCNccsBd8pudCJE7akoVwQbP5TwCBvjg0dEooMDCL4pkFfbVf4
	52CAn1YoSGSmwDr6dgDKiI3WBgJDzYbMEIDQV2qvEAp4AHOFw/CzNsvMEi0TVcYf36p/
	311yyDdhXsqSOe6ZyinPIwXs3pW2Um6VfA7qGyMayO2v0mie2rfRUIFp1Z4kTrZjLLAQ
	dyAw==
X-Gm-Message-State: AN3rC/7J2kDo/F9A0ppetopP3qDRnjUSQSO77lnRgerBHI6h21YIt+0Q
	7eP7fmNBLkSqzg==
X-Received: by 10.84.213.8 with SMTP id f8mr6791576pli.156.1492643093738;
	Wed, 19 Apr 2017 16:04:53 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s68sm6393655pfj.77.2017.04.19.16.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Apr 2017 16:04:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 16:04:45 -0700
Message-Id: <1492643086-31218-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tclibc-musl.inc: fix stray comment reference to uclibc
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
X-List-Received-Date: Wed, 19 Apr 2017 23:04:53 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 1ddd58e..3d3f6ac 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -4,7 +4,7 @@
 
 LIBCEXTENSION = "-musl"
 
-# Add uclibc overrides to the overrides.
+# Add musl libc overrides to the overrides.
 LIBCOVERRIDE = ":libc-musl"
 OVERRIDES .= "${LIBCOVERRIDE}"
 
-- 
1.9.1


