Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id C93576A5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:46 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so2017518oag.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=A7FSX10wCLSuBFPPsbyxs58xiEYwFQ0z8PMPArh1ZF4=;
	b=gk5ntewD5vp6iw7OnB9aaAGcfoHHZVkiRXpycss7v+/uPJuR0fdUfFB81q4O5yZtSR
	ibsK3F7fAnUXdX7Ap3/AirI7Viyj5H0ISQ2m70CIeqasxsAYs9Kg/NL1KLsvbBDcU0Dd
	FkGb214bVuIHYx26XBK01hGoSsp3xbGGr/VaSIJ59ZlG4iNJiCo5yohT29ZNPLwXcO9e
	1Udv8SEf4DwGuLP8/Iz5Qjrc7AveSRjPtR6bpJ7y+tKAAhsx9eQS6xZDbMvnG6wCtis2
	EzkyS36R90lC2nieSebtFhAMjNjCrdGHwspUrckZFEP6q8yK+BrB1SoFl76HuyTwYWAM
	rt3A==
X-Received: by 10.60.174.83 with SMTP id bq19mr9449042oec.80.1370897207479;
	Mon, 10 Jun 2013 13:46:47 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z5sm24272820obw.4.2013.06.10.13.46.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:48 -0700
Message-Id: <cover.1370896985.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] A few miscellaneous fixes from Mentor
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git misc-fixes

Christopher Larson (4):
  packagegroup-core-tools-profile: don't exclude mips
  gconf: inherit gettext
  avahi: inherit python classes, use PACKAGECONFIG
  license.bbclass: include all licenses in the manifest

 meta/classes/license.bbclass                                  |  7 +++----
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb            |  9 +++++++--
 .../packagegroups/packagegroup-core-tools-profile.bb          | 11 -----------
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                       |  2 +-
 4 files changed, 11 insertions(+), 18 deletions(-)

-- 
1.8.3


