Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfGe8-000402-B0
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 22:00:16 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so837667dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=upqYeAZEz0mH4/hfXMuyod0T3I8/ELCp7t7CbBaRjGI=;
	b=V6wsjCuV0BonXgFE4BxPkXQQYlNnKxN5HAppPrOL+bedM2iwQiC+NPpH5EK0qL2GK3
	+Cdo4wsEwvgv3aH1R3qWu82Yp2mW9mxZvdDo+4lf/cthE8N0Z7DYq204SD1WnhqlScHl
	sAS+X0NHIrK/QFup+WI11J/4uh7hCq3ttCOuql+MvnkgorAolNUIYt9i3f6gHWVQGMy4
	sGL0E1wf87cdWyVi5oSA9I2+JbdiFw+QFJX9GbLXG/TDEHp9ZSmx7lisuZ8L94xFVmLs
	n8bLK2RbllLo3cH/sp4dOjAE5Ni5tPlTHVMUn/i6v9cZxQCIXuUnbGUUDlE2r66PqtuA
	tZtQ==
Received: by 10.68.251.130 with SMTP id zk2mr23850117pbc.19.1354481152840;
	Sun, 02 Dec 2012 12:45:52 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vx2sm5128699pbc.33.2012.12.02.12.45.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Dec 2012 12:45:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 12:45:07 -0800
Message-Id: <8db2a8dab66febf2844ac62cd207e9e40edec11c.1354480962.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
In-Reply-To: <cover.1354480962.git.raj.khem@gmail.com>
References: <cover.1354480962.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] libcgroup: Fix QA error about .so symlink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2012 21:00:17 -0000

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so:
cgroups-pam-plugin path
'/work/x86_64-angstrom-linux/libcgroup/0.37.1-r1/packages-split/cgroups-pam-plugin/lib/security/pam_cgroup.so'
ERROR: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
index 3ef1dad..7ac782b 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -24,4 +24,4 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la"
 
 # We really need the symlink so :(
-INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP_cgroups-pam-plugin = "dev-so"
-- 
1.7.9.5



