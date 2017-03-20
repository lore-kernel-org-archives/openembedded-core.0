Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0F50371E50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:29:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 20 Mar 2017 16:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="69199739"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga004.jf.intel.com with ESMTP; 20 Mar 2017 16:29:51 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:33:21 -0600
Message-Id: <1490052806-12100-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, patrick.ohly@gmx.de
Subject: [PATCH 2/7] scripts/yocto-compat-layer.py: Dump log to stdout instead of stderr
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
X-List-Received-Date: Mon, 20 Mar 2017 23:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The common unix tools uses stdout as standard for log output, by default
python logging uses stderr if not stream is specified.

[YOCTO #11160]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 09dc5bf..8996fff 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -31,7 +31,7 @@ DEFAULT_OUTPUT_LOG = '%s-%s.log' % (PROGNAME,
 OUTPUT_LOG_LINK = "%s.log" % PROGNAME
 CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'compatlayer', 'cases')]
-logger = scriptutils.logger_create(PROGNAME)
+logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 def test_layer_compatibility(td, layer):
     from compatlayer.context import CompatLayerTestContext
-- 
2.1.4


