Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5845B601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199910"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:13 +1200
Message-Id: <1a45fac17947bdaab1570f2c6929a582cf90faa8.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] gobject-introspection: set SUMMARY and HOMEPAGE
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
X-List-Received-Date: Wed, 25 May 2016 03:37:51 -0000

We should at least have SUMMARY set for all recipes in OE-Core, and
there's a reasonable HOMEPAGE in this case so use it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gobject-introspection/gobject-introspection_1.46.0.bb              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 861af5f..abc1bc7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -1,4 +1,5 @@
-HOMEPAGE = "http://gnome.org"
+SUMMARY = "Middleware layer between GObject-using C libraries and language bindings"
+HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2+ & GPLv2+"
-- 
2.5.5


