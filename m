Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 66B6B7FC36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:09 +0000 (UTC)
IronPort-SDR: V5TtBqPu7KewYdEaN0q7ZBdaxLs+uS6uQGdHHYYQ+dx4lPL+2vs4NeG3FHpshJf6tt4dKTrQPn
	Tm9IEXBUByVz/foC7OQyEQenDpVNbgFyzewFV/WruE4Zg9viMhcUoNguFbZQG1Qph09oThiacZ
	wN9C2scBWAjNK2WaIJhze+oeGLEGDqdSi0FpMHr1zLkLzJ3rZFkOr7nIyKJfiKQPa2NaaMuCII
	Xb8xYtMh/o63BYm/nEIMJ2EL0Ukpd1LZV9eP6bKi2GOvhDoma3whsKSOY9bGkZjLzf3D6m+7Rx
	VQc=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160257"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:53 +0100
Message-Id: <20200108034455.10101-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 5/7] oe-pkgdata-browser: Avoid an extra space for dependencies without version
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 57e56f66ee..75d889271b 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -217,9 +217,9 @@ class PkgUi():
                 l = []
                 for name, version in bb.utils.explode_dep_versions2(data[field]).items():
                     if clickable:
-                        l.append("<a href='package:{0}'>{0}</a> {1}".format(name, " ".join(version)))
+                        l.append("<a href='package:{0}'>{0}</a> {1}".format(name, " ".join(version)).strip())
                     else:
-                        l.append("{0} {1}".format(name, " ".join(version)))
+                        l.append("{0} {1}".format(name, " ".join(version)).strip())
                 label.set_markup(prefix + ", ".join(l))
                 label.show()
             else:
-- 
2.21.1


