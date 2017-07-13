Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4C89F780CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:48:42 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 62so30628188wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pa/L+dHAYRwfXN67tQF/pUqqhrDjrmdc1zNnDsdicxk=;
	b=LO6K4J8OS78UdxXtAVG3kDti7GIch19i/lGNjCvrwv5qJKE1QLa3+z9EtgeAvkmo4j
	3rvW+bDjH+a61qHv6EHidpaiVw+CpDlzzxyIFIs9BqAU3oYI88V8FK/js144nN0k/BWO
	qug3wl1R84LYbqkCNtrOZ1h6ut1IjlH8B7JJL+w5elluGRzRVM5UEvPwdw1B6qBPB+A1
	dnuKYnJKLy8uCW4iqg7NzEZ7vyM/jejx9VoTBo+aoVBRcwf7Fahu0BVWhTNfsQ7UqMSY
	Z55800sviQnijeFiWxSuWj5nDqdyQjuTGUeBfBiOA8t0eO6ilt8GoI3BNAu+KxViPGmY
	AOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pa/L+dHAYRwfXN67tQF/pUqqhrDjrmdc1zNnDsdicxk=;
	b=jbAwxlAhlTC9WiDu8y7cZ+oyIzHAgT4G6klmIXKCQDOItMNqinZn8j2SKW656tM1Iv
	2F34LCPJavW6A4lsAelfUk8Tj2vYZ7zBWx/qbwVW5mEJ4ou19gyVAyLQ1j81ap5ltlph
	pT5gO4bG/MJ5OZY4/QDtXzXb+uY5oibDUPxozIb/H0LnIGxQ5uBGZSMnUxj8JuQb5+6l
	siIU5aIpFyxLTeBLeyNvQFXupT3hMAxIqXe93bwyeFLRghzeBndyJ1dziT1MNbEJ4AAf
	4CUZrzF+KtuJONm9S62ZDxrnRUudA2EMStlMiTCGqcc37OXbxddIto1JtVvK4tjz5d66
	t2CQ==
X-Gm-Message-State: AIVw113KU9e2HDe4axarEgvJMsicJcbQbPgOywGMsH80t15fgVftzK+K
	WKepEDJIFqgorjqDdUU=
X-Received: by 10.28.140.143 with SMTP id o137mr3285461wmd.47.1499968117912;
	Thu, 13 Jul 2017 10:48:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 24sm6456511wrw.0.2017.07.13.10.48.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 10:48:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 18:48:35 +0100
Message-Id: <20170713174835.20237-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libgcrypt: upgrade to 1.7.7
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
X-List-Received-Date: Thu, 13 Jul 2017 17:48:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb | 4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
deleted file mode 100644
index da0a1fe7fb8..00000000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "eac6d11999650e8a1493674c1bdbc7f8"
-SRC_URI[sha256sum] = "fc0aec7714d75d812b665bd510d66031b1b2ce8fa855cc2c02238c954ea36982"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
new file mode 100644
index 00000000000..2bc21d2e69b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "36ace8f8dc4b1a82793ae759bbfc806f"
+SRC_URI[sha256sum] = "0e72e91290d553c303095a50ea660279d8f11b76c6c86e826f470442fcdf1edd"
-- 
2.11.0


