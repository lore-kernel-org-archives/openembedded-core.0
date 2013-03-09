Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UETrS-00049o-HH
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 01:11:35 +0100
Received: by mail-da0-f50.google.com with SMTP id t1so71219dae.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 15:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Arb44HSvkFnGbpN0pED0wnA6iCU86cUMRg5QGYRctnE=;
	b=Epi5dAobokYhBQyqBfo4hV9VhShFWs2pWAa7eogS0wGO4Dn0dtnCA3lnHc/HnkCWKk
	1T0jiHz8lNk0wOHI5ZgOzhwyTgJ1jCtN83Dnn1U/mYkteUSP4lDSpv0prOEYFmFG6qCS
	C7Y8Dgx4+mAaBQHbDBCgvY032Eo+6qzqAJIelA4w488FIAGoS76K7rLPhhHxquzHnDWp
	zGq8zr9laUnKl1pAaLVy4liSERMxIlmQ2YjG3Ex+OSVt5Wm6D7BhNoYM/mFwukJ2BKkW
	foxq5lgPQOOGiJ5soKMdfzut/oHZF/JCs9UK3yxNay7Qd/zz1qco8hRbs1GxowBWx9gB
	85PA==
X-Received: by 10.68.11.135 with SMTP id q7mr15180589pbb.5.1362873298052;
	Sat, 09 Mar 2013 15:54:58 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp13sm12441718pbb.3.2013.03.09.15.54.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 15:54:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Mar 2013 15:54:29 -0800
Message-Id: <8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
In-Reply-To: <cover.1362873102.git.raj.khem@gmail.com>
References: <cover.1362873102.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] systemd: Package hwdb data
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
X-List-Received-Date: Sun, 10 Mar 2013 00:11:36 -0000

Create a new package to hold the hwdb.d
Fixes the packaging warning as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_198.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_198.bb b/meta/recipes-core/systemd/systemd_198.bb
index 381a67b..9fc4704 100644
--- a/meta/recipes-core/systemd/systemd_198.bb
+++ b/meta/recipes-core/systemd/systemd_198.bb
@@ -105,7 +105,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-hwdb"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
@@ -168,6 +168,8 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
+FILES_${PN}-hwdb = "/lib/udev/hwdb.d"
+
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-- 
1.7.9.5



