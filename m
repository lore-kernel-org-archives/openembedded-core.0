Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAK4r-0006XU-K9
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 13:56:27 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so4567706wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 04:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=WnUp1UWdoxePDXEvFcQ/3fz8BGOJGur3dM87MuajVVc=;
	b=a0LN7+jk9sgsOgycloIG2dQdc2MLLSc3fyHykd/Fy71c/cD2F3nfII5PeiGHJ9zsbS
	ErlHRuSctXj30LZrM1fdO+LO5BO/FnPMglckNX/sHheITeCUgPDbc+LINGGYAsZivj95
	XX5tgUjUuI0kUAzETVMWRqcp1QZIYuqwbGLIJ+UIxEwQz9hWVrM0F+pwZ84BzhZlZYxq
	jYi8RnsTBXg9zsllQKKXNP/DET3/UPR7Y17MstOsZwxJPA9Ljro4xcBD1kW9nBdWLejI
	tQO2w4qKTFfavz80zikjDVL1quW21hAPyFJLHChkng414yRh8aIgmZ3oJFnnNOlAGVBd
	/sIw==
X-Received: by 10.180.97.233 with SMTP id ed9mr18863026wib.32.1361882393950;
	Tue, 26 Feb 2013 04:39:53 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ay10sm20864220wib.3.2013.02.26.04.39.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 04:39:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 12:37:29 +0000
Message-Id: <1361882250-8266-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQld8zpFXtKkSiIvS94uhE2SP1XxkzW45T46eIRqvQUmXKBx+DLeKIj1Rfmca2+wWhDI88oc
Subject: [PATCH 1/2] weston: add dependency on xkeyboard-config
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
X-List-Received-Date: Tue, 26 Feb 2013 12:56:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.0.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
index 0635aa2..c7b02d4 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -51,6 +51,8 @@ do_install_append() {
 
 FILES_${PN} += "${datadir}/applications ${datadir}/icons"
 
+RDEPENDS_${PN} += "xkeyboard-config"
+
 # Add a group for weston-launch, a setuid helper
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "weston-launch"
-- 
1.7.10.4



