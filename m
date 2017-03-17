Return-Path: <brian.avery@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D3F206FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489780746; x=1521316746;
	h=from:to:cc:subject:date:message-id;
	bh=0rmhH/3hkkQo2UF2N4uqWwHHl1w3bjG0Vv/6k0hIiQA=;
	b=ErwpGqXJWLyg9eVliwdikf7nR4ZH8/CUybUg6G10xO7JneQifrfl19Ye
	Y2pWEAvpHTclC30KC0E92RzwDaaa7g==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 12:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,178,1486454400"; d="scan'208";a="835971738"
Received: from echidna.jf.intel.com ([10.54.77.142])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2017 12:59:04 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 05:49:54 -0700
Message-Id: <cover.1489754655.git.brian.avery@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] gen-lockedsig-cache: catch os.link error V2
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
X-List-Received-Date: Fri, 17 Mar 2017 19:59:05 -0000

If your sstate-cache directory is on a different filesystem from the one your build is on, gen-lockedsig-cache fails which causes the esdk creation to fail. This catches the hard link failure and does a copy in those cases.

This is a V2 because I took a copy/paste shortcut when I sent in the last one and that went as well as I should have expected. This one is sent from the machine it was tested on... My bad :(.

-brian


The following changes since commit 7e0985bab68547f946163828a16beab7542fca2e:

  nativesdk-packagegroup-sdk-host.bb: add cmake (2017-03-17 16:53:06 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/gen-sigs-linkfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/gen-sigs-linkfix

brian avery (1):
  gen-lockedsig-cache: catch os.link error

 scripts/gen-lockedsig-cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--
2.7.4

