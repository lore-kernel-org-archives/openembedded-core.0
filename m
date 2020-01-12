Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AD3B87F8B6
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:36:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k25so3105207pgt.7
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=JoiaS+FDIGyXpCr7v9yzj4bz3I7hACZSKvz7OtEvKjAYX3YKeocqN9iJF6R2LOcCVv
	PyYy4QH5pUFJ/YdcVZ3fFtAk/9wc9BL70mNH7HAyKGPvMEjpG8Pw7eC5J5LNilqPVIAQ
	qGUn2FK48yPYSSS2/Onx3JUMk8o1RhehstgSVwl795UQm+dL6UuUglZNuaPDE9ayCviE
	TzOxv/YKzkLrdfYWTQ9RyJMQo33GDPMwhIfS97UUCpHs/gecluzasraoqq9aKTpCjQuT
	EgymCG3NG+cAd8hjHjljvZBTA6oo62J9fdL0q2pDLiA28uAQUx2wGil7ppq3SPkeumJ3
	ntOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=QKh44bDUH3o2Jy+1NCznoQzZ8A7s+IEPnRuTST5ia85PezSZKhzcOEdwY0rdKQcuk6
	heWE4I0jX+OSAHaza7Zw5nXoyKqCSi6cp5BvIiGVVzQ4t4M0OCrURNK34+/Ci2fiNCZV
	RZ3fgtEItm6asyr8FluvFICDzTfp1+Tp8GptY6C+o4ROpo5Ok3rm9a6+GSroftSTVNX7
	hsCTFthK88O8eWRghyF53uBUPuFwrpMiFn9yDLpXwliKOtWK6e2slLfESrx7A5+WjK6x
	49EZXaACpz3D0RFQEXTooa55aPS+qrUbJ9qo2Ie82OItThpdw8zycSqLEaJ+GSLhcRn2
	Tjbw==
X-Gm-Message-State: APjAAAX53WB3v/Krre2NvUdGEoGZU0rXxj3whwijfpGKOzcN7sgY/nm+
	pMKsKcRCpXT3LGF2dj+kV+RZFhyL
X-Google-Smtp-Source: APXvYqxes25jSjr8KPIYqfOZpjRCx4ifcR4xZmF96EzyiG8QFQ+9w7Mp7SpOJaJ6QEs9a/tEjxgYoA==
X-Received: by 2002:a63:1101:: with SMTP id g1mr14350596pgl.435.1578810995515; 
	Sat, 11 Jan 2020 22:36:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id
	136sm8437493pgg.74.2020.01.11.22.36.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:36:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:36:30 -0800
Message-Id: <20200112063633.11144-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [warror][PATCH 1/4] popt: fix SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:36:34 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

rpm5.org has been down for about a year now. Use linuxfromscratch.org
as an alternative reliable source instead.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9224014da9a512b1b8837e4e7a736d465c97be3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f9bf..27e49c2ca2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.17.1


