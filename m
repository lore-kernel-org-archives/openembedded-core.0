Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B106273068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:30 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p68so104579975qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SbHdguLZt/KSjqDdKlKwdBCpOJEjzsamX4JFyWuYrCw=;
	b=nVmaagtPSCj9ZG8ob1I531HFnVzSFieL5ubgkWvzv+aObS0mynLUat5IQXb6keXCWp
	5VdXo01WwNMSv9jkufQ1nAHfV//vq30ncTMfTT1Y5nZ/gMLrChNxQaQQ6gAcJFJfoI6z
	SiVXE3GftMIyKnC6uqNRrzC8Mtue7C28b+hKLUkRS1Mb9qrsn3e5A0TSc7/xC8xXTA/9
	yPlNg6sBGhg9jIpuSD8D8idgePvXH2+nHwEVMjnZkYIgKg9PYta6fbz/PNkANlFuM1NG
	afwzIsbDw2G4XAXa4sS6zwNz9aML8nv0Wc/18sO8F/9lft2P03b1Qj3YWnpfa5uu1ZAV
	uuyQ==
X-Gm-Message-State: AN3rC/40yGi1y5ak+l3m7y+bQPAV0aULLWd/cmSYWf8IdzZeDs5iJHdo
	IbejU3+KyO56Cg==
X-Received: by 10.55.15.38 with SMTP id z38mr8274611qkg.277.1492436371881;
	Mon, 17 Apr 2017 06:39:31 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:31 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:56 -0400
Message-Id: <1492436338-32048-7-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 6/8] bluez5: do not install audio.conf
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:31 -0000

The audio.conf file has been removed, stop installing it.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c8a240f..47d8f22 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -56,9 +56,6 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
 	install -d ${D}${sysconfdir}/bluetooth/
-	if [ -f ${S}/profiles/audio/audio.conf ]; then
-	    install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-	fi
 	if [ -f ${S}/profiles/network/network.conf ]; then
 	    install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	fi
-- 
2.7.4


