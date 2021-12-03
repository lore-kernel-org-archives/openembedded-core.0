Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF189C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.15311.1638555709284929467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OCndUu0n;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b13so2687953plg.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qVWmR54C7+sQJ+xwz2b5h6Javq1YAnnVJT5IEE+qR0I=;
        b=OCndUu0np+QztaSHYo/Hdp+fx8kc8MQX92oGOEFXawhpBYph2GCLqiVJUnMMdMNcmS
         BNvP2MvPqLOkCIeb+psG9wVOk+FJFV1NqtzHp7xlvmza16kr+YayC1N01DVEHXdMWmGw
         ecxf3JuEVow2HHX891FkHp2D4CbIsutqfKm476EvIdwnsKZlB7jecXb+Vx7aZS32voTr
         JUwKHJzrlb1znYENkZ17vdg47kLpNHpV/lb+rq55aIlXFMDyl6D1T+tekpDeiyfGkqvJ
         rgIcixDGQ1UMLuW+VkYOyWJLZ+v7TDGrHDgH0UKW6kwRpZUVFv/c8wUMmgsjpOagCSMZ
         MaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qVWmR54C7+sQJ+xwz2b5h6Javq1YAnnVJT5IEE+qR0I=;
        b=KCMNbO8LJgAKCIlXZqPHfhe94KipvzIAgz4dKDLKaXDyfizQqfQOpN3vTgq9S9sh8H
         0KinaZGWsz1l8rT96K35x/nXUDzlEOTontOxb2SvHKHr4aYjQnpdkeY74e9WEPXjtQxf
         I7ikJxkkWjIgyfN6YXKU2cXu6Pe/pknbylH/VIAY/xdrjO47WfD1aHfhgsPDLNICvts5
         JybUog1F2bPtMJXSjntw89j1k6N9jS+FhW9Zce1DMHim/Jm/0Wr09DAfWxx/6Krr8vmL
         7RaUqzGg5rKuA69Er20+GuWaEatHMNAMSoWYLjqdBJwMy32OSeu4VzoE/cE+ObpdXTdY
         mlWA==
X-Gm-Message-State: AOAM533QTsdA1FB0e7VUEJF8BjF0XyvdmzgJkQKAiyLxIC0LBnmHWNsv
	lC5dL1+wAfdv4brhY/dFXXrz1Pk6GJ6kRmGL6XM=
X-Google-Smtp-Source: 
 ABdhPJysBW96m6qwMYzlhmpzEz/7oOaKTsq9+6Iq0mbHNdy7VquMGvjsdcmIY4BoiGapHIbd2CwYqg==
X-Received: by 2002:a17:90b:1d03:: with SMTP id
 on3mr2474268pjb.68.1638555708260;
        Fri, 03 Dec 2021 10:21:48 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/18] bind: update to 9.11.35
Date: Fri,  3 Dec 2021 08:18:57 -1000
Message-Id: 
 <00ff122ef6dba8beda273152976884dd60128a6a.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159137

Notes for BIND 9.11.35

Security Fixes

named failed to check the opcode of responses when performing zone refreshes,
stub zone updates, and UPDATE forwarding. This could lead to an assertion
failure under certain conditions and has been addressed by rejecting responses
whose opcode does not match the expected value. [GL #2762]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.34.bb => bind_9.11.35.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.34.bb => bind_9.11.35.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.34.bb b/meta/recipes-connectivity/bind/bind_9.11.35.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.34.bb
rename to meta/recipes-connectivity/bind/bind_9.11.35.bb
index dbb2f83876..4652529623 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.34.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.35.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "aa031775a73d30d951451034c84c4a716a10e6625acc4eb4bb878ed4c61b7271"
+SRC_URI[sha256sum] = "1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


