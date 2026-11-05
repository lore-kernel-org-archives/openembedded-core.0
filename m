Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29824.1793868241474359126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Mulsemv/;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so1232879f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868240; x=1794473040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sot/0BPJfGencxs+eKl1QxN/SxQqF5USKwNeGZqxNiM=;
        b=Mulsemv/E1XVRGw+34fLAq8pRN4j7aW9U+rNTjsCP6JXo+uNLRWGADylmTCqxeVRRh
         IPiE1izMLBZnu8GMAS2OwOuuLOB1FOtlHxfQQZer8iCcQPwVl+76A2klGliqNp5C4HUO
         8xH48f4TvoefbUvm42tFEQXScuFogzQxBD4jWPq5MlBiyI7gZBRWw6OtL7ISmbWgybNE
         eB6QWJFgmznHK0JghObS2ZkYkCwJRAlP7blMo/USaz0lGzfZL3j9+TWWOK7Q2x/5dSZ4
         MxmtF61cEPuHHQYgqbkdWwYSFj8y6P038trKPRTVqRUtGpXFg2bel/212UZRFbTYUUrB
         dr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868240; x=1794473040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sot/0BPJfGencxs+eKl1QxN/SxQqF5USKwNeGZqxNiM=;
        b=w5K+I9puh+D31kPoRAkLr57ifhXcf9cVb+r+sNBOE3J7fzpv4WB6GWxiEKpM0CYgGA
         huy6GYbKvPIjbNJLcmLr4DD7L1MQ+Aoha6pF3QzzEPexgS0Yf1JoXocszCmXAzeYUOif
         AWls7RmwzHmlyPmCc17Fz4FgsuzIS1krsG25RYjkdfMpOycn5Ms0znd+nrdRkjMnbjev
         Yg4W44VDPFuP4zoljVdhBBX2lnLcRPAPMdGG0SVbor7qhHS0zgqSRv9jRKl33BB1y/7S
         JcIWNV+bIOtoOSqMvt+fwdLRJ/GsAyD+2zR0Yw0kdL0gZ8vLI8AvDSryLiByQ83bfNRW
         jMbQ==
X-Gm-Message-State: APuU4Z8z7Nz6xRaMMkE93JoM7S4IfrYgVlx8mYeRxGWNsdDNH6y9X72a
	0d6MhbugfHNmWU0rqNyTJo1VBARYeSt6+MfYbxK1V1PZniQAkT6aDta1/nmab9QSweXvWpc4ViR
	IT3wCodk=
X-Gm-Gg: AYBFou2d2AOfR/m8OHvcc1Wy9TfsrPuRWdUZz+w8q+bm20BMe9RmFGrvRH6449N2EIY
	r+VX0ySYNc7U85gjSxcA97OvRpnxJvQ0jQMC2RkvocpDj1Z1unGVddysEvOKz8yO0gqzSRqvXLP
	9Zj2k8z+A7ZJwkBKjFVzDECa7SGPXpRVyUojhB1Xu6b3gOPWXD+n6P++voKaHCH0LcQMYqx04Qh
	gd0YYrnLxOhQ3L88MEtC9yjOu71G0F7ARKH0A+WN5RdlJTKgl2m/tFxGlg4BoNmk9h2HA4pY08B
	ALqm5wOWgpxt1me3MyvjrjI+cDtxe1ldlDrXfdzDX4VtYKZWqF8TbK0osLKl/P7SLVT+4WI/G/P
	WyvRrUyL319Mjiz0Lvarf+Hwvt1bQLeZhqtMRinBzLlDAvNmne741ipSX7ZmxBKEWY88mdWGOlY
	x9xYY47oRqP+b+o65BsWm0gZFod2MZ8QgOFir/3H9RM9oysiu4+oRnbuhshkvp2qbD+xQBxhUDU
	WPzlQcZ0/kjLJ2b3Fk+JDWc+8xZ9BBwscz7LfOOOg6VilLkztjS18pmZOhblNIiS7kuLDSnRYc1
	LjH8Wawl0MibK8C151Id2YIYKkKm+QXn2GgH/8tGSUxZtcnRGb4dN49UIdip7mZyKfLkZndz8Bl
	QYwi4vGlVnUHWzKO2cLn5zAmwrsSBg5gd3U2KtPaJmWd/rDtW0Q==
X-Received: by 2002:a05:6000:186d:b0:490:1881:80ec with SMTP id ffacd0b85a97d-49018818265mr7742176f8f.36.1793868239639;
        Thu, 05 Nov 2026 00:43:59 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 39/60] oe/reproducible: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
Date: Thu,  5 Nov 2026 09:42:58 +0100
Message-ID: <3158a0a97193cbc21272c07f3f95648920baf05c.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249498
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
via d.setVar(), so its runtime value leaks into the basehash of any
task that calls it, causing a "metadata is not deterministic" error
once SDE_FILE is populated.

Exclude it, since it is not meaningful build metadata, using the
bb.parse.vardepsexclude decorator on the function itself.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit aeaa8ba9d58d58b2f022e79abaf68a0849c66f2e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index a80376010a5..d8e1dc825fc 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -156,6 +156,9 @@ def get_source_date_epoch(d, sourcedir):
         fixed_source_date_epoch(d)       # Last resort
     )
 
+# epochfile_read() memoizes into __CACHED_SOURCE_DATE_EPOCH via d.setVar(), so
+# its runtime value must not leak into any task's hash.
+@bb.parse.vardepsexclude("__CACHED_SOURCE_DATE_EPOCH")
 def epochfile_read(epochfile, d):
     cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
     if cached and efile == epochfile:
