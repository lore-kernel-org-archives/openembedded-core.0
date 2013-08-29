Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id CA1876BEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:19 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so344665eek.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=G1NBsB7BokgorgSry5jIRrfI2ImQzEPZL/Z5LC4S/fY=;
	b=lS5Rog+XuVh40J4XMcxc5ZEOPpqWD6rTtY2ubroTWsivQSNQxW7DJn/v4nAZ1Xcntn
	qMAGD6ZM1zG8OJPEGYnoYffcS0io8Rk9HigvqoS2NWa9dGWMLFOPolmaIwGK+h4LOcvU
	FEtD2FjtTCMcFb0iccMGTcmDEhTF4O7ldr/tvavaVnsR2YNrIgjRo2HETITQjDygBKJV
	K+XZuCnfSosEKOrPWA/C8icTDaYew0yeAQiX/yPgGLr0guYkQDXknH4efZaNCubc6nrM
	7vMVhLFo7OkkVdxmUd5WRKRrx441cvFaQksrZn6MhwYDzWxEgho4DLN93sXe99A0LI51
	CCGg==
X-Received: by 10.15.48.67 with SMTP id g43mr5504382eew.17.1377792140135;
	Thu, 29 Aug 2013 09:02:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47243284eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:06 +0200
Message-Id: <32476859fe5a291da5acc8f1f57e0c11d32e1100.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 19/20] systemd: Add PACKAGECONFIG for cryptsetup
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_206.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index f05aa1b..0511813 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -50,6 +50,7 @@ DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.8.3.2


