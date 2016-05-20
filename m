Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 253166FF25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 12:50:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2016 05:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,339,1459839600"; d="scan'208";a="107492315"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 20 May 2016 05:50:54 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B67256A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 06:38:23 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 15:51:20 +0300
Message-Id: <1463748682-22067-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
References: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] libsoup-2.4: provide PACKAGECONFIG for gssapi
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
X-List-Received-Date: Fri, 20 May 2016 12:50:53 -0000

Fixes this build error:

| ../../libsoup-2.54.1/libsoup/soup-auth-negotiate.c:16:27: fatal error:
gssapi/gssapi.h: No such file or directory
| compilation terminated.
| Makefile:1166: recipe for target
'libsoup_2_4_la-soup-auth-negotiate.lo' failed
| make[3]: *** [libsoup_2_4_la-soup-auth-negotiate.lo] Error 1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
index ad8202c..f243cbc 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
@@ -21,6 +21,7 @@ inherit autotools gettext pkgconfig upstream-version-is-even gobject-introspecti
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
 
 EXTRA_OECONF = "--disable-vala"
 
-- 
2.4.0


