Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id A3353778D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y33so25338881qta.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SbHdguLZt/KSjqDdKlKwdBCpOJEjzsamX4JFyWuYrCw=;
	b=nSba2YrqFkGqMG3GxvHgDrN34RlELplA+stvwwmE8JJyvS3GOXNcm1rfR8xwSyEVSR
	EkYI4/o+SJS7QPcEUpVeQ+X2m1hLMGTz+WXueAQhJozDnlP4DgzlzpkRbFrH9f4whMdU
	nKasvqUNBKx8rh4qfcoNr1yO8TVtcIS4PAteUPvhsXuRg//XaFaAbQjIICGwovZQrNBU
	1c/cbfDgNfaFpDSxyH68MtMafSW16NCf9OTEeVWsAfw5CCe+SxeHA3QX3OMj/0RSeura
	Yy1i6jIkWPcgVQyTXkK/93ews1dDnHlkuaPxj/fK0uzaC2r/NMVAryjXIHILdU1wsHQg
	OoJw==
X-Gm-Message-State: AN3rC/77HbdjKBli29M8sqC1zRJ4iALlKZvX/kHHFwPMtUCAGuwM3QLM
	xzLhk6E1NUkiKw==
X-Received: by 10.200.36.212 with SMTP id t20mr34104375qtt.269.1493131740774; 
	Tue, 25 Apr 2017 07:49:00 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:49:00 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:39 -0400
Message-Id: <1493131720-19456-7-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 6/7] bluez5: do not install audio.conf
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
X-List-Received-Date: Tue, 25 Apr 2017 14:49:00 -0000

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


