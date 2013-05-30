Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id AE40960811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:48:19 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hj6so254506wib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=QJGHwSSJMU1BPeM8MFPaLWdWyyEDIEL9JAI2cYoI8ZM=;
	b=THGNTHEQaA7kyuF7ZZLSln/y62VwkLdcvlEZwus7ODskF7bbnVFMehjeytBiAhda5B
	2MGdELU2TTeUYiXrEBU2BGQo4pBkLiUYkdblXfQXanCWrS8IkKciaSoSVidu5ouNVVc8
	wQaALq8/2hqEY1V5C1CD1LxzCoqplWEpBbdY0zHYAg+vEkpPdB61SxCklWfvQ4150G9n
	3nz0zFa1G9XI+HLBXXVeTXVVShSVxtc0fPxEzko3PFKS3Qc4M4+d1wNw1Xx/rB1r8E5B
	mjgExco8vFeOrlgbTYmtkMSCOUAUKHvaU7yyQ/vc2N9BqXcQM2Pb1if/hx209ahl0OUQ
	SIXA==
X-Received: by 10.194.83.5 with SMTP id m5mr4864640wjy.20.1369921699355;
	Thu, 30 May 2013 06:48:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm38151698wib.3.2013.05.30.06.48.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:48:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:45:02 +0100
Message-Id: <1369921502-10997-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnlUH/pdc1PxbacVtauXrHe8x7DmBeYURk9bOKhgLIZRRxGOiih3Dr8k+PLLyDVH+w1NjZG
Subject: [PATCH] cogl: add missing xrandr dependency
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
X-List-Received-Date: Thu, 30 May 2013 13:48:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3a6de28..9dc47f8 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -13,7 +13,7 @@ EDEPENDS_GL    = "virtual/libgl libdrm"
 EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS   = "libdrm virtual/egl"
 EDEPENDS_EGL   = "virtual/egl"
-EDEPENDS_X11   = "virtual/libx11 libxcomposite libxfixes libxi"
+EDEPENDS_X11   = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
 
 # Extra RDEPENDS for PACKAGECONFIG
 # This has to be explictly listed, because cogl dlopens the backends
-- 
1.7.10.4


