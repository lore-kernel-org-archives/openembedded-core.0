Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 589897897D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 139so9981710wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IX9Ss+QnG+1niCTQPI97MkSTFxqt+nyg31UWhTE8HWg=;
	b=FFrHUoAK8lG1j29VVjYneqcLVJniGOhaBxjqIj+RyuCVfeiWOCc0u1UZc1ReDtTx+s
	QRGzao3keBxki5EuM2T8k3h1ssM3OyOjWk3S6tQFJnmuAZsk027x09KGaxteSrEUMYXh
	lJQUR78jB89dn5iIfpleyYlLjMU3Y5v0z73CdEQsyKJlN5xITmOPe0uRDX5rwkdL+g2V
	r3dbC5l5y82/smWD3Ad7rj3F/ZR3H4AlGFcYorSe2MJBV3XoUFDDMvGBpEvXUpfJGbrB
	tddVvuJtIj+ic5HUj3ES2Raahj1Qoo1cXQ8e8pI4wWuneO/dJsqa6K1LnnFrOZhmzaXp
	LFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IX9Ss+QnG+1niCTQPI97MkSTFxqt+nyg31UWhTE8HWg=;
	b=dF+EIelEJMmX2DKEbhG0hd1Ug1mdiHnQGljzq5JVd5DcQIpSoq+ou/928PIbOmiLfD
	Jk/rWQ63Gi3PXBrwX/BHm9Dfqn8n7iaY8KvkzR9MdNi/6lTtEkz37HT5G2J+0Zu6rSaH
	uv9Vi/rRi7nFad8w7nnTaWComaMOpHO+J56fFECteIpjnWSXW5lZ3LH0cqWqCQSISPtP
	HizvSD6/jBro5kHiaNxkVFGVQXU176KEq/kdrbsVBEwl32z/aMyUZUKgrUOzaI+LWOmA
	Q9QEaKyzHBUZW5klPhM0j2vf/P7OQA38WpOe0NyX4Izxdo1lVhSTOVjrZI8UD+OE7bBs
	L9Zw==
X-Gm-Message-State: AElRT7FMIV5uWb37Jri3l/jBktPnvjI+uMK7FoDdgvN5JpACLXgk4xs1
	ORrmdl0LE5hY0+dTJi6mvZke1g==
X-Google-Smtp-Source: AG47ELuehEmRv/dFFg1BiREY2NpsnJi0GE07QCs4oO8Y3rNpK+7IwLB4EkDfqxr0Fg6o/CaEIfRceQ==
X-Received: by 10.28.210.81 with SMTP id j78mr1901415wmg.55.1520728999569;
	Sat, 10 Mar 2018 16:43:19 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m9sm8295158wrf.13.2018.03.10.16.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:43:10 +0000
Message-Id: <46eeffd1f3886c633a7586562b1ec67508650528.1520728804.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 1/8] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:18 -0000

* this doesn't work correctly as discussed in:
  http://lists.openembedded.org/pipermail/openembedded-commits/2018-January/218460.html
* some of the issues were fixed in master since then
  but not all, so revert it until it's completely resolved

This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/waf.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index acbda278a2..c4698e910a 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
 
     return ""
 
-python waf_preconfigure() {
-    from distutils.version import StrictVersion
-    srcsubdir = d.getVar('S')
-    wafbin = os.path.join(srcsubdir, 'waf')
-    status, result = oe.utils.getstatusoutput(wafbin + " --version")
-    if status != 0:
-        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
-        return
-    version = result.split()[1]
-    if StrictVersion(version) >= StrictVersion("1.8.7"):
-        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
-}
-
-do_configure[prefuncs] += "waf_preconfigure"
-
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
+	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-- 
2.15.1


