Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42A8C001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:28:13 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.7326.1686734887489540118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EWcGaITP;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso11028225a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734886; x=1689326886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ+zLEUPr3gRFjLWC9j4k5FcRDQVYmaakvlLW7M/tpg=;
        b=EWcGaITPyfYgtckiBwMQXP6ONTD6R/Ztp5NDDU0lRzE3RPJxY79k+2bi325I2RRdCK
         WMDNkYhwajFrX2nV5QY1wISnYykiyblzIlWUOeJUYtZeY/x9KaDfPmk0wQdOhW9PQlH6
         ZhSAhqGgHG8lyVZ5a+A7QzI0nkgyLZK17FDGNSoTsa/xDQZqdK2JDnp4U5eVvn9LXCGA
         mb6nf+zxaCTla2a3OZfSfZ6dS3W/AvwgeUZ5bWsQSUj622givvqKi9rA80wbnQqMCfTC
         7s2kt1x/X7NT8tQu4oUQEvirYHeZiopJmVJK5ifHVjFksiGCs5WkHq0U3HgLqCMXKhvW
         8A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734886; x=1689326886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ+zLEUPr3gRFjLWC9j4k5FcRDQVYmaakvlLW7M/tpg=;
        b=dN5YAneldt13ipAj+UfYAoBPu+PnleAfAXGgxN1U5H04fTSOddNDOHz0i9KhGbFUsj
         pS/p5JnZLu81owRau3H9FMdlPhHTeSd2t61r7OtbE77pq+2tjBJxRqtQDJ+ax43nTwbU
         e7NIBe9KQ0RrtaOJjuVPbmbn0kDCTDbma7SFl3P8TSpuSvWbXSaLBj+eOx9O4HkVvJTK
         X0/gJqZ4T7HWJMmNMMsaoJZo8yvzktDyjFVsJvy1s1qmUVn2rirKQ3JlhxMgwkSsHX0v
         i1LRn45u0pJjnDapFOfsUrliFkOBU3DV57vw8njVay/B78KdoOhMgUrApxvW9yUnS1cp
         NYqQ==
X-Gm-Message-State: AC+VfDxGdytplrBinDR50aHpYimL2/qDAVLqL0vlAuKTNB0tEkeEDac7
	kxexajzSjPZv/sdbLpX35kYxqZpo6Og=
X-Google-Smtp-Source: ACHHUZ4Ie/xsg7zgHn8pLBzO5VimNt3p/1qO5Hamu4zfVzFuWF6JSeS9Zq37yoYfV7FJf37g+EKBkA==
X-Received: by 2002:a17:907:6e10:b0:974:5ce6:f9ff with SMTP id sd16-20020a1709076e1000b009745ce6f9ffmr16526593ejc.32.1686734885882;
        Wed, 14 Jun 2023 02:28:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906148900b0094edfbd475csm7765252ejc.127.2023.06.14.02.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:28:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] maintainers.inc: unassign Chase Qi from libc-test
Date: Wed, 14 Jun 2023 11:27:58 +0200
Message-Id: <20230614092800.4065279-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092800.4065279-1-alex@linutronix.de>
References: <20230614092800.4065279-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182743

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index dd0c6faca88..f4f38331f7c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -311,7 +311,7 @@ RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.co
 RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libatomic-ops = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-libc-test = "Chase Qi <chase.qi@linaro.org>"
+RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.30.2


