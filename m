Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E72C601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199859"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:08 +1200
Message-Id: <cover.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/6] Ensure SUMMARY is set
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
X-List-Received-Date: Wed, 25 May 2016 03:37:41 -0000

SUMMARY should be set in every recipe so you have a reasonable short
description to show in places such as Toaster and devtool search.


The following changes since commit d6241e4c94a0a72acfc57e96a59918c0b2146d65:

  useradd: Fix infinite build loop (2016-05-23 10:33:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/summary
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/summary

Paul Eggleton (6):
  bsd-headers: set SUMMARY instead of DESCRIPTION
  fts: set SUMMARY instead of DESCRIPTION
  signing-keys: set SUMMARY instead of DESCRIPTION
  argp-standalone: set SUMMARY instead of DESCRIPTION
  gobject-introspection: set SUMMARY and HOMEPAGE
  libjpeg-turbo: set SUMMARY

 meta/recipes-core/bsd-headers/bsd-headers.bb                           | 2 +-
 meta/recipes-core/fts/fts.bb                                           | 2 +-
 meta/recipes-core/meta/signing-keys.bb                                 | 2 +-
 .../gobject-introspection/gobject-introspection_1.46.0.bb              | 3 ++-
 meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb                   | 1 +
 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb            | 2 +-
 6 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.5.5


