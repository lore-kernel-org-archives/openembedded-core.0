Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC0D71DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:20:49 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r126so140786079wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Yh3DfcltbPk0fVzhMcLRJAvQE22elLQ7ESjUGrSniM0=;
	b=06PFpv0XE+3k9pOXtrIZ2BVXgkGqIJ+OZONHA+6/A/baZ+eHRV+P4u08LOin+vjj+F
	EQFFSx9+3HQ+UtDercj9m8gRK2vmbdSFDv3HXK3PfLwP+ea6XdlnBoa+U60XSXpr08iw
	cQ0ZaEKR3AoIm4Mxnio8zoJjUxsU4KeO9ws3RveeKYTDCexz8i0xovU8yDUwLPY3fnYd
	8WdeqaTNSOFmsBycncNLtINR9LBggX/hjWY+e6mrB4Xs5xnw22h9ZVxegdg8fFwIHbOh
	uYzIl/w/3cZ8Z/xPHANWjMqbLDNNVCa2H8TdMsXwF0RAIeayx4HsrpUeu+ASpY/z9ZnM
	cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Yh3DfcltbPk0fVzhMcLRJAvQE22elLQ7ESjUGrSniM0=;
	b=pMFJxxz1DBVvqxvOgkn4ZCUXzPuTCgZm2KgxmvPteRdIQL1Ngq8bL12/V+bZQv/DuR
	KhpwIx5rSyDB1JmW5TNqrUSOBtplDqwoF7T7z/A+msltAi+2WIqfrp4+GXBN6nwoOLpD
	UG9HolEDGkyPcJu0WGSPGjHRDjcBLTB+L9nqTznNco1OW/HXl2RSps788XKDsBKaZBUT
	QVpgx7JHHKzVdD10mxptzSJ0LCn/zwbsZDwjDa3SRezoguZOm4ATFp391+faqes80hUD
	SGYQo6DVzJk7urqd6S/2NC2MpkbCEA/IOudGdj/wP0Jfrt5OMwSkh+uokd9nBgh0Fw++
	7caQ==
X-Gm-Message-State: AIkVDXI97Gy7O8bjHzmlKnRWna9yqrQ3yyb0+pnah1xG6uo9sfC1aJok8a9O4ufGoq5D31yu
X-Received: by 10.28.188.9 with SMTP id m9mr13841997wmf.79.1485188449015;
	Mon, 23 Jan 2017 08:20:49 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm15524837wra.36.2017.01.23.08.20.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 08:20:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 16:20:45 +0000
Message-Id: <1485188445-19983-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] ed: use yoctoproject mirror for SRC_URI
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
X-List-Received-Date: Mon, 23 Jan 2017 16:20:50 -0000

Upstream has removed a number of releases from the canonical download site,
including the 1.9 release we were using.

We shoud upgrade to the latest release but as new releases are only compressed
using lzip that means adding lzip-native to oe-core, so this is a suitable
short-term fix.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/ed/ed_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index f2ec42a..83c31fc 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -11,7 +11,7 @@ SECTION = "base"
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
 SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
-- 
2.8.1


