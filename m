Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8A65B7F96B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 3so8594072pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=02HOXmS2MhJx1HPOYsK4xN+pCxiCOrlFMvRoS7F4NBo=;
	b=bnfnsAZYLSWQyiPaNKHzNFjydmXLXGZGXEDfcz/11GSVaZV5BTTzVNItoxwYhh5iFF
	gamYirj5ZKKnI4NhvlsXPuhXArD80bc00NM3ANaXkgafntj8iJZmGfb/IV1alH2YQU3f
	uACvTnp4kU0g7NtwK4JSFwUjBYV5hN7zEeG/1oZi0fN7GOr7Skt4a+Svgtm5xIANDfAU
	VA780OwnyMK7kmb+gNzrsZauuT54wCA5DRu9AKuCb2zgn/hmBVNRJz/YVYIDaizGRSw4
	ApW+uF/SnKOoSH2FMtdNCES6hi8WDwbd66nAcu0ByBkq3YrTbrSN/v8VihO2IXrnW3O+
	14DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=02HOXmS2MhJx1HPOYsK4xN+pCxiCOrlFMvRoS7F4NBo=;
	b=JzKYKnFdLHLJgSVLh+PqoJjkI5NhOED2lDNB+qF5maNY77YReFMbsKY9/6+qSA8hAP
	Zhg2hCg0W9/ISPsmPQt06ZDVY0BeXPKInaNZdfL4t041mC0IIsO65uxS68P9yXqYVB5A
	QPPJuuRBF7hSP9bcRlAehDfXGuwfBVBviUygtL+gkgdeuSN7xvIQ9QElW0ZPjqnK5Lz/
	uOfupcEJshgONeGaXpgv4q5W9HxyHyA4mTLdFRXsV01S0y/KQKmz3khTIBAT0/bOrkJf
	XZAXWTel/Cv7kYfbRSmUm7e+zBrd2ejGEsm5rx8/loF5dE0yMGeYwZhfs2NDgvEkIzDc
	rq2w==
X-Gm-Message-State: APjAAAX+HeatD9NZPxLlUkim4yEoTIVbL7KqRkE7vs/hGQKR45XQlRc4
	36vN3WDs6L7IDk1w4lL++jbsTaSX
X-Google-Smtp-Source: APXvYqzZV1TZQKw5hPb7pHUsl/WQmOR90zaM3EckKcvgtidB8g9uvFDYw3E5BYHc4/kfeCINVMOFDQ==
X-Received: by 2002:a62:e914:: with SMTP id j20mr27340321pfh.245.1573961724530;
	Sat, 16 Nov 2019 19:35:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:17 -0800
Message-Id: <1573961720-4099-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/7] oeqa/manual/bsp-hw: remove reboot test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2019 03:35:23 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 2ab7dda..9421c50 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -147,28 +147,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.reboot_system",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "launch terminal and run \"reboot\"",
-                    "expected_results": "System can reboot successfully . "
-                }
-            },
-            "summary": "reboot_system"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.switch_among_multi_applications_and_desktop",
             "author": [
                 {
-- 
2.7.4


