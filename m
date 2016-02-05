Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEE9770EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:07:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 71so414913pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=HX/aTxDGOdMrMx17jyvi1xHXHXEA6RVpGK9WI4VNKSo=;
	b=jBrgULi1H8eNHnfqAd1kchqv8+wFsdqzJCO01twyimcytjRN+YYrRV7GVVGDH9ho9o
	l9qkaviiiKoCG9leaFHEDWM1E1Js1YNthnFIgoJC1DBqxA8Sa6IVnZPx76mU42m0gADs
	gKBv0bgn8lPXDcwDkDfm0TNBy4jgGrB4HnOvDzew4HIHbeFkC6e1G4cRZcipVbFb69Vs
	nSYilPtg45PbWNpTUttTnkkbquPVT99nOXysiCVBQcjf6UiZ+/FRQAIz4yIXQnR8HBiH
	k/JgwqBcjsFyRVKS5LPmyCxkoZW6z+iGbpPFNckAUtHAk9KhiFQO7hMcxf2wUtID2ay7
	i4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HX/aTxDGOdMrMx17jyvi1xHXHXEA6RVpGK9WI4VNKSo=;
	b=lbXqvuKumINOofT6YQzh4S5cLB3fA+Nxq1Z/b6fwsssSuu7pnB1DD7+N+I9tyFN8Fk
	uPY/50QkrKDSSqBc5Ar25y23+19LRfK/8MGud23nLP5U3eNpL/joC8o6gBPm9KXu7mfx
	jM850iUDhMTPCrAm4AKU6gGqNfJHASd/Zd6kf/LNBiNB+uJRFr9Fg3tCzYUWeAYWO8e7
	A6u/1yqCADU3NMR/oRQcNN/GR6o+pWv19j/KwwzUdoxHbdnFkRFzT3QrkUQ6d1gFvJC+
	8x2oQ/0yiXEe10IpBfS0r+qafjFnX7C0RaqomAE00bwMOileetk2lX4WIK0/lR72twvc
	ShSA==
X-Gm-Message-State: AG10YOTeHUK/YDruSm63tidgly7YWB2w8c8gxplWszUpJX2Erxj7EaaNc5aAELsss1tnfw==
X-Received: by 10.98.72.193 with SMTP id q62mr21603718pfi.117.1454692050043;
	Fri, 05 Feb 2016 09:07:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tp3sm25783064pac.16.2016.02.05.09.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:07:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 09:07:14 -0800
Message-Id: <cover.1454691935.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4][jethro] Jethro security fix pull request
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
X-List-Received-Date: Fri, 05 Feb 2016 17:07:30 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for the next next jethro-next

The following changes since commit 9cfb259d1bfe2d66801e0f15e7bb36a162f757ad:

  socat: Security fix CVE-2016-2217 (2016-02-05 06:32:56 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (4):
  nettle: Security fix CVE-2015-8803 and CVE-2015-8805
  nettle: Security fix CVE-2015-8804
  curl: Security fix CVE-2016-0754
  curl: Secuirty fix CVE-2016-0755

 meta/recipes-support/curl/curl/CVE-2016-0754.patch | 417 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2016-0755.patch | 138 +++++++
 meta/recipes-support/curl/curl_7.44.0.bb           |   4 +-
 .../nettle/nettle-3.1.1/CVE-2015-8803_8805.patch   |  71 ++++
 .../nettle/nettle-3.1.1/CVE-2015-8804.patch        | 281 ++++++++++++++
 meta/recipes-support/nettle/nettle_3.1.1.bb        |   5 +
 6 files changed, 915 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0754.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0755.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8804.patch

-- 
2.3.5


