Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54951FEFB6D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 16:15:23 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99757.1772208914027347821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 08:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=cqrJrW2f;
 spf=pass (domain: 0leil.net, ip: 83.166.143.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fMthb658pzS1t;
	Fri, 27 Feb 2026 17:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1772208911;
	bh=Ks36sr7h5Hm+NryYRHqgssnQKYK0fOqk7/aH9BUlVZk=;
	h=From:Date:Subject:To:Cc:From;
	b=cqrJrW2faGeLShwQPn/whg3Giw5eIwir+havW8Yx+V1cxOxRI22dy9zpazorl+S+4
	 HLRRQq7ZIGGOjb1e1o4+XcM66dqldYvp4SIjs3kf/ACmm0DGboT0nup9/MpPbRK9G9
	 Wgr1HEqZOji5y+pf36aMirTEcE2XWCnLaxBkwqQPznapLRsVIPEyJtRmEbfi2IVYam
	 JwoUswH+rkhJxokOu54bkafujDsOCIMmHeu8LdEWZo7/kpgjIJxBBVAo8hNuHMevGA
	 /wWvdIFbo8Cdu1Lxad86v4lfa8AzfIrNd+MBsyA5ja4zyfp5UaUeTvY8TpMYmHlCL9
	 sXj0K0OwpjHIQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fMthb3FwJzgnv;
	Fri, 27 Feb 2026 17:15:11 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 27 Feb 2026 17:14:56 +0100
Subject: [PATCH] mesa: security bump 26.0.0 -> 26.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-mesa-26-0-1-v1-1-63ae511aeafe@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IQ0igV5EuYhztFBpLRqUgu
 XujLt/i/wOUs7DCozkg8y4qS6ro2gbiK6SZUcZqIEPOEHn8sAYkhwY75OiCt34cbHRQi2/mSX7
 XrX/e1m14c1zPBZTyB4Q53udvAAAA
X-Change-ID: 20260227-mesa-26-0-1-ec6a747db4c6
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232102

From: Quentin Schulz <quentin.schulz@cherry.de>

See https://docs.mesa3d.org/relnotes/26.0.1.html for the changelog and
sha256sum.

The announcement[1] on the mailing list states this contains an
important security fix.

[1] https://lists.freedesktop.org/archives/mesa-dev/2026-February/226597.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Build tested on RK3399, RK3588, PX30, qemuarm64, qemux86-64, qemuriscv64
with poky distro. Not runtime tested.

Did a cursory check of the commits since 26.0.0, nothing standing out as
requiring additional changes in the recipe.
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 82e02e5f91..58102dad74 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "2a44e98e64d5c36cec64633de2d0ec7eff64703ee25b35364ba8fcaa84f33f72"
-PV = "26.0.0"
+SRC_URI[sha256sum] = "bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc"
+PV = "26.0.1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

---
base-commit: be8cdcf13a658e9e81ff2f7b71d1c8c37a920ce7
change-id: 20260227-mesa-26-0-1-ec6a747db4c6

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


