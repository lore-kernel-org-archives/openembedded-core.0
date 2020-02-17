Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9623E61507
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:00:57 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id j4so9413744pgi.1
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GMJ9Ib7VNtVgLEoFJTzy/PFcte9ywR7Pn1/H9WsY6dc=;
	b=mVSAkIWHXAmGtAaNrjG0+NtOlZ5pIc1jh7OyqP8OG5NFbWCsPW/0f/2tazmq1ttg1B
	efsW8XuX+qvY2fq0rTOIj8eToCH3wLrzaIbbqmksc9pBCEAP95RHkal23OsgSpDWdhGq
	XgD2IfFQbav4y4KYFCODLJ+ZoNcsMraYQOOj8KJtkLRTf8cmFxacqtNgxrwM84Ju24OG
	8lj+8tyFB7PYma2MiC8yJgzb3DRMBanJLpyMubg1woBbosjl+AOL0qyj9rotMhrWwYld
	ia1Htete86OpzzmK/ns8ifPiHPWEu6pDVu9u94i4ngOH3NSMkBUQiW4+3BxIAVa44h9o
	oQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GMJ9Ib7VNtVgLEoFJTzy/PFcte9ywR7Pn1/H9WsY6dc=;
	b=OshRjk5JjJvj+DcXsa7l/GGL9P9cJYZziQbn1+8dZoAX7GjYaSo3SKwJKv10JTuQ+G
	eXcjxvZp0Srzz0OCx+waM30vlUM/9jieXk9Ekx2/2QGMgdG2ri3CdPl2y4OGp69ns0f5
	9YaL/HA/6pkUNN1DpZK7aPLvGkg6Y6pXrYPdminZ47989o311HUy8pUSaDib19+dKSoT
	jkL2IojS9WczTmOc77k2R7T7Q6NpDA58ffVlXOx1RSUW1dYshnxEIUqoyEZoOoUwgo4H
	trkdjw1HJOOWuEwwVihyHE5Vu66s7hZmt0EbZu39E2Oj4PgpGViyKqJhzFfXtjDgZvOD
	ArWg==
X-Gm-Message-State: APjAAAX3zq/O71obNu1eemDgKTb7fMaeCOCrsii3EpUcASmA6hgFjLui
	XsMovxUeD35rh+EjlANsS4BDifa3
X-Google-Smtp-Source: APXvYqwLmFUP2VNlfOff7/BoLrfP+O9KdWtKgkVjSbaDo82bmnQaUpDyjL2ggPqTRBQ8Vh2DSVP04w==
X-Received: by 2002:a63:1b1d:: with SMTP id b29mr18354108pgb.111.1581955258432;
	Mon, 17 Feb 2020 08:00:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.00.57
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:00:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:40 -0800
Message-Id: <0a88a86d92b294175c14c7c5a2533d4e418fec6a.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
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
X-List-Received-Date: Mon, 17 Feb 2020 16:00:57 -0000

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


