Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjQ2-0003uB-9D
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:02:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3288161fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=OrtCa6HPAe6gERP4I9yIAiISLIKzE8JbCumiXh5t1M0=;
	b=goA0vBo0tnTzClYDffZhzvY6Ujn6w+wgon7nGhnHFZjISWpOUpC/WYddxj3Jka0N1J
	h2He1zwKfCmOhwF23AqG0BOC9l9P+rpguCQ2COxocKoSlrxRgHRBsY5Ddd/KmupKpLxR
	LAcf9cquTyuF2np17SOge/M1ZjKGt96wwe4nE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bTdZFBEd3e0f9IH/TlGOxzEl5Sd8gNuvbuCoxjASQ75Mnt1ACDQddBY4NHkeggSSAY
	Ga9TUi1eKm0Zs44hURByT3aFYGaykpeFaE4rB+IpMxgwdbd3RB1EwEzKVfZTE4/3LZ+j
	dg+PM+H/D40IINC35pKWYzZ+hxlHxTRp8JPY8=
Received: by 10.223.17.141 with SMTP id s13mr2169173faa.23.1303113631873;
	Mon, 18 Apr 2011 01:00:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p16sm1571586fax.45.2011.04.18.01.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:00:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:00:30 +0200
Message-Id: <f78273c64ab21b1a0691585a2140d5fdf24f3f3a.1303113405.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303113405.git.Martin.Jansa@gmail.com>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Mon, 18 Apr 2011 08:02:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/tasks/task-base.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 138e617..10f3af4 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi = "\
     acpid \
     libacpi "
 
+# Distro can override apm provider
+DISTRO_APM ?= "apm"
+
 RDEPENDS_task-base-apm = "\
-    apm \
+    ${DISTRO_APM} \
     apmd"
 
 RDEPENDS_task-base-ext2 = "\
-- 
1.7.5.rc1



