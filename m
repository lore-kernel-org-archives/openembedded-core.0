Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.37078.1598811518003192480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oIlHmRFy;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.193, mailfrom: steve@sakoman.com)
Received: by mail-il1-f193.google.com with SMTP id w3so4718809ilh.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KuYcsw61JRZXFJbCrN6Yi1poZ3LzMANnLNnMwe4k8cQ=;
        b=oIlHmRFydc10dxKtlLfYPq0dMOYJDLkeqKmbuxj7wxZpdMZEWdHUhhQEInhTSAk7YW
         lRrEfP0eoJTx+x2utb4MOVS+SSFhqE0c/ATWqsBUrUo4gcOdCxFDeYTqIbxE38P1N8H9
         zQs36eLOgDE605PFbsZiXeA8mB9L7siNbR7YzNx6FNERQJ8r3pnQBZMruk8617I1ZqH6
         Z+7folG7zhVW09aQ6ObDGbIT7Wj6Hq8ik3aXA21pjrT/h0H+KCkyGJ/ut6cs3CheQp5u
         E9c/cbqkGE2JslB1DkKv8urUX0uqFW85cKGVnjLBqAU4XSMljhEvROUH9qOi3oXCu47b
         Onqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KuYcsw61JRZXFJbCrN6Yi1poZ3LzMANnLNnMwe4k8cQ=;
        b=bNDL6EquQlkcoEXdXtM5TsSVWtobC4kcBDh1Xq4NUBQg+uuUvjzDkU7/voUTHn8OFM
         +jZhgltQwjIjt7VCKSRa3CDoy3kCyenOd+JP1dy5EENk6vkdm5MJbqVwYTz2PYjnAIz2
         AVhDWzY9F1m8RPaxMdv9hjncNAfeZgYmMY8JsI3nrWGRAG5EV12bz7WUtbBCvc0teqL9
         fZDRw+1+gUyB5OUPPbFMmMjWXO1Zul/rAKNw+yxQIOsqI6UrseGy07c3oIVUJfIMiri9
         d8kDP/BtqHxBqBH4TtgV2atYDssEhz5hXgxkaAuaqedj4LMscadapSXBHXtHIy/JP/OF
         LSOw==
X-Gm-Message-State: AOAM532u/D/0pOOqtBX47OILLtHPm6cWlau7UXCuh6min3WdxLdpo1Sh
	SuE5/lHwa4v5svXc6L0k5JVg/Nw6Ix5m9DmN8Ho=
X-Google-Smtp-Source: ABdhPJyMJXc7zvFo7lcrXCNLClOdCD/8wLlQQ3yuGzU6E8ZZrsJUmJ+p1pqwUL6rQZRmZpzQj8yR/g==
X-Received: by 2002:a05:6e02:d2:: with SMTP id r18mr1477596ilq.303.1598811517005;
        Sun, 30 Aug 2020 11:18:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/25] bind: update to 9.11.22 ESV
Date: Sun, 30 Aug 2020 08:16:07 -1000
Message-Id: <c8b64e6f4d9fd990b4dbfe44d7309bb7f149f700.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

Source: isc.org
MR: 105232, 105246, 105260
Type: Security Fix
Disposition: Backport from  https://www.isc.org/bind/
ChangeID: 655cfdf1e91c4107321e63a2012302e1cc184366
Description:

Bug fix only update

Three CVE fixes
CVE-2020-8622
CVE-2020-8623
CVE-2020-8624

For more information see: https://downloads.isc.org/isc/bind9/9.11.22/RELEASE-NOTES-bind-9.11.22.pdf

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c85f26b1bd3475699d54f18c6b5b4924bcd8eb2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.21.bb => bind_9.11.22.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.21.bb => bind_9.11.22.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.21.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.21.bb
rename to meta/recipes-connectivity/bind/bind_9.11.22.bb
index ee546a0a2c..7128bd3870 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "668158b005b3de4328fa0dbbbb3f524b66f28f024c67538aa9412a9e69c9dfbc"
+SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.17.1

