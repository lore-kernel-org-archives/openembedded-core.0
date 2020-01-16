Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6171A7FA3F
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:11 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r11so10054226pgf.1
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=HIumYI3GQtSQQDINcFNI6+vYTAUQpZVBvRr8k9v+23WFBYDCK3xo+QopNIf7UqQAWw
	aGmJSdjGNJwOU/k7RXQznWdTRC+1EpDP7dioLLmriHr+cYp2xyTOozGlCVP+PIl+KT31
	KJ1RAL/EFixxDzrC2cNWmVZsUFrHpzZWMge6l1r6zYU5dI1kIqulF9Im0e+f/sWWw5lW
	zWCm3AEL0O744+19p1JIwRV/ok8eRFrUdAA8qB+0PuU5xTNyo8yRiUPcRrYKhmh04vJl
	P7lZhB6x9NapMEGm1IHDhfQCAzB26PPVupCbibk+0+JPxZ6m+ueK8NSvlEbmlfF1U2Za
	QV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=c+DDskZuG6z3AewZ9umrmTY4OFkXPK5CYLG7YkPHKE/vCKxgKbe4xfox5W3X0pE/ot
	mKOR7hdQ0bwgHDDpP/W9leeCj0c1QNbBUXIBc2GqCn3S0BwtM2VpWdS1KEu0xpLX2s2c
	faWJc9QLG1I5wCQ/GaK5xiFFudPZTgTuSpw/T4mF3ZqHOFDZsASH3VSSlDyAsAcM4fP6
	eLpqriOJ29B4CQSFPL+ndkoSX718Hte0oFRx0Wfyf3V88a++CQXiFe8Fa6gYArOBxSpU
	rsN5fDJxIv32UqsQFR47YAqnYS5vII85GAIgRkD6UwZwA8Pv06nciah238hWnRIokSRo
	8HEA==
X-Gm-Message-State: APjAAAWtrsGx+BVZKVyT7CJMISQ9b4eLMWgr0PtEbkUl/e2eqeCrkcLJ
	FnGWyI5xmk91A0YNx2beplI8r+gd
X-Google-Smtp-Source: APXvYqzXoTZy/+5VdcfPwjypCDZeFQiWM7RoFI0vS17X5aaKjZSjbvjcWwtjwTut8AV1BiQOV8exfw==
X-Received: by 2002:a62:d407:: with SMTP id a7mr37007120pfh.242.1579188072432; 
	Thu, 16 Jan 2020 07:21:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:38 -0800
Message-Id: <2e2fb4e9db2e328dcb771951feb7f7ab5c0c4dd6.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 29/32] popt: fix SRC_URI
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:11 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

rpm5.org has been down for about a year now. Use linuxfromscratch.org
as an alternative reliable source instead.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9224014da9a512b1b8837e4e7a736d465c97be3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f9bf..27e49c2ca2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.17.1


