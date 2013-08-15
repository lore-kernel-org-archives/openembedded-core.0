Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id DAE3E6B8CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:01 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so183018eek.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Z1zypesdVkwIH8hFyhKUE0QuaZxhZpPc3tEirXeQA2Y=;
	b=gH7fAfXueEwCYJ7oAktstD1WkvQgVfXbRfvGTbxYXq0mNvrmao6sRYsvskzd70Aj5D
	8tVlwK0/a5I9lepOtaLgrLYehMWJfxrJxhay7VlfMTf1dhcM8e4H/uvZX0KH2XSsi/c0
	DYbsOfjeB8kIc8/G4Xx+crtT+FELrVqFIbPCNUaY+7037DHqy2ojcEhhVevRIPkCMmB+
	/miTQjw2niWhyfX5Y6oCv75PAZTHwGi6QvESRpBnjwsTUHnvv+ZnX1xojtEfP+o+DXu/
	sY3piTdyYMnLkJOvv5TrpOwLeJvvdXbMMvPRLzcblgDIK0/WV6XxflKwVJGjI1lfmvVR
	33hQ==
X-Received: by 10.14.47.73 with SMTP id s49mr570317eeb.71.1376551382343;
	Thu, 15 Aug 2013 00:23:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm81957095eeg.5.2013.08.15.00.23.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:18 +0200
Message-Id: <cb9cc7b8e22b322514913e6597fd0a1bbe86b109.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 07/33] systemtap: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:02 -0000

* systemtap-native was failing with undefined AC_DEFINE
  configure.ac:56: error: possibly undefined macro: AC_DEFINE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 22f8959..9bba5a9 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -20,7 +20,7 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.3.2


