Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1F51F61013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 14:13:22 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q59so7796662wes.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 07:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6BE4CVjUZ+bw0MhlD8U/hzlmQBX3+8niJCVgcOwbkDs=;
	b=i5GdBZ1/cpcvUlcKtiRylvnQlPRm7qrivb7KGTpSGPcbcieDSuYMC9/y6P0qyx3F44
	34MdEabR2I53qpVHGmeUvhFGF2v7GRVNCKI43D4aLUM1w45IPczcW/bfpc7bYjskFkfR
	+RWT4+Ehf3CoM2DFJrGKSltHAOslP5mIcn8A4vY2qhgJsiU2/S6kqP5nOY1m8v2OvaUF
	Z3mxEwAKvc+GZkvmx3auX6dJT68z17VA7STWIQ2TPUhNiXfFUV6ptTaC24cN5nJyq5Zj
	i0YGmUzTK0I931Pth6qAiX/qTcxtT+O1sIvzfhwMM97vxZsceehwm/pNAJV86t0Ysm7c
	z/Ow==
X-Gm-Message-State: ALoCoQnDZIUuDsnCgXyIebDb1Ggm9VBXWL2Z17KRoUhh08xvuPbrPdFl27DRJHNN22llVomPXY7A
X-Received: by 10.194.173.163 with SMTP id bl3mr1726513wjc.10.1379600003993;
	Thu, 19 Sep 2013 07:13:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ev4sm12327844wib.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 07:13:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 15:13:20 +0100
Message-Id: <1379600000-31415-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oprofileui-server: use two digit initscript sequene
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
X-List-Received-Date: Thu, 19 Sep 2013 14:13:24 -0000

initscript sequence numbers are 00-99, so using 999 resulted in systemd warning
that it couldn't find "9oprofileui-server".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/oprofile/oprofileui-server_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index 70a1fbf..dbb5599 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -26,7 +26,7 @@ do_install_append() {
 inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "oprofileui-server"
-INITSCRIPT_PARAMS = "start 999 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
 SYSTEMD_SERVICE_${PN} = "oprofileui-server.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.10.4


