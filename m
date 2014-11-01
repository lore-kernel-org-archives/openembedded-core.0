Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D7F8571F1E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 00:14:30 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id n3so2563785wiv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 17:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4I46LebFnFc1ixpFdiGuv2/fd3Jwb/iNdtN3VxbvzuU=;
	b=N1734yAyDTJDhw3j/6O2Qm6/O+rF3FL4XeL6ooOFzl986TjPydQyhl7gRuDjb3t+7L
	BpJpshg5iRWWdrMPA1tFGVg21NCF4H7VV5Lq/7TDU2Kus3Wf/NnydCHa77NrhmmwrirA
	wrcBL7eyARzCtxkL3FhFzCc1LEg80QredTnd0XOqWnDod6YdAXDLXrd7+o3vYtk0KkS8
	JS74/+x36JRRqdk+szxddNliyRew9xilC6evyl6QZpAGsGC340fYfGa5ZvkWL4erINm0
	4spS4egt6ygcocVXWEQXf8cKo/5hbY8+77aMG67sCz80gWX6gz7imf7YS1cYK7ov/zDK
	wu8w==
X-Gm-Message-State: ALoCoQmipBmDQact8Qvjj8PEdG8NbC+kgKDaGgnOlNLsQfYR/BmrUAvURvAdsUIG/RbOBmGzpj9q
X-Received: by 10.180.79.169 with SMTP id k9mr591731wix.34.1414800871295;
	Fri, 31 Oct 2014 17:14:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b6sm305511wiy.22.2014.10.31.17.14.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Oct 2014 17:14:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Nov 2014 00:12:41 +0000
Message-Id: <1414800761-14649-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] acl: add acl dependency to acl-ptest
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
X-List-Received-Date: Sat, 01 Nov 2014 00:14:32 -0000

The acl test suite doesn't work without the acl binaries, so add an explicit
dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/acl.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index bc9fd6d..b2bc8ba 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -36,4 +36,4 @@ do_install_ptest() {
 	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
+RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
-- 
1.7.10.4


