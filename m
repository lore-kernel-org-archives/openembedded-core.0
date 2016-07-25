Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BCE51606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:22:16 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o80so172999815wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iyi+tGek0siMUG+f6O8dq2/ddLkcO2dSBIgUHZAS8ek=;
	b=pPTbbJ0XCNWOYpIfr/VrMEFs7WzmpIJv6CE0TNuPrGKWi5Cmkomp+tmScifxS73T9D
	DomtYq5WC7VAsq8rUVdRvEnXu65q6vTMLwXGKbGQTzwThVXWUxqrVwiDyHflHZoflTQd
	zZUyYEm/tw9n8mILoEA3DULTyu4X+Ea0pG2DLxECTT+neR89qxVGW8D7gzj66olNBxhW
	PF3hETfVJTrfCTyywew23GJHIg6G6k7HBE+0Odh91Hy5yHv1RH043Yh01eB0nyjobLSm
	crlY1I2WVPkC0dmL3JHkHGiWJtVotUHbzBH06W76v1UyEp2H2eozjXtk8KxWP3G6UsZ4
	Irmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iyi+tGek0siMUG+f6O8dq2/ddLkcO2dSBIgUHZAS8ek=;
	b=DAHpq60zc55SzBnRS9/BiCpxrNtgFBrrx6i0el2HcSU4JgFPDHA9kDMgWYr0WoncTj
	GYHxKFzlooSWEZCAIzlClfW2tAlmKj3rtx3w5tqp66TQ7G535DnRyzskwqf7P3g5DRID
	xO8jIdbDIl7KTPWNOz7Ux+QADcbh0HgteCDvweOmGt+y2N2jPnlCNOJAs2DHOh8/Xjiy
	Xg/EtkDwjL75eSP4RAvDsPdpGPllFBTrHSTty4x+MQLK4bUlM4wF8bzSh0zEWQHXqccB
	H81zqbQmSazwSbH7tsPI89io+W78VHEinUgTaoga4DPVJ5VOwCljPfcHUP5xlT/FFb5r
	y+1Q==
X-Gm-Message-State: ALyK8tK9O289+6S+4iia9gQwTqT/mmiINfq3+nPcAuVHAEJ8Xc1ij2b6fK8rR2QlKlvJIlP5
X-Received: by 10.28.186.138 with SMTP id k132mr40102466wmf.65.1469478136040; 
	Mon, 25 Jul 2016 13:22:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k186sm26674089wmd.13.2016.07.25.13.22.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jul 2016 13:22:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 21:22:12 +0100
Message-Id: <1469478132-12585-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] layer.conf: bump version for uclibc removal and LSB update
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
X-List-Received-Date: Mon, 25 Jul 2016 20:22:17 -0000

As of oe-core layer version 9, uclibc has been removed and LSB approximates
version 5 (which means that Qt 3 isn't required for LSB conformance).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 81dd4be..b6d5f1c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "8"
+LAYERVERSION_core = "9"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.8.1


