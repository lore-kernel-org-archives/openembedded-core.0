Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BF55B6AD33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:13 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so2943159eei.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C99HVPrP1vB38YfvNAbyLDWBnhrVBJL7nt0NPSSVV6M=;
	b=YWopfbmKyNh6gOdXuwtMNe+Mzv+cblcOkNiwxg/wfzf+0DRfb+3Z5wS9Az9i1F6Cws
	uYTVH01nHIOebTY3rnEqERDpkcpUOW7sAiC/kngSD0hIZfI8LOidrn/TKNxiThAe1rTD
	ANf6E2QMnUDzcGqSXDc20OEsYpfGqSghnixRhmP/gwpLEDJeBWkXcxINbS7mG0NJc5BY
	0uw6Ytur67iDUY/+TX3O56uC87hXzPWWV4p94tB/z0D/rWgJkkTM/rIrNQWxFirO5/2R
	Qm+tTzZCc1C6TtLOLlHDqNBCjkcTz002Zf0+C/9ktVOHXSJJ1HHa7POjUthaRJHL080H
	ix2w==
X-Received: by 10.14.204.137 with SMTP id h9mr20732443eeo.13.1374332234081;
	Sat, 20 Jul 2013 07:57:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm35901245eeu.4.2013.07.20.07.57.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:22 +0200
Message-Id: <2db88bbd0f4ee37dcc5a5d76ff0b9f8874d37bae.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] subversion: add PACKAGECONFIG for sasl
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:14 -0000

* cyrus-sasl is in meta-networking

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.6.15.bb | 2 ++
 meta/recipes-devtools/subversion/subversion_1.7.10.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 244d7ea..ef679b3 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -20,6 +20,8 @@ SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
 
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
+
 EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 9d189fe..a24edb5 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
+
 EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-- 
1.8.3.2


