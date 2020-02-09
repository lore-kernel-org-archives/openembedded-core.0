Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id E8EA860CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:03 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id g3so2517402pgs.11
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yzdQNoMuIDvtPXtYNgoCvM45BgTxk/7J3Aj6kunYSXU=;
	b=eGVak/sXI/C5ieJWEgqKRbZtEeg+3q8t8iGBUURxQ7yKwXRl3wCHvKxUeMtsh9hqIl
	qPetW3GaGWdcSTpm/cvixT08kn/zecyL10unLqistQUqmT+Ei5xy1wKAX8ZCOuKmlzsP
	w28W9cWXHzqHxDpFCWe9DmiIa+eFeHr4IOLzivthRUQ5qaLB06/WIYC2Uk5ErcZ7yisf
	JqjBIc7w9HtxHAPfEM+N7I0ekUFjiIbI7B/CewPSZbCHbrzY7yBXuTDGO5Acoy2Of0pD
	/Lf8zweGcFL1dacZHz1C6eMVLoVa9GYbDZLQJhGwgaTUM1dCQXNeaX4WjAtgy7nDBeyc
	VWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yzdQNoMuIDvtPXtYNgoCvM45BgTxk/7J3Aj6kunYSXU=;
	b=fUcK0pN5QXwpefQlWc3npMhEFVkan4jim3NSvBpvoT/a4+dj5CfM7pO8MxZA3VlAs6
	r+mfTcOkUWmCKAqyGIW73lfQfIf8tv9vLrsi0qON2zHY3l5uuK+A3/b7UX+76L1e9v9x
	h7Su6CMkdfsdaZtf8oFRL6MO8uzgRnaCSHo1+R5PXDPR+SmrdTVbD+S1iHm4+K7c+F/U
	mMsMcEMYcAQXfcgVVi3WTQ8TUixtE0htafv7OcfkV9/kVu8Tn+CB5KwwoQ+BVa+BFRhf
	wFMOM3nnnWdpxR8TcyNaXfHA86H3T4n8kmTwvk2lJKes4ZEMIsLK9+yuryE0gYtHSivx
	8cvg==
X-Gm-Message-State: APjAAAUQI1aaXU660GFmlEhIl7090fHNIXmiWlXYM4jrUuT/4Ccu058K
	aue7BYGzTbunsG+lyKCToA4D9SZm
X-Google-Smtp-Source: APXvYqwMAh/pQrN0Evrd7h0ANufFjKpYK0CV0rdjGyuCSDV/nvP8xSlDNjsvus8XMcFW1osPSWLcWg==
X-Received: by 2002:a63:e30a:: with SMTP id f10mr9566583pgh.331.1581264604827; 
	Sun, 09 Feb 2020 08:10:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:30 -0800
Message-Id: <842bd7ca21efc6378ba24a8d0bf065c4d0f54f1d.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 02/29] rsync: whitelist CVE-2017-16548
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:04 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch for this CVE applies to v3.1.3pre1 not for v3.1.3.
patch already in v3.1.3.
see
https://git.samba.org/rsync.git/?p=rsync.git;a=commitdiff;h=47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1;hp=bc112b0e7feece62ce98708092306639a8a53cce

(From OE-Core rev: 1e2739c821312527010fb0afbde5a20cd3f03d24)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rsync/rsync_3.1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index ffb1d061c0..152ff02a25 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -20,6 +20,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
 SRC_URI[sha256sum] = "55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0"
 
+# -16548 required for v3.1.3pre1. Already in v3.1.3.
+CVE_CHECK_WHITELIST += " CVE-2017-16548 "
+
 inherit autotools
 
 PACKAGECONFIG ??= "acl attr \
-- 
2.17.1


