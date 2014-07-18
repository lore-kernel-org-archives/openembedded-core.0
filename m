Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 094B870617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 03:45:59 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so4606986pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 20:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+O9Dej2olJIa2VYKPjOr5WfYNc0UNvTliYpgb5a0k+A=;
	b=Rdz2S08ywRZRIxV0UyI+X+fbyLQctUkfUSb0LQy0bWETD6RQzr3sPKDPcvr6eZEsOG
	YmtKq9LY/Cv6a+UJVwRWCCOFHby3vy/c3lwgzIlkRxL2mB+rfJGmqzgiwvGdZsyoOSfZ
	NBwp896GvIFImHG13TEd3iKJFtZMB9AWbhg+6ZqhzIt11rHPFokcLTaniJHwDiXBmaLg
	j8bD1HOi4wvYZfr+gIwJP0tOvJTGKDqF0Qc9U+INpBlV3NPfW4jD2AlOEOYtgFHnBq4a
	lx5/ooOx1a+ywoiekQ4tpMxWcoS+FfGj6l5lBjmMlZBpxTJq/8VTUpVX76AIDaIBCnpK
	TBqQ==
X-Gm-Message-State: ALoCoQlD4OrxtAnTISTAd2ZjTBN4Qa/5QjQgZNAXfeotCyL2SZNsuMsqOtff5/bOtUVjBe/Tu6wF
X-Received: by 10.69.12.33 with SMTP id en1mr1744761pbd.66.1405655160261;
	Thu, 17 Jul 2014 20:46:00 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id x5sm4035034pbw.26.2014.07.17.20.45.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Jul 2014 20:45:59 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 20:45:56 -0700
Message-Id: <1405655156-655-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] [v4] lz4: update to latest
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
X-List-Received-Date: Fri, 18 Jul 2014 03:46:07 -0000

update to version r119
LICENSE md5sum changed since it was updated in r117 for
  copyright date change
Fixes CVE-2014-4611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/lz4_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index 38e36d8..44160f4 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -2,10 +2,10 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
 # Upstream names releases after SVN revs
-SRCREV = "112"
+SRCREV = "119"
 PV = "r${SRCREV}"
 
 SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-- 
1.9.1


