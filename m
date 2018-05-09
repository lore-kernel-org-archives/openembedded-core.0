Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5D274A6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:49:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y189-v6so10563065wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jGWwAVoDIbpBR/Oof4fSljqwg9QhWNit3TPbNFGo/zQ=;
	b=JENZeP45UVQ8JwRelivykRhuDA9qOYl/REFlLWaXs4eOwNADV+JKMCY6ZjuBahYOXB
	5503zDtIwgdo6U8SieNOz0pHFG+Isj/SegnHpeyhYmfwP+oMmJ2eC4OiJ9+nQOAo/UA3
	rL7uREZZ6nrgVVngR6rXP6TsWFQGsksqhyFinrOJTfqQsobEdgg3ttRZ3sgC/lVbuQf7
	zwUMbJ9SWKUZAlRyPN7AJJSvbzSWVZFuKFHX4jZMgdUDee2wLQ8bYUryzvlCVYHwXvnJ
	9eGFheTBQV6bvcJvuR8pElbIJHPJH6FDWKWpeWO2pso8w/HRHf5dQQp7v7lUKLZDPCjn
	VtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jGWwAVoDIbpBR/Oof4fSljqwg9QhWNit3TPbNFGo/zQ=;
	b=p7ITbWi++kA/siljUOWFKumxT6yeUibv3lTkDb190nVumBIsbmOkFlDGy4qwk1CF5U
	QsuSmQGQN19xTTONiP5ZwVBCQ8FGoK0HJRw5Cvtc4r4OvwPvQml/LTFoE49Ti8KBaRzN
	6im5L0X2mJhje9zNhH3PNhU3CzTPTe3wUwZ+jHoL3c4Tt/hgcH2oTxjuDezaPJvObUkE
	JRHV9+nv9SeRPgYDtZW19CiJ5ppBmaKvi288/Cz8Qcp/Da4+4TSxIH+esaRAe7ChfG5f
	XR1wgsH1keMqL6uBFXp1SHjBO1mdRBfeCr5Mi4P2U/mwZAC0fhjuGOYZfXOEP8XyBf1E
	V+eA==
X-Gm-Message-State: ALKqPwcdDG1B2X8Cqg8PonX6MWN6JvCA0eYf2EcV8lApOiPHzMdkvZ7j
	VMoZszB8LsHMuAMMCEC+QESvQzCU
X-Google-Smtp-Source: AB8JxZraGtSmp8rNfr55AeOISmtLtRdMA6I+eINfVi7Zn1A2gCgP+SIYbOJ4CU+wAf5swJBC+brV2Q==
X-Received: by 10.28.44.194 with SMTP id s185mr5738973wms.62.1525880973529;
	Wed, 09 May 2018 08:49:33 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm27408321wrg.56.2018.05.09.08.49.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 08:49:32 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 09:49:19 -0600
Message-Id: <20180509154920.5987-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
Subject: [PATCH 1/2] go-native: use nonarch_libdir
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
X-List-Received-Date: Wed, 09 May 2018 15:49:33 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Setting staging_libdir to libdir caused unnecessary rebuilds of
go-native when switching from a multilib build to a non-multilib
build. Switch to nonarch_libdir because that's the same on both
multilib and regular builds.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/go/go-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index b76fb0825e4..76c83848cd3 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -1,6 +1,6 @@
 # Use immediate assingment here to get the original (/usr/lib)
 # instead of the one rewritten by native.bbclass.
-nonstaging_libdir := "${libdir}"
+nonstaging_libdir := "${nonarch_libdir}"
 
 inherit native
 
-- 
2.18.0-dev


