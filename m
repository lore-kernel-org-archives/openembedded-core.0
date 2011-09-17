Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R53IX-0002Z5-Bk
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:23:45 +0200
Received: by fxi1 with SMTP id 1so3133321fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WMMdrbC5hxxbMxI0lTuBGcRauPEIOZe/HPEnonrwQRM=;
	b=PJ1PuutwxtYnJhlRMo3N9Htf+Z+xikIqw1sep1X+G548gUx39wT/ta3hXLDnUtYX3T
	DbRvpJlEYL1TXAaoOt2b9dFjsBE3po0ZF3VHKwziPxZQJYrkEX9aH8WmkufbTgbgm9RS
	CoK+5xKf2GGJ8Mg4fUvRtDISRXnu5CGuVyz18=
Received: by 10.223.6.26 with SMTP id 26mr1970535fax.40.1316297911264;
	Sat, 17 Sep 2011 15:18:31 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l20sm16037887fad.12.2011.09.17.15.18.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 15:18:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 02:18:13 +0400
Message-Id: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Sat, 17 Sep 2011 22:23:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bc1baa0..c577011 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,7 +451,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
 	bb.data.setVar('FILES_' + metapkg, "", d)
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-- 
1.7.2.5



