Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B08574838
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:32 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s24-v6so11767423plq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GjALHnO2WnchbsPuIy0XkJ40UOIzo1sCCNCQeL3Xvfw=;
	b=tvPR6EYt0MZGVC7UzqjGLPQ5pAJ+eEIkRIHypc2V0iOakJ3yZoEeT8pooy9/o73+oz
	WTunUNNoSj6DWfIoVPDhVD5+L3NFr3lfo5/5tJs4lMQfVLYcgF6vRq54TG5iQy2JOzjS
	2nj+pTbI4RXkv4Qc8c3N3CEEu2BxR5Hv5qSWpQilsm08iqTInHJG8of14DugYZ/qHqLn
	izP990ceNANjXadztLPngZ1odtw7+W9Si4wnEUe5vMSGTIbPlocxtxRZaOCubvQ/H2ej
	SXYzLYyySVagMxLsaj47+E39YNTEICMpSHHXN9lrmlfkI+mMhWmHRjep7j/QjzdQLHR0
	aQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GjALHnO2WnchbsPuIy0XkJ40UOIzo1sCCNCQeL3Xvfw=;
	b=r8g+/8Y3SEJRg19Tqq72cM/cXUC5xl8YVN1hNwbdl38w4QDt+JbvZW5iXLqGYMSBrf
	qhZVKhyb0goGsfKnQN3x/FmtxECJFYL2a+UCbkcP98X7MLqJXR7eh6gApC/Uo4y7BPlt
	K8CwVOrXuTmv1/Kt/H2srlRqLnFUKXy7FXkKs706vU24UanBHKA3sE3upiaXUMLDF4+8
	yNlXMMkhZmTv64a8kNFO2V6TOhbkuKQ5Q2a0IYVZ2K3BtrYsxedknWUyE31jFEpSxLjl
	/Q1JhJPVjKlaUaUauGEha2PVTfSH5kiR4aVJNhSKN5VkqbzNFt8iS9WefxE+8W7Hn81Q
	4H5Q==
X-Gm-Message-State: AElRT7FzKfdiFZN1KVf2+zzAN0+jn06dh9uwj6VGH2Hs42QW3FWNGBPj
	DKZ6riguIk3ZSYKm9qHpNiMDaQ==
X-Google-Smtp-Source: AIpwx48VmWtOQBSZU1Wr7GUhoDK5n+BQ5J6zJ8yNSysd6Kh0wfDZVyrFWKVP2tsCRQjpwVG+G9rhnA==
X-Received: by 2002:a17:902:830a:: with SMTP id
	bd10-v6mr16153388plb.322.1522806573607; 
	Tue, 03 Apr 2018 18:49:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:09 -0700
Message-Id: <baaea1f828b83085229f46e3868347f50da0302d.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 10/21] xset: update to 1.2.4
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:32 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.3.bb b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xset_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.4.bb
index f683b76..5748837 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
@@ -12,8 +12,8 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "dcd227388b57487d543cab2fd7a602d7"
-SRC_URI[sha256sum] = "4382f4fb29b88647e13f3b4bc29263134270747fc159cfc5f7e3af23588c8063"
+SRC_URI[md5sum] = "70ea7bc7bacf1a124b1692605883f620"
+SRC_URI[sha256sum] = "e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"
-- 
2.7.4


