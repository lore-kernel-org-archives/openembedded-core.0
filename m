Return-Path: <matt@console-pimps.org>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0A5A6FA48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 16:10:42 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so8541713wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jun 2014 09:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x/D4mq6VJ25Mo1A5PEqlypTu/a0LAurN9Tb8EQZVGVw=;
	b=F0CoUgZUSERjsZOKBtU5Iz+RLQWNHnXhOsQiRFzaggQievWRoihWJoX3FkBMLdVM8w
	dq7LhCcJ7er6VnTeDvBystxnxITiuxbtr8EIVEdHuFtuTtp5dqAjLeWjUugwWc7GPSzD
	MctAy4/nVd/mUnecMkTRVHnwVBPOfd4XCJBKqjV6scLjoJGrN7d8yTpGKCVXrNiq3oBu
	uXfTL48KWRlr2x5p6roXQpxuKRplO36Gpx2eo5k2kstUWOdgCKxkRhTxgnDaL3W3V/of
	5ehyqvn+crw7+04wEVVHal5Jvem26x4Ds7z94tZFGFwJQsnanJ0SrdKTzsQKx+YrOGgf
	r8sw==
X-Gm-Message-State: ALoCoQnZdOEEgch41yzyDhF4kRF5zL91qNdzZnhiRITu77rNSnEtTYc5JPBj664esjMYeLp+lk+7
X-Received: by 10.180.36.35 with SMTP id n3mr6737875wij.23.1401898242512;
	Wed, 04 Jun 2014 09:10:42 -0700 (PDT)
Received: from localhost ([90.207.204.193])
	by mx.google.com with ESMTPSA id vp5sm4290729wjc.31.2014.06.04.09.10.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 09:10:41 -0700 (PDT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jun 2014 17:10:36 +0100
Message-Id: <1401898238-18043-1-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.0
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH 0/2] Add python-importlib
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
X-List-Received-Date: Wed, 04 Jun 2014 16:10:45 -0000

From: Matt Fleming <matt.fleming@intel.com>

It seems that the importlib python module isn't available to recipes
because the importlib/ directory isn't included in the
python*manifest.py files.

Create a new python-importlib package for exporting this module.

Matt Fleming (2):
  generate-manifest-2.7.py: Add importlib
  generate-manifest-3.3.py: Add importlib

 meta/recipes-devtools/python/python-2.7-manifest.inc | 13 ++++++++-----
 meta/recipes-devtools/python/python-3.3-manifest.inc | 10 +++++++---
 scripts/contrib/python/generate-manifest-2.7.py      |  3 +++
 scripts/contrib/python/generate-manifest-3.3.py      |  3 +++
 4 files changed, 21 insertions(+), 8 deletions(-)

-- 
1.9.0


