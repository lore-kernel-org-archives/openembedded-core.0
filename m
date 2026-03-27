Return-Path: <fantom.jac@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23FA10F2879
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:15:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1380.1774653344989785733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eq/SqZAt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: fantom.jac@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so2151545a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774653344; x=1775258144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rnnpjVra+QbhpQAq3KEpZQjXUp+ymME8yKk0hFqRck=;
        b=eq/SqZAtRRVqJRhE+rd+bTHIs20g9m+M5pGFc7iI+GbJBJlYFUCw7MhpQdx3ZKVO30
         MdB1DkJkFsMJKfG2cOAMVDqp6ycv7IYt5EWFvQ+aGpXNhwPTdEVPZpN5DGOCdddlbKB4
         WHClLMbNRPVKLCU+Ri76RSIwyI+LwmdMC0yp31W+kdGMmnW/DVcomE6+kPtxQGazDKn2
         mFbAu4ZY8ehuaQXdIAVGs8vTbkBTJwAfo3orbDfvXBNTwgT7nheDH9OnkicbJdvgduqX
         V0AnALsyJ4zmLsEMXsPwZWyVMwclAomVJW188ErvN8/5XLGd3kI7CneJkHA4hQ9UvuIo
         RuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653344; x=1775258144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rnnpjVra+QbhpQAq3KEpZQjXUp+ymME8yKk0hFqRck=;
        b=hSoUa/MYGlZE/dLsC0kgPk6FrBX2geO/vyLplW+aT0utf+9lLrBYZKSqDmVi4hEVdT
         XR1tWyLEGRZjuBBlox8teWhU+jG8UpKL14HLfz6tHNdopSd8RwtKq99hSA8/R8TOo7XE
         /a/JsmU9iXlZiUiYU7pOyUdlMGkMWpaRNKhPNrImBBfMfZ7zm85DDsBsVL8P0n8aCRgA
         qov1IiiUsPtmvh9cbrYbqvac3OWiPf+db3ouTzhXdZQyazEGgXpWuU0hS7CFyNE8cHZt
         ykzf36zKfZProq8VWLVO8ilnHIlKoapfTiEeQPq1LtCaRMgMTqUEX8lhXcN4VGrxptZg
         sAnQ==
X-Gm-Message-State: AOJu0YyrUTkRK+fe2VL0aTT5DuoTRraRV5VMGPApl5LrvJRPvnmoehPQ
	5ufukfIwjfRha6j5Tc3XVzI/A2CPyRjekA0YOhneggVJHqjmkw4D3C8wK4/iKA==
X-Gm-Gg: ATEYQzz9iaUjl91ZISpPh6XCEm4huTjMrPnqzL2YYuEJqClUhEFFLmYUgiRiW7jrRON
	DCPnRvI5nddRypd70QR1xqSs18OctNg73C5oo5P7QurzNMLQ5LusenLmQ6SJ274eN7jcwZmKn5+
	sgmPXeX3hKCZtm3lR3Es8DwKLKnLV1/Lx+Ss7B0l+rLALpknOThvJfH33Q4Y3qAdSpHU/tZboty
	ziz8ZOKaswv5nL1J3ZHy6QGWTBaDkduiJja+VwiRbnJbbIPxx+wAR/5+Ijupze5U9OKROAQTz57
	hRxLcTnKb3VK3xhUC95jqpRSA6YyQRCsyouJ/Ob5njPaaKAlxKXcqW43UTdlQGSv0mlZh9BYNTQ
	yw7F7boM63Eu4mm10Jv2NAd88uhE7/mRFb6EDdT1qxkcE052JlDEtENnmVis1AnrJuG3EDpCs3d
	ihLhdvphPQ/UBHamp4pfIGymyroFtYSbchhW7ypNYcAM98LqcyKiI=
X-Received: by 2002:a17:903:947:b0:2b0:5cee:c421 with SMTP id d9443c01a7336-2b0cdc20ee6mr45149305ad.4.1774653344061;
        Fri, 27 Mar 2026 16:15:44 -0700 (PDT)
Received: from suchida-mbpt.uaudio.com ([45.62.187.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427ae07fsm3999745ad.69.2026.03.27.16.15.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 16:15:43 -0700 (PDT)
From: Shotaro Uchida <fantom.jac@gmail.com>
X-Google-Original-From: Shotaro Uchida <suchida@uaudio.com>
To: openembedded-core@lists.openembedded.org
Cc: Shotaro Uchida <suchida@uaudio.com>
Subject: [PATCH] insane: appendVarFlags must be preceded by a whitespace
Date: Fri, 27 Mar 2026 16:15:18 -0700
Message-ID: <20260327231518.19822-1-suchida@uaudio.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234108

appendVarFlags is not automatically adding a whitespace, user must add a
white space before the value to be added. Current usage may break
INSANE_SKIP:${PN} vardeps flag value by adding QAPATHTEST functions
immediately without a whitespace. e.g. It will become something like
INSANE_SKIP:${PN}package_qa_check_shebang_size

Signed-off-by: Shotaro Uchida <suchida@uaudio.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 8bbe5bb19a..4ccc532282 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1207,7 +1207,7 @@ python() {
     funcs = d.getVarFlags("QAPATHTEST")
     funcs.update(d.getVarFlags("QAPKGTEST"))
     funcs.update(d.getVarFlags("QARECIPETEST"))
-    d.appendVarFlag("do_package_qa", "vardeps", " ".join(funcs.values()))
+    d.appendVarFlag("do_package_qa", "vardeps", " {}".format(" ".join(funcs.values())))
 }
 
 SSTATETASKS += "do_package_qa"
-- 
2.51.0


