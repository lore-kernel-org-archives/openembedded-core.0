Return-Path: <brian.avery@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E405606CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489611431; x=1521147431;
	h=from:to:cc:subject:date:message-id;
	bh=C+w4sTIH453fixJ9LzWiSrd66yaQm3QTMex2c1HZLeM=;
	b=G3/d/A8aArQSaNaqL217qofmLn/OM1UuVxf379dafVl/AQTweaxU6yZ+
	IgxdKd8fDnb23IS0+s8C5v9ELCerCQ==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 13:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="67759242"
Received: from echidna.jf.intel.com ([10.54.77.142])
	by orsmga004.jf.intel.com with ESMTP; 15 Mar 2017 13:57:09 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 06:47:58 -0700
Message-Id: <cover.1489585481.git.brian.avery@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] add cmake host tool to sdk and esdk
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
X-List-Received-Date: Wed, 15 Mar 2017 20:57:11 -0000


The Eclipse plugin uses cmake from the SDK and currently has issues
because cmake is not installed as a host tool.  This patch adds cmake as
a host tool for the sdk/esdk.
This adds ~ 20M to the sdk/esdk which is not alot given the functionality.

-brian

The following changes since commit 812fabbd30a062f6e726e6ae0399d87e85bf7fa3:

  bitbake: runqueue: minor typo fix (2017-03-15 17:38:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/add-cmake-to-sdk-and-esdl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/add-cmake-to-sdk-and-esdl

brian avery (1):
  tivesdk-packagegroup-sdk-host.bb: add cmake

 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.7.4

