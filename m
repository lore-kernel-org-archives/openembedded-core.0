Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7966F78542
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n89so15153398pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JMca1YMB96o0x1/Xf6Kbxi6q9Ux4TtGsvtm9fnaxDUk=;
	b=gtjtF6ibWs44EobZIBAXp2tc7+7zFAF5XSmwzXc8EfpPVtOp94o/Go935OACcrO0B5
	s3ICm3z4kTLZeDcL8ja0Dzw1yjG/rJQoe5F6XwliVNAxFEXWMDUpixr/6EvjkICxXE3d
	PAJ/M5O7sZ5Euk12wJ5GhZkI9GhpEipUx9D4jpEn0Cawn835XNiYgRfxZo/quA+FbnJ0
	LbyTQ5GLy8S5qnYnZGN4/DFJvo9PAqQVaBtOV1z/6kk/HECB3LvQ1/HPvJSBwtC+682I
	14N897b9XMdjJc8800cHR2cSBw/77EUql7pQB/nNUpTVjl1L/Qftla97kb/q6BgwigeY
	6p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JMca1YMB96o0x1/Xf6Kbxi6q9Ux4TtGsvtm9fnaxDUk=;
	b=EORllGVxSkkzMEk4S+qcxFyfvHOOP9Qukr2G39x2d1RhDqOJYaOzCXupw7rnxHyw/5
	yMCHhKCxz9EgY92/Xp9t4t4u+qcedJz4I9mzLd9yahHMwAyXP5/fmR0FTCnGDM8q6EmE
	AWFOJ8WFs9UlC777miUywmUgV3t0EJB1mKsJU6T56IifcXIm7eKFmrHamiQEXUTgXGQZ
	Q5I2PkNETfGonYLzpWJ2NSfzAYgPeKrgI5nGNVVx+6DexEtDIM2hvmrO49ktab8G397v
	v/NzYs2GFBLydd4yfXwP9+0FD2LcX83B2cEWyOybZFa8eII4LSgtQ6uDJRCAtsE6CoO4
	z54Q==
X-Gm-Message-State: AJaThX6o9b8M9ENT0PrIXKMEGE51ARLZWm5TZSy+JG/f9LF4ng8qBla/
	RIMSM2JtVyt9A4O9spgz8rkuDw==
X-Google-Smtp-Source: AGs4zMbcflgx4BZcvMJKc9L7bfxlZU1c9lcnY1PqrnWf7HekMHqr81PlgVOl+OVDPokMBYoyTIWF9w==
X-Received: by 10.98.6.4 with SMTP id 4mr14927789pfg.224.1510688377544;
	Tue, 14 Nov 2017 11:39:37 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:20 -0800
Message-Id: <1510688364-32667-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/6] systemd: remove musl specific control of ldconfig PACKAGECONFIG
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:36 -0000

The ldconfig PACKAGECONFIG option is controlled by the ldconfig
distro feature - which is now disabled by default when building for
musl.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 6b8745b..6946538 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -80,7 +80,6 @@ PACKAGECONFIG_remove_libc-musl = "smack"
 PACKAGECONFIG_remove_libc-musl = "resolved"
 PACKAGECONFIG_remove_libc-musl = "nss"
 PACKAGECONFIG_remove_libc-musl = "localed"
-PACKAGECONFIG_remove_libc-musl = "ldconfig"
 
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
-- 
1.9.1


