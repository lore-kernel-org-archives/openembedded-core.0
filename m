Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Mar 2019 02:09:17 UTC
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 300397C77E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 02:09:16 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 9BA311C0028;
	Wed,  6 Mar 2019 14:59:26 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 14:59:21 +1300
Message-Id: <20190306015921.24809-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libpam: libpamc is licensed under its own BSD-style licence
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
X-List-Received-Date: Wed, 06 Mar 2019 02:09:27 -0000

Or alternatively GPL, the same as the top-level Linux-PAM COPYING.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 5c45460c3a..c124e3bb02 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
 # libpam-runtime-1.0.1 is GPLv2+), by openembedded
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
+                    file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
+                    "
 
 SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
-- 
2.17.1


