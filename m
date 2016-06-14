Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 854E57001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 21:50:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c74so170198pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SIGPoNGhmcIa8vX7AGoMNbGyePIfwmlO68SjgbHP8Ew=;
	b=ttt9O0A7kliob2jm1zxAjQu2oz16RfNzVY6mWSjBTn6GVBrQfEFAcw8PQKfLFULXXp
	wprNtku92zOC316rzVx7UgFedHFE+rQoCsVAjjXcqumrV8WN81HYOHBI5xnX6wrLQrfv
	PBm1HPuvhJWYMDX9Jih5yhrotrrUPhM7D4aTFn3cukGA4hfsz8U33shG8MZHAFwNJ1tu
	2cbu/anDMQLm/pBQUNfdpOE+gsUsJaAdym5ZJVS+RKYJrBEj6O+Jhq30ytqeNsQIOaWe
	AYxKGaxInUAKhR/GUcVNg1wy7oDhXcCLIz/bpma2SqIccA6hIBcBSjrz70Z24lqohdLK
	dyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SIGPoNGhmcIa8vX7AGoMNbGyePIfwmlO68SjgbHP8Ew=;
	b=duvOXnRAJ98snaFTbK6Q3Kyf6PeopoVdrEt+ybX2WhNfF82OBe1ta03IE0aW3QDOv4
	M3QMGgwSD9vZEREeoamDNYGzEXKDLi0gAPw48pzeczkH4A2sW1QiVt2zZwCETb6aYyXC
	ZDXDuMEzFfsP/Lhf4wc0fysn2HOAIkb4ooYHGQBb8kSddx/9elyRvSNlWBgXLBStvawr
	Y6tniGnGpCYk6uEm3tv5zMEMWgF0zhQiYt4LFYHVaAYhlNOg8pL4QCuF/x5oGq4hO5XT
	NHPo1iN6fz9sUCVDsMb6tQ7/dmI6bkbruMi4hMNjLMzSz5i/IQGDF+M0fmXDTAMkmMXO
	E5Jw==
X-Gm-Message-State: ALyK8tLYlqaJtzq7j+sMZg2cc6cwg07gKQ/LiOLC0WdJHqLQaYIYVoJPtVeO8bn8IlI7kQ==
X-Received: by 10.66.49.134 with SMTP id u6mr30765607pan.118.1465941026364;
	Tue, 14 Jun 2016 14:50:26 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id
	a188sm11940573pfa.70.2016.06.14.14.50.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 14:50:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 14:50:22 -0700
Message-Id: <1465941022-1264-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1465941022-1264-1-git-send-email-akuster808@gmail.com>
References: <1465941022-1264-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][jethro][fido][v2][PATCH 2/2] tzdata: update to 2016e
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
X-List-Received-Date: Tue, 14 Jun 2016 21:50:29 -0000

From: Armin Kuster <akuster@mvista.com>

Changes affecting future time stamps

Africa/Cairo observes DST in 2016 from July 7 to the end of October.
Guess October 27 and 24:00 transitions. (Thanks to Steffen Thorsen.)
For future years, guess April's last Thursday to October's last
Thursday except for Ramadan.

Changes affecting past time stamps

Locations while uninhabited now use '-00', not 'zzz', as a
placeholder time zone abbreviation.  This is inspired by Internet
RFC 3339 and is more consistent with numeric time zone
abbreviations already used elsewhere.  The change affects several
arctic and antarctic locations, e.g., America/Cambridge_Bay before
1920 and Antarctica/Troll before 2005.

Asia/Baku's 1992-09-27 transition from +04 (DST) to +04 (non-DST) was
at 03:00, not 23:00 the previous day.  (Thanks to Michael Deckers.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016d.bb b/meta/recipes-extended/tzdata/tzdata_2016e.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016d.bb
rename to meta/recipes-extended/tzdata/tzdata_2016e.bb
index a525c8c..ac05726 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016e.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
-SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
+SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
+SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
 
 inherit allarch
 
-- 
2.3.5


