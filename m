Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 65D056F6F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:39:16 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id z2so1906860wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ejI9Io6BN5khUYrcyXlotuuGZ/Kg7jfAG7TaIjd8xpM=;
	b=W/TU+AhS7F2ajaQC6D1ZtDeGF23YhMA7y3GepmhgpdNwsC0U6Loh898yAw6AQ+UA5p
	+SfnYWn1hI57ax7ZHb+rshKynIcVWkIyopDCfEVFZUWGN55vHnnptAD3Pal43VN+Rcu1
	qqY9CYmbQcuGnzO8KaKnRSQ260hdzWDqCCVkp21wWgqxIbH7Rim4aeq1dQFcK86uEQ6n
	wm0dmHP1+3tI5qf3/zMzllLRb7oZZyc/UhimBvGbT0Dw5J1sUNh8VbjPM50NPh+NDRZG
	15ufJ/qFYPAxvbHi7/+PHQ55O9Le+cg9C4+3EMH8w87vHfFMeHyFshBxw5rQ1jAC+tZV
	GWqQ==
X-Gm-Message-State: ALoCoQnXAzyNrKyAHBgUO+kVGntRl4dTMZquZQ8OB5Rm3ejTgsaS8QK8gzmmCXv7COZWrY4Vk8wl
X-Received: by 10.194.192.233 with SMTP id hj9mr5581883wjc.78.1396283957124;
	Mon, 31 Mar 2014 09:39:17 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id q2sm27618669wix.5.2014.03.31.09.39.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 09:39:16 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id D11285601AD; Mon, 31 Mar 2014 17:39:17 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 17:39:16 +0100
Message-Id: <cover.1396283886.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 0/2] toaster patchset pull request
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
X-List-Received-Date: Mon, 31 Mar 2014 16:39:21 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Hello,

This is a Toaster pull request. The patches have been reviewed on the 
toaster mailinglist.

Can you please pull ?

Thanks,
Alex

The following changes since commit 8210928e847fda7dbc145a94372b0beaf653a4f9:

  yocto-bsps: remove linux-yocto 3.8 bbappend (2014-03-30 23:53:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib adamian/20140331-submission
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=adamian/20140331-submission

Alexandru DAMIAN (1):
  sstate.bbclass: update missed sstate event

Cristiana Voicu (1):
  toaster.bbclass: the license.manifest is located in DEPLOY_DIR

 meta/classes/sstate.bbclass  | 12 ++++++++++--
 meta/classes/toaster.bbclass |  4 ++--
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
1.9.1


