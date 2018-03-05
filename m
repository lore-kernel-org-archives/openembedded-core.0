Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D9B9178A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z9so17011050wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cVeNtzjfagpmCZaqSID/DYLJKbhLBdH3Tfa2Y9V3uZA=;
	b=K6GusnTeCEsAcyjMhfrJHSmd/PSfVyXEb32B34obE5ypoEH+H0sl8OhcQFJHCeahSE
	mYcRvrXrTibjyjpGyEOHCemtFHmaiodvXZKa8Qx7gcUbNAZVMekUuU9ZrHeFkPZj2aMU
	QzSo00TZoOrN8bowUGs/etgbk+U649gjJHZkRdKvrIEozs3G9VUcr0S5me3wyTL6uXTb
	/cSB8d8eSro8Dt47f5F0zoloAFr09/uHJNNydc1XSrk3r4T3hDBiA4eafQ6jFcD2ut4/
	ImeGGVtqhJ/+DswS6umitlMs9IaZK5LAF1UW2febI/Os1VYlVQ7NaH3Ghn3L61ziMbL5
	YjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cVeNtzjfagpmCZaqSID/DYLJKbhLBdH3Tfa2Y9V3uZA=;
	b=clOunZHWpRZ7oSwNRKMFXTkzC96wy+Wpd7/E+rA6Bg0TT/kkhApExIu3Me1fvQF6U1
	GilcsXj9QQCaNbZ5S9cjpg7nzg0IJbAkVBHsl0TegXw5NOXD6TXJdpxnhZypbPzGPiQF
	zeLsVUocNhAitRz5YJibEFNo1OqSaYC/gaKXRLTu1/6EZLrP3F0FDXYmzPVrwkxFK8rS
	TOgC7r2/tmkaTP+Gt4l1SPz8EBwmcLNUE5JNw2Gmkp4fpa7e+hTCB76jsSqJma6fu9Td
	6wD3Zd992ysNWBNgNY1qlWJe1TXp2+EMdgJ5ZoXH5agjl+PtzEw6ENAAhqHW80zrv6wU
	h+CQ==
X-Gm-Message-State: AElRT7GSZHJUKbJgnJbkULGTvZO+8Mi1seo4KssWnGT6ODxtdAxvBgrN
	hLxGy19cfv8DvETETcXucGECTzE0
X-Google-Smtp-Source: AG47ELukGVVEXGs9gyrB2ro1WGijooes79X9QX5Ox6EjCkyDMz7ERk0EWFfaAAsg5ZckuwfQ/rV5sw==
X-Received: by 10.28.66.69 with SMTP id p66mr8838249wma.119.1520270466825;
	Mon, 05 Mar 2018 09:21:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:32 +0000
Message-Id: <20180305172046.21729-15-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 15/29] ccache: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:06 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/0002-dev.mk.in-fix-file-name-too-long.patch       | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
index 837cfadf6a6..3f01c69b2a8 100644
--- a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
+++ b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
@@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  dev.mk.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/dev.mk.in b/dev.mk.in
-index 1261ad3..ec55ac4 100644
---- a/dev.mk.in
-+++ b/dev.mk.in
+Index: ccache-3.3.4/dev.mk.in
+===================================================================
+--- ccache-3.3.4.orig/dev.mk.in
++++ ccache-3.3.4/dev.mk.in
 @@ -1,7 +1,7 @@
  # GNU make syntax reigns in this file.
  
@@ -26,7 +26,4 @@ index 1261ad3..ec55ac4 100644
 +all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$(subst $(srcdir)/,,$<))).d
  
  ASCIIDOC = asciidoc
- GPERF = gperf
--- 
-1.7.9.5
-
+ CPPCHECK = cppcheck
-- 
2.11.0


