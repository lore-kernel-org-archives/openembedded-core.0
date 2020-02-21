Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 195FD61605
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:53:57 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id v23so254434pgk.2
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GMJ9Ib7VNtVgLEoFJTzy/PFcte9ywR7Pn1/H9WsY6dc=;
	b=tVaI26CdNhntemZCEQVt2lweHPt+2F4gMBCZB7p26NlTiGoWfnrP93+bfWygEH091z
	Vv6Mn5KhJeLJjoFwsUzdu5Wybi9qemE+124Nsa5T2J2vUs/vG5kC+sdg4nyKgpaKMdqB
	JJRGKjPi8mfjQr9c9V6lYRg1cIXXcCi+Pd3TxrImX64CdQUfIEKpSMl3XvbYEae9v2CP
	hhbP9AVQ0aF4H/1+BaefLNn1mmXaJ/UtcCQ8CNMu0Wn1whtuMQjoaHSTYSPS2OxtA0Q7
	suPjk6v26uGAqrHZp5IdR4c8uerL0eAXuaVQZAbSc9noKmG1cDShP75kMPNM+f+wlqeV
	WoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GMJ9Ib7VNtVgLEoFJTzy/PFcte9ywR7Pn1/H9WsY6dc=;
	b=hkcnywrmINsYa3CJWc+LP5axr3fWfiTzRuWsCRrezElz+sai+HrgUnJlspbYKgUtDD
	VtSUsj5JEgnJBhUmoRSrm/btDlaYy6wB2DnxCHMlGZVS12aLiB90LdfuGGSjJNO/FTZK
	YW7mllACMVveW0rPuOzqQeKuLLIjz6WlMx+3ghUNj3UtC/1yDXAKWc9MTMliWyaej+Uf
	+NWosjQdezxj6r0Ao7GcjztkDtbBV2Qi/SdmkotKlOmIaQrkkCO9+wqpLZUciKYNLtoM
	0Us7xU2SbuaiBmbYZohWpCqjpg/hz+uA6z9rQfqHz7FGRiauXNy6ohZibWjFytoXC0Oj
	Hahw==
X-Gm-Message-State: APjAAAUzmuO9dxO43cH6F33x8oOdfZ/Ay7Oi5etX87Ko6HoZywMtPEXI
	f3E1npHV7lt/MKBY3XPldD7hSvhM
X-Google-Smtp-Source: APXvYqxCmklxa3TOFGQFwmYavKRYpFiaFYgj9ayFT7/5JzeHdXI+xvutATbgfLy623l7d7Q/s9imyQ==
X-Received: by 2002:a63:7783:: with SMTP id
	s125mr16579063pgc.214.1582253637695; 
	Thu, 20 Feb 2020 18:53:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.53.56
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:53:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:21 -0800
Message-Id: <0a88a86d92b294175c14c7c5a2533d4e418fec6a.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 02/14] rsync: whitelist CVE-2017-16548
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
X-List-Received-Date: Fri, 21 Feb 2020 02:53:57 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch for this CVE applies to v3.1.3pre1 not for v3.1.3.
patch already in v3.1.3.
see
https://git.samba.org/rsync.git/?p=rsync.git;a=commitdiff;h=47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1;hp=bc112b0e7feece62ce98708092306639a8a53cce

(From OE-Core rev: 1e2739c821312527010fb0afbde5a20cd3f03d24)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 842bd7ca21efc6378ba24a8d0bf065c4d0f54f1d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


