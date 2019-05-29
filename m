Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF9597E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:43 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v11so1420441pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DXnwLYtL5QVMBtn3LdIY8R4W/czPHzNCpXU404w3h1w=;
	b=GlFKvO9llk1u281qKbvhQNiPN215+LkcbqqYFr8vaDj2LUOiTkpgBwbxcGPxvkHgf2
	XUUbHRenc3fFnV3Ec79IqEXrUbHu7vN83hX882PN7E2XUY/wd/9K9Br3nf6m4EAZo6YD
	DhO+kYBTbK9Z5+Yvk5bZe8LmdnV6tb5SfGCHgbnTADo1Z7NmDIkAn50rly0DIi09IrD7
	NucSPJqmhjupCORqXaPXQU/dSq/y24n6SPud7D27SQz1khQraOgyrdfrfmWFh5Lp4Rts
	sO0u9Sh27f99PGFDPoxfxZN3T97MHIFU8Qey1cy4WBpf9PzA82Kj2pAeiQnj5LPLq8ZR
	xXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DXnwLYtL5QVMBtn3LdIY8R4W/czPHzNCpXU404w3h1w=;
	b=B9x2h3vbIJxfmiWIjMhWrfnVIwzm2xj3WBYz2wOD9oO9rWHqdCjC4IEh8PpA57KzIs
	Sxb8DdUWPO9eBIIDlcWehlIrHcWvF0tz84jCeJZ/FKWyxdwdLot5dBDjZwhGFnqwahSb
	V87uOqvUWi9/7KDA/sHoKlmBTqo/8+jctwEk8PPsX5ZskcJbcFvy4xbFGaP295ea8xsq
	1ZZY8tiAuQRFFilCWdZXFlPZv/aPa23XQJVXvyF4vYO7fNkBaGUhTzaLtlNRRBX5k2oQ
	jACD9q7k2pEbrvSUtNWnb9ckxaVvJfXEo/pCgMp+d7Vueby+eDwSb/NCn4awTzjGoCFW
	8Kfg==
X-Gm-Message-State: APjAAAXnE334gfEAy5TBRyxN6Xv9bD5W52TS1xw/FmClLpOgK+vonbDp
	AjV5Ix+DQ6hdqMGjkSmCrBjvIAjA
X-Google-Smtp-Source: APXvYqyCIFXgt6iOhmm3430tR91L0xC8t/Tt7jCXD7awK6ZYOdM8dBY++WITs96e+lSuEAuO0u5i8g==
X-Received: by 2002:a65:450b:: with SMTP id n11mr95281976pgq.174.1559137844962;
	Wed, 29 May 2019 06:50:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:33 -0700
Message-Id: <1559137838-8972-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 4/9] gnutls: update to 3.6.5
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
X-List-Received-Date: Wed, 29 May 2019 13:50:44 -0000

Bug fix only release

Full details:
https://lists.gnupg.org/pipermail/gnutls-help/2018-December/004465.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.4.bb => gnutls_3.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.4.bb => gnutls_3.6.5.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.4.bb b/meta/recipes-support/gnutls/gnutls_3.6.5.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.5.bb
index d79a39d..dfc3507 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.5.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
-SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
+SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
+SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


