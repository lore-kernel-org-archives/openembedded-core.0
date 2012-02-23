Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b4Y-0003xO-2d
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:59:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so619839eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:50:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.101.141 as permitted sender) client-ip=10.14.101.141; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.101.141 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.101.141])
	by 10.14.101.141 with SMTP id b13mr1196403eeg.92.1330012250938
	(num_hops = 1); Thu, 23 Feb 2012 07:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2qXUYriHGmVOvzHO9Z5aTKZQRwbay7FQ20/XwDhK3co=;
	b=gp99LQCiUiYosfb6GroW2hLyVMNX0glLzTLi+yyjRp/XTQzxJb6+/+PFBLU5XSCeAg
	7WSZuXQkV4r3PscRB3kT+/kikQn+F0JM2CFODyn+ff5GpDjhj1QU285WrZeRaO4MNEjV
	TBIv8M2+blszEBROsTCkRoJK9oiwlG6noXL0E=
Received: by 10.14.101.141 with SMTP id b13mr937212eeg.92.1330012250747;
	Thu, 23 Feb 2012 07:50:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm6618549eef.10.2012.02.23.07.50.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:50:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:50:26 +0100
Message-Id: <a03ab99c268c3285f622516e590cdad843572340.1330012029.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
References: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012029.git.Martin.Jansa@gmail.com>
References: <cover.1330012029.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/11] apr: add apr_rules.mk to SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 23 Feb 2012 15:59:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/apr/apr_1.4.5.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.5.bb b/meta/recipes-support/apr/apr_1.4.5.bb
index be465b4..2374d30 100644
--- a/meta/recipes-support/apr/apr_1.4.5.bb
+++ b/meta/recipes-support/apr/apr_1.4.5.bb
@@ -41,6 +41,8 @@ do_install_append() {
 	oe_multilib_header apr.h
 }
 
+SSTATE_SCAN_FILES += "apr_rules.mk"
+
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
 
 apr_sysroot_preprocess () {
-- 
1.7.8.4



