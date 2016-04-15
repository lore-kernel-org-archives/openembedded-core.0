Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 772DA6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:08 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id u185so16836464iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZKRdtbAN0+SHoKsHKkQaB55p2TI7vBT4G1WFGFArnDU=;
	b=IbostB5TVK4pX7aTh/AJUJf3gL9OcvO4D2TpKa76mdgCQAYG3qzs5N29yu2TsgNg2n
	+Rv4dxE+rZx1tXnqWU1H+LAm++3Tpso8IfmPEu/wl8bn4ambTuDIY2wjZKMYsjp2wodk
	1ttKaBtk7e0AcDrRgnh+4qIqJyFx9zPEH/rpvr/Gi7rv+GWp5bQH+YbHJxKJUjzWFJCp
	Vbv2K12kT7Y4xCf247JmkkcVCETWbB1Q1z6KMbEbomAmrrHNHmua9AKt6twdbbor6Esy
	nvtYWTJ7GTvMuID+2C22nviT3nHJbInpy+56S053hIjrgyQs/Knxj8ESGejtxR4gT/DM
	5z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZKRdtbAN0+SHoKsHKkQaB55p2TI7vBT4G1WFGFArnDU=;
	b=kvzA5DWWVXaQk+NHNPyBa2UrIQsXEo4bjvyHVB+mMIeNhvhhYuznhZ3OvbQ2PJW1jG
	3xp3bjOn8QMv2E1n4fpetXTmCFKmY86YN3U8jXII+uTMl88b6PjzpT1C0tWFKhJVxb/z
	ss27lVuTQt/L87nlpweeHNP3AY2ZDGjdoJZYDVZcoCFBFjsp/Fv0cxjJfn3a/fShlh1u
	ehPjmum/Q4q/Ail5SxwVfyTHNgNgsRg42nFYulkNTxxoJHwm0Wxq2BsWxu8Shsq/skjr
	p0DQrx/jAtT3yfcLV5gSoWiOwbxOI1D1ku8bDvKG50xBe+U9yaaVL2gwp5KpSS6ONpWH
	oWrQ==
X-Gm-Message-State: AOPr4FWLVDKgDnlNZyDx5JXGr1s2aTcNmCc3XwQi+zpTC2/QZrmrtsC9omAGlfqfcS683Q==
X-Received: by 10.107.166.72 with SMTP id p69mr26277865ioe.100.1460764808819; 
	Fri, 15 Apr 2016 17:00:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:52 -0700
Message-Id: <1460764798-12701-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 1/7] sqlite3: update 3.11.0 -> 3.11.1
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:08 -0000

SQLite Release 3.11.1 On 2016-03-03

 - Improvements to the Makefiles and build scripts used by VisualStudio.
 - Fix an FTS5 issue in which the 'optimize' command could cause index corruption.
 - Fix a buffer overread that might occur if FTS5 is used to query a corrupt database file.
 - Increase the maximum "scope" value for the spellfix1 extension from 6 to 30.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.11.0.bb => sqlite3_3.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.11.0.bb => sqlite3_3.11.1.bb} (64%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.11.0.bb b/meta/recipes-support/sqlite/sqlite3_3.11.1.bb
similarity index 64%
rename from meta/recipes-support/sqlite/sqlite3_3.11.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.11.1.bb
index 992d20c..06f54aa 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.11.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.11.1.bb
@@ -7,5 +7,5 @@ SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://fix-disable-static-shell.patch \
 "
 
-SRC_URI[md5sum] = "a6cdc3e0a6e5087d620037ae0c48720d"
-SRC_URI[sha256sum] = "508d4dcbcf7a7181e95c717a1dc4ae3c0880b3d593be0c4b40abb6c3a0e201fb"
+SRC_URI[md5sum] = "c66b4e9d5ca6cfd15471b5b03fc44537"
+SRC_URI[sha256sum] = "533ff1d0271c2e666f01591271cef01a31648563affa0c95e80ef735077d4377"
-- 
1.9.1


