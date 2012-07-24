Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StdxY-0004sT-Ic
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 14:11:30 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jul 2012 04:59:58 -0700
Received: by wgbdr13 with SMTP id dr13so4772282wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 04:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=eGYx+TbmCLc3axKxoFwAIzwd/vxd0nyANDRpQic2CwE=;
	b=U3GQw2ebC2nad0mqxIQVcQ853nWfOJmvtkYCjE9PXshY7eZZ90j7iQ61mPqleIA/r4
	O/x/AHHQgMLwrFUZx6KwkUhj8zskzGKdSHsfm+b33l+SgrsfuWNwh3jS9e1tpR36nbTG
	zIcxz6N/VCtY/H1SFQgZqQlStj7yv5Fg7WGuapWlCmGPpGbDyIGIM4pX66kpnoSgGcKH
	iAyzFPqwyxEzNyryN0IFLWnbS8+HMhWJdLKcbSbN4qwR3S59ca7sgEPFtpn6pgjYRn+Q
	hNLIQV1kw9gW8k8OQUKNB6Aj0+XPwE/T4HDVSEGbUqllO+FtWZFQe99JZU2uTSLurVhk
	x//g==
Received: by 10.180.81.133 with SMTP id a5mr6315293wiy.17.1343131197224;
	Tue, 24 Jul 2012 04:59:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o2sm6247762wiz.11.2012.07.24.04.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 04:59:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 12:59:37 +0100
Message-Id: <1343131177-18517-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmwDcYaJCtmi9nY0NYs/ck2nvodj1TOsqzuEv2XmoXtvJQywE1ooAkqbxUrakHm3xcew5+9
Subject: [PATCH] core-image: remove x11-netbook package group, it's unused
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
X-List-Received-Date: Tue, 24 Jul 2012 12:11:30 -0000
X-List-Received-Date: Tue, 24 Jul 2012 12:11:30 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/core-image.bbclass |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 6b207d7..13e45aa 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - x11-mini            - minimal environment for X11 server 
 # - x11-base            - X11 server + minimal desktop	
 # - x11-sato            - OpenedHand Sato environment
-# - x11-netbook         - Metacity based environment for netbooks
 # - apps-x11-core       - X Terminal, file manager, file editor
 # - apps-x11-games
 # - apps-x11-pimlico    - OpenedHand Pimlico apps
@@ -33,7 +32,6 @@ PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
 PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
 PACKAGE_GROUP_x11-base = "task-core-x11-base"
 PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
-PACKAGE_GROUP_x11-netbook = "task-core-x11-netbook"
 PACKAGE_GROUP_apps-x11-core = "task-core-apps-x11-core"
 PACKAGE_GROUP_apps-x11-games = "task-core-apps-x11-games"
 PACKAGE_GROUP_apps-x11-pimlico = "task-core-apps-x11-pimlico"
-- 
1.7.10



