Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6083A7706E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:22 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so3930481qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IxQE3i9FmQldVVQDwBD/6rpt8dDeTKpRL2VO1klMEps=;
	b=MIKUdkB0b48zjk7DsBD1jlnAHKqe8BECYLBENo6ZgK7iR3zHsUgdsT5tlHmGUlSXma
	aeEDuU7gbVqPzRoomEW6baw9CmMydJF+LwyLUMCjKe89UKV6N2qztf3R2OLLAjMbkyLU
	fu+b7sXx4bUAg6C9pVzHIS3pcL5b1ncRJAgEg7UQYv7VAux+UYuWjOhZNtN4Gw03VgS4
	xMCD0I+TL3PS20KhnBc/gMlVfVXkuRDaydPc7XS6puyYxX3OBWeIzWZHmlv/LP8RrKjJ
	7VdPE8pfckb8ZMkDrPNKYxKuNx2mVgfAtJNmpp9zUCUs9ctGK/xrtGzQquTM8rVbS48K
	LN8w==
X-Gm-Message-State: AG10YOQB+gAIMrfrlo7QffOmSIEQ8dBXpRVAMs88y9LpC40sMs1WKUkPoraEdzKm5z5wbA==
X-Received: by 10.55.217.217 with SMTP id q86mr9697777qkl.13.1453590622804;
	Sat, 23 Jan 2016 15:10:22 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:05 -0500
Message-Id: <14a7723ae4a25c0d00dfde4fcf2e0964f33d8757.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 08/13] python-backports-ssl: update to 3.5.0.1
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:23 -0000

---
 ...n-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
rename to meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index f5776cc..7c980e7 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -6,12 +6,12 @@ on your own. So the ssl package in the Standard Library of Python 3.2 and greate
 match_hostname() function for performing this check instead of requiring every application to \
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95a5ee8fd779fbeca8b4cbca64433c87"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 
-SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
-SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
+SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
+SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
 
 inherit pypi setuptools
-- 
1.9.1


