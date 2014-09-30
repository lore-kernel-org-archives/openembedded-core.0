Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id B84A565DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:39:23 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q59so3863229wes.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=7axNHEKqDeupPkFQlOEF94eFlzgNtmhatBsg03qtgDc=;
	b=pV6u5dVgps7Cwi0wC3JhCrq2B/G5KVb2QAFNoIjTFOgJSEOx/H+RkerhbmjKMIAjf/
	PEsBtTnwSjVUJOqfczUeC/Eun5atZPbRC2vAzAUF0Uq8PdF9yQzsFM2QAq4Use+I2F3I
	a9JiL5SHSEQHVAInGKN6/VzOdrPYCwRs3osoR6bK45zcmiYz6572PyJtNUT/ILWjZKZT
	0wI2n7j1yc6X3/QIfP6JaHkTxhaCIoztAnir3NkbyAWNyiMMwq5tqC+lL8/uQbK/6wOO
	RszrWYLbRVzqfhWz7eP4nSTMZpqf8ZGSW33RxXVKbPJQBpl9IrfQ/Hb1GHKtioJhfw6n
	NOYA==
X-Received: by 10.180.83.69 with SMTP id o5mr3482070wiy.41.1412084364033;
	Tue, 30 Sep 2014 06:39:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id
	ll20sm15218949wic.14.2014.09.30.06.39.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Sep 2014 06:39:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 15:39:16 +0200
Message-Id: <1412084356-4002-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] gtk-doc-stub: update to latest commit
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
X-List-Received-Date: Tue, 30 Sep 2014 13:39:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fix build for packages with AC_CONFIG_MACRO_DIR set but not shipping macros
  causing:
  | ln: target 'm4/' is not a directory: No such file or directory
  | cp: cannot create regular file 'm4/': Not a directory
* In 2012 version was increased to 1.1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
index 9ceeeff..40f3243 100644
--- a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
+++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PROVIDES = "gtk-doc gobject-introspection-stub"
 
-SRCREV = "3dfd0a09de696ec8c544762747f8a0f77153622e"
-PV = "0.0+git${SRCPV}"
+SRCREV = "1dea266593edb766d6d898c79451ef193eb17cfa"
+PV = "1.1+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/${BPN}"
 
-- 
1.8.3.1


