Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 08C5E608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:08 +0000 (UTC)
Received: by wibt6 with SMTP id t6so76530112wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d1nfYbvkpNnJ20qS9Y7+wlSV9DuRRBEyjPP6O7NGu3k=;
	b=MwIcd/MFpGR+nJHiI4NAJ9YX3u0pablX5t87Ix9e6tSuev5DjHm90Iu8MCy+IdANJX
	6WaGsDO9IUIYKkMWndVE7YxZk6vRgq+Xlr+EiaVmvE7TkI0dE5RS0aMxvm7IW0AEMKug
	gpL+KQUQAdTggILHsQyMom7w0eY7Jmk/7WHGftcb3S32/TbEnsuM8wBRH1zIAPIrVWij
	f+vB2UQmI+7eNhapahmMo/6tlQAvGoCMsLCQ6vqFg3qP/HSfmyRZ65m8vWFwV23NlAP3
	zISokuBP3OEWRrla9e2JdzFRhUte7OETHt0nw/jbWB45m3xEwISGNFHf5bssw5sPSW4U
	aaqQ==
X-Gm-Message-State: ALoCoQmAwKLbYdaaOxBFV9ynDIGPeVUqX8Wl37zttolwxLCM5YC3xz9bPU2ZGD/QqaQF7lmDIIVZ
X-Received: by 10.180.219.42 with SMTP id pl10mr23909589wic.70.1431967809718; 
	Mon, 18 May 2015 09:50:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:31 +0100
Message-Id: <1431967531-25163-13-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 13/13] libxx86vm: upgrade to 1.1.4
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
X-List-Received-Date: Mon, 18 May 2015 16:50:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxxf86vm_1.1.3.bb => libxxf86vm_1.1.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.3.bb => libxxf86vm_1.1.4.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
index e276a76..35f87d2 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
@@ -16,5 +16,5 @@ PE = "1"
 
 XORG_PN = "libXxf86vm"
 
-SRC_URI[md5sum] = "e46f6ee4f4567349a3189044fe1bb712"
-SRC_URI[sha256sum] = "da5e86c32ee2069b9e6d820e4c2e4242d4877cb155a2b2fbf2675a1480ec37b8"
+SRC_URI[md5sum] = "298b8fff82df17304dfdb5fe4066fe3a"
+SRC_URI[sha256sum] = "afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57"
-- 
2.1.4


