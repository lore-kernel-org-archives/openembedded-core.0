Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 50CBB7FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:54 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id z188so5057716pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=icqULzWw+zsVTCbvXRemRUhocxIzfsIaYO2W9RG5tI4=;
	b=nZJ0xgq1keur43tAnYZ6+wEXaxNvQyjTaeHj7A9ZOVkz4N39wlPxNjGJ24Khn3a3wL
	qG4HC0NMvisdUn/KMe1qrdIu85XXXb8OXh4UDhi9/sj+EU43t1nJul13q1CUWpc52MUG
	ktXgoBNPxBHn5wFVWbAm005BO/o96W54GhmOP1/UrDuATvL037QeLdeIjHi0t7MGDLup
	yFlBlH3zpC6aMmfcbaLa214jB0znzkAwtzoi23L7IIUyxAzqUegPIphfTWHyYrhFh1ZD
	fDursYCPtwBK8shgDWA+KLvfVfNrUTunrAXe8j0GpDRVU0aTPJ9ipDYxBQaAX/d8sYaU
	PoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=icqULzWw+zsVTCbvXRemRUhocxIzfsIaYO2W9RG5tI4=;
	b=GZqMQeY1SD/eM7tI0I1oU7jDu1jcvvmqlO0q+D3JNHiI/DEz83vGvZnSNemTxyTIXr
	+gUFoydgEzCKppkMotLgJECmDHXLT8yoDdU2w2CkGu1AewpqvWoG05acLZ8Y64gW1znU
	Ck/voGEYlK8CKTD8TMaPvEhnxSCSh/1j0+iPWfQgRtrFHpNZpIHLIz8eat/uIkKwmldS
	+7/Nw0YD4xHT+5yJCXA6qKx6xC3siVFBuXV54Mv0opG+7wFScbxSb9tDhsy21pNyehFV
	1N+CWAK00+5Xln8GQpcgCdGS4TGdZjmUDkzY7QOaWWlxnOAVA8H57KK3utPnp25VD5l5
	aBjg==
X-Gm-Message-State: APjAAAUcWwtSr/om6wqN/GoaT5whMa9pYfsjmFbutoGWVtp+8P4bXPih
	WG+QnrRD6B5f/KYFdajY3i1ceVZY
X-Google-Smtp-Source: APXvYqxXXHU76LH1qCtVm+B/jbRNZg+m2IrWiGaVwmHaEfIhJnZi3AWEPJjedRHuXEu60RPmCcfBRA==
X-Received: by 2002:a62:6404:: with SMTP id y4mr32836705pfb.170.1573533235290; 
	Mon, 11 Nov 2019 20:33:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:34 -0800
Message-Id: <4a97d5b11fafaaae565c2502c651e3744d1ac622.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 15/20] OEQA: remove manual bash test
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:54 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index 021ba57..b19bf4b 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -25,22 +25,4 @@
       "summary": "Add_user_with_cleartext_type_password_during_filesystem_construction"
     }
   },
-  {
-    "test": {
-      "@alias": "bsps-qemu.bsps-runtime.check_bash_in_image",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "After system is up, check if bash command exists with command \"which bash\"",
-          "expected_results": "bash command should exist in image giving something as below  \"/bin/bash\""
-        }
-      },
-      "summary": "check_bash_in_image"
-    }
-  }
 ]
-- 
2.7.4


