Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50AED7EA44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 16:51:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so223441wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mw0yxcM0fEPGSOH3Yu3K/VSDSjiK6l5Mn2oosoaMUjY=;
	b=LCxBhptkaic3qJuRAoS2/nlxd/BkcfKOn4L6G/9IYqC3TClW7LigKwdiGdEDPxa7oq
	1tuAeMGdt+Sdb1Ve6eKEJN4rQ3Pa/tajoADxsmRlMiNJwtWop0Ayu7I1hgBZzHTIPRF4
	M9VeBKhf0HmQ7ELZqo+r/2BTJwH2R2eEJV9eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mw0yxcM0fEPGSOH3Yu3K/VSDSjiK6l5Mn2oosoaMUjY=;
	b=W2JwqwwCW2pjyR5UXNHKBEbMZlM371JCX/VCjHY5h+VIe09mMzCEUKnz/1al29HOb9
	8bE215kLzGgQ6jvckYeb0rzm2JS3ae7F6TepvjLZmbj49l7H6xjJd0pdwfG+t3z9DmZ7
	hDZURfuTvvsi3nt/4c4wRGwlytbnjtchAkCXFGw2r8d2BRiPqkmYVW4ywINzjANUsg1N
	XGrLpVi2dtq/hpy1HKPQOkbxavnrUXBwogs017vbJmBl0NXQxt32J24geItV9WqaD25G
	RmuG7N+3Prbey+3Ci1UP4s5WIOlElPiaAVed6zfKQLR7m9u/3sI3RH65Nc31MKRpttgm
	sdMg==
X-Gm-Message-State: APjAAAW9WYixNj6a83hteFR+I5wqmdL34d7p5Rr893E+56L5BkiSSpSN
	n1+czZ/1ZWVDHF/CdwTHYlYZ2KqCFWw=
X-Google-Smtp-Source: APXvYqwJCpS7ALQT0ayollqQLqo7g5BhtxyGmmRCJZMgY3k3wDJ2eH/bQc5jGfQC3MRajGz3zyEY7A==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr9715605wmi.0.1560963104756;
	Wed, 19 Jun 2019 09:51:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t12sm22374716wrw.53.2019.06.19.09.51.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 09:51:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 17:51:42 +0100
Message-Id: <20190619165142.24867-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] openssh: Add missing DEPENDS on virtual/crypt
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
X-List-Received-Date: Wed, 19 Jun 2019 16:51:44 -0000
Content-Transfer-Encoding: 8bit

Changes to libxcrypt revealed a missing dependency in the openssh recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 0a5c2ffae5f..35cdf71eb30 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -8,7 +8,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
-DEPENDS = "zlib openssl"
+DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
-- 
2.20.1


