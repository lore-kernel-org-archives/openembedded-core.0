Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2E060962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:54 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so26520887wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cDXMJM98MloIVkk5UxOWyUTfVc5qhhniC46Pztdb564=;
	b=bkana8PSFChYI7T84AVHbgANZeDFGr6Ifmwn4bSz+nGCp8+CYZJIcVE4x0ArTz7uux
	xmN66lMbsm1Nocc5j71c9cxxXoRkKUYOkj8UsACyWBE5TMukyXhCeYMeYiTP4HXVMEU9
	7gPLEJnEsmgK7sqovGBS2+8xidV78jAUsHlxtDRaCgqflgZFwTtCKLFWTkVNWOrVEHSP
	4AHtKTbDH2RDOHqcvub6LPosxK32wkT5bQ18ZNuChnDJ2NulmAbiSYM0B+JAQ8I+sSKy
	CrQzMP9Z2wr48/tcB5tQMd0dhz2NIc1RBQELqV4c4eQ6ch9y6meUc7OScctwcdKuoeGw
	SBpg==
X-Gm-Message-State: ALoCoQnK45rF+ycP/b7r6fFA3KsvtnxXioXZtUJRIqEHq5VvXyNUdanv5ZqzrtpmSGPRDgR+lK+I
X-Received: by 10.180.87.230 with SMTP id bb6mr6707389wib.36.1437742134161;
	Fri, 24 Jul 2015 05:48:54 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:44 +0100
Message-Id: <1437742128-23260-2-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
References: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
Subject: [PATCH 1/5] rsync: use ${sysconfdir} instead of hardcoding /etc
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
X-List-Received-Date: Fri, 24 Jul 2015 12:48:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

---
 meta/recipes-devtools/rsync/rsync.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index 4223c59..c65f270 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -16,8 +16,8 @@ SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
 inherit autotools
 
 do_install_append() {
-	install -d ${D}/etc
-	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}/etc
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
 EXTRA_OEMAKE='STRIP=""'
-- 
2.1.4


