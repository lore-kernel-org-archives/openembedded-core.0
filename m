Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 19A22606F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1259; q=dns/txt; s=axis-central1;
	t=1584727399; x=1616263399;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=VpSf5vaHi3CEwQ7E/RisEWV3mWL3Y24z2HYe9sP2Bh4=;
	b=l6pS6QwNNvhIqKxjU4sGXllybK72cgDVsIQncW5VsGUMUAbCIKULNJzB
	bSQRzuTiD9EdJzUeZJdlcnLkFYNB4S2+67liN5o0tG829SGLHnd3vnaaO
	XNlz77E8aVORq8WXGAfCHGibbejrzE0goFu+cmnDm+0XQEy3xyOffXSxX
	XMZP13WKYfdbDt3S7TKTRFpRDyJ7L12u0swgVxMQI/CWBAtTum818xqYC
	A43r/Qj72TosgbZ1NfJ25rw8qdK7f/zNNsOdKN8SEj4km9M24rf//VFk/
	KyhlNLRmpjxe6UAF+DmIrKca43B37IL4E3CtZPtZG430/gzTJ0CwF89v7 A==;
IronPort-SDR: 5bv2kefMsXFEYRFKUKEYM2ji7ljcIMdtznmKCXOVTlAOF2fnH+c5HUH2HsWcKFRrp72DVadjY1
	h4dh/K6UrPBWXOoWOmCRF28xYR45KRzPD2bNOoDG/RgWzf5p4EaDOHocCfQtOIYz5ThlZ2mX7L
	JpYBisQcLefXSlabfeDdW7Z9P+0ryMzijYfTFsq7IzPIS40FTepsp2zKiME+4Hub6CHA0t1ibT
	VKMQSEFqkcXLXLa31Cm/l9xCwvYSl+eIR+zHk5Y5SU9haZcTmsjTYWI1W9i/G9mBgiHEu2HoDx
	gNY=
X-IronPort-AV: E=Sophos;i="5.72,285,1580770800"; 
   d="scan'208";a="6750189"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2020 19:03:12 +0100
Message-ID: <20200320180312.31459-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: Correct a typo
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
X-List-Received-Date: Fri, 20 Mar 2020 18:03:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also add a missing space in a warning message.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 013195df7d..48b4913a9f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -32,7 +32,7 @@
 #     directory suitable for direct use as a mirror. Duplicate sources are
 #     ignored.
 # 12) Source mirror exclusions:
-#     ARCHIVE_MIRROR_EXCLUDE is a list of prefixes to exclude from the mirror.
+#     ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the mirror.
 #     This may be used for sources which you are already publishing yourself
 #     (e.g. if the URI starts with 'https://mysite.com/' and your mirror is
 #     going to be published to the same site). It may also be used to exclude
@@ -359,7 +359,7 @@ python do_ar_mirror() {
                 break
 
         if len(ud.mirrortarballs) and not localpath:
-            bb.warn('Mirror tarballs are listed for a source but none are present.' \
+            bb.warn('Mirror tarballs are listed for a source but none are present. ' \
                     'Falling back to original download.\n' \
                     'SRC_URI = %s' % (url))
 
-- 
2.21.1


