Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id E71807C527
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:11:25 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id z131so32464066itf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 09:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pj4QUFtHwr4uSDeo1T0vLVA4OUG/86MI7P+ub7qsydI=;
	b=qv4PKPFIyaVLn2kBuBELvmL+pCkggLwT/LTyyta78VcO98+hxTEhKAYzTMWEWCI1Nt
	KpKm0C0HvFxUwoigGpN37Qs+3uTa0u/v4wZmtuwa1I69dInHeJ99imoJfp8N/mLck59Z
	h+gKAKx6Pj+a90mXcsFuI+cj7+qGIRErX8Ka/fSLocdPmWpGgVLuGroPaXA9pdjgVNxb
	rqLhKhSSy2UifzEqbwnRfa7+/Tqd36atdH9cbYJxRxPjM6jf0XPbxlmhuHaY+gPnraJ4
	LIQtamRJB9mK7QD6bV1vRTC6fdlWSSuiOUkoPiL/CO3Ra2j80L67snwSWen0ya9mVmRh
	tATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pj4QUFtHwr4uSDeo1T0vLVA4OUG/86MI7P+ub7qsydI=;
	b=MXEybUJKPqySQRVYfdwq0SFpWSHsHPMMVuZTMGUKzI1+aA0HpkpozrrI+wiWK4XfX9
	6h9ZmGUbdEJXjLfEXUCMoHpbcrD+IZnKf9RPVeHYDB04/PrDOSYsZj850vqJhi/tdEu4
	49Z6BSd+vltfh/xwnfUEaTDn4FHZg3ybLxWBX1SS+v2WEI9QmNbyhuEVUdK4H2E/0d/I
	iu+dsHZlybG3+FiJwsCYYjxul/a2TFcbXyb+yCpX96wWPGp7OoIjEPkwGeI8nc9Ephif
	NxK83jP7hdAT0Bk24FST2Ar41utg51KC5NWO2nCkUKOcU/3nnDucOoFmh4DLZbYFO5gq
	yPtg==
X-Gm-Message-State: AHQUAub0x4dhX+n42pG2jfnqXKzTtAlDnOt8B52DrgKyFWLHB2RLNbnJ
	GgIsB0+Njhwl3Da/PuEXM5CWEKMh
X-Google-Smtp-Source: AHgI3IYcK5QQLFE7GBrIQC4wRVMSGtGMaMWVVcWT2S50fddtk59a2cE/LMaAESikw7DBlXGFyzlCWQ==
X-Received: by 2002:a24:ccc5:: with SMTP id x188mr734627itf.123.1550509886597; 
	Mon, 18 Feb 2019 09:11:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id k4sm5586247ioj.33.2019.02.18.09.11.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Feb 2019 09:11:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 11:11:23 -0600
Message-Id: <20190218171123.7707-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] initscripts: Update volatiles documentation to include binds
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
X-List-Received-Date: Mon, 18 Feb 2019 17:11:26 -0000
Content-Transfer-Encoding: 8bit

Volatiles processing now handles bind mounts, so update the comment in
the core file to indicate this.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 201106645d1..cd8a4be05f2 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -8,7 +8,7 @@
 # The # character introduces a comment lasting until end of line.
 # Blank lines are ignored.
 #
-# <type> : d|f|l : (d)irectory|(f)ile|(l)ink
+# <type> : d|f|l|b : (d)irectory|(f)ile|(l)ink|(b)ind
 #
 # A linking example:
 # l root root 0777 /var/test /tmp/testfile
-- 
2.20.1


