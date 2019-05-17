Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 776197E01C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c66so9845882wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9dfBivIfakHihEGHWuGivw3Nmrsf+WaO2Pd9yNz6O1s=;
	b=vFZOY3fykxDz3HbRT3HkTa8tegw5GzAJ4b8yVCxccBw2B+aAJLuP78/VkoYYBOt4Xu
	r4u8Lf2Sh+pxXD6waiFfrzwSYU0mbgHd8G6IMCfJ6fkDWTI6YnjkBhHbJFJVNaDthCOh
	C4ZgkLayigcEV3pvU/+4QqulDdvc6ztXWXtMLevjo81JBADWQcTmjraAWon8vpDItKlh
	43SLlkCqa4cEwf37UOoWBWenHBq8mGEHz+lAk6/UjOcrHnQDTmCmTogrXy1oVUN3/6lb
	SPSwzLtaWwkODHGTRphaQIGtJq1sShk1sCOW3gzS+f9v/WIxgFjSNQXN5ycBg1QEEgGv
	6alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9dfBivIfakHihEGHWuGivw3Nmrsf+WaO2Pd9yNz6O1s=;
	b=pXVANyrQxJGso7mKkdLFF+UeuBwgShQqXvs5ROhfWJ/kuianG4ETJER+G2x4GNmh8M
	jH3uZ6dQRKUKfxm3usf7XeGSIlJcNfm/jsae+ymUX/k7FDf6Qv8OuBgJJSOyZt8xV1y5
	6tv09tq6lhbrNvlMKyJvqT1OUVS5b/uATHsr7Rjv1sGH83YadI1hmdxT9TSgDKCpYmG1
	fab64uZZ7b0EPkkC5F52aOJEXM9PIPmhOebdCJG6Fz8YbzG5g7YnkuCyLEwGfwdsyg6q
	AwHb32DsYB049cW6eh4yUA1sC3ts6+tpBFeyJ4pIhjUPSJzJ7CdlhbBLJwfDfqtwC5wH
	2Dsg==
X-Gm-Message-State: APjAAAUAcoeStuM0cTAHr/lYEgPuIxm3x9bM2OiYmCeFcfjPLKuCUeP9
	9tf3+w4srN/nt46bc2s8rqJKKv/O
X-Google-Smtp-Source: APXvYqzqLr88GhYxJOrrJDDIZdNlCOciJOYPjv/nzfYpzDEKzsZYfdozGlfKmJxZtwL3UGC5q63mvQ==
X-Received: by 2002:a1c:6206:: with SMTP id w6mr3354606wmb.56.1558116741221;
	Fri, 17 May 2019 11:12:21 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:40 +0200
Message-Id: <20190517181151.44001-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 26/37] glib-networking: upgrade 2.60.1 -> 2.60.2
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
X-List-Received-Date: Fri, 17 May 2019 18:12:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.60.1.bb => glib-networking_2.60.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.60.1.bb => glib-networking_2.60.2.bb} (87%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
similarity index 87%
rename from meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
index 09af229d698..e0910de32e2 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "83321ffc3c336894b8a5bc18db3fe58d"
-SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0af0d17b14435d92"
+SRC_URI[archive.md5sum] = "bf46d1208ac00d78a45fbf621d459025"
+SRC_URI[archive.sha256sum] = "c022f3d10f55a5b7c31676fb001b4cb6401db8ab9f6e8418c69de00d0f268732"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1


