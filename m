Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Soc5R-0004h5-LQ
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:10:49 +0200
Received: by qcad10 with SMTP id d10so68534qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=6n2xUMeHMSx7i6Y/MH3/lBLeu2zsxEBWLsfXxOXFeYY=;
	b=KwgRZRJbGAi7XAkXmk3z3kCXNaasm0vmmujRfhdTYocgQIzIXJBXDcQ6eu/kLNoEMS
	wfrzDW09SVXN/nhWZkbOjTGA1QDay0FEJvoVujQt2ndYsxPHI1dHlxOvhrfq3wsjyBej
	2Yz8CVRWrLRQA3k192BuboFj0pKTxATkAWo9uhxmcoR/JWHSraXlaqX6JhnY3q7szR+d
	rhKms+ke5wSAOc60WDNukc4D1ZDOY2JUv0jZm3eYg9gAIt8zegzA7wd2i3DY16nBqyvr
	xIpvISu0MTeadAFRbKmejO/NFlHTGK0qNwNCrASu/O+P1dczYrOt2Er1Q7WFGER3sdAA
	+cDw==
Received: by 10.224.59.212 with SMTP id m20mr70087492qah.35.1341932378590;
	Tue, 10 Jul 2012 07:59:38 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n2sm65763443qap.10.2012.07.10.07.59.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 07:59:38 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 17:59:21 +0300
Message-Id: <40066cc89157e59c2d2dc16cc464c427193530a6.1341932186.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
In-Reply-To: <cover.1341932186.git.andrei@gherzan.ro>
References: <cover.1341932186.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmY5zkH6CxUsC71dtazQ8H/CyMYbDKKc/Qz6bdjwgKkXYO04qyiLcaIAggZgwUtb7Zp2QR/
Subject: [PATCH 4/5] bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:10:49 -0000

This was done this way so that the current machine configuration
would remain unaffected.
The rtc MACHINE_FEATURE will specify if a real time clock is avalaible.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6a4d4ef..8904132 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,7 +724,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
-MACHINE_FEATURES_BACKFILL = ""
+MACHINE_FEATURES_BACKFILL = "rtc"
 MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
-- 
1.7.9.5



