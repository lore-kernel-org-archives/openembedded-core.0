Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8962B7E4F9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id j2so3808138pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=rRocMv2r7xxaRjogDJYiJ2SQAMQZYdyrSvdu3e9ugaUjMwoOIXcIaPcbAGM2+LdXUo
	Mv1lAQURs1w1KOtsdjoQJljeuNRQTKMvCwN6oIYWNmRSjZbBiW/ms/aZErcXZDpmWfXy
	B41CXmajxBgznnNiUnPvrdVDAyllqQR2I6xY7s8YNDKg1GWBwB5un/RhD1ZmULvMNRJg
	sLxSIfL+UfsviEYoCQxarZlmRz31XZq8+bs+DB9P/ZlDbWx2Lsz6hLvYujZmX9xxw+75
	CN+Z65hBulIW5tOpfWlOZFNdR2NUVvroP+BNGi8hOTXKWE1vH75i/QXqZouVd+skjroN
	/BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=cNnVNRVogjV3ulFAJ+7y/hePQt4YIilzOvOlVL+nPvV7mIClu2swjqfvm8gxvIfE9j
	kwfRO8x90QNlBXVUsY+vl1TCW2aErbw44bfV+U+EZrRGQu4SybLOm0FXgtH+prBKK+ck
	IpU3zWLndI5J2HPdFLjMR9tD3SEsSInTWfsmslgQ9GTGmOEAL29H3uH54CNsv88JS1Xa
	h75V9ngZtYd/wz9EVNidoGecyxGbOOLK90w0oG3c1kvnfVCq/13VKLLBobtPXib48AzC
	ILtx3u8nTLx9UjuPIL8LYfs8zIQ82UBkhqlE0l1hTrbkbssigcAaruKYRudmH6mr4wla
	fJuw==
X-Gm-Message-State: APjAAAVsZ8d8CvQ0yi0TPCDouL0CRX/7KwUsoTVVy+FusLXPsCJJ9D+r
	twQ6ve4B6p1LrBeK2vip6SeYQL2Q
X-Google-Smtp-Source: APXvYqxRmjYlAVqGoyyMhqHncjHtDY9H7K7UmbcmPBswwbsIe5C/d3JNTtkB41YfjGafHFG/HCgZKQ==
X-Received: by 2002:a17:90a:2008:: with SMTP id
	n8mr16209979pjc.4.1560092047608; 
	Sun, 09 Jun 2019 07:54:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:37 -0700
Message-Id: <8086c4822ef26cfd7b92f3a3bab40ecce78e79a7.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 02/27] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:06 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ba99fb6..3326c0d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
-tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
+tar -xJf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
 ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
   ${UNINATIVE_LOADER} \
-- 
2.7.4


