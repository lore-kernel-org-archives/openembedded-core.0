Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id F38F0731C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:05 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id x140so1561905oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0NEuIhjxJGUa+rmNm0NuVQzD1l2TlQhTB41+NQ7bgPg=;
	b=mhIeumRertUL4fqs8Am0T8hcDWGlM4N1x/2zwsGicIdPxrVIE2DuH1bnRA8TtU0+aC
	EOiDY/96ClGgRXkBSmEJ8r5VlaDXDif8Bzmk/TfeWXHFw4gMoSyR9IytGJKB7X6aTiOY
	1y2nZwjggPAm5tCCSlUkKK7h95fZIbSHqY7mEGc44YbYc7wVlmqn08usbJctFkzsBz16
	J7iNdat7maIs0EJ9j9MhyN6d5U/LIzV8hKyMhKs+XvC2UpH7YBurjuyYnrxJSpcwNOCW
	SAVxQ01B0O3w/Ex3yn9QcAwHVpk1iQnPpswoZqQGRg4DkANNCiquNieHSuA22GAXUtkO
	J9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0NEuIhjxJGUa+rmNm0NuVQzD1l2TlQhTB41+NQ7bgPg=;
	b=kqqUfMFmXtMH3SW5s8UUwHFULi+CIOVjupiBEJbaHq75PtHmZOqqyzveFU+tDecRTk
	3C8w7rdzx4Gc7unGWAC037JhlXCeqPwDGenGGdwSbo9jekUI3lIsQ4NC4iR5EsiU9hjE
	6sxSOocAOfuszrHT47ACMeYXmDlKo3DIbDjvcpbyQOV5PuiblPZ559AJAOZ9u6QKtEPb
	5c4S0wOFhiWq/1tVO/wJsCQQmHiyO/DKHISnpiNvYHEZNLAmJEq8evYqgAoMQDUqQzFV
	SlggaY418etGzG0Z5yeAmjSNpcg9ynmu1QwJDkvY+5rHF3iaZkf6CuU7PiwmLj4NzVAO
	GE2w==
X-Gm-Message-State: ALoCoQm1W294h5xxQfsCMGiJEEhFrQqUXz2EkGAPiYkA2BXcfSRKWp6ZKUxI2Q40Zae7jbulG0AP1v6AoIOUq9OPAqLCFuzg6Q==
X-Received: by 10.202.230.197 with SMTP id d188mr29463603oih.59.1453354626425; 
	Wed, 20 Jan 2016 21:37:06 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:05 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:19 -0800
Message-Id: <1453354610-19218-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 01/32] gst-player: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:06 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 9850242..c6c8f36 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -1,5 +1,4 @@
-SUMMARY="GStreamer playback helper library and examples"
-
+SUMMARY = "GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
 
-- 
1.9.1


