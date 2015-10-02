Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADBD770A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:24:59 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so108181610pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Oct 2015 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/ArlWeCM2u8/alvQakQmG+5hU/e1k8DuA3LHSNY/BZ8=;
	b=G9yFiRgncfSemNweCefOVeE8WTYx5F7uds+KizaRxafw8RUMiT6/Ov0OIazQ5bbazv
	fRZXp1aulfxI7/AkhycIqf9MH9NNo6wuIoyFGb2MyAhowCLmV+rrst8ddFnF9/53mleT
	OixHMFhWli4n26W7qRavjZarmv1Aptby+FyaL8nQTt1QO8PTaQTt9sw3a0gwCMDF2CqV
	4kix5+qW5iwUj1lvaWgJi8t0YFb/q/K8rekHsE57+YXRzmWYOJPjUQLIKgbFpygT2wsf
	rLmchLqPHv4vTt/2lxH9MeXkkzmpZwNYknge0Z0SdQi2DgpNjeHeLwmxD+XUcCBh3qxV
	DyMw==
X-Received: by 10.66.182.135 with SMTP id ee7mr20372940pac.95.1443795899925;
	Fri, 02 Oct 2015 07:24:59 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ya10sm12294688pbc.69.2015.10.02.07.24.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Oct 2015 07:24:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 07:24:53 -0700
Message-Id: <1443795893-29043-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1443795893-29043-1-git-send-email-akuster808@gmail.com>
References: <1443795893-29043-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2015f
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
X-List-Received-Date: Fri, 02 Oct 2015 14:25:00 -0000

Changes affecting future time stamps

Turkey's 2015 fall-back transition is scheduled for Nov. 8, not Oct. 25.
(Thanks to Fatih.)

Norfolk moves from +1130 to +1100 on 2015-10-04 at 02:00 local time.
(Thanks to Alexander Krivenyshev.)

Fiji's 2016 fall-back transition is scheduled for January 17, not 24.
(Thanks to Ken Rylander.)

Fort Nelson, British Columbia will not fall back on 2015-11-01. It has
effectively been on MST (-0700) since it advanced its clocks on 2015-03-08.
New zone America/Fort_Nelson.  (Thanks to Matt Johnson.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2015f.bb => tzdata_2015g.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2015f.bb => tzdata_2015g.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015f.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2015f.bb
rename to meta/recipes-extended/tzdata/tzdata_2015g.bb
index 7cda40d..039a7c1 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015f.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
@@ -7,8 +7,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "e3b82732d20e973e48af1c6f13df9a1d"
-SRC_URI[tzdata.sha256sum] = "959f81b541e042ecb13c50097d264ae92ff03a57979c478dbcf24d5da242531d"
+SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
+SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
 
 inherit allarch
 
-- 
2.3.5


