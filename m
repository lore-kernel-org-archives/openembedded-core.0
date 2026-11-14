Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2402.1794682529437049831
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 10:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qCS/mGZk;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b271e573adso1148766b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682529; x=1795287329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H0YFKoiU0oEpeWdaIP8Kenc6wHChyHbJQCqmZQpTsc=;
        b=qCS/mGZkjBbw4Uuins+AWeK8UjtUsVRcKaAljWHih/Z1fG/7p8TKRJsB6qP+Y9FsPl
         LdDgKqXOUocW1lm0M0e5nEf/e1TFEPluJIpn9hAsxxJplaaToKlBsTg0T5QgBUkqtUnj
         dfkWvwxxRV6HPQFWEah7FKM2KksX0fqk4F9ravVqEEAmIhRvMhin/poAUf89iiu4yOzf
         UaOV+0UtljakZEosAMteGK19KUqxz/LxRzUwVA+GWno9DA+hqVIhlGI4eFCNm+om6a6L
         RRdcL7pJnZNO3RmGR/wJfbhex8abSMLbYUApJp47R4tnZXyTdJ/Vc1SEkuw32Pdb6zKW
         8kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682529; x=1795287329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H0YFKoiU0oEpeWdaIP8Kenc6wHChyHbJQCqmZQpTsc=;
        b=aBySnYXTOlW0l4CQuM4SkZTsWRsOUB2JRLHLx4jAHCarr5xDn+1GDKBczR78lCicTu
         MeY7PKtbrv/pu5UO55vWKMK1RTaZPNNMVKazKLgjRPipAPAEKenFuApkf/xXfKtDJWCj
         xlwV2nCY+wZ47/4S+TWZXYG3q8LBYoi5NTPQwCVDP71XVwJjnE4Y4CCE/h0u+vzrq4Un
         Y8VjqYy4hJFhmYT7E0V3jDbFxZE6OZkJl/p0cr7dlTwW0tdhGwM9rY51eKYgxlFyIBEw
         7vMK9vaAzbwoxfrgr3ZLZvxo6Hz4+6HBkAtdSpDcZoyrUK9Hj3jinAclyjTm14DmyjxR
         LnCQ==
X-Gm-Message-State: APuU4Z9PFJ2yOoTr5aGXPz68o4LBXuBj18SnDo2dclBgDr1rcX/ComG4
	PhXMMIMpkXoxx0jvrF//ZQLE9CaPXxhL84+5iSeiFeGs6ZbiCqVRJv8T5Pxl/55OMfU=
X-Gm-Gg: AYBFou2jNlgxZrlcctn0hgpIW6+7d4ObCKZS1pEOly8hJjytldIcplPxGpyYxjA6FyR
	BSzZS1Nig7k7jUSPhIGprmfNjbE2p6q3hDMqTy9lr5OGY8ZHBotgq9uBhusrV316pXWBOXT+wFb
	v9lyqs9m8UypoxsBkpAFmwP+QjE7/wEyGIGCu7kMJyyycd6IxPZxwiWSxv6FfsjEs717ejtPtUc
	HRDzjiPZFG1Y1DvmfW6gXZ0zXCmLjh2idbgqUBdkrTpZ7DuhKc64OsfTnTuP5cygD5jMtWsGcQI
	ebZ1XieD4cQm5LvqeiO4b3YymTjvBxADXd3+39/nG/4XKLtsTGwr/XaBfvy9QYBge7pI7IuRZvI
	k3VKShfeXQ0H6SAXV+7HNVOULaNN2Xhw2wyTtH3NCmFvni8N8Sm2r7HLiS5fZpLbzLt/9iIz+SU
	e5BDdPvwRuqzHawX0DAkhcR9kqDaV0EMBnhaoEFTGcnQ9mwBycojdcB/3lJvG6BoF9U8Es1EQmX
	r8SljFmCuIhoXad2IVbq61LGjueS4jYtvOn5mVk5rmJzROR5n++5G0Y6Xn/BVY6S8T+49StAB0Z
	WxFK0naLg1psNrr4s9Mn5s8X5oTwzBLFNw5GGpcUiqtDtJYeQH+Ye8lhPGRDgOM=
X-Received: by 2002:a05:6a00:bc8c:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8beb8dc260fmr6171881b3a.48.1794682528677;
        Sat, 14 Nov 2026 10:55:28 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bfca804fbesm1443396b3a.28.2026.11.14.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:55:28 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Etienne Cordonnier <ecordonnier@snap.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] kernel.bbclass: keep the sources when do_symlink_kernsrc reruns
Date: Sat, 14 Nov 2026 18:55:27 +0000
Message-ID: <20261114185527.6-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250206
Content-Type: text/plain; charset="utf-8"

With S outside STAGING_KERNEL_DIR, a second do_symlink_kernsrc without
do_unpack deletes the sources and leaves STAGING_KERNEL_DIR as a link
to itself:

  do_kernel_checkout: [Errno 17] File exists: '.../linux-yocto-7.2.13+git'

S is already a symlink to STAGING_KERNEL_DIR by then. Skip the move
when the two resolve to the same directory.

[YOCTO #15325]

Suggested-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 46da867a63..44223a4712 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -196,7 +196,7 @@ do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDD
 python do_symlink_kernsrc () {
     s = d.getVar("S")
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
-    if s != kernsrc:
+    if os.path.realpath(s) != os.path.realpath(kernsrc):
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
         if s[-1] == '/':
-- 
2.43.0

