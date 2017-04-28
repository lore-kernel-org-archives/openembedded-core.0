Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id C135177E51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 18:38:22 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 76EFDAD01851; Fri, 28 Apr 2017 20:38:22 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 20:38:22 +0200
Message-Id: <1493404702-17520-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493404702-17520-1-git-send-email-obi@opendreambox.org>
References: <1493404702-17520-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] package_deb.bbclass: Avoid writing empty custom fields
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
X-List-Received-Date: Fri, 28 Apr 2017 18:38:23 -0000

Avoids parser errors if PACKAGE_ADD_METADATA_DEB is set to an
empty value.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/package_deb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 3cd5efa..eacabcd 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -187,7 +187,7 @@ python do_package_deb () {
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("deb", localdata)
-        if custom_fields_chunk is not None:
+        if custom_fields_chunk:
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
 
-- 
2.7.4


