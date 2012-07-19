Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVC-0000pw-3L
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:22:58 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:34 -0700
Received: by wibhm11 with SMTP id hm11so5006402wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=do3BxILkSPwyK38hAv9XORNK1IS1nI7uDLklsMWBIM0=;
	b=XDBNhbiN6QBhSX9IBLExl5ifPAjxH5Ya5aq05y9HJUc921bU2lsHTq+dm/qoFG6NqY
	rEFaIVIL4Se7A68WQg5ujEevij25CRoO+4evNQk2Eb/PZPDIVkkrH79f6YdOBr946F1H
	KDGEiPm3toaq6V5HEGp/f5wfBFbWMnS6cu8fc5satMtI9QnMe7rO3KYTJ0OFhYrDuVv2
	oJUDf4rqVtKYoFqSoCwvUX+DEroeBBhlUK3cOISBLyS35vY9MF590xPD7XcBPwMGtPie
	h5aWQ5ahJjuRevnvept8WshTfd5dpuGjPybZ3qL35XJ4Fzf+JbstyUFDIBa8KeAubicu
	i41A==
Received: by 10.180.80.134 with SMTP id r6mr6179219wix.1.1342714292999;
	Thu, 19 Jul 2012 09:11:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:48 +0100
Message-Id: <a8f06b12375aa5d2c00510a731712bc080f18ee2.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlt5UaUPSCt84w+zdDtnEIcrLQtqk1TvkqUbWgGNscQ2hcqLI9Qu4I7NeCxX/XWNn+La2ML
Subject: [PATCH 01/26] Add gtk-doc-stub
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 16:22:58 -0000

This is a maintained stub for gtk-doc (and gobject-introspection) that was
created by Colin Walters for his Poky-powered ostree project.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb

diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
new file mode 100644
index 0000000..195fc41
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Stub implementation of gtk-doc"
+DESCRIPTION = "Stub implementation of gtk-doc, as we don't want to build the API documentation"
+SECTION = "x11/base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PROVIDES = "gtk-doc"
+
+SRCREV = "3dfd0a09de696ec8c544762747f8a0f77153622e"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.7.10



