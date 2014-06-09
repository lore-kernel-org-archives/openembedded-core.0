Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EFB4765EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:18:27 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id n15so1326655wiw.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 07:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bbKK7KL3Im0lXX0ZTQ3M1V9LPtRi222VWZ80jhnckHo=;
	b=cGcVHQ0ZEOH+yPs13g7C2yFiE+bE/X60KdvzDlHRP+Q5bLfJs93ugO4H/+czV/Oa2/
	/bZ2Fvv8w5BoU1E4Vcwk3U3YQvmUp7fjUPSDyL8DlBBdCRQDHHbrEcr35mXp7hmasxJs
	sLd31NKCtMTIkajfXJKDAUf0yPWTckcWQ1m4lcB2/s1bUspCVGqvaUgBtl7++qbdpHEG
	VxQl/jtL2AnDueIKGY642mq+ca6Ma2Cu6ZTK5pGmoN3KUcnJcrGPI3TqrHbn/TTf5247
	kts2Wkl7s2nLOEn+8vhYXeDniSTHI2dd3LxwSrrvCsnOjXa57HIYvoxes+8cmnLU0f7F
	0jQA==
X-Gm-Message-State: ALoCoQml0qd49alUw6vsFNF0ex8DgJh+DC8dn0OvtPoL3/XvE3RbZBC6L9+9OwS0/3x629LVDFGh
X-Received: by 10.180.228.6 with SMTP id se6mr29156936wic.52.1402323508241;
	Mon, 09 Jun 2014 07:18:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id g9sm25200969wja.39.2014.06.09.07.18.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 07:18:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 15:18:17 +0100
Message-Id: <f292054974936b7da5ef38aa07c6be6e2b4fb615.1402323355.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
Subject: [PATCH 1/3] mesa: add build-dependency on libxml2-native
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
X-List-Received-Date: Mon, 09 Jun 2014 14:18:34 -0000

glapi/gen needs the libxml2 Python module, but this isn't listed as a build
dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a33b7b5..6503c2d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eac
 INC_PR = "r9"
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native udev"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
-- 
1.7.10.4


