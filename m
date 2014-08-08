Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 41A9F70A6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="585500867"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2014 15:06:32 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:40 -0500
Message-Id: <c1491f211598384c7c659589da2c2bd90232e0af.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 15/35] wic: Remove 3rdparty/urlgrabber
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:45 -0000

wic doesn't use it, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 -
 .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ------
 .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 --------------------
 .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 --------
 .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ------
 .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 -------
 .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 --
 7 files changed, 3688 deletions(-)
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py

Patch too large to post - see git repository.

-- 
1.8.3.1


