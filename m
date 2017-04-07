Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA1577D45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 02:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491532701; x=1523068701; h=from:to:subject:date:message-id;
	bh=q4ZEIuq+h7z9DUz9oZ7nvUmwu7g9aYMnaXsrDDZCsSs=;
	b=jlqIluTPHlfmVwN3JL1ejlgf/ray6432SsxberjrB4FSc07ZfFrO5l4L
	A0js/m1MvugVw9L5mkNkTxFyfAkGQw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 19:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="953167683"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 19:38:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:38:12 +1200
Message-Id: <cover.1491532173.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [morty][PATCH 0/1] packagegroup-core-standalone-sdk-target: add libssp
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
X-List-Received-Date: Fri, 07 Apr 2017 02:38:20 -0000

Backport this to morty since if you want runtime support for stack-smashing
protection when building with gcc you need this library.


The following changes since commit ddf907ca95a19f54785079b4396935273b3747f6:

  Revert "file: update SRCREV for 5.28 to fix fetch fail on missing commit" (2017-03-21 22:17:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libssp-sdk-morty
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libssp-sdk-morty

Paul Eggleton (1):
  packagegroup-core-standalone-sdk-target: add libssp

 .../packagegroups/packagegroup-core-standalone-sdk-target.bb         | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.9.3


