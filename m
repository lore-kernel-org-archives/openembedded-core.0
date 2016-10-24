Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE27171A21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 03:00:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r16so15069853pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ftow4uLBvuIuP5wy5xobCYUo+LAbBFY320kGEgJfRJg=;
	b=DDKaERS7y8+xfm7Fevm/UeJ2YceHFvK+rk2E6SxwIEZYZqrluCVCMosehViOakWEAg
	7LrLFjV5GspLn8yrmUm1BcwK8ttqEFAHa8ZHS+0NR0YiEa1J/C17oVeu8jn/pc9Bm+Ig
	T30KiPNGE6INULw/vGsp0/vSx16+52lM0GxnW1K/I52UaxuSlR9uWXzp2kwymw/SHmOM
	7ZLbew/fdAB4DqRnicKjyp/tg5Z7QhVnOTpRYYQbMnDwawe8hIMNIqwUTYhbzcwImzOg
	kIkqOWAqy1vAebb4CKHPGqkwQLfqmYSTKXb3CoT8gpKru+I81gP0M8iIZ2a+fostwxyP
	tdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ftow4uLBvuIuP5wy5xobCYUo+LAbBFY320kGEgJfRJg=;
	b=ZwOuyOwJfVPRB9+T0vCwfe9RWUZIfXnVc+WBAsqBQ1HHEjYSO4xtZnQxM6RU7EB5XP
	RKSRSY3fhjfov3/Hh/Eek4/JUUCMBo7QMMPR4apRwxri49P2rRn+HAnjOZmiPmCV3rYf
	+D+5uib8pa1YwvbU8/CP3nkn3YrDsSTZ9AO0K0X9wyt/ieGAgqjJ3GJplw6WjF+TrDMr
	hHygYKCF/hIAqTxM+2K7whTJlvpVwA2I5FC36LhQIZmv6fXg9UMGYGe2k/3EMnhVaVVX
	CaSuZrjvH/il6ZWGsZnVNt57xEL8DIF+dkQ3H4ViQPGbWm5MOcLJ8oUT8zT6N3iedink
	XI4A==
X-Gm-Message-State: ABUngvcMUl1foFUKnOjWiqdtBIpEZ/owsBsWkyWK7AUDA6pf3+LxR4kTdFPJemOnI+/p1g==
X-Received: by 10.99.218.69 with SMTP id l5mr20014826pgj.95.1477278018557;
	Sun, 23 Oct 2016 20:00:18 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:2c34:ed1b:8260:837d])
	by smtp.gmail.com with ESMTPSA id
	p88sm20537560pfi.51.2016.10.23.20.00.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 20:00:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 20:00:15 -0700
Message-Id: <1477278016-2481-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Master][morty][PATCH 1/2] tzcode-native: update to 2016h
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
X-List-Received-Date: Mon, 24 Oct 2016 03:00:18 -0000

From: Armin Kuster <akuster@mvista.com>

Changes to code

zic no longer mishandles relativizing file names when creating
symbolic links like /etc/localtime, when these symbolic links
are outside the usual directory hierarchy.  This fixes a bug
introduced in 2016g.  (Problem reported by Andreas Stieger.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2016g.bb => tzcode-native_2016h.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016g.bb => tzcode-native_2016h.bb} (69%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016g.bb b/meta/recipes-extended/tzcode/tzcode-native_2016h.bb
similarity index 69%
rename from meta/recipes-extended/tzcode/tzcode-native_2016g.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016h.bb
index a2e6217..de7d88d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016h.bb
@@ -9,10 +9,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "f89867013676e3cb9544be2df7d36a91"
-SRC_URI[tzcode.sha256sum] = "1ff90b47ad7986140a513b5287b1851c40f80fd44fd636db5cc5b46d06f9fa2b"
-SRC_URI[tzdata.md5sum] = "3c7e97ec8527211104d27cc1d97a23de"
-SRC_URI[tzdata.sha256sum] = "3c7137b2bc47323b0de47b77786bacf81ed503d4b2c693ff8ada2fbd1281ebd1"
+SRC_URI[tzcode.md5sum] = "00c20689d996dea4cf5b45504724ce8f"
+SRC_URI[tzcode.sha256sum] = "30e62f0b86a78fb020d378b950930da023ca31b1a58f08d8fb2066627c4d6566"
+SRC_URI[tzdata.md5sum] = "878f0ec3fd9e4026ea11dd1b649a315a"
+SRC_URI[tzdata.sha256sum] = "da1b74fc2dec2ce8b64948dafb0bfc2f923c830d421a7ae4d016226135697a64"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


