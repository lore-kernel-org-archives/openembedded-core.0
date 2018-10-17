Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B505D796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:08:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z204-v6so2577332wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DWuuvkYX6pbzoTsQzYd7s1FLknPsgr3FEWIwGx62pkc=;
	b=e9ze7s5dmCAe6ujk2caLpDdFcBlK+64GLX8Hi+0iZiYX4McuXz/RQpL5+m9Wflcp2V
	wWNFLmvS32hGi1GgG/pzeCst1iNj8rfoTwhakEbQDpGFBPRTpzYKEfTycuJIjoXgnvEg
	sv+v/XuWcyklcuCTPZbjyy6FYkdWHHGVs0475TdLI28Jl3FmwUcGVVtrndCUaWWAzjVW
	n+I5zeFxrD57nEFJxBA399czdArWz4X4Js5LYLeLxl7VbaO0D4V2YnJfS5BZcC+fatWx
	xrfnwCBO3E0meGmGoqcpEN3mVVlRuJuBFseySZ+ynbcvkXKl0WOAiWXA5zPUhY1Sjqm/
	hQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DWuuvkYX6pbzoTsQzYd7s1FLknPsgr3FEWIwGx62pkc=;
	b=TE5VQoaOZWSASn3rjWf781WFLATqoo2v3pL99ucugQLdicxM4p88wCDKVQvxAM8TB0
	Kbu1J8BcPgfRbI3aEhbNrDTxy+//AaW6XEgb9UyX1PbKcYE4NPE6FfHjV31QMU2bSAv8
	B3whVMHUKK7cfcyp8WfLAURWti3dy7W9UFUq5WRyYpF2cUQmlyPKnaYIzp4w8XsT74Mk
	3xcQxE/Nq6lIQHwK2HL8oxddC14P1AIUHzREQa7ECLDcx1c8ae2nFVf6VJUgwCrBBZ9/
	6zv3fFdusF2GOXPuru+oYXoeYF71Ar3i6T+q6lxmyNcJNKKYut7BZCz3IB66YAoeZDVO
	b6pA==
X-Gm-Message-State: ABuFfogp3/GoI+HKbhON19kFFyDgBgp55IiRE4gTq+4UItWSq/udS6fJ
	RLLrERs7Bw/LBm6jsI+8qnrBipFUX7zhtA==
X-Google-Smtp-Source: ACcGV6354caBd9BPv3V7OMzFCLw7LTl1lalFJUcIVYyqRpGtt+BziLZ+TGSnsGa+dwt8hu0aWsCSyw==
X-Received: by 2002:a1c:1812:: with SMTP id 18-v6mr3360253wmy.34.1539788885824;
	Wed, 17 Oct 2018 08:08:05 -0700 (PDT)
Received: from yantop.local (lfbn-1-3228-112.w90-79.abo.wanadoo.fr.
	[90.79.233.112]) by smtp.gmail.com with ESMTPSA id
	j6-v6sm1454450wmd.29.2018.10.17.08.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 08:08:05 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 17:07:57 +0200
Message-Id: <20181017150757.14591-1-yann@blade-group.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 15:08:06 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Otherwise the build fails with:

  NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['${RDEPENDS_}']

This restores some truth in the "Otherwise install nothing" comment in the recipe.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 0ede5e57b..e81516fef 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -32,6 +32,8 @@ RDEPENDS_bluez5 = " \
         '', d)} \
 "
 
+RDEPENDS_ = ""
+
 # Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
 # Otherwise install nothing.
 RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.19.1


