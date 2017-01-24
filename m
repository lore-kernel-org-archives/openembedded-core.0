Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8E91C731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:29:42 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r144so206355214wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xq83dyWWeKGQfpTa3rwvOH6WiD8ht+cbB5nVZYZWPqc=;
	b=jSv5Lu21JaZQGZNdrLRodRxU1HHc1YXuna28wosFvEc/VduqjJk4RU6S82lWKogKRr
	6dmvRws26p4HN8x3AOLLw4dffJhv0EaB8hehcHWLd9FSEBXR/S685uQcBaiQY9pEe26L
	jxjBX+apESy9E+pATwj5Cs6YHOM8XasWUw99/1C2e/f2+L6Xv328rUJwS5wmbVGk7c3a
	TtjOjXQzkeor5kKN/cv6kMv0yWP+sHEf//GOP5eDAirJ1KxSVUnePL+xYsTN+cfol0bJ
	3tzjlIJ0mhyb3VuyXRvAWI5VHE9lh4CsnAuk5s0HdeeMgaKoI/u2bWCrKdZkTo9S9kVj
	FxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xq83dyWWeKGQfpTa3rwvOH6WiD8ht+cbB5nVZYZWPqc=;
	b=sCW9O3R4XDTJ5VuudEYDuZKb7rdgshoBpGonysGdDO3Tsib8G3CrNoyoUxfFAeACCK
	ICjifnoBDQrbhgOrjSXKH8i2ze0Bz2zn+L15DK9W90UXHf+ViHeTi+Y3V/GJ6Hs6yDV4
	wPuBuM0WPQnIFmN2wRkrnydsBwlaCXRKtifJxegnKgaeRR9gBazNYzn2t12B1WM1Igvf
	49t+UFb7UCEzen97GPTOZIq7hvAuv7sh0DV9iAp6pJQ0rpu0jRmSQC0m02D4eyQHUIt6
	7zHWTrOgW+kr//aZzBd9ChGu6MrClVuaa4OGNc3G/Fv5CIDaT+yp6Klh2ZmVmt7APk1T
	iwqg==
X-Gm-Message-State: AIkVDXJB5Kys4OJGNEawCg1CiqAYZ0m88qt48+lQmLCLh2U/akKGoySwACYcp6QtJ//9VlYf
X-Received: by 10.223.138.172 with SMTP id y41mr27998746wry.118.1485260982092; 
	Tue, 24 Jan 2017 04:29:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o143sm26241192wmd.3.2017.01.24.04.29.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 04:29:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:29:37 +0000
Message-Id: <1485260977-10218-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1485260977-10218-1-git-send-email-ross.burton@intel.com>
References: <1485260977-10218-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] rsync: update SRC_URI
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
X-List-Received-Date: Tue, 24 Jan 2017 12:29:43 -0000

rsync.samba.org has disappeared from the Internet and isn't responding anymore,
so point the SRC_URI at the canonical samba.org download server instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rsync/rsync.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index 37897ab..26c023a 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 DEPENDS = "popt"
 
-SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
+SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf"
 
 inherit autotools
-- 
2.8.1


