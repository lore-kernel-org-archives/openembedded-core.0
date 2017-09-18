Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 93A3578249
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:55:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 17 Sep 2017 21:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,411,1500966000"; d="scan'208";a="312778393"
Received: from ogmeshki-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.189])
	by fmsmga004.fm.intel.com with ESMTP; 17 Sep 2017 21:55:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:54:41 +1200
Message-Id: <cover.1505710457.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] classes/externalsrc: delete symlinks at start of do_buildclean
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
X-List-Received-Date: Mon, 18 Sep 2017 04:55:13 -0000

The following changes since commit a15ec979910a74d4490aecf30aa21fa5c2f4e99d:

  linux-yocto/4.9: bluetooth: CVE-2017-1000251 (2017-09-14 16:38:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/externalsrc-symlinks-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/externalsrc-symlinks-fix

Paul Eggleton (1):
  classes/externalsrc: delete symlinks at start of do_buildclean

 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.9.5


