Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 277FD701F1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:07:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2014 09:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="582844309"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2014 09:07:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:06:57 +0100
Message-Id: <cover.1407686783.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] OpenSSL upgrade
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
X-List-Received-Date: Sun, 10 Aug 2014 16:07:08 -0000

The following change since commit 1fafe7ccc563d5ac9e41f5c1de93d2736745b512:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:21 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssl101i
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl101i

Paul Eggleton (1):
  openssl: upgrade to 1.0.1i

 .../openssl/heartbeat-test-private-api.patch       | 45 ----------------------
 .../{openssl_1.0.1h.bb => openssl_1.0.1i.bb}       |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1h.bb => openssl_1.0.1i.bb} (90%)

-- 
1.9.3


