Return-Path: <soeren.brinkmann@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8B31E72027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 22:59:52 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so10302828obc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 14:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=c4sUhei0BZRNbDwFyyOCEXMgVAW/sF1qqDui41Jee7w=;
	b=Dcwej1EpZUTnKtuPfv1eigmMfsSX8mDlqdLX277EY+w6wCRqPF/ZDnr6wD3efK+pbT
	x3KMlWixoSHSkFHXwuzZL3AzLWpz+kFELVI2mWVvRNLkWx/U1zAsKaAHkoKw+ZTuahsQ
	YigL9sVfBY8qM6VbFDhFeeBVgsQdJQTFNMP/2S66eMVJweE+a5MihXrt93oGMH4eWqPr
	wem44Gd99FFtPI6xgZhnh8xXpy+WwQExHTZh8NQCpjGit4gaTXVm92Y+m543Lr2k1LjX
	dfjnnIdMIvOIrcizYGbZGCakfR+smvIcKw7w9BhsSbzu+lkKFdO2DJqvcJUAwwFswdoV
	0izw==
X-Received: by 10.202.193.193 with SMTP id r184mr6882639oif.6.1420757991672;
	Thu, 08 Jan 2015 14:59:51 -0800 (PST)
Received: from localhost ([149.199.62.254]) by mx.google.com with ESMTPSA id
	d198sm3549830oih.12.2015.01.08.14.59.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 14:59:49 -0800 (PST)
Sender: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jan 2015 14:59:43 -0800
Message-Id: <1420757983-26493-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.2.1.1.gb42cc81
Subject: [PATCH] shadow: securetty: Add Xilinx Zynq SoC
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
X-List-Received-Date: Thu, 08 Jan 2015 22:59:56 -0000

Add Zynq's console devices to securetty.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 meta/recipes-extended/shadow/files/securetty | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index ecc246f7997c..2be341a216bc 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -45,6 +45,10 @@ ttyO1
 ttyO2
 ttyO3
 
+# Xilinx Zynq SoC
+ttyPS0
+ttyPS1
+
 # USB dongles
 ttyUSB0
 ttyUSB1
-- 
2.2.1.1.gb42cc81


