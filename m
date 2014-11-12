Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B64DC62252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 14:09:57 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x13so14247290wgg.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 06:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j2RpfSxTvh7mshv8+lyxcKD/nJj/DG86uI+kiCs59HE=;
	b=FCjd21RnnEUueOV71WKSdE4Dbw5NzYFO64C1oJIXtCBXdI98+maZHWMviCiHje+2nz
	lQRiL5ZWQIEpzTgq754Ob1gM5mmZb/xeyi6cjZBhMtN6wJWw8Ot3cRhMPaIYHDRzwV8X
	oH72emnzGl1gaQx9Q65pIBD5q1iuHKMDH4x9lInisx0QPGs9sAupBq3fWf3/4M1xxCiL
	o/8RsMTzLROASMZzkVp9wTgQ1iGfrDi0++Xsq9CHTGPJUvHg5Tdgf/fSAcdwrPurl3Z6
	C3TtH2b56yTJApBbias3uwzrKhy9Tz1o8Ax8yxSMRyqAA2kjDAA3xlNK5blqXZICjgmo
	rA8Q==
X-Gm-Message-State: ALoCoQmbZe29exETUMd9FpPzCIWhXAcHsEno6h/IpDDWQoYSK+2HEVQZIE1IOH+Jxdkw+UWiS7mq
X-Received: by 10.181.29.74 with SMTP id ju10mr6338878wid.10.1415801396707;
	Wed, 12 Nov 2014 06:09:56 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	s10sm25856266wjw.29.2014.11.12.06.09.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 06:09:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 14:09:45 +0000
Message-Id: <1415801385-10076-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] docbook-xsl-stylesheets: fix do_configure typo
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
X-List-Received-Date: Wed, 12 Nov 2014 14:10:00 -0000

do_configure was incorrectly spelt do_configre, which with recent changes to
base.bbclass mean make clean was invoked, which doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 95498da..2a1bdc4 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -19,7 +19,7 @@ BBCLASSEXTEND = "native"
 SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xsl_stylesheets_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xsl_stylesheets_sysroot_preprocess"
 
-do_configre (){
+do_configure (){
 	:
 }
 
-- 
1.7.10.4


