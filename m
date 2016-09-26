Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04FB460777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:17:06 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id x192so4857648itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=ufNwuMHSDwe4L/ygPZ1yLBfWNzEV7f68Vn4/LAx6AU4=;
	b=bmqhtnqG6He9Ik+X8vWumwXASiTu+ysVIi5dlPLY5OuaXu+PbmP8BCMBBBTkEK0RQO
	Jnugwp3T5HzvjQoezhnUAbbhseoRybzIdlgtuOob3ui2xlIE34xHiFJxe83eP+snvYFS
	bmDhfSCdTiNpmhZvSSpt6KUEvNnRtmD/gIMl6IChNNqXj6NPS3gmT7X2RXVIacTKoBWx
	etKhDRpdbztKAPHEWoG991qbb3zVrWmgk4XvOn6qNMLwKjXJOzG8TUtyezB+lRbOI8KP
	a+uuTX1D7PBbNOvj9M9bRrdr/07AvcegurHP2yeF0FuiqDGyFxgoh3ZmiUFa2xZzics2
	Z6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=ufNwuMHSDwe4L/ygPZ1yLBfWNzEV7f68Vn4/LAx6AU4=;
	b=Vh2nLgbV3YKoUAvg3OCF7PfSegohe5U+/bhFFutcScBClx37b1Xc2HyZO4AmCYBCd3
	+OXJynE8kQDMsm575U0konBJg6AOCLRLvdOyVAQauWZlFjsFCmRZDS6MzDvLmwM0nyFx
	8JipPLvDa48kBtHpcm4jF9jPUbXKNfO1YQQJaZNguYnN5dKjtEtNUtEP7wav6/qCZY9D
	8usipo6dTdKEVN8u60hx0LxxEWhtCti6p1vSmlIY0ILwo7db07nfOPBdRlKJEownmG+s
	S7VRH7rBjdNl/FGEiH4jMy0cCFyyIomYdSJKNhftuGET+NMoex1Lr+3QPmG6VhrdIIJr
	cbFA==
X-Gm-Message-State: AA6/9RmNThD2y/YNzfovfIWtXTLBT0BAnTgMGP4+Nea0lflduCrbGZFVApjWJT1VbAxfUw==
X-Received: by 10.36.158.213 with SMTP id p204mr15880393itd.99.1474895827543; 
	Mon, 26 Sep 2016 06:17:07 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id 72sm8203110ioh.41.2016.09.26.06.17.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 06:17:06 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 09:17:08 -0400
Message-Id: <1474895828-8496-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] devtool: Add a line break to generated README
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2016 13:17:08 -0000

When devtool creates a new workspace, it produced a README with one very
long line and no space following 'bblayers.conf'.  Add a line break as was
intended.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 scripts/devtool | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/devtool b/scripts/devtool
index 91e3954..0c32c50 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -187,7 +187,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('directly (although recipes added with "devtool add" will often need\n')
             f.write('direct modification.)\n')
             f.write('\nIf you no longer need to use devtool or the workspace layer\'s contents\n')
-            f.write('you can remove the path to this workspace layer from your conf/bblayers.conf')
+            f.write('you can remove the path to this workspace layer from your conf/bblayers.conf\n')
             f.write('file (and then delete the layer, if you wish).\n')
             f.write('\nNote that by default, if devtool fetches and unpacks source code, it\n')
             f.write('will place it in a subdirectory of a "sources" subdirectory of the\n')
-- 
1.9.1


