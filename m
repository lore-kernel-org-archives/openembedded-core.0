Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5C46023E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:28:02 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq4so3140691wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 01:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ENkbV6XQ+Lz3eAEa6uPsunmk49sugTEsoJ3qedam4KM=;
	b=Xg/sHoA4P3Yn9qZ0seNyMDNlnz9l9kPZuc7ubQ9C+tqP79bCE9PERc9kbR62mgC3Y/
	8Btb4WDRj7LK80RvrSkcistAbvpbfP8KcbznwvFpgMGsoYOJK8HscfsjJuZSnDxXjsW8
	EEJOGQvkJBu7CtzL+Op6fq6KvfmlPynG6bAQCoFWRMb8oqa6hkMIKEV5GuQ41A1a2hiz
	kGdxS4QZszFKSTiKsstNOH1oEibZzXDKssL85bDPNEHyy6GekTVfssQcpxcNRsFp0uoL
	mnK27db3cW1hQrVkDk+9LkX50f7RvGQvzgYtxQqy7PYSqydXdK9/LYvAGzQoxiFNJD1k
	XP2w==
X-Received: by 10.194.83.195 with SMTP id s3mr3073703wjy.82.1371544082618;
	Tue, 18 Jun 2013 01:28:02 -0700 (PDT)
Received: from flashheart.burtonini.com (92.40.253.155.threembb.co.uk.
	[92.40.253.155])
	by mx.google.com with ESMTPSA id f8sm484256wiv.0.2013.06.18.01.28.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 01:28:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2013 09:27:51 +0100
Message-Id: <1371544072-32169-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlf7bgPB6EgVetnVEYwkDeUEYplCvWfj2ttu8UGgVQL6+0Q+PI86veJGHr55yQRk/kGOAvZ
Subject: [PATCH 1/2] matchbox-panel: bump SRCREV for linkage fixes
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
X-List-Received-Date: Tue, 18 Jun 2013 08:28:03 -0000

Newer toolchains are stricter with linking.  Patches have been merged upstream
so bump the SRCREV to use them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 1160b87..ba2780b 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "gnome-common gtk+ startup-notification dbus dbus-glib"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
-SRCREV = "c03234512784b78a95b5aa9ca445d05836b9d51a"
+SRCREV = "26a3a67b41c50e0ae163d8fe86ccf7a0f0a671ae"
 PV = "2.0+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.10.4


