Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1T9JZd-0004hC-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 19:39:33 +0200
Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 10:27:08 -0700
Received: by qcad10 with SMTP id d10so279345qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 10:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=MB3WeM0eHMHRDdj1VS9aspy9wOUcNDa8RYml2hTz94s=;
	b=mu+DEUDbVUYtI3myEs0fI1VLXerbhhJbakCeWGY6gTrreqCWUdBekOZkclYgcYSW3p
	hR/gaF34tY+68/Qkk4SrcxfLRu2QE5TfJQ5Qb1KawMQrkcWVjijuDHSv57zC+sbFFCvB
	ZbVDx+87jXhk2cCMX3BPb0va2enlW+J9DTAuN77vvurCvPN2xEG4nmdlxGywZfEkgy7S
	lkXSLgZwBENXYWPnr0qbkp4WaMOkXn3dbIHoqQZztIeA5bAMSMmXZe5jcAagD9Ve6hPB
	W7/BMyyzCPFruMkysHYKa0yiLZ2pYGDGAcpCTT7gyF8fzES+7RLsNJ9Hev88NAlVAt3D
	oqnQ==
MIME-Version: 1.0
Received: by 10.224.42.82 with SMTP id r18mr46182073qae.43.1346866025518; Wed,
	05 Sep 2012 10:27:05 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Wed, 5 Sep 2012 10:27:05 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:27:05 -0700
Message-ID: <CAPhnLPC6xOrTSk_uo2unRO7JM4G7_oV1N+p1Lv84j5YKge1bpw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl0hoqJMNu6RTuu3+FQdCx7cJh1CPhBJFyt0+6tSSnXpUzsV7rnPBNH1mf3L9/UR3ooM6Ud
Subject: [PATCH 1/1] Revised: adt-installer: Add adt-installer-dev.bb
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
X-List-Received-Date: Wed, 05 Sep 2012 17:39:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

This adds an adt-installer-dev for QA and autobuilder use.
It repoints the ADTREPO url to adtrepo-dev.yp.org.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++++++++
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../installer/adt-installer_1.0.bb                 |    1 +
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb

diff --git a/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
new file mode 100644
index 0000000..7679038
--- /dev/null
+++ b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
@@ -0,0 +1,26 @@
+# Yocto ADT Installer bb file
+#
+# Copyright 2010-2011 by Intel Corp.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the
"Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# THE SOFTWARE.
+
+require recipes-devtools/installer/adt-installer_${PV}.bb
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/adt-installer:"
+ADTREPO = "http://adtrepo-dev.yoctoproject.org/${SDK_VERSION}"
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index afc69a4..171d2ac 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@

 # Your yocto distro repository, this should include IPKG based
packages and root filesystem files where the installation is based on

-YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
+YOCTOADT_REPO="ADTREPO"

 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb
b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index becdef6..4ee276f 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -68,6 +68,7 @@ fakeroot do_populate_adt () {
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
+	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
 	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
 	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
 	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-- 
1.7.9.5


-- 
Elizabeth Flanagan
Yocto Project
Build and Release


