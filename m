Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcMqC-0000fc-TO
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 20:56:13 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so3846499iak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7LFCuVLi6gJVAeGVc6uzUs5IfHsvxXievr1SiMLuiOo=;
	b=CtWz+14QADrzaXAJkojlvARupmNCBS7AxWLW3Bmn6e385r2uvenfT7dhtHnoUKW5hP
	f/9bMbznB6hLHN0xN4FcOVGnU76FnhIN5LFs7uh3JfSLWd3o3m5ZBxp1fGJniF/+RInv
	feJj/mxO5Rsgu/R2JXJNmEJJnUi4yy/1Beejs=
Received: by 10.50.12.161 with SMTP id z1mr22730868igb.85.1324237752861;
	Sun, 18 Dec 2011 11:49:12 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	cv10sm10929303igc.0.2011.12.18.11.49.11 (version=SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 11:49:12 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 23:47:30 +0400
Message-Id: <1324237652-15618-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 3/5] ncurses: drop compatibility symlink to remove QA warning
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
X-List-Received-Date: Sun, 18 Dec 2011 19:56:13 -0000

ncurses doesn't use ${libdir}/terminfo. It is a backwards-compatibility
symlink to ${datadir}/terminfo. It is not installed by ncurses recipe.
Drop it to drop QA warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 98f45a4..1449f34 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -171,6 +171,8 @@ do_install() {
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
 
 	oe_multilib_header curses.h
+
+	rm ${D}${libdir}/terminfo
 }
 
 python populate_packages_prepend () {
-- 
1.7.7.3



