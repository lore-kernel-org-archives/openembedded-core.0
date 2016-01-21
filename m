Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC58731AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:57 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a202so1409993oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wgU1XyKh4/oqwoxq+mSXDoSp4jOiReIpGY6TFKFN2QM=;
	b=xOk4fXwm0p5jEhf6KVMr3HrkOmvHgQUD1AL2ZsxQJT+SgxhJvjB/moTPGL1m2o4cbB
	yve+Rb+ugnZysJYOqIyFCbhDujvJmlQUBj2s3NiECSfGlr2N37YEf70L2ta4FCSFsmBS
	6hWZeac04lg0YAtoUlGU5jHKXkvaIsDBjzHcqTPHsdY8nIaFOYwdabeHIyJeMSkWcKFg
	U7i72v6JWHgvz2hd4CGwkN6iWUn+iTrEvpf/VCDEz1h1Ax2wSVWZLGno0B2wEUWQ+MAP
	PtsohBZaf4Q5nZ+07ol+NqbyBUtzW2/HA93lPGTfqb6C2QJR+TFucvcymT3ytRWjj4q8
	kVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wgU1XyKh4/oqwoxq+mSXDoSp4jOiReIpGY6TFKFN2QM=;
	b=hvw+vbKC2k4WsTRKZ5S/DR0whi6cmeSo1dmBcgvii+0FegmulPiYNtJTMpbxpzU8Xw
	wPNOFD39Hit/ggv5GMG3QhQivAoaTlSEdttRg2puF10kPMpnxfJ9YLg6YUFiGvKM9/Lt
	CLNKF4WNVlBRYYNbQgoc0uqSsBGp8kXq1ntXH/NA7lRv8SgJlIR0CRD2oVd/xnHt3bbO
	wPBBm1l2Vj1zErQvy7BnqPv1d0Wn+XZgfxN3gIYfi+9pMXESqIbU1JDGXnOXOZwd+xjd
	ebV3r6l3tdQ8X4ko7Kv7H8SyqZdaj/Pqjktx8QMzrHzbkLhZVvP357Echk10/VGFgpU2
	06fQ==
X-Gm-Message-State: ALoCoQmHr3sRSIJ1KV+ejZe5JvTgkEQgMPyfS6LDdndnQRlhSiSTFyY51JbUrvCUB+ZNncQ9k5o9jFIyE+Lx1xzR2P5LJ4ZuZw==
X-Received: by 10.202.104.224 with SMTP id o93mr30583409oik.126.1453344238050; 
	Wed, 20 Jan 2016 18:43:58 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:11 -0800
Message-Id: <1453344203-7118-14-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 13/25] gstreamer1.0-plugins.inc: add missing glib-2.0-native dependency
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:57 -0000

Building the gstreamer1.0-plugins packages requires glib-mkenums.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 568d51f..d8532ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 
-DEPENDS = "gstreamer1.0"
+DEPENDS = "gstreamer1.0 glib-2.0-native"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-- 
1.9.1


