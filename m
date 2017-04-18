Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6628D71C7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:30 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o22so68829926iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SbHdguLZt/KSjqDdKlKwdBCpOJEjzsamX4JFyWuYrCw=;
	b=ZCITT6LTkR1GEO/dbxtFKGCG6EjRpteiZ58DYczMv0wq2r8DcGvyivPdLIxM4DE+pK
	cRnxdmNnvG6FLia/DSsYw7kB8oeHilUOC6fHkPs+kUCrru5wwe3OssJUNqadQcstlsuA
	0ZQwBeQzUcU+drNhup3qKrIETuSud1kL5PZu8DliYjnpzFt2z7eCB4dZRUYsyZ84ClYD
	FyExXHnyHFBBXcpz/XFG8EflbFWAU9PYdJskZn4DLmD6fXcIQdydtkmAf+h/iPHDncAe
	uJnQm2otfg1mwDGXpR7HowgGolTh6eruWlqzKaQbX3w0LFUBWqkRIzm66KsiDCFamSgG
	8Q3g==
X-Gm-Message-State: AN3rC/6gCLHmggtdT0xb/04nT0KxsF3I82P+rtVCgaoDzgnVdmwKs/h+
	P892z+aQna6fOObR
X-Received: by 10.36.155.194 with SMTP id o185mr13841644itd.64.1492521631403; 
	Tue, 18 Apr 2017 06:20:31 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:30 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:07 -0400
Message-Id: <1492521609-26624-7-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 6/8] bluez5: do not install audio.conf
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:30 -0000

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


