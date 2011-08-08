Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QqKlx-0006PM-R3
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 10:01:17 +0200
Received: by fxg11 with SMTP id 11so4418436fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AiA1+RdQYlfHK3tAvGEj2O1FvxY/avOpH3IRuAe3YRU=;
	b=tq5pvqn3eNoZ4wpQPU2XzS8tPRvY7TK6a4s+MaYPsBFdIb2glV7HxOcthSUewpK9FB
	tH5Eyb7vWbzXl5Wrn1lQQhA6u/VvCvPzWwjpeVGInEPtlHyaAwxdn/PW5gp60p1IY0Dm
	7eiRdgRI2rgGDA2atysxSKA4wH8E4K1HoUHac=
Received: by 10.223.159.4 with SMTP id h4mr7353807fax.57.1312790210062;
	Mon, 08 Aug 2011 00:56:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o18sm3966348fal.23.2011.08.08.00.56.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Aug 2011 00:56:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 09:56:40 +0200
Message-Id: <1312790200-7205-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <4E38336B.8010604@linux.intel.com>
References: <4E38336B.8010604@linux.intel.com>
Subject: [PATCH 10/10] eglibc: remove PACKAGES from eglibc.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 08:01:17 -0000

* PACKAGES were defined in eglibc.inc as well as eglibc-package.inc, definition
  from eglibc.inc was overriden from recipes including eglibc.inc only

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1b2e630..0f97f82 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -41,8 +41,6 @@ EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
 EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
 PARALLEL_MAKE = ""
 
-PACKAGES = "glibc catchsegv sln nscd ldd glibc-utils glibc-dev glibc-doc libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
-- 
1.7.6



