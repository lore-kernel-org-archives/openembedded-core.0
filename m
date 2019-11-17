Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCC77F998
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:25 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d7so7535333pls.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=poIYAa39P7/wXKlRoughyduFrSyP+9BAPrW8txRu/8o=;
	b=cRR+6wX8ppIK7tn4+RVQkhEvWc5p+ms7YLHjHmyl5qn+SrsQEhU8MkQahFdMQqplEW
	+S8SVVgXcRPgFl64DICrUvIfq3Kj5XnAJC3z+JuOAzEHgtZBrrTcujykWcgVYCGcUyiK
	MIlTuyRf6lErvBzXTgzkb1iUqMS4hKXRib+PgX0ZVNjny+BNRdKwh6oRNhkWRw2RwEXK
	HU1ToQbwMJRRpbaGus7ztJ6D49DzFQPK+9xEeBpRMDbBq9sPGmsseuRwgCSXVKQjgcej
	ZugsQMTlh/jhT/1bece7nHK5DF5OYe/uQ6KPvzv3Jl2l8CUA20JM55nQ3DJYnOXbXG9F
	PXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=poIYAa39P7/wXKlRoughyduFrSyP+9BAPrW8txRu/8o=;
	b=QLkIfJLlGlxwAZPvz0ZsQKQVYIOKx043ST+10B7PKiSM4I4aiCEw8EkNCZ633nGuC5
	ar8hpu7mMi3miuHyGso4M4PnGpuBuBumWGOPxRK7jRh1nVqzUrqh0cpVeh/1/siu4LSt
	PYpaXb6AJXAArN/JaOCscaqXPnBwvbmiR0fJfBwmj4gP0suKV18j9qKpDqqOA5yYMxUK
	axsED1Ii6ehjeuSHg4bEdqWPoVw7u8wyoDW7h0tK6zrxvXwqxzdHlDuqnVSYCSELspfb
	+EdHJxEapm3IpkPpQa4AXoKUeErDvC1SdvE13xOVS3so8Ihi+Xb5nH04GaXSwbnJoSXp
	WjXQ==
X-Gm-Message-State: APjAAAXqAflqzW4pLc8+vBzjKnMbvpJMk1aMBHpD8SSuWaZqEVuiBTw1
	siuZHBlUhYh1e41A4PxmJK6XVmlb
X-Google-Smtp-Source: APXvYqxy6Y4rHRrEG5ZNK8f6seYOWk4rYjot/T5iSlQt2mXE4FRjQfgVuHWZwxV4Y0lntjEmV6XEYQ==
X-Received: by 2002:a17:90b:94f:: with SMTP id
	dw15mr29842748pjb.13.1573961726898; 
	Sat, 16 Nov 2019 19:35:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:20 -0800
Message-Id: <1573961720-4099-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 7/7] manual/bsd-hw: remove bash tests
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:26 -0000

done as part of IncompatibleLicensePerImageTests

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index dd3504f..5c5b9b5 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -457,24 +457,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.check_bash_in_image",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "After system is up, check if bash command exists with command \"which bash\"",
-                    "expected_results": "bash command should exist in image giving something as below  \"/bin/bash\""
-                }
-            },
-            "summary": "check_bash_in_image"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.video_-_libva_check_(ogg_video_play)",
             "author": [
                 {
-- 
2.7.4


