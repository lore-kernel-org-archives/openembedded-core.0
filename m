Return-Path: <jean-michel.hautbois@vodalys.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94B8D60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 16:24:36 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so28637508wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 08:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fJyabrDzsEwp7PWeI33lkEBkTp3UuJ1/g8+UNbWcyzg=;
	b=JEZL5fKdgVJZzThX0YNkOHEVB6wJikx+L5NvaGFADzkTJNguFCxUEoHLvAmzQJ1j3S
	yzX84VHAhaLxg1AZAT1EI8wAdo+2yJmk1m186DUvC6MgytouVYK6T2GHxVJI+1ECvum+
	XPH/VKlMjkByg5G2Y6nGvvhCh6um4UDEPYzaINGAsrj55QAjIcgT6hENuQUFSUcIQ1iJ
	KreZudCMPKjT6rgkwiUHJ+aYLjhw6UT2ShGbTD2hZ1ciEX28He6xvhFAb+LG9nPJoQkx
	CtOax54IdVw4VNt/xFX+NPsy7ELMv0ZA3W9HPJtSA73wNYDLytsAPh1uD1BIk/6cMj7Q
	7gHQ==
X-Gm-Message-State: ALoCoQkRrbavkr9sNMxZQGAvUMqBgi3OufaW7fjZwZRgz7T/j2AUKWXgfPB6yeoTgcoZetI2elej
X-Received: by 10.180.149.203 with SMTP id uc11mr6376298wib.11.1417537476744; 
	Tue, 02 Dec 2014 08:24:36 -0800 (PST)
Received: from tatooine.vodalys.lan
	(LDijon-156-64-30-180.w80-15.abo.wanadoo.fr. [80.15.95.180])
	by mx.google.com with ESMTPSA id ej10sm6938041wib.2.2014.12.02.08.24.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Dec 2014 08:24:36 -0800 (PST)
From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 17:24:32 +0100
Message-Id: <1417537472-11649-1-git-send-email-jean-michel.hautbois@vodalys.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-multimedia][PATCH] gstreamer1.0-plugins-bad.inc: Disable cocoa on configure
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
X-List-Received-Date: Tue, 02 Dec 2014 16:24:36 -0000

When configuring, if GNUstep is found on host, the configure script thinks
that ist is running osx and so enables cocoa support.

Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index dab0bf5..9c15f2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -80,6 +80,7 @@ EXTRA_OECONF += " \
     --disable-apple_media \
     --disable-avc \
     --disable-chromaprint \
+    --disable-cocoa \
     --disable-daala \
     --disable-dc1394 \
     --disable-direct3d \
-- 
2.1.2


