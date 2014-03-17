Return-Path: <alexandru.damian@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEBC6F719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:04:06 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so4634767wes.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xlp+Oxta6Hg3wHEvIYA2CRnN/NIV2NSrrbgGbaIVnyY=;
	b=RuOxJpausRO2f8cDxvodWx/Lv2RkplgpejSm/58/RIrClZIMQzmuJ7yCyeTtzKCH54
	sLvtBkXh1z2tiJ/ZLYABbiO4nP/GcrQ55wfnWWbMfZoihN8gG+bAt3Ensy9E3/PW2TMN
	13gwY6izUqIkHSEV4i+sS4jPa1cROwSIctJpnwMp9z17lEKEqGKp7qCd/aNOCp8cTgCH
	x3AmGdfuf+UBurn5F33Q5SKFHsuPg2k1A5mGRsggORF9m16J+Vvyxggxe7dWLTdzd3zx
	smc+IttfVBoIUoXwp7+jWRiizcCFQ5NPE6z9eQQwARPks6pKZdgK8xDPHJcaqLwgzEqZ
	PdqQ==
X-Gm-Message-State: ALoCoQmeHf+++LKsdviYsVvvCI1NsXoeihZRYY+/S920+W1fAev7TNqVhXbLzE4/91CAtNe9XOnI
X-Received: by 10.194.63.103 with SMTP id f7mr6486540wjs.38.1395068646383;
	Mon, 17 Mar 2014 08:04:06 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id bi8sm25026668wib.3.2014.03.17.08.04.04
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 08:04:05 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 6834F5605A8; Mon, 17 Mar 2014 15:04:04 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 15:04:03 +0000
Message-Id: <cover.1395068545.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 0/3] toaster-related patchset
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
X-List-Received-Date: Mon, 17 Mar 2014 15:04:09 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This is a rebased patchset consisting of patches that have been 
previously submitted to the oe-core mail list separately, but not yet merged.

In order to make merging easier, I'm resubmitting as a new patchset.



The following changes since commit e8476a9d19dba7a1a6c5a558a89f2c9f89d39ae2:

  gettext: upgrade from 0.18.3.1 to 0.18.3.2 (2014-03-17 14:01:43 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib adamian/submission-17032014
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=adamian/submission-17032014

Alexandru DAMIAN (1):
  sstate: list missing files for toaster

Cristiana Voicu (1):
  toaster.bbclass: read the data needed for license manifest path

Marius Avram (1):
  buildstats: use TaskBase time for elapsed time

 meta/classes/buildstats.bbclass | 23 +++++++++++++++--------
 meta/classes/sstate.bbclass     | 11 +++++++++++
 meta/classes/toaster.bbclass    | 12 ++++++++++++
 3 files changed, 38 insertions(+), 8 deletions(-)

-- 
1.8.3.2


