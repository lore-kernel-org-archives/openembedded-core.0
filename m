Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EB1C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.63.1659106089658593206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LRntkVVk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 206so699443pgb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AG5tetnfSdbMATa2EEohWz/tLJyS8XPBOP6uGFwi+l0=;
        b=LRntkVVkAn5UR/XlZ9EtLXXN8GuPA9EustDNiwGn/26davmeEXGptP2zxczFQyabYE
         b1S183+Qs3wWzCWjHxwGoFO8f4f2vtjyOWPV0AVUEf3MLlZv0vWcKQUES0Cy2nRVbwUp
         pmRppBqEVA2PypEZmuhccI1QcpYipgwMt4JPI9pNZgzl7/P6H0lWIUFfH/Uge3uGIHSl
         qwDzmcTSeWw80qEGconcnuFV6w8+ht6k7L3ugw+3UnTAN5ParpGGXZLb3fV/aVVnbnNi
         Cy9PlKAbyxZ9FmH4AOjorUeYVw0Oq1VmI2hsRZc1S0dTuijkbMvk++Sog9wXQlYaxOhD
         s4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AG5tetnfSdbMATa2EEohWz/tLJyS8XPBOP6uGFwi+l0=;
        b=vI3kb63G2soLL7/WUIVKwGUfXFXNQs5R+SgN/9jzYYEzz8AVlS28atgDYus3ny5IZl
         4ev/V36o1Tv3Y44hpE+g0MG4HgHZGt61irvLRIuFHU+BXFyGzZMcN7R6hjrg0yabt5Q1
         bsr5+3wHoVtTJP/MNsbIC98r9TV+ViYCaaHxfo2pMKD03OAirEOXtQCGRJUfNcuBFnv3
         E9d1UKpLc/Kx3+ddfz6gOdH8K8uJs0nd6Sbzky0GIkdPkfI2IKM3m9FFsPwCEsp4lkqJ
         iV4Q13LzIiDiGjpqcb6nMKAX0NISl67GPigxDqxU5nhMv5g5CR+g32MwAmvLjAwtF7o4
         /UYg==
X-Gm-Message-State: ACgBeo00s/oauEnqdcliJGeFhg34KHyZ5iVof64jdpGnAwXIdxYvomrB
	+z9QWIDdT51lPSihfINVLRlcWOXyX1guwjah
X-Google-Smtp-Source: 
 AA6agR7CJ4DyZyQyQ0m/44WJFEGvdwvSn5KID5d20nwFQlOys4y2x9AMeUKlLr89qanc7FPYOpe3Yw==
X-Received: by 2002:a63:8a42:0:b0:41b:b583:c3ea with SMTP id
 y63-20020a638a42000000b0041bb583c3eamr93444pgd.418.1659106088585;
        Fri, 29 Jul 2022 07:48:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/29] epiphany: upgrade 42.2 -> 42.3
Date: Fri, 29 Jul 2022 04:46:36 -1000
Message-Id: 
 <492e5659220c1d1cd90810749ca9bac2356cb916.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168655

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

 * Fix crash when deleting all passwords (#1773)
 * Fix memory corruption caused by Sync failure (!1115)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34ebcfe23c065718be4e392673f6e1b489d2eb98)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../epiphany/{epiphany_42.2.bb => epiphany_42.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.2.bb => epiphany_42.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.2.bb b/meta/recipes-gnome/epiphany/epiphany_42.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.3.bb
index dc1b34ac92..f9d60ff2a9 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "92c02cf886d10d2ccff5de658e1a420eab31d20bb50e746d430e9535b485192d"
+SRC_URI[archive.sha256sum] = "7316d3c6500e825d8e57293fa58047c56727bee16cd6b6ac804ffe5d9b229560"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.25.1


