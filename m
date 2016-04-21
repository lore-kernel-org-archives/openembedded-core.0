Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3F460249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 15:45:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l6so22487021wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lNeW0ancLLv5BAm056EmJife0bWQtlBAZWHaMWIcLgY=;
	b=uIG6z+6G2x3Ki2DxIlpQGKtORvHQroejx3MMIz6RUdpvpMd9uBc+3rvn+/dypRfuEc
	y4MIzOMGfEj7sE+HL0hI4JPaCeenYy3eyIuGngiCrSqEmZ0Auhbfd3leDetFm0TLRwW1
	xgLoj8naJsayvgu41x9BXuhHNb23aqERDPbVcyWBnBMHKKx4dvv2m07vUU4IQ0O7InD7
	nSeo5rz+yZ3fw67su1EUHjwnQ52Yk1WypLT2rNCtCeiFFQjcEjua/NFIjQvXC2D6XtyY
	BvTtNQgA3sqSWINxAYlIBFi3zvZnkmLUGWK6+qJIdvhFpu1w52VLMQNZtjqd9XqZhkG4
	NjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lNeW0ancLLv5BAm056EmJife0bWQtlBAZWHaMWIcLgY=;
	b=JbgKLYYLzcICo8sIorQRby8vTrC5kw79RkyTgN9DjnRbWt6chrU5MAZyX8C8VajMok
	5LfVUz4q0b/kiPXA8ZfCL1d4XgRymKFBIRe1tW4H4fupFRNpfDTWwPYSw2c+DX6IJ1VG
	Ut0spanrLWCdQpe7cSaFg5KB6/dqIDpu9NuOGgpHxtcepY0QmgmBocEEBlUpcvB6UvFz
	INC2dzRBrf46Pu8UeZbf9MlLETvcSD5ggu9AsRO9Mokl1Lxjq0PoBMt0Y1WXZVZOH3pP
	pPack7LB3NFNmb7E1u0WQmtBXOwys/zNOK+0tHRu8R1sdu5BAxmqVFcv7J/aLUI/g4/s
	O1tw==
X-Gm-Message-State: AOPr4FUB7hdqipPJ7gZlGlyP2d7skSwQlX1ZXAIAZgfNHz5wlfk+0CQ9BccCA3m5TO6X0A==
X-Received: by 10.194.216.227 with SMTP id ot3mr16132798wjc.69.1461253547810; 
	Thu, 21 Apr 2016 08:45:47 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	kj9sm3466356wjb.14.2016.04.21.08.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 08:45:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 08:45:41 -0700
Message-Id: <1461253541-14071-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] recipetool.newappend: fix syntax error for 'not path_ok' error
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
X-List-Received-Date: Thu, 21 Apr 2016 15:45:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/newappend.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index bdf0693..4fbb40a 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -81,7 +81,7 @@ def newappend(args):
         return 1
 
     if not path_ok:
-        logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath))
+        logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(append_path))
 
     layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
     if not os.path.abspath(args.destlayer) in layerdirs:
-- 
2.8.0


