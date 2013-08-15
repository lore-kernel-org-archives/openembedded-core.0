Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 91FBB6B905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:15 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so182473eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=KgH+z3zs8LRDiOohbwLSa9gu03nIVQjuLrfeMWAFPzQ=;
	b=fiWzVQOOuFx8+m0/9mVAwgI9i4UOUmZbIompBGyPm3e/37bxjKIPoCnBcsWwqybaCQ
	wjXWU2uGM8qu60CRF3J0DadquBFGS0h7OyIEBQO9ZtWUVy4mGl0z7v1bVz/J/qQ/yZaP
	EysrIpNfmUTbhxe61aYOSVtPXTpyYqL34/313XunUXtWZUWt7rpD7W2QdpTBvlzbk3Mc
	ptr/s6Zf+oTA3n0anm9UzzgEIzpm5LNG0hA7JuxN8SRKzPMVroE76xXASQk5SpzM4MG9
	MGpx1PG6eTwhfZq1vnbYgg9WN8qbdwEW3IVlXYwe4d4rsIdKyEgku4eiHrVwvvKERxxA
	lv8w==
X-Received: by 10.14.174.68 with SMTP id w44mr10777072eel.50.1376551396030;
	Thu, 15 Aug 2013 00:23:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm81975123eel.12.2013.08.15.00.23.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:29 +0200
Message-Id: <6ef462e213b20f113529f140a978a3b2d0a7b410.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 18/33] cups: add PACKAGECONFIG for acl
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:16 -0000

* acl is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cups/cups16.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups16.inc b/meta/recipes-extended/cups/cups16.inc
index 914c3f9..b7fcb1d 100644
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


