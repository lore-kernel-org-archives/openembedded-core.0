Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7nhK-0000JW-C6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:53:00 +0100
Received: by wibhm17 with SMTP id hm17so5882158wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 05:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S7PunwZykHO11sr2N+Wd1D15U1UQG7qMwKqGOVJ4GHw=;
	b=xW+7s65DZaj+XIwA1nhcoZlr3VAlNFrIlKfxezBRdyRC1zJD+WWwuixs1BkMJ5gjJQ
	gT4KPB6aCj5OtC/FQYCjcvEpc2Pl/Bs6phzDGEdRQZ03TvtClDvHWbKV9mRNGyQJpMeb
	J7YfYOPqMY3u+SfNQjg29/uB3HO/ib/cy96bD76DThH1MEySRF8UT80b3hiIpCKLD0BC
	DfadUWSjKD76zcEM1aI+AAgakAuKmikBhntt4J4RR4vKjDVd65NRg60xk6jHldPE024B
	uCSoUQ1v8E7CrH61suan83YHir/wv2lz1Yopkny+WG9K4NSxbfqlQdBw0pYWbfEDgcjv
	jiAA==
Received: by 10.180.104.65 with SMTP id gc1mr6066764wib.13.1331729053348;
	Wed, 14 Mar 2012 05:44:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm51651297wib.0.2012.03.14.05.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 05:44:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 13:44:04 +0100
Message-Id: <1331729044-19187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] librsvg: really bump PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 12:53:02 -0000

* it was downgraded from r4 to r1 in
  http://git.openembedded.org/openembedded-core/commit/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb?id=50ad5230ea9e0982cdfda23fb9fcfccf89d28f29
  so even with latest change making it r3 we had still on lower version that we had before for 2.32.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 74286fd..1e57647 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r3"
+PR = "r5"
 
 inherit autotools pkgconfig gnome
 
-- 
1.7.8.5



