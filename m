Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlXb-0006nu-7K
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 13:55:51 +0200
Received: by fxm19 with SMTP id 19so4766254fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=YJioOykzyDe4VIVw98p8/xM/HfBVW0JhrvVF4FkZoYU=;
	b=wBBFf+zYs8rq7FBI34nh0+zFM1o2ataSS5pFDojZJMfYm+bTICno780XqQh/pcJm2m
	YaeQBYSVlkRJUg/F2jG6kcsz/Beo1JNTTsNrlsjlZHLUNhoaxF0fCWujEXHjGMV3pERe
	q+DBsxO6k0n/P+vEUEAujHdEcmKlHOWG7jf9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HJuEm11meTICla7xvm0wTPTQfUM9lJwM5Whl4UJFHmUZ8iSqLStnGUxPG/bOdwAnz8
	jtzeP8qA4VcSjJz8QumH0hQ7Tf88DiEnTwmJ0a9GlGZpHtGLCRNWmrwgsWZerMpKrRUn
	qtaWCnFYdSbrL6EFcW0K2VLAoCMY/jTRQvNhc=
Received: by 10.223.106.78 with SMTP id w14mr2434572fao.35.1305028384430;
	Tue, 10 May 2011 04:53:04 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j12sm2352787fax.9.2011.05.10.04.53.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:53:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 13:52:41 +0200
Message-Id: <1305028361-24057-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] procps: use u-a for pmap, otherwise conflicts with pmap from busybox
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
X-List-Received-Date: Tue, 10 May 2011 11:55:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/procps/procps_3.2.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index f694612..b1a7de7 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,13 +1,13 @@
 require procps.inc
 
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d update-alternatives
 
 INITSCRIPT_NAME = "procps.sh"
 INITSCRIPT_PARAMS = "start 30 S ."
 
-ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill \
+ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
                      ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
 ALTERNATIVE_PRIORITY = "90"
 
-- 
1.7.5.rc3



