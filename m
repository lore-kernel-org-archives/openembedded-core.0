Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE9F76923
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:41:12 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so42862054pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+2BrukBQqpTyg/2+T6qXacd9akRwvv1vbXTJKF5ER8w=;
	b=ElAJn0mAp/H4bNyrZAP28l53sHNW7izQSjix/RQlzRIz4KDF0qUbu5dtc/Hpcxnqd8
	WMp1v53hyMWhy+nq55CyPooz4HLvrDZR4t/g2HTSQkzRujIZ73LUYpDmmii+byRUo2kL
	1LOS+Qz8z/CvA8C8YEYkEn7ZnL0cFn5n/hgAzPNt5077e/UyHHtj6hVsrDWQXM6NJEpV
	Yo6anq7jzKSep9ZDCTHzms7rglNaFTRSspUP3dvQRxnTtg/Sm1LxBUAWp7eVr4oahyHy
	qsNib2S7ipMTEWUA8ek4I3R+syxqPsXA2WrRhErcwY0h0gcwN5ZShxwb3bNStqabiELd
	co7g==
X-Received: by 10.66.66.68 with SMTP id d4mr52411178pat.43.1439271672609;
	Mon, 10 Aug 2015 22:41:12 -0700 (PDT)
Received: from Pahoa2.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id qp5sm962384pbc.0.2015.08.10.22.41.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Aug 2015 22:41:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 11:11:04 +0530
Message-Id: <1439271664-22049-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1439271664-22049-1-git-send-email-akuster808@gmail.com>
References: <1439271664-22049-1-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Tue, 11 Aug 2015 05:41:14 -0000

Changes affecting future time stamps

North Korea switches to +0830 on 2015-08-15.  (Thanks to Steffen Thorsen.)
The abbreviation remains "KST".  (Thanks to Robert Elz.)

Uruguay no longer observes DST.  (Thanks to Steffen Thorsen
and Pablo Camargo.)

Changes affecting past and future time stamps

Moldova starts and ends DST at 00:00 UTC, not at 01:00 UTC.
(Thanks to Roman Tudos.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2015e.bb => tzdata_2015f.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2015e.bb => tzdata_2015f.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015e.bb b/meta/recipes-extended/tzdata/tzdata_2015f.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2015e.bb
rename to meta/recipes-extended/tzdata/tzdata_2015f.bb
index 92389a9..7cda40d 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015e.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015f.bb
@@ -7,8 +7,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "36f9056efb432ca945c73397acfce0d4"
-SRC_URI[tzdata.sha256sum] = "ffc9b5d38abda8277aa479e3f75aa7668819d0977cd1a0c8ef3b09128334ba6f"
+SRC_URI[tzdata.md5sum] = "e3b82732d20e973e48af1c6f13df9a1d"
+SRC_URI[tzdata.sha256sum] = "959f81b541e042ecb13c50097d264ae92ff03a57979c478dbcf24d5da242531d"
 
 inherit allarch
 
-- 
2.3.5


