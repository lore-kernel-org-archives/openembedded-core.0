Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F101C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 16:23:59 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15186.1789835035733919206
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 09:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=K8s7XiwD;
 spf=pass (domain: konsulko.com, ip: 74.125.227.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so202115a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789835035; x=1790439835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QQ+F//z7t0QY5SDzbtA6rBA4vJJmVXcIWrMm9RUw4U=;
        b=K8s7XiwDKvqL6w6tEu2UpphFQp95nKOWFZUBrhJR928+c4M7lFWLcBoSGPdhzgwgzq
         L9WLXwuVJAje6qy9jyO8Wqdm2LLDFwP7FwuQnVpPU8aQGKShY4goCgub6ZSYeCeUcMKp
         WeFozOeYRLpfJO7QANPcbTLyCxU49qte2zaOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835035; x=1790439835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QQ+F//z7t0QY5SDzbtA6rBA4vJJmVXcIWrMm9RUw4U=;
        b=xioVKqXI9NsE1FrmE5mmlzdX6eHF2BFSaHsqPW3f9pGFVQ0idJMsy/ghvlxDgz+G0G
         fPzlkIRKX6GzNgq29QYGr6WFuPh4ZQojxEnByDFc9ICAL+Ios8Vw8d3uyNTWfYSgc5Qb
         FAYDYJ68biwzZMHd6Q/Mr7DLHk9HtDz7eyKhdytPVPBIHpu7FVCDiNoQHXqEVKWOTB9J
         SA5f4LMocf7iOn4CzwDg6WakOrJTsgZthy4rvC2bU5/3AgcewDwF1YnzXCCcrhZcV2Xh
         kOnnEMsMZr7JlwqNmpPmKfT4YY1uuX9mjolJsL4PyxzO/ZRYbxrNR+wL8n9lefskXjsc
         8Q9A==
X-Gm-Message-State: AFuF++mAx8//+TvgB3abbZ6J2z2rmcMULft8nRZ0KcTjzfzDoiN792Ok
	qj0j8/gd17UUfB3UvipG+HfMm5ufAQyoHYNshUdm+kaldAQRMV6fb4fm3FTKk5M/TgrAS7RPgFq
	uj6Re
X-Gm-Gg: AYBFou1OTJ6b3ta1a/A9p1BOfJPDROJ02sneFsU99iy8xTejRNsXO8ZlefRf9Wqb1aE
	KO7/MTr5DvpgQTy0aTXNcs6BfFn2EOPcbmMeoOrFSJkJeTbyOTB8D2gqEfDPPveKKSFdID/e0E5
	Riny7fU0OAIDgfa+Wus4NEEmfBMBgccufpZK+ngkHvqcvNb9ZXr4uGp15CYpSAQtb9cLZyTUHl7
	+UIgvI7DOimbxcKYYJzJ4Atxp2rc6h/31e5bgBYmKJE3qXa1Xv2VTJuJ8wda5jkyeVg2VDoRL3S
	ansQ4iosn5Cd4HpxE9SOBjpoPFI8quvj3CTuA1WOFpb7G4dt/5nj/5qjS/LELvkyox8+kLPelgH
	wFxVFQuGN19sI8EmY+v2Mj/rzbT9cRgvFlVJQ31rmbX2sUM/Lp7QzUgRzk4gjsE27Zvphoeusj1
	332r8JG9apMRkrbfqJZEcf3lwk4DxVZYiQoXFaLcebIB/zZdwVFdFzSwZFI5CfGr+FVip1hbN9s
	U/pt+aAXJEiIkswTw8FpncSnsc=
X-Received: by 2002:a17:90b:3fcc:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-39e54d36eabmr9753462a91.4.1789835035056;
        Sat, 19 Sep 2026 09:23:55 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm5242632a91.14.2026.09.19.09.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:23:53 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] maintainers.inc: assign gsettings-desktop-schemas
Date: Sat, 19 Sep 2026 09:23:24 -0700
Message-ID: <20260919162323.3862788-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919162323.3862788-2-tim.orling@konsulko.com>
References: <20260919162323.3862788-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 16:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246239

From: Tim Orling <tim.orling@konsulko.com>

gsettings-desktop-schemas is now in RDEPENDS for at-spi2-core,
so assign myself as maintainer.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 783084060f..c273d2d754 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -248,7 +248,7 @@ RECIPE_MAINTAINER:pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-grub = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-grub-bootconf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-grub-efi = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-gsettings-desktop-schemas = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-gsettings-desktop-schemas = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-gst-devtools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gst-examples = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gstreamer1.0 = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.47.3


