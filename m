Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E62C60620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:41:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r71so2488114wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sEnb42z1dhKBq5qr3kP3qqOlRRWI/t/AgtJrBZl4KnQ=;
	b=rWVaIii+qddmaLR0Wte51HVY5V1Y/uKe3OEpaj4/AYTneKxwZJiyzB1uxZpNzegPlD
	pj2K/cZG3eBrpMuzo7wZERsGzs9NOdOuzgOkCZzSDk3rNWCHX33hGqLLNJXU6dCQw0HW
	w57PqEItIOZLxw0aNqqew2qXESpoV+hhDu9BqiPpa/J1Bz39sYyrseCxg8nZivr5lrrR
	bmLw+/dd+jSvsBK1tE0E/opwvGcUWhCt7eQrgornIJRZrcoRYIuveisEq1zRaX/Z+UQ4
	xeolWfKLxvrTBVvGn/4rKaf9FOFXG45zcgocOy1ibEcUfQs3WhtsCMJeQDoqsybyRu9a
	JV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sEnb42z1dhKBq5qr3kP3qqOlRRWI/t/AgtJrBZl4KnQ=;
	b=NIUHi763Sl8q4a7sRSoJLaIRc3fLcfk0x+DcSWI0yosninfx8BbdCbIhTaxOUKp0Cf
	QrZoF6KXDwxu6/Mz5unt2RAtSDac/0byD6XJG1jYZtrPt06zB/tjl7WXdZ5NcMBLzpYj
	ivBDmZw4HfUOYttxy3LardHynNCpHvOtZoH7LRoQkloyRDXQmbkjWcVndabsG+nxFNMw
	/1yWF95trTI1bsMEkaLj8EhzrJl5IVbeK0usB4HHFyXeGNjFJvGiDf7E81P3RtbZOqM9
	i4pUKD6S9hvqhmxAyUkQN/olvMYklp6yfLbaxpiZlxxsUvaJGUDFKhFomEX6BjT9qDik
	cGlg==
X-Gm-Message-State: AKwxytflcG1Titsej0sZdGppoYCvfibLPLdVn+NIXcxPfcDJgEHOhba9
	OBbgBrlt4604PVd/C0zpON19jQ==
X-Google-Smtp-Source: AH8x226fJC9fCbQlohxUDIpy3D0KFwvk7uoG9+KrgF09Gs7GKdOYHel1hz8ryQ+C3MsGKIT5WTgQ1g==
X-Received: by 10.28.120.19 with SMTP id t19mr21576275wmc.53.1517330484887;
	Tue, 30 Jan 2018 08:41:24 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g15sm14360685wrb.66.2018.01.30.08.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 08:41:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 16:41:23 +0000
Message-Id: <20180130164123.11117-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] tcmode-default.inc: drop preferred version of gzip-native
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
X-List-Received-Date: Tue, 30 Jan 2018 16:41:24 -0000

* gzip was recently upgraded from 1.8 to 1.9, now all the builds show:
  NOTE: preferred version 1.8 of gzip-native not available (for item gzip-native)
  NOTE: versions of gzip-native available: 1.9
* drop the setting, because nobody is probably going to use older
  gzip-native than 1.4 when there is only 1.9 available in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 852ac3c7b4..64ffeb5ef7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -63,9 +63,6 @@ PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
-# don't use version earlier than 1.4 for gzip-native, as it's necessary for
-# some packages using an archive format incompatible with earlier gzip
-PREFERRED_VERSION_gzip-native ?= "1.8"
 
 # Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
-- 
2.15.1


