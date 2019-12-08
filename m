Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net
	[83.102.40.154])
	by mail.openembedded.org (Postfix) with ESMTP id 82BAF7F9B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id BDD801521C;
	Sun,  8 Dec 2019 20:39:06 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id RkP3UPUMV_QH; Sun,  8 Dec 2019 20:39:06 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 475A7150DD;
	Sun,  8 Dec 2019 20:39:06 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 78A2D2C61;
	Sun,  8 Dec 2019 20:39:01 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:49 +0200
Message-Id: <20191208183557.32589-3-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 03/11] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Sun, 08 Dec 2019 18:39:06 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9dc6..1c8b2223a2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.20.1


