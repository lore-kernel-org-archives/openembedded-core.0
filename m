Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29F5B71D31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 20:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490645128; x=1522181128;
	h=from:to:cc:subject:date:message-id;
	bh=0TA92V5Egto638J+hsBSWiBIqryulLrkQrqmej5Ke9Y=;
	b=PICrp+hYLekJiD02cp9I9lshcXep+ieTnCiVzSDP//l1cX/Mju+DTca1
	qZKMNIj2BRJIKneWrqdK/NJElr/B5g==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 13:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,233,1486454400"; d="scan'208";a="839020797"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2017 13:05:28 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 13:05:23 -0700
Message-Id: <cover.1490645010.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCHv2 0/1] oeqa/core/loader.py: Do not import underscore modules by default
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
X-List-Received-Date: Mon, 27 Mar 2017 20:05:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Changes in v2:
- Rebase to master.
- Fix how bug number was specified to make patchtest happy.

The following changes since commit f5187871ce03fc24cb0017cff1089a288f50a24f:

  classes: Replace "if test" file tests with POSIX file tests (2017-03-27 11:08:34 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10980
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10980

Mariano Lopez (1):
  oeqa/core/loader.py: Do not import underscore modules by default

 meta/lib/oeqa/core/loader.py | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.10.2


