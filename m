Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 932B877CE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:59:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a23so8879300pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 19:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rdAhmsePgsWqCCCPLqjFGAA/jUjtAuS0CSoDmFRUb4s=;
	b=vO/tQmLGLgOc2pf/7KIqL0m6ccH3CoQ9jJXSLpH+Ay5vG9idYjehc9owrvsfLK1/fr
	FIr30S/3nLy0BGJdMrXuqOjriUmbiWQIK5RdTptRROBqYv+kSGAwaOFYpMvH7kBrU2Ga
	7U+vP29YQch4wkjuIy/8DJZvfmQllnL3MavQG9OLVe8yR5+Uie4SrM/NZGXlPoa8ULQU
	r54uSFwBAWFAnMS20BC9bC55S1IRJ5lXqxnDQfIvu41gIfAw6/cubsXIlMiRY4yQ+ocA
	goECsoph60i67FaTdZ8t9N2UT+3upToABoWmpF8xtSmI3aZwjzZTnnf7AawsENAarCnI
	sFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rdAhmsePgsWqCCCPLqjFGAA/jUjtAuS0CSoDmFRUb4s=;
	b=tVT8YBj0bNnxu7Ulzue9dAmuQCWXEWdJu9UWDSMz4/QMSz0O6etaolMYt+SFTOWyfb
	Y/B7W1VtxdXm0iR9CLpwC5ogAvKDaO1W3BYZC4f2td1R7z9r+rMzNUAsfbB/j/7t1CBt
	wvuB7j5E5DCiT9Zu52pix8ivM6et2INThkl9qMHuEQsNIIrA42M/SVJlW1+OVibT8qZC
	7lMf5kqmKzsoWjRJdHOgs0ce+dKuCiJ7uYRvaYfSlxaj/5RnCiHQO91ONq5iJOPmn126
	Cd5S6ED3PGZqsIW/d+x2vuLRmKlP+/trMgAQOOE2GyJ34wF6kKQvG2CGJjiiKpbI0Ysb
	VjlA==
X-Gm-Message-State: AODbwcBMxWpdrn40/FBHLft0CvR2fqSb172On+IIQaidB1LegGEYyqpR
	rgbK5GtiWyY+lA==
X-Received: by 10.99.9.130 with SMTP id 124mr7643287pgj.22.1494644389749;
	Fri, 12 May 2017 19:59:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id q4sm4541134pgf.9.2017.05.12.19.59.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 19:59:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 19:59:30 -0700
Message-Id: <20170513025932.26254-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170513025932.26254-1-raj.khem@gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
Subject: [PATCH 5/7] vala: Upgrade to 0.36.3 release
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
X-List-Received-Date: Sat, 13 May 2017 02:59:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.34.4.bb => vala_0.36.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.34.4.bb => vala_0.36.3.bb} (55%)

diff --git a/meta/recipes-devtools/vala/vala_0.34.4.bb b/meta/recipes-devtools/vala/vala_0.36.3.bb
similarity index 55%
rename from meta/recipes-devtools/vala/vala_0.34.4.bb
rename to meta/recipes-devtools/vala/vala_0.36.3.bb
index d1b49aea7d..7f54f2beb9 100644
--- a/meta/recipes-devtools/vala/vala_0.34.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.36.3.bb
@@ -3,6 +3,5 @@ require ${BPN}.inc
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
-
-SRC_URI[md5sum] = "a856989d749fc5e472a3592b96f9ca48"
-SRC_URI[sha256sum] = "6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83"
+SRC_URI[md5sum] = "ff093f46e1d2e0b179543ec43cf27d76"
+SRC_URI[sha256sum] = "ac8a4ecd01f62d0c5f62ba50b7290d8c5a1edb308eec772a65b8e79be68f061c"
-- 
2.13.0


