Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BC4C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.11903.1651248169682307269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xKuhzt7Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso10926992pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fdmNOhfg4WLdfzLfgClI2WnnvJBXjHVxXOHucwPYC0A=;
        b=xKuhzt7QZoEO5oNXNkQsgvoey14sTWBlKolMX1yIhMpnHdRztqcY6l2PEzK4rItfPV
         ENvk4NqVq/7EnfCeeNaXrWHTkdYJF9Cl7BOCp3QlYltXVP98ztpEWuUdhCeSJSEpbvfF
         ywa+y/R8jBeCoBJ9D/Z+A5H67FSZAcES3WI7L3HwpaImiluxcEIfXOuKuC9ncq1JUu9R
         VhSVA6MAzzcKocfOeEM2moJ19Os7fgrzhoJA/4FRCkl2fDef4wa4N776G72kbjuxc743
         a8tFckO0C7Vibg+LQcrkICBCawMWMYxo1K4QqxPXcg/pzUUCXHLJZCSBdrli2im7sjnB
         5qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdmNOhfg4WLdfzLfgClI2WnnvJBXjHVxXOHucwPYC0A=;
        b=XNFXuYuwMdoPJmqBiBDuogGb1Hbt4n10r9DoM7QZa+4yJsJQj/SrqcRbybKKaVx1yt
         SKSyA/W0oJmlFIRMgZ9BMBfCdZ5VddG5mmyLaiNUr43OybVc76fXOtlT/P8fOKWLcnLX
         ZSPz7V8B8CkOM0hrBe+bMrWbvxYhTMIL2EY55qz7RmNlUGYzC8J50LaJQ9W2b1YI+6ta
         DqdXeLCGrKGH+sevutzGG5UHZOoBSUD7+iNJTRtsSme1IUW+IVyLD+oSmEX3V6nmfM61
         bc0p6XBJzuvNDMg3kHe3Ha01wpP1jMqJH1Hh26eHS5EzRVpoTnJ+aPcGur/IWEm3T3y1
         OhHA==
X-Gm-Message-State: AOAM532YnD8yT8UH7GXeZB+JsqTb2QRnUkDhBPrPQFOQQASbw+0/qk7E
	jZimhquRuDCtYHGalmyLZ4oRq/qs2ie3B6KFYUo=
X-Google-Smtp-Source: 
 ABdhPJzPlCwL+AywfprwErxckUcY9F1EGl7s7aLzThwN9JoVMQvL4G3sA/kY9yB5GOS5K767BQ2vfg==
X-Received: by 2002:a17:902:7298:b0:158:3a08:3163 with SMTP id
 d24-20020a170902729800b001583a083163mr69908pll.133.1651248168391;
        Fri, 29 Apr 2022 09:02:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/34] libxml2: update patch status
Date: Fri, 29 Apr 2022 06:00:53 -1000
Message-Id: 
 <87d7383989a1ef6deaeff85739e622d8175ae9b6.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165053

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e21e1e5e2659b02a771ce986fc3194deeda9f4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2/runtest.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index a89dac8b75..42bb22cfd4 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -5,9 +5,11 @@ Subject: [PATCH] Add 'install-ptest' rule.
 
 Print a standard result line for each test.
 
+The patch needs a rework according to comments in the merge request.
+
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
+Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-- 
2.25.1


