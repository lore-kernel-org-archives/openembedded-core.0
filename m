Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPalK-00088P-5H
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:42:38 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so541647bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eKgd6utnTPV+9FzJZTnmwxiGRJdtCyDi4PQWKou2dGo=;
	b=K3sN6GNv06lAkHb5II0o2rMQwQ2LSw0XXbfAqw2NEobE7fLQHoUlb4S3XwWVYBJ2Vn
	JhWLUXvxSq5CZrz0OaGMsItW1oxEnGq1vhdvpjbIt/0hpHEbpG1d385ZAXQqCTzGNGkF
	eu/Sa3wjkpSxcTvQGlrbFVbW4oLPBOOIiz64pX4+0KT+WAnflbZ1rcQYDsIhq2SiHLPj
	fWmKAcGmWnzWVBn4e9F88avjDRLf5gzwgHKrrUv+t4o75QwMblTexLipo0GeuKi5y4ca
	aGrYUYnF33ofYI1bty7mQcZTuTQRQ5ySQzLnicQVKS+2ReW7dg/pCf7h9Q+jkp9PzfPU
	UETA==
Received: by 10.204.130.1 with SMTP id q1mr10061316bks.70.1335969176102;
	Wed, 02 May 2012 07:32:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n19sm4298547bkv.14.2012.05.02.07.32.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:32:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 16:32:36 +0200
Message-Id: <ebc0c97cd803f441abd0691bf5d5609b6a9f5261.1335969047.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <8bad5055c1e2074bee56611b8b42477086087159.1335969047.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<8bad5055c1e2074bee56611b8b42477086087159.1335969047.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335969047.git.Martin.Jansa@gmail.com>
References: <cover.1335969047.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] site/ix86-common, site/x86_64-linux: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Wed, 02 May 2012 14:42:38 -0000

These are required to build recent versions of glib-2.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/site/ix86-common  |    3 +++
 meta/site/x86_64-linux |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index a625f8e..20cac75 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -97,6 +97,9 @@ glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=4
+ac_cv_alignof_unsigned_long=4
 
 # guile
 ac_cv_uchar=${ac_cv_uchar=no}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index a0a9362..3acc294 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -52,6 +52,9 @@ glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=ye
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
 
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
-- 
1.7.8.6



