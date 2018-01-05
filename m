Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A85437864F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 17:16:10 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l41so4897037wre.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ym6qI2SinROfhjqmu5dJ6vRbwD7Z5f6h9xmErq7BbQw=;
	b=0i87ixG3GE9yRkG46yRsrkrjqVMFLNuTpLWCCIfUUv3dNF70AwwB35WEFEQFDzRyEk
	fq+1PNvR2/78gBHyMuE4cVYdBjt3ai2T2TSADPEU727Afb3Qwoe8j0qgO7hMdaxeruc+
	KTvpozS4+564OiFwH1LmbpzcID6mHj3KFTgzrwV76f0xC1+Hq20yzKniZftj13DDOqL3
	Im6JflRSXYifM1nWm2Ug8jiOWwzEcKQ+DisesbFNZv5b66pu2g7WRkd8fbXW/wDhNGQW
	kJsCVEOMtAavqtUBvHSv2K19zcNA/CwPFQ2HBttLHE1d73I4rGItkPGbKNyqOphhG3Mf
	3Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ym6qI2SinROfhjqmu5dJ6vRbwD7Z5f6h9xmErq7BbQw=;
	b=F0SGiePf0XEcY4zIZkum6aqCrG0R7GghxtbjqHzmudxNWvC+csbj6WK1Urae0V+qIB
	139mmZvuomgymdFBc02vIj+VGaSrZUERvfOWhCppw7lQmOs7Aee7WL3KRBVQlIgXIxes
	xu43tx8bwrjvBh3Jo+xu2UdwQ0sQTKzbspv4IvvzW+tn2MWHf5ZFG4+Oqzq5rUrNjP+i
	dx3nhp+5fMLD3HAPFxMtnE/YYhzpvzTNNuSFm3dWLszpECxfxESvIbwYU64llldthYYk
	N7TPCEUcqVCNDN/UFFKx80ijBNASZxBDvin08P5Ak3DKcbgNL8WZryT3OdXHNc23C2ye
	Cq7A==
X-Gm-Message-State: AKGB3mKWo14mwpg5UOAgbbsFkG0cdmd3ZYNAnpV+vXNRqs8thj7A1+08
	YGEUGgSPWpwlTHMqtQPzUl3+Tkcd
X-Google-Smtp-Source: ACJfBotzCess/mhE+Bh3LQsGiZOt24AI9e91ZVG47fQRtzoZaWVLF88/NgGQPuO4xFYKAG4IhVhPVg==
X-Received: by 10.223.165.84 with SMTP id j20mr3345215wrb.278.1515172571204;
	Fri, 05 Jan 2018 09:16:11 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r9sm3950196wrg.74.2018.01.05.09.16.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 09:16:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 17:16:08 +0000
Message-Id: <20180105171608.24806-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] psmisc: improve autopoint-enabling
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
X-List-Received-Date: Fri, 05 Jan 2018 17:16:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 527a1d590f3..82ef947709a 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -18,8 +18,8 @@ inherit autotools gettext
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
-#doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF=""
+# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
+EXTRA_AUTORECONF_remove = "--exclude=autopoint"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.11.0


