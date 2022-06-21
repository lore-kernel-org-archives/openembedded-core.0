Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93230CCA482
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.47954.1655842606808933030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OfN55fZZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id pk21so6721291ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TA6ATqhoHJN1/t4lQEA3h5QlFKzn4rPlc8qH3HdPMd4=;
        b=OfN55fZZ19xN/6UrW5S7yyLf+jecNT3brDGmerdMmnUR91pHtyU3e0tLTzh/wXHrBH
         zWR3/lwiNmSUm/vCKnEqtEwZ6ZDwjKXHl4gjbQuV6VYCgMrqL9iDuXw27XxYZqPm7sVF
         uA3ULcL0un/rfooiRxZd+mtyI5j/VYZt8EXgQhrVcy6v4/944M0CXk27MGTY8C11FiJ0
         DK2d51UjBzUbNzgdKzI5Qt++WOtlsV0ZVD2+k0qsaw5mJIjKdVRM80/8A4OQcUjsEAfa
         pbxWZdEDN8XQdTSLlMIxfioN1of97m9m6twm0Qov0qZ75sk9dDJRBRARC7D91F8NldBg
         Lvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TA6ATqhoHJN1/t4lQEA3h5QlFKzn4rPlc8qH3HdPMd4=;
        b=g2d2Gn44sZNZoGEl4URBwd7JZGiuwAJOj2akU5v/bsDm8eWPnvFe30KHZLeerDQgJl
         74mGJI3RIxbfZOYuHZv3xE6gqLiE1aI5iWh59ubPrVcbVQhQX69f5wrZyY0VQ58/X5Pr
         +qZbqZoNY5kdZitVB/AIUucNfv/shBrd1d8QRlj6k7AD0BhIZ26K79y2kwiKeIRC3Oes
         26NWlXSD9f3SXQ/1PxhM7a4yZEx2iRXNMoV7Vi5+F0/p3Qw+yu8Xyr6EWps5Dv5QeR2l
         52sqlvkgQlaXAUKHNfVAjbeGiYvKrLrxlWJDUH5V2cX4XZHG0ej6ZZ0ueGCFfO7nE61+
         mJBA==
X-Gm-Message-State: AJIora8qPhkCf+xvt0VzBE6+Fvk7mZOSTpI4cL8XWYpLq2hVINDDvG6b
	wTVk7/FQoRqE9GFD5m8IkVHtx1+l9dr54w==
X-Google-Smtp-Source: 
 AGRyM1vZQHpDuVGJEQNgztcvrQLt4Ke3PjEtD7MImcgAR3hDHLuhiEZQH3Pz2gJgUgo7Zk/MJCR9vA==
X-Received: by 2002:a17:906:64c9:b0:722:e8ca:f929 with SMTP id
 p9-20020a17090664c900b00722e8caf929mr1988982ejn.675.1655842616813;
        Tue, 21 Jun 2022 13:16:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/18] dos2unix: upgrade 7.4.2 -> 7.4.3
Date: Tue, 21 Jun 2022 22:16:31 +0200
Message-Id: <20220621201637.1378306-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167180

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dos2unix/{dos2unix_7.4.2.bb => dos2unix_7.4.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.2.bb => dos2unix_7.4.3.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
index 509a0a0ddc..0d71c38bd1 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8a7c3499a1142df819e727253cd53a12"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9641fc4af7b564646f533f3911074b7a"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "72596f0ae21faa25a07a872d4843bc885475115d"
+SRCREV = "dae6d4bbc42d03fabb89cde65ed89f22a165d16e"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.30.2


