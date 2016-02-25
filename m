Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 349CF6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:59:31 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so46764267wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pYE1399KN6f74vjjETe9rbWWgXnv6f7w+XqvtiWtGK4=;
	b=KInSh9WS6V+sGq/2FJllk1qEFx3Ea4QAx/c022+C5Gk3Mikqsx8EOvOKyJq+u/Krvf
	HBsTtUyM8IIWIqPALKqN+tsjNSEa+f+mRGfDSqD+FG1HHo1WCAsrv3e5Pj+Buo3jN68u
	jwVQ4ze20mJ0ncMvoPTuSc99qi9n6FeNBV95uibLtOVcsQMBj+qHHU2woq4G3wOgG9Q2
	n0IurQbiBKsCNc3Af9OueyASfaqMbSCdAq6beYDbpbPssQEe8QLvehqU40V/me/+DnWz
	LIeeIfLa1+2Hz0WFm0r2ua8WYkxO1BHCwJ3zy52TWn88n4cAjWwHN2FSroqb/jhphnyJ
	Df1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pYE1399KN6f74vjjETe9rbWWgXnv6f7w+XqvtiWtGK4=;
	b=TWAPcTk64lgrtOcNzrw+ybBhiLNS4j6Rg1zJMgNS6VaA7rvP8KdT//nGDRVigS9AVw
	IaIL7WYB3swY4V7nitZPb3bhcAu4j47k66wukhcuOGxxdiFFOutr+XZd1P0RvG9nIkiu
	TiUTaO+ejxaTMc7YA/bPsLXNN+tSyvAyZcb/ypQdnHCXOh9zCRNp25krwmWLJVAeRdzm
	kr+XOyHDJjRxdl5c136DXFhFEurkWBb9kgLwk2a8FqleiZSfu+7eHaZZX2uMmbgOES7C
	SB7zi/uGTzpQTLinf+AsOPgvcL1VJSvN/iejaWqEu7SbZknwXL3QhiEYfJI/9X4H+e7b
	U1BQ==
X-Gm-Message-State: AG10YOSJ1w71xfa5XiOkP/4PmxRGtbUXOz8TGNl7Qm7RmSd+X3sFWofLHuVlDRzFC1b9j7IM
X-Received: by 10.194.81.103 with SMTP id z7mr46045433wjx.25.1456437571458;
	Thu, 25 Feb 2016 13:59:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 74sm197111wmn.17.2016.02.25.13.59.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 13:59:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 21:59:28 +0000
Message-Id: <1456437568-391-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] rsync: enable native builds for rsync 2.6.9
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
X-List-Received-Date: Thu, 25 Feb 2016 21:59:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rsync/rsync_2.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 6854c77..d37cda7 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -26,3 +26,5 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
 
 PR = "r4"
+
+BBCLASSEXTEND = "native"
-- 
2.7.0


