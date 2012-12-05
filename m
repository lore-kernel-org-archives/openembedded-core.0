Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TgOm8-0001Ok-Gg
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 00:53:12 +0100
Received: from mail-da0-f69.google.com ([209.85.210.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 15:37:41 -0800
Received: by mail-da0-f69.google.com with SMTP id x4so4857984daj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 15:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lvRMPzFO2wLH6fyTgnnq7kuFDK6a/1zwSqeXvJwK/F0=;
	b=kBkD2t9ifitSDgZqy35+9gUuHiOaiPb1FBD5Pk7ifFR4NUkvestoFbKmArdcgJjFjj
	+2CRTPIipdqGwo88sbJBNA1lF52HS8M8y9ej7pJHBB7LZPVWADkn1CEgr3GR/JJ9IQS8
	CUj7fsjT7qn6clG+cGuTR9evlNgiF2BiUGj+3Tddx4c7nkwbFyacvDReH7waDNYkhUww
	YLgw3q9oJvF1nRYZI1QXFhd/+mlkOjmU8NSQZ0XVnXfAKoWt77R1F5FSmpPjqKpw3zmT
	niS+kTOVDLHvVDDO3mG6RsknT+rztawVroC/XPfrTohYxYo8+xO7a5sRC6H97vlx2xZq
	oTgw==
Received: by 10.66.84.134 with SMTP id z6mr3488033pay.1.1354750660930;
	Wed, 05 Dec 2012 15:37:40 -0800 (PST)
Received: by 10.66.84.134 with SMTP id z6mr3488027pay.1.1354750660879;
	Wed, 05 Dec 2012 15:37:40 -0800 (PST)
Received: from avartita.hsd1.or.comcast.net.
	(c-71-236-152-235.hsd1.or.comcast.net. [71.236.152.235])
	by mx.google.com with ESMTPS id uh9sm3643681pbc.5.2012.12.05.15.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 15:37:40 -0800 (PST)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 15:37:31 -0800
Message-Id: <18ff48823dac8258feb94958f9ebe3dcaab32815.1354748735.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354748735.git.elizabeth.flanagan@intel.com>
References: <cover.1354748735.git.elizabeth.flanagan@intel.com>
X-Gm-Message-State: ALoCoQnPQfDD8hS42D6Tse6w5lTj3vkJgv0qT7+MstBOIHKL0lDNhxYFf93VKFNuukNbjm2VVepMOBNKdvDUlx+Vpg8Dlq4HlUMlfA5POG6VTvikjhYmjrDScvTpOChcpGp20qfdLZv4lW095rLq5l/Tj5SBExmRYWjly+fQD6a7cDHG4Dh+rVzl8iZiuqtIZDr0uZ2q9AHX
Subject: [PATCH 1/1] license.bbclass: Including locale packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 23:53:12 -0000

As locale packages are installed on the image, we should
be including them in the package/license manifest.

This ensures that the manifests are accurate and complete.

[ YOCTO #2461 ]

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c7ca4a6..8c03c42 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -13,7 +13,7 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 license_create_manifest() {
 	mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
 	# Get list of installed packages
-	list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
+	list_installed_packages |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
 	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
 	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
 	# remove existing license.manifest file
@@ -26,11 +26,6 @@ license_create_manifest() {
 		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 
-		# exclude locale recipes
-		if [ "${pkged_pn}" = "*locale*" ]; then
-			continue
-		fi
-
 		# check to see if the package name exists in the manifest. if so, bail.
 		if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
 			continue
-- 
1.7.9.5



