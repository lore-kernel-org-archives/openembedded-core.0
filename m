Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BB64B77238
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:56:39 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id il1so1885620obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/q4DmyzzE9/XJczM4j7Fko6iQaHLrquVB76+H4qxgmk=;
	b=0QxvnyiWqu/IhJyrlOBkVIa0fTLJ2eZE2rD+MYYpB8PGrDwJW+HmdY9JoKxjHq+K0s
	kJxDVkc+TVH+R88jZaHwbNz5wpMaXrcxHAX/VOBDTS/nuuK/3MXHdSJsHiaIHAAy9JCo
	kTkF+zFvJBVfjq5RGILC1qpPfvUqdB14baEYAHcEmt9mPxeGDm6/9EsYK4L/g5oavAPG
	OBTnoMA6IG7MIQ8LADYA/Pjy0lBNpAW7yiQWwDgKzLHDWofZ0AnmAjOByDQPKQo6phKM
	aw9qu/+cUCoQ7dolvHrdBlLOSlYaJ51gQnMep2qu37xRbxOpwti30iji8LpFzSWcMOvj
	ePnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/q4DmyzzE9/XJczM4j7Fko6iQaHLrquVB76+H4qxgmk=;
	b=ZCRtrxNiFHzMqdzOoCsbAFwxbcK+72OLPEQ+SfhlvWDNcUdXCPF7RoZUu2WKR+P81n
	lp3WnZEggAaARqswAtNTc9Qc3/NtKc/sKhBG1uIZoi+xmhO0fZGRaVSpr2HCC9Mh8SaI
	D5hjhWIlonltf7kWaeyKP7TGQ1pgrQAtkW3M5Rb6Bq6DeO1gXO+hSTsTSSGz64IrLUtd
	QJdam+tcikIiIqMVFHxfYVg4eXGshbXnoxOULts1XkkkVIVGQJ54hrrbs1LueZ8Cp1Hs
	kgFVSg0iTxBT+2RNXLTUtzMxh1c9n+z7d6PC2h+tp2quPCF3UIVjQgRXh68LqPAMLCyB
	Dkqw==
X-Gm-Message-State: AG10YOTBoiz49HtQK1o3VAetH1oHe6CYjqnY14qiwdmwmkn5ZLJ9mLuk4zJIlpdTrrNDfQ==
X-Received: by 10.60.178.70 with SMTP id cw6mr13986422oec.46.1454702200636;
	Fri, 05 Feb 2016 11:56:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f9sm10046151obw.13.2016.02.05.11.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 11:56:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:56:18 -0800
Message-Id: <1454702179-30239-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
References: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] gmp.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Fri, 05 Feb 2016 19:56:39 -0000

The original over-ride dates back to 2008:

  http://git.openembedded.org/openembedded-core/commit/?id=b3dddcdde5d10f382f71413aad67f7ef2e2420a2

There are no obvious issues seen now when building either of the
current gmp recipes (4.2.1 or 6.1.0) in thumb2 for Cortex A15.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gmp/gmp.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 2beea26..abac8cf 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -8,4 +8,5 @@ inherit autotools texinfo
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
1.9.1


