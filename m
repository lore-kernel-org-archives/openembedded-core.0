Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3507886C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 06:23:19 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 61-v6so1215636plf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kANwkuU4opH1E7ctKKOUbpRJD/9LlzEW2Dstzj0CZL8=;
	b=R5u4z7JRJP1cj6SArxyeEqcfvb+IwY4/QtAVH1yt3L2w3IPjOs41uW1SU4jqX4ehBD
	ldGbXi+O84jwNqh1thM81qgdnZG+b2ln3nVNTetiLvkRcbvP6NUYlD/J+dvU//cEO4rx
	vPwiVgDdQPYyvF7cjGTQAcv5tUoumrZCju29aKaImw87U0+GmUpzXFuR0OEnjkPj8PSs
	kOy5gHzRq2TWoHRDsGO7goW9yQi8plF/pVv1DINbmSkXN1/hk4yLBW/FEVS2sOKyB5ke
	xLgaT8plZ551Zb/SXfp3oVzig8HFPUPBVyiewGYpgf8N5lL77kc3dK5OGaJ/N8McU2IV
	/KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kANwkuU4opH1E7ctKKOUbpRJD/9LlzEW2Dstzj0CZL8=;
	b=K14y2DpoTBl3t6mE7Gh1RSxZm4tBAx7VN4ivAaBX4JUjLpDc0WCMIy1ZG1NHsBTsTD
	FpWVxKjS3o9ZkFD1TrWJ9yLiW1eCmjAkvGo1zL/VsdcYrCvqM6qTbHE9FjsjrmfgPxDn
	LuL5ONoacjAG/D2i568jglYqAEuZ+s5/YzSNIQ6eA3WrjenxgSA6Wvp22l9UuMXjvadL
	bZas+2wM4UfqYuI75xinfYpH0xRXyICJfQI4jJGdB7t5qgdlhfhOYCB7CdTocwRUiAjr
	rpl61COhMgrhqdbNJM9awEhR51pop5KWhitkGWtmvuR8CaCMtkunmxTtRXv5/rKwlt6r
	sHvw==
X-Gm-Message-State: AElRT7GxQwlmLD38WiPMya4xpd0Jq/tHzs/fH+lLLEPkQtVpPcwN/tNE
	qXRs90bCnXELWg1m58b6J4SQrw==
X-Google-Smtp-Source: AG47ELskT192bx64PlwdyXzW/vz5T1zuVAkusSMiMVQKZpCb7ZpA/IJ8+FuZcg1Hfd4bgdab/GoUig==
X-Received: by 2002:a17:902:a705:: with SMTP id
	w5-v6mr3049293plq.299.1521008601115; 
	Tue, 13 Mar 2018 23:23:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p9sm3088924pff.173.2018.03.13.23.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 23:23:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 23:23:11 -0700
Message-Id: <20180314062311.19380-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] insane.bbclass: add support for RISC-V baremetal
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
X-List-Received-Date: Wed, 14 Mar 2018 06:23:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7407b29f86..7791a867f7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -71,6 +71,8 @@ def package_qa_get_machine_dict(d):
                         "microblaze":  (189,   0,    0,          False,         32),
                         "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
+                        "riscv":      (243,    0,    0,          True,          32),
+                        "riscv64":    (243,    0,    0,          True,          64),
                       },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
-- 
2.16.2


