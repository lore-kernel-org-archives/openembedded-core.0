Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 384DA6B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:24 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so190080eek.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=e2l9OmKhoZOjl2hAYZpvNo6Gtc/zFzqUtt3VVWVymXU=;
	b=WPH/qYk1y0ij+p3FjsPc+ax1O+fn3ty/+ilWHENwXl1B14lvSDug0aVBDScLntYBfI
	d9P5yKOfvIwrX14fS5F6DPC81YgRGBqME+JWvUeowsJ8IYyi0kIwvCeOpYk46LxbLx3N
	LByUO1c284ZlKIEpChegBta2Dr4oOTxhj17V3DiUEyBHFn0LadXgJmUY+zlvreOdIs6s
	QdEEs4tS8aAb+2egufPkHQXL9dsA7JehPc418LGhZw8isjLqdMNLDd8nt2VAw2oho5R/
	t2swW3OyaH9AnlpBYCMuILPWAZDLshFsVBAHw+tMiUI+UVdG4T6NMZcX9Jyi5SLQsA5Z
	wvpg==
X-Received: by 10.14.201.68 with SMTP id a44mr11444474eeo.46.1374667344452;
	Wed, 24 Jul 2013 05:02:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm65593435eeb.13.2013.07.24.05.02.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:27 +0200
Message-Id: <930808d0bd4f1382a888dd7a6ae2d0788703c01e.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/18] cups: add PACKAGECONFIG for acl
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:24 -0000

* acl is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cups/cups16.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups16.inc b/meta/recipes-extended/cups/cups16.inc
index bf155a1..7b8ba06 100644
--- a/meta/recipes-extended/cups/cups16.inc
+++ b/meta/recipes-extended/cups/cups16.inc
@@ -13,6 +13,7 @@ inherit autotools binconfig
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 
 EXTRA_OECONF = " \
                --enable-gnutls \
-- 
1.8.3.2


