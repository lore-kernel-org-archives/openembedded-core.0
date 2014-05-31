Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A2C9D6FD5A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 May 2014 04:03:19 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so2363357pab.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 21:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=57o0U0nX1zJmrwOQMFEAc229KPGQyb/SB/in233Wt9Y=;
	b=PLssUmnmcWsFkRc5o/cocLxozxlIRKJQJfDdKcAPfWhJbG30maEh2i1oAJh0FsJnhR
	gBpRzs3NAs3+qk++nx2K5D7pB46M8k6+p6vVmXpTbRtxYqbtPWMbwiXHxYmOQ97f7gI/
	IfF1BdASpVwH4Lm/kfoIBZZM0yu6igTWrULvzyDdGlx7djUqrtYtq+lRRIGyCgCeuiM0
	6e2TJAaskZu9/IsiWncDyq4T+wQS19/oFUzCMNV9WBukSB7YWCGlLlHUEHjX4t3CiPdk
	EvvgQsNssxfVFgsB6i+Ad/cBKtEYO+GYF75QmigxcytB1qfYovKjLot3V99Q+yAaO/K4
	34oA==
X-Gm-Message-State: ALoCoQm70PSdQHLGFFR16z2oucHjntO0KKpYO9GrbCdgV2MyHTN0VdC/nhU4asONFBqTVDdE9q0I
X-Received: by 10.68.164.229 with SMTP id yt5mr23994597pbb.28.1401509001140;
	Fri, 30 May 2014 21:03:21 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id og3sm8905425pbc.48.2014.05.30.21.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 May 2014 21:03:20 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 21:03:16 -0700
Message-Id: <1401508996-21323-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401508996-21323-1-git-send-email-akuster@mvista.com>
References: <1401508996-21323-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/2] Update tzdata to 2014d
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
X-List-Received-Date: Sat, 31 May 2014 04:03:27 -0000

moved build data to an inc file since it changes little.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2014c.bb => tzdata.inc} | 5 -----
 meta/recipes-extended/tzdata/tzdata_2014d.bb                 | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2014c.bb => tzdata.inc} (97%)
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014d.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014c.bb b/meta/recipes-extended/tzdata/tzdata.inc
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2014c.bb
rename to meta/recipes-extended/tzdata/tzdata.inc
index 457f145..06a6bea 100644
--- a/meta/recipes-extended/tzdata/tzdata_2014c.bb
+++ b/meta/recipes-extended/tzdata/tzdata.inc
@@ -12,11 +12,6 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "fa7f3dc1c6f6238253a6f2b850467e2e"
-SRC_URI[tzdata.sha256sum] = "aa2924e012644de3a6cc3160ffff690cb3afecf350af435daefa43bb669fb8f1"
-
 S = "${WORKDIR}"
 
 DEFAULT_TIMEZONE ?= "Universal"
diff --git a/meta/recipes-extended/tzdata/tzdata_2014d.bb b/meta/recipes-extended/tzdata/tzdata_2014d.bb
new file mode 100644
index 0000000..984c665
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014d.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
+SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
+
+require tzdata.inc
-- 
1.9.1


