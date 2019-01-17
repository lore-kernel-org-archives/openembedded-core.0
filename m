Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8357C1EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id t9-v6so9125842ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=dwI0ieHrXta40JYPuo/qWilqsL6YHsjFhTwqMK2xhzt1S8r1yIi0OOPZh1+zFkhJtq
	bokoh9bV/GWpQZkzZ1XIONwJVMylmaImrwqvK5ZI48AhiHVP1Baclu4h0z11EL09h4qq
	S1nHg4+81yh4JEESC/cEhYsWcbGAtixgo+eBNhQ9pLqFZFu3ELykgsW+3/JUFVa+F4V2
	TCcp5GmPfKFMhtdq0zKP13kkNWB5Dh5NN/fhOn3ZMVYuC8aEusnCieCznOr3Zkp8+zM5
	e/W1t/rKupb44ieB8uJWAOU6JhkWIrA/D1aICdl5spc+7b6eqMXZOtbY64j6GFdWNGDc
	ureQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=oySnvlTHoHromvlRciX75mpFXIXPF93vddTcr5KKnQFPKhbj9wdeOWV4iCxxlvjTYM
	SN7znds48vp9fYUVYg1lbXOfvXcJqMngivTSMQa4hW14FJDwIFAzU8tOR3tZQqjpTQpo
	DLs//LrzYfeov0sZhycEUse2wEGL6ZIN9tGtOsbkqZGmVsPVLPG/8QPIMDRTNODE4vLs
	nfXrwho0y3gAZ9ez+uLeTDMt15ACPfR0wZeKp0luEi9lbAp6ePFsbzAhGjpnHzyQLGqN
	n9KApipubVAJsxcagrJ9Y6nfkKqPqnnL4Hbedsr1yWXIf1PmUtd4rUura8C+GWENSe5x
	IeOQ==
X-Gm-Message-State: AJcUukfsU9gLN6W5jQ4lUlzWa4CZVx543udd2U/CsTKzcwAQikilvQy2
	SBeyyGHBy7ZGG7jJOxhWNqtVR4Xv
X-Google-Smtp-Source: ALg8bN7W5fBmJt8y0m0Bl/4jWhDF0QUZHEAtRLZpGX+GS4Zts8jusRaVXhHBqiRfi/rWZDUGFpQfCw==
X-Received: by 2002:a2e:841:: with SMTP id g1-v6mr10834738ljd.21.1547743241444;
	Thu, 17 Jan 2019 08:40:41 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:00 +0100
Message-Id: <65b5019c9fb0dd7d84e0f2d4c8bd8d969f9e5ae3.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 15/27] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:41 -0000

We do not support g-i for nativesdk, neverthless atk tries and fails.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/atk/atk_2.30.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index 481f8e89a13..4e2dacbc4d8 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -20,6 +20,8 @@ GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 GI_ENABLE_FLAG = "-Dintrospection=true"
 GI_DISABLE_FLAG = "-Dintrospection=false"
 
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
                                                                                        '${GI_DISABLE_FLAG}', d)} "
 
-- 
2.17.1


