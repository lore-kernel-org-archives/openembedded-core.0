Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Le-0007ds-06
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:34 +0200
Received: by weyr6 with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=DGZGrcg+KvtUAzzc9wiofG3mAlQvGI6AOPxTke/pxIw=;
	b=IIflBWJHWiWf+PJZfafmuYtTlqhUg2oCPXLYWV1B3eMZwlzevjEY21Y4USFkEBb+zi
	mA+GVkaf78B0+e6ce9HloJiLtrmpgxmIdqjh4XAORii+4ycLyX9gLjlr9cN0Y2X+AcNa
	scJj9J4nwfShYYnf9j6k2bEjVbcJPWOg27aKLq7aqU/bNrHbdQngTCYYgtQyzahxkVGy
	rnpSiRISGPDeIIoKF3+sAoMqzCMVFON4d5ZZrg7g4zsqa6W2tYdMo6I1iGEC8Je9xxvt
	YYQROBi1Ss5lGXiqmq60JKoP1WRwwE+8q4RJclGs8RN3OMBEYMjr12UEHex96GuxVwQn
	F1bA==
Received: by 10.180.100.131 with SMTP id ey3mr11465410wib.15.1344182090779;
	Sun, 05 Aug 2012 08:54:50 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:50 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:51 +0200
Message-Id: <1344182057-15981-5-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnttkTRp/RIxeQIh/V/N1/dAIVFv4CT5p4fCVequMDPGzo8wQZtLhZGeHiUwBI0h/o/ukN1
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/30] sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 16:06:34 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/sudo/sudo_1.8.5p2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
index dfba7e0..0b940d2 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
@@ -24,6 +24,6 @@ do_install_append () {
 		fi
 	done
 
-	chmod 4111 ${D}/usr/bin/sudo
-	chmod 0440 ${D}/etc/sudoers
+	chmod 4111 ${D}${bindir}/sudo
+	chmod 0440 ${D}${sysconfdir}/sudoers
 }
-- 
1.7.7.6



