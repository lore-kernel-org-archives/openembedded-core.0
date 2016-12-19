Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8F5C771AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w68so1431528pgw.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wt1veltNsZnYGzq+A335r4/PkxrtdMRfSTUq4EmnvLU=;
	b=h8W6hV9qOf7i/LWTpobYBK1QXDYOcirTO2taS42hrp3Q0SPAnfYXsQGWFQuOdv/+Yg
	sonoG0pcYWOqgKRqnWYcTUtss17CkhtWaHWs3RMnmixTguXSwuWZwZ/ftH0DN6Ajk7ih
	0WmPu7/cRHm15WBF9sqaRKki/RDcJfQ55qkwX/fSHTR+QMOHgnTVbJD96J1KXnKzhIM4
	j/nBZfKq+c5mB2+XG8Fice5ymAc2Ts5yMmhVk1pMhOKK8y0Zn/T7Jtzl6mympcH0fMet
	48eAssu0Gj+1QGem7eLjXIPLHkmrZZSuPeOZ34i2yC3ieXTAXDcCPn3yjHq5S6bx0jaa
	lNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wt1veltNsZnYGzq+A335r4/PkxrtdMRfSTUq4EmnvLU=;
	b=h79Y6ofXLXK2VfJLIaq7h2+c4XikRw8xwaExsvpIodCPw9LGRqy1HzCUNKgEqe3h7b
	9qgS7Qqx6CvXr+nL1VzQyyglKS4HEpE54zsIiGYAaxlN1rIjxaFodhiUw3qA9lDmiNUD
	5y4zG1ULmVaXPlwItXPhwIquofOMHY2PjkarJhJabPzW6rBkljNtD0T7Ni15AJrqJ7xH
	F0SzhHBOUM1aafm5AM9pKCaGPhxPslMY11pKdFrgxiszNWY3qRA8Rxhvb69WDjfwGsVs
	s8SxQtrBZ4eeqvR9FnY5ZNuBpdMeLmS73o7oz46iNq/lENdQ9ppoaDkPivRrAGOU+r25
	4kIA==
X-Gm-Message-State: AKaTC01JKjGZGiSlK+4QSuO5nRVr0TtKWwn12hOViSJejqMK3XtSuW7FOvm2AD6/+Qix7g==
X-Received: by 10.99.95.86 with SMTP id t83mr26713416pgb.0.1482129612474;
	Sun, 18 Dec 2016 22:40:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:56 -0800
Message-Id: <20161219063957.18716-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 09/10] opnssl-native: Compile with -fPIC
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:10 -0000

Fixes
| /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 against undefined symbol `OPENSSL_ia32cap_P' can not be used when making a shared object; recompile with -fPIC
| /usr/bin/ld: final link failed: Bad value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
index f2aca36eca..94672f90bc 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -5,6 +5,7 @@ require openssl.inc
 DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
 
-- 
2.11.0


