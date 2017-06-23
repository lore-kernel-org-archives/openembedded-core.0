Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEF978221
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:42:16 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id h134so8385397iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EYDVTYu4OGu/J+RWOsPaN9CzJ88zYYDgdYqYXBi7vUg=;
	b=tDBunB0/M5nZiM11KnkvRDzvKKBvCoG6CcRz9SQWVE6SNDSCX7HYIQto49HMhwsVu2
	BIGN2KlNLqlqXUdOG9x7272ATUFSHy9erJFd4KxqkGdBt1hMHzelUlmabBeagSEG38fF
	xDzlaypRkyCYd6yH/yNXvCaaq50T1PUpfru2epvLTMUNk1hbzAYZ/haelPOS1sAogEHn
	Na/lngybCxsH7iMNAGC7RuNuy0bbmsNKnk8zggeQ48SuEImQSj7G4HC25ks4YoNCpGTm
	mDuww+SrKKZ1QyozsD12/p5RkqK4SDGtcuPssYt2CvT2ec9vwKQmoLx9KrebwZUy4nBQ
	2yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EYDVTYu4OGu/J+RWOsPaN9CzJ88zYYDgdYqYXBi7vUg=;
	b=rzCijWQX315mpAm0Opbp6as9NCwrkM0KEagOuB8ej1aHxsGPskY1mwSk/wa6pVspm5
	x7C/DCLFwo4AuZZ+02h4nRnD6vMOGTB4MkjY7l/YCCpX2jAX5k2OJLIy+7YVGvkUu+CG
	LHq0tVwUjN70ArG0xmS5ZGb57lsq4eMnNmAmHiSr7Mz0pD//6udLDJkJPPttXxatqKeR
	aAxi6tBIVFnoUZsKhBQTKK3n+27jh+oSYy9rgTE4F3ge+juf109p73l8+4hpWvmT5MaE
	20QvOMgbC8rHREtSArLvUYBRHHpy5yS7PgoeG9fkGflbmTSYldFUODGrcM2b+GMiKut4
	hsUQ==
X-Gm-Message-State: AKS2vOy3oKlbfT5jumq8nIAakTnXEqkcfH4KAlwTGd5fOfrXFIjCr7lS
	Ly5CuvYzDeuabirL
X-Received: by 10.107.182.130 with SMTP id g124mr9905725iof.120.1498261337346; 
	Fri, 23 Jun 2017 16:42:17 -0700 (PDT)
Received: from jfddesk.Sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.gmail.com with ESMTPSA id
	131sm3744076itl.11.2017.06.23.16.42.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jun 2017 16:42:16 -0700 (PDT)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 19:41:55 -0400
Message-Id: <1498261315-7196-1-git-send-email-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: remove extra double-quote on documentation string
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
X-List-Received-Date: Fri, 23 Jun 2017 23:42:16 -0000

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
 scripts/lib/wic/ksparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d026caa..47afda4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -114,7 +114,7 @@ def systemidtype(arg):
     return arg
 
 class KickStart():
-    """"Kickstart parser implementation."""
+    """Kickstart parser implementation."""
 
     DEFAULT_EXTRA_SPACE = 10*1024
     DEFAULT_OVERHEAD_FACTOR = 1.3
-- 
2.1.4


