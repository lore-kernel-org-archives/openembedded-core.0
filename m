Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QmpCM-0004sn-32
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:42:02 +0200
Received: by eye4 with SMTP id 4so4982989eye.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sKLk/bxSaeMCe1fBfNk1NABF4zZi9hSJm/SlgmmjKA4=;
	b=BdSlqQ4wrgjBVGGLEuevAKX5kx5HnNdjaSAUr7iprMnTFVNFKfYzqY/NowfNTDiiMN
	ZGGpCUw5U8DuvGzKURuSfn2nJhfLRBeH3mgtfVDOHov8AcWS/G6bd67nK93ATk7KEGaz
	pAop8x87BlaGykoqdgFVFVx2+rUdDv1JdlacE=
Received: by 10.14.95.5 with SMTP id o5mr573469eef.98.1311953865295;
	Fri, 29 Jul 2011 08:37:45 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t1sm919431eeb.6.2011.07.29.08.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 08:37:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 19:37:38 +0400
Message-Id: <1311953858-21349-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] tune-xscale: fix xscale/xscale-be confusion
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
X-List-Received-Date: Fri, 29 Jul 2011 15:42:02 -0000

Currently tune-xscale.inc has options wrt. setting of xscale/xscale-be tunes.
Fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/machine/include/tune-xscale.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 9fe9685..54f3727 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -10,7 +10,7 @@ TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
 PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
 
 AVAILTUNES += "xscale-be"
-TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5teb} xscale"
+TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale-be"
 PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
-- 
1.7.2.3



