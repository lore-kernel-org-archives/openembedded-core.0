Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id C3BD473A65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:53:42 +0000 (UTC)
Received: by wevl61 with SMTP id l61so3540697wev.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5JyrCv+HG3Wqib/UA+xAXCvRcRr0/DDV8U3vkpiAZ7M=;
	b=lSxy9+iTtxuFYvIt+aWhKVW4SediRBqVKmr5YTawDsPysrwCMqsqbAy5p7gHBwJ58S
	ZLFynQw9GVWMnEshoZIBk4+KbgtvI5b1ro3WA/I2pazjPkcQ3P7cNG8tQ3tzGvE7NSK+
	nRcnzEVaV9SYnrI9WTbVGNKDIb5FC4psaMHV6wYAaXxc+N1aNN4+k8JQIsKUCPuURMGM
	InSceH8NU3S/zU0NeH7SvCgffrteLQyM+QWDrCQGBPtPMuMvy/HhDxhzV5dawZkrCWdX
	WPglFoJcJjygFU20jqhH/kg7TT3nGqtwro37nTyjX+PnHVAG56mjfYnBmILRou6/PL0a
	F5EA==
X-Gm-Message-State: ALoCoQls02tmDsPUdbiyHuf86xOffeGjAB29kyeEgry/wjK31WJnPUpM5FuGbLvQr01jdzegueTG
X-Received: by 10.180.73.205 with SMTP id n13mr71039485wiv.64.1426010023391;
	Tue, 10 Mar 2015 10:53:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ha5sm21282355wib.1.2015.03.10.10.53.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 10:53:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 17:50:57 +0000
Message-Id: <1426009857-1224-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] devshell: start in ${B} not ${S}
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
X-List-Received-Date: Tue, 10 Mar 2015 17:53:46 -0000

When S=B this is a no-op, but when B!=S this means you can run make and so on
without having to change directory first.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/devshell.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 41164a3..051ab72 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -17,7 +17,7 @@ python do_devshell () {
 
 addtask devshell after do_patch
 
-do_devshell[dirs] = "${S}"
+do_devshell[dirs] = "${B}"
 do_devshell[nostamp] = "1"
 
 # devshell and fakeroot/pseudo need careful handling since only the final
-- 
1.7.10.4


