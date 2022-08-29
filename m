Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12A8ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.3690.1661806987405985448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YkTmaxnN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so9858864pjg.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=RxYhLcN6kC+qIzPL3drA/49WdQzGxveX6vnc70m9laU=;
        b=YkTmaxnNqbOcL15xN8vKQtV+stdU2gXOApZqPxUtpk5J7clHp1IFHVg4ZO22Dh5BBQ
         B4FWx6wXEKnLf7s/dhkCJepxODcPgMFuMJUfbBRmvDQfhDZxjtdJHXHgsIaH4B/JQdUs
         7l6RKWYrEA3JEoCo5iHRTtHj+yAahJzIKcNW6XJVtAGA5kUeFIQp4U/gp7EDH1qu/t40
         6NJBvjtBTG1AEK3t88jBeFftAjPjt/Kl2oKdFloFdNb/GEolY3+UyECKRE5DmbIGAOI1
         mjn5RbS906E9dRxRuBoSvdCPGZcXQB7nJnyxyl+M790WniPyuKb585D+Q4yteyjWOjVA
         VHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=RxYhLcN6kC+qIzPL3drA/49WdQzGxveX6vnc70m9laU=;
        b=7t65OnAyTVpPqhiMIX8AeCEVqCyJ9cCMJqPFvgUsiAcc+6tzBtUEY+MVln4nlGvdZD
         4/Y4FteThDet28GQjEZ2F0W0EMasMPkU1HzirFubHG9VdRI8RwBtb1dEtUFvvK5cBJI4
         B7yVZXnJAp837SuPgASdzkZdB5VRWTK1UpwcXahQwm/Pbcokof67G3hy94QxX1zBBxas
         hLlo8DM8rsmqOw+zFvp5exs3U4AJQ3RuZnZIuN8/i0n1vJvDFbd1RMO5fH4rIbdmBPLS
         6glFYq5nW7nztZwdGgZHkOOqljYScUP1gxWjeRArWDYWi9B3tKSGwnry6z4gYHHgziKs
         9Txw==
X-Gm-Message-State: ACgBeo0n3YejdBeRlt29wiNvhmCVMaTlDpDIexouRXc0Dbvj0Xxc32PA
	yN+B3seNalm/n7c5qFcfr/1HS6nORbg+zcXL
X-Google-Smtp-Source: 
 AA6agR7jLvfEArM6EInAxV/1vJMhmevWWpxqShXGGYf1U3wyc7bWnHy19Vxf/2CSoXK8xNIq88hlYA==
X-Received: by 2002:a17:902:f60f:b0:172:86f6:241b with SMTP id
 n15-20020a170902f60f00b0017286f6241bmr18257056plg.162.1661806986452;
        Mon, 29 Aug 2022 14:03:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] tzdata: upgrade 2022a -> 2022b
Date: Mon, 29 Aug 2022 11:02:29 -1000
Message-Id: 
 <b0a0abbcc5e631e693b9e896bd0fc9b9432dd297.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170035

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b301d5203a4da0a0985670848126c5db762ddc86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index cdd1a2ac3c..2b956cf7c0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022a"
+PV = "2022b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
-SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
+SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
+SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
 
-- 
2.25.1


