Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id D270E6B8F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:11 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so182241eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=f+yVUYFUqbdT5ZcvB5J2AF1xbVSDkG7pyokcUoR0EEc=;
	b=aw4A+SjcIHkLBQtkoWYPyNKfqEzqXWw76AnPaC7YCgDPiGA78XIQJflkP5gqgTNUUa
	1dhB2EC7WVphadyFVdCUKON2FvK7eXfxdigFuhUbs4TdjWll4T+xK46hHLIbYuoePdO+
	gq6/PXE2UEDy1pgsVZTOOWht2ER5cpAdqzWU4wmh0+hnVUHI1KlAynz6wTEl+7bxb6Q/
	jySiJy0fqzIXHMHWcVe0RNchQF3LukEAq3uAPYg8I2tabsAP+e+8ruPEI3PgfkNQA/Y+
	QZXsMChCmMujltbtVWk4TNCGROy9CoIuR3/+cVmhhSktURhnRZ5oR8ve6JhvkzFsNkEy
	aEXA==
X-Received: by 10.14.38.196 with SMTP id a44mr250293eeb.78.1376551392315;
	Thu, 15 Aug 2013 00:23:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81969710eeb.11.2013.08.15.00.23.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:26 +0200
Message-Id: <6855a42836977f266a8b7f2dac256370eecb9163.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 15/33] quota: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:12 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/quota/quota_4.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index f3c8fbe..9835f06 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -21,6 +21,9 @@ inherit autotools gettext pkgconfig
 
 EXTRA_OEMAKE += 'STRIP=""'
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcpwrappers,--without-tcpwrappers,tcp-wrappers"
+
 do_install() {
 	oe_runmake prefix=${D}${prefix} install
 }
-- 
1.8.3.2


