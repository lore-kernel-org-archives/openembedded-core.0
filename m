Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TTAG1-0006Du-9K
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 12:45:21 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 04:31:43 -0700
Received: by mail-ea0-f197.google.com with SMTP id i1so143717eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 04:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pXvgCIfdhDWwQFvNoyG9jrHhSjJU5T9g/9tJWirjpTo=;
	b=QCVNaIc43Y5isVaJay5mszyYGjIh7HGxq97Oj1kj/mFf7TuXpc5sReGMPyPW3J5bwh
	XoHNDl5Uc5E0XPpXdICgxWUxdkOV4I+0hR7YJ7OSvVizmE5HDuk7yojbhVwZFels83p6
	wjBprniVbjUTLmrZG7E7xrTuQtE1xaAdXyaVjHr0dm6DovgwToAL/JXzCZFpWoxej0sa
	+F92GJ4YrYGTtwXs2FzmX3eLBFfLypuDHonnS+gTlUP3nbsLLrLJlNVWGQMWxbVPg0D4
	SOHOq3jNMVYH/h6k/dAk29Ue/lD8y/41Ozd1GLGu/rFvl+SDSKM/onfMgz3oI2XO4IzR
	VjWA==
Received: by 10.216.135.85 with SMTP id t63mr16897658wei.93.1351596701875;
	Tue, 30 Oct 2012 04:31:41 -0700 (PDT)
Received: by 10.216.135.85 with SMTP id t63mr16897655wei.93.1351596701792;
	Tue, 30 Oct 2012 04:31:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm793471wib.3.2012.10.30.04.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 04:31:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2012 11:30:26 +0000
Message-Id: <1351596626-6603-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmc05H8eTohL3ccvaqSKBwQXgYA2QQD3hzMwnuQqv/c8WbOrQvZ7FJVgLIBxjDyRD7Vk2SPVf2Pn0yUDt9Drc6Q/pHIQq8qik3jYwiLKW4fKravZwIk5uCaPMo/NxPEXRHjupgYypiIEZt7wRM28Pzd8cK/V6A3I5Nsd/hgTh+0+WfSV04shYwhXx8cFIKg46ON3z6p
Subject: [PATCH] gnomebase: depend on gnome-common-native
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
X-List-Received-Date: Tue, 30 Oct 2012 11:45:21 -0000

gnome-common is a build-only dependency so we should depend on the native
variant.  This also resolves an (incorrect) GPLv3 license issue in gnome-common
at build-time.

This will also remove the pointless gnome-common-dev RRECOMMENDS in any -dev
package that uses gnomebase.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnomebase.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 19c7f71..91c476c 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -7,7 +7,7 @@ GNOME_COMPRESS_TYPE ?= "bz2"
 SECTION ?= "x11/gnome"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
 
-DEPENDS += "gnome-common"
+DEPENDS += "gnome-common-native"
 
 FILES_${PN} += "${datadir}/application-registry  \
 	${datadir}/mime-info \
-- 
1.7.10



