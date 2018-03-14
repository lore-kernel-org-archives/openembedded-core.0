Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id E94C078489
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 07:44:03 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c8-v6so413177plr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Gtg0Bl63pMFfiziPJDwAg8YhCUl82GRUIJs+u8v+R6Y=;
	b=XYjtUv9O/rFuErxTVy4U/IFZ6y0cYGkJqGW9ULhLqpU45LnWxrbseYamsAvlOLoETn
	apa6nqjX5e4iBqkoXcgYxd9r4NDCgAPCYqC8y/aMEWfHIIOs8gLjx9l3eRKxR9EXjKVm
	BNqlcsUbeyJcv/BlFSXj5v90kobaeUig2jTJtLO1fRYO5hGmBCuEXcLpgHBc+wl1z2F5
	N85dhA0rkdhVY6Hk+cWDTI9YffLC4f3HbfHfWEPE8LHn94cRcFZxl8+z9bN2jjCcS5k5
	ViYxU5EkMgeseRqMNxWxD3ra6wbdyFihQxIowrQHptlSISUSDZrJiExrpJwmCtKU9e1P
	b1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gtg0Bl63pMFfiziPJDwAg8YhCUl82GRUIJs+u8v+R6Y=;
	b=CfcZ78PMs/HUFm8Fip3e+in1JpP1BC2liU+EX8AsXufTG4ZqtW1E9TfGiKD3JiP4+y
	CLl+xy8CRiI2VPaFOvpVU3PDLGF1t6bc+gANkT0wgciJtHv25Q3/koeWosVDL1qQhEc/
	p0yJhCLKXQFGHVmdf7S5iCCV/gzHD566m65DYDGPq5Qp0KjRaRB2jIQSuQ95H3dKnIeB
	YyDskXLc4EpvJfsTQbRysw4uFwfx6Q07yrDDx5eOxbRPxDfMkaKlQEzb812n88P2OYKy
	8Mid89D34FT9yTLzGZ7NEVjTbcvGnmAB277rRHg0Qk28yMlG9Z8G1ulVj5OoBYypBs25
	6Qig==
X-Gm-Message-State: AElRT7HHMhUqeqidyoCxtbeFfHQBjs42Qkq82KZOmnm3iKehaHN2M8yz
	0YZxtBO0Nt9FcusLzpcHGxfuQA==
X-Google-Smtp-Source: AG47ELt7fUZdAmX11PwAo2VPLwVfJPsYCOr0197jK32ZfW+lIt//QaU1ZSdqLP5swCv8hdGnJ9+fRg==
X-Received: by 2002:a17:902:7b85:: with SMTP id
	w5-v6mr3191167pll.131.1521013444988; 
	Wed, 14 Mar 2018 00:44:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	d15sm3998650pfj.121.2018.03.14.00.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Mar 2018 00:44:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2018 00:43:56 -0700
Message-Id: <20180314074356.10174-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] insane.bbclass: Fix typos in 32bit risc-v machine type
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
X-List-Received-Date: Wed, 14 Mar 2018 07:44:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7791a867f7..fa15460842 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -71,7 +71,7 @@ def package_qa_get_machine_dict(d):
                         "microblaze":  (189,   0,    0,          False,         32),
                         "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
-                        "riscv":      (243,    0,    0,          True,          32),
+                        "riscv32":    (243,    0,    0,          True,          32),
                         "riscv64":    (243,    0,    0,          True,          64),
                       },
             "linux" : { 
@@ -99,7 +99,7 @@ def package_qa_get_machine_dict(d):
                         "mipsisa64r6":   ( 8,  0,    0,          False,         64),
                         "mipsisa64r6el": ( 8,  0,    0,          True,          64),
                         "nios2":      (113,    0,    0,          True,          32),
-                        "riscv":      (243,    0,    0,          True,          32),
+                        "riscv32":    (243,    0,    0,          True,          32),
                         "riscv64":    (243,    0,    0,          True,          64),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
@@ -126,7 +126,7 @@ def package_qa_get_machine_dict(d):
                         "microblaze":  (189,     0,    0,          False,         32),
                         "microblazeeb":(189,     0,    0,          False,         32),
                         "microblazeel":(189,     0,    0,          True,          32),
-                        "riscv":      (243,      0,    0,          True,          32),
+                        "riscv32":    (243,      0,    0,          True,          32),
                         "riscv64":    (243,      0,    0,          True,          64),
                         "sh4":        (  42,     0,    0,          True,          32),
                       },
-- 
2.16.2


