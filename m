Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B1B8E78AA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:09 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p104so18081382wrc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WsQHlqrlLvu2wRnxsNV5fmExn/pugLcP1R/3A+qVpEU=;
	b=ou5/SyVFXvwNy1uyruZcpfONXc3FsC5uS7DW0kduEB9vYG7sUAB3wbmNzy9KFxGjIr
	vJJ+X7CIUTVrpxmJ0dKAlgBxuXbzgIcru1qGcXiYZxXKOwUORFmNJ/p9gUIQCmpWCMK7
	0qlVmp/Lfq7axGt20mzb3scsp7ovk5/IfI5lWLDfQqwqQZpvEeRPP5w4jNrcVGZsAYl6
	EzfPvriDCkX8RADb9Q6r4WyXYEU151xTP/7uxHPBW88iKSEOyH1DfJOHhwzqpp9sxZkY
	6J4nrdYBdCTIepNZhyibo0AR5/PjoJ+Rhqg85fnJ2PSKnIEiAVsRBcriwYoEQlVpXj3A
	urcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WsQHlqrlLvu2wRnxsNV5fmExn/pugLcP1R/3A+qVpEU=;
	b=PaRm1th3+3NGl1k2fUVGOLtao+9wCkWCM0U8BvXbNQgO80L9zzk9oIb/62u+6LA2RQ
	zBAATeD6z6vTFczVEujKcAzZXSmGJxoqvc5ItlHnr5i87AjHJeKWqL6ruVVobxIEn1r2
	qBHkeilAlJB3ErIMWwp77UTQW2lLIiLhA6UH+pRTZFbKuK/ssiLtoIVI8ITNSR9ZtWMb
	dnXE0Bh+bKTeAtecfElGbUAUoTQ7oJI5rYIQY6OiK7DZWmfJIUZ4QyVb90pJTwIiQTy7
	lRYWG2RvrhDUKpCfXnIaFHmTrDno47FHAVhFvp5CURkOSS16kuASfDqsGPZa7H9D0TUm
	KCTw==
X-Gm-Message-State: APf1xPB3i26Mp5faCblavy5Fy7dDCFVkkIlPGU36a9/d+h+DG8EnK80q
	28SGtjs407BvByph6CR/gkv0e4kf
X-Google-Smtp-Source: AG47ELt0UCsm9iNKnTw1U5aB6m2h8H43ZCGxlnM40IPrQ6tVgK4IBelKmfnF8RvfeT4p8UZ3Xl1t5w==
X-Received: by 10.223.209.197 with SMTP id m5mr13373648wri.121.1520270470557; 
	Mon, 05 Mar 2018 09:21:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:36 +0000
Message-Id: <20180305172046.21729-19-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 19/29] watchdog: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-extended/watchdog/watchdog/watchdog-conf.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
index e68ad545c30..ec44c803b14 100644
--- a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
@@ -1,14 +1,16 @@
 Signed-off-by: Diego Rondini <diego.ml@zoho.com>
 Upstream-Status: Inappropriate
 
---- watchdog-5.13.orig/watchdog.conf	2013-02-01 12:15:44.000000000 +0100
-+++ watchdog-5.13/watchdog.conf	2014-11-13 10:59:43.233943000 +0100
-@@ -20,7 +20,7 @@
- #test-binary		= 
- #test-timeout		= 
+Index: watchdog-5.15/watchdog.conf
+===================================================================
+--- watchdog-5.15.orig/watchdog.conf
++++ watchdog-5.15/watchdog.conf
+@@ -28,7 +28,7 @@
+ #retry-timeout		= 60
+ #repair-maximum		= 1
  
 -#watchdog-device	= /dev/watchdog
 +watchdog-device	= /dev/watchdog
  
  # Defaults compiled into the binary
- #temperature-device	=
+ #temperature-sensor	=
-- 
2.11.0


