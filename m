Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA51774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:53 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c24so535528pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YZGObjNbW4SQ9Mmoqt8kq67x3IoiGEkhlYa12PQaBMg=;
	b=MGkjozS7qrV5E1bowdE9bOpnm2RZgKb3ZZZOE0rf1khRaCDjrJUDBefJw7u/kiphYg
	U8u3uQlwaiQO9nDexXOYI6JTLQJKgJtZRe/U7cskwEtkk+CQ0eOK9gE6Q82yc0+egJiC
	UOPyJsik1vKysGiLTTNQrUXjnQ4PwE9408fFRUvherWUhTltdAV1/SPILOYcAFfKwIis
	M9XuECDSVZMGPqb0leEJTNRyzvVfBCmGpfV6b1IwkANTUhs8EGbUMV3mdrL5bthI7aTn
	swZUiz6UBDlkK/y0uAvjio4qtC/Qq+tpfeRV/cP9fyRhOCwmog4dlMhqrA8520b4hy4E
	AcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YZGObjNbW4SQ9Mmoqt8kq67x3IoiGEkhlYa12PQaBMg=;
	b=eVlnb2FF7ptu+jnlFCdhjmkMuxRIS+KVEL+R9gMmf83SC+8cgtuEvEGx1KGTNFMY9J
	2AXFAZrA2tlu97QpD9Hmltzp+vfT1/vpPmIo7cJsZRRAMlWaOJRFLMqP4Pe4sz6PqHbj
	Bv2rxd0NCsp7BzkKELRGVH5PmeNkpNm+dWm1wM3x+LTwGQMpVfWmm0Z5ZpImtSQwhoY0
	ZZu7v8XI12im9Y0tycL6VoHS31+A2wJsKROTYYbHKi+vnUnIbzEUd7A0sc8vm1pjUJwQ
	CYFIsdSrqjWTYZWsQnZWSiBdMXCL2vTEWvw8Aa8adXHDVtNVPFzl6HtZGcogwfXu/rDi
	lrHA==
X-Gm-Message-State: AIVw110nCSqgL/6kvlFCiZs0zUpJN7ElDhzlbZE3fBr+e5tDCvj/A1+l
	2TXqwduXsZDp1t/l
X-Received: by 10.99.186.83 with SMTP id l19mr26198431pgu.44.1499351634874;
	Thu, 06 Jul 2017 07:33:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:14 -0700
Message-Id: <7598a351028a710f6651f7924db1f7dea48dcf03.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 13/22] glibc: Enable obsoleted nsl
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:53 -0000

libnsl has been obsoleted in 2.26 and will be removed in future
until them we enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.25.90.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index 0efa9e6e02..600beef615 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -75,6 +75,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
+                --enable-obsolete-nsl \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-- 
2.13.2


