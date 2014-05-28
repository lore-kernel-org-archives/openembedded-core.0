Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f174.google.com (unknown [74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE436FAA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 15:26:30 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so11357147wev.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q83r07D1sBL/sCtgNzTdCSMbSDRvZOewyyXZmCA2s4c=;
	b=D1dhnFZswJhL7H1d6Z3Npa1ppv+nhdw5VTe3zavU7DTsrb2blZACaAR/zsb1S12kSE
	Ds37V2eo5A9IUyr9atVtqjWWkrK3tsUq73u3YrTUlEcuiIM2hAuhAZ3Pf+SkqoP2jeyS
	3dA5oahVDUxu/uuf+3/i5NkeMIdm2x5xK2UdnyTOtIkwJlSRyk8PQzhnzfou/pzG9+JY
	JAlJ+gwKag8GcQ2eWCJ+FOUrQtXCzuWJ3gz0pa18hSP6WLK2XnSMIdl2xw115AkIsy/P
	Mtugp2Zvf4dmfTE1eshbETdGWGwRtAQIAzaqfkTwiXcR5UiwlZfKyV3O5KlV+tKeGg53
	ontA==
X-Received: by 10.194.87.200 with SMTP id ba8mr473086wjb.28.1401290403855;
	Wed, 28 May 2014 08:20:03 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	r15sm17617729wiw.17.2014.05.28.08.20.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 08:20:03 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 15:19:49 +0000
Message-Id: <1401290390-5959-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
References: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 1/2] opkg-utils: Update SRCREV
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
X-List-Received-Date: Wed, 28 May 2014 15:26:32 -0000

Recent changes in opkg-utils allow package files to be stored in a different
directory to the package index if desired.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 54cfe54..2d16660 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "c33b217016ee911718b10c9d57f9912935baf5a9"
+SRCREV = "d14458499af7dd41d8e424946c164961421b0ddb"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
1.9.3


