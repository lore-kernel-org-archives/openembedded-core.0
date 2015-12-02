Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1426FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 18:38:57 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so47889420pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YL8tVgAbRwonY6WPfVAMfroVUtEeQ+bHh3fhUP4IU/M=;
	b=nsBEfclnuAH63Utmog60N3gbu6rC9XvR0bh4Va3+9+98EvhxcLegH8jctlW6aJTILH
	HA9TjEPJgDz83FhjuE7car+5FU/XV7lpoT3fL8kJ2FEAfG4Irbm69PSoyxoxs42XFTyu
	MFniqz7cNmShg9ub5s7ee9P+/JwfJUJjg7MFtrgN3FINkRIeac9LUAgz+m5bf3s+iVeT
	fDQ0XrSl3syRkH3REydMu0KUTvLrZKBCew9Bqx2O3WDrk0vvaIOHYancEAMsxnnkj0y0
	XIb4yJOEdRSAUd/f01yaX1Izc4iE/own3hhBIWNFzuRS3m44AQA9STBEDPZ56JysmGac
	Llkw==
X-Received: by 10.98.9.194 with SMTP id 63mr6886789pfj.30.1449081538362;
	Wed, 02 Dec 2015 10:38:58 -0800 (PST)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id h9sm5772375pfj.69.2015.12.02.10.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 10:38:57 -0800 (PST)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:42:30 -0800
Message-Id: <0186925666f53829a8e99859721b819646716de5.1449081562.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1449081562.git.avery.brian@gmail.com>
References: <cover.1449081562.git.avery.brian@gmail.com>
Subject: [PATCH 1/1] meta/conf/toasterconf.json: remove SDKMACHINE
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
X-List-Received-Date: Wed, 02 Dec 2015 18:38:57 -0000

Signed-off-by: brian avery <avery.brian@gmail.com>
---
 meta/conf/toasterconf.json | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c8e42ef..1987793 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -4,8 +4,7 @@
         "DISTRO"       : "poky",
         "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
         "IMAGE_INSTALL_append": "",
-        "PACKAGE_CLASSES": "package_rpm",
-        "SDKMACHINE"   : "x86_64"
+        "PACKAGE_CLASSES": "package_rpm"
     },
     "layersources": [
         {
--
1.9.1

