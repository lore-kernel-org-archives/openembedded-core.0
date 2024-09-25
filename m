Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EA0CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9311.1727246980454541622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jQRXTx3c;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246981; x=1758782981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gSxZo+WP87YUCASOPdpZ9bVWdI4PyQcK0qDtryriygc=;
  b=jQRXTx3cJEjd6k4R+Ldlb5b273W/ViRUh5WEHF5jw2C2iD/TxMXIVjKA
   ZzUlAy47lyvOzLuyvhFRT8IXxKkq7+dLCiYDiSF4QLtvTiB2oMfjzLqfi
   EOdKJI7jhTZFztbs/qkmVlTHkHmj1pP1YGYSf4sm+lEtM/S2cWHHLDZIp
   xhf7HnV43kV/OzNA9UFuQpTHwhisYlqfMuiSVSP773fMKQeWC/G/bpfRL
   VwRyHbn8gcHhPTkcK3TJ21jstUlQpH/JwZH3H1KgUM7eJ5Lukmfjy4jUc
   pZFuev0EENPooPzlBSLl/sfr90/JHlGmfDouE43boDeLd88uGzeAUDdw8
   g==;
X-CSE-ConnectionGUID: h6m54YWiQWKui9BZfhHuQg==
X-CSE-MsgGUID: aAN+GpAfTUiCnD0MU8/F3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949682"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949682"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51383C68E9
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85736D4F6B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21661E2528
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C64291A000A;
	Wed, 25 Sep 2024 14:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/47] git: upgrade 2.46.0 -> 2.46.1
Date: Wed, 25 Sep 2024 14:48:40 +0800
Message-Id: <1727246960-20665-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--14.016100-10.000000
X-TMASE-MatchedRID: aJfGYVVmw3ijz0nOeth/yUIIxwDaU5mrWfgivgcUPZMWn6/ikoy0wppj
	+XNqU6N7HuHAs1B9LGUCcwFPiXdZ+07HN6DyoeIKs/Hes76OTZAXivwflisSrMC5DTEMxpeQOiw
	t/WQfkJ+HXCqP22PVELhMPLktub63YrO1KENDMW4IoonX8X+CmUfLPdsHmQbn/gMNehoKqTuLcY
	4IaAaI5jbHLXsjW/n4iLowx+tZc4nxU9PsVPtf/NyBRU/cKn69YIOxzvM9rTZFms6YEs23D6r4U
	BzxglDXMB+YD3KTT8bQddCrqvGMDCupJvqHf1A8A9lly13c/gGsHzm4NPdwpDKIerHAhfYxpPMO
	vJ4MziBNZb1KUaUl3qMXkskHDfqP3vDC6J0LEl7GL//8mlodA5hqxsBO7lrLPHMAbjuhwd9EGDr
	WRIrgOAd16CBhHumFxiiH+oQX+1UBOHW58ozCWlgowyUWHgGdhYceXdhuQJCbKItl61J/yZ+inT
	K0bC9eKrauXd3MZDUMFsa+1wyh/APKXpE2npSiryFMruFLf7iJWc5+2ytz8qKSnfiRMSpUV+LOC
	ph5BIs=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204900

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
 * "git checkout --ours" (no other arguments) complained that the
   option is incompatible with branch switching, which is technically
   correct, but found confusing by some users.  It now says that the
   user needs to give pathspec to specify what paths to checkout.
 * It has been documented that we avoid "VAR=VAL shell_func" and why.
 * "git add -p" by users with diff.suppressBlankEmpty set to true
   failed to parse the patch that represents an unmodified empty line
   with an empty line (not a line with a single space on it), which
   has been corrected.
 * "git rebase --help" referred to "offset" (the difference between
   the location a change was taken from and the change gets replaced)
   incorrectly and called it "fuzz", which has been corrected.
 * "git notes add -m '' --allow-empty" and friends that take prepared
   data to create notes should not invoke an editor, but it started
   doing so since Git 2.42, which has been corrected.
 * An expensive operation to prepare tracing was done in re-encoding
   code path even when the tracing was not requested, which has been
   corrected.
 * Perforce tests have been updated.
 * The credential helper to talk to OSX keychain sometimes sent
   garbage bytes after the username, which has been corrected.
 * A recent update broke "git ls-remote" used outside a repository,
   which has been corrected.
 * "git config --value=foo --fixed-value section.key newvalue" barfed
   when the existing value in the configuration file used the
   valueless true syntax, which has been corrected.
 * "git reflog expire" failed to honor annotated tags when computing
   reachable commits.
 * A flakey test and incorrect calls to strtoX() functions have been
   fixed.

 * Follow-up on 2.45.1 regression fix.
 * "git rev-list ... | git diff-tree -p --remerge-diff --stdin" should
   behave more or less like "git log -p --remerge-diff" but instead it
   crashed, forgetting to prepare a temporary object store needed.
 * The patch parser in "git patch-id" has been tightened to avoid
   getting confused by lines that look like a patch header in the log
   message.
 * "git bundle unbundle" outside a repository triggered a BUG()
   unnecessarily, which has been corrected.
 * The code forgot to discard unnecessary in-core commit buffer data
   for commits that "git log --skip=<number>" traversed but omitted
   from the output, which has been corrected.
 * "git verify-pack" and "git index-pack" started dying outside a
   repository, which has been corrected.
 * A corner case bug in "git stash" was fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.46.0.bb b/meta/recipes-devtools/git/git_2.46.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.46.0.bb
rename to meta/recipes-devtools/git/git_2.46.1.bb
index 7c6beb5b5c..d301c474f2 100644
--- a/meta/recipes-devtools/git/git_2.46.0.bb
+++ b/meta/recipes-devtools/git/git_2.46.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "b138811e16838f669a2516e40f09d50500e1c7fc541b5ab50ce84b98585e5230"
+SRC_URI[tarball.sha256sum] = "b0a4d1ad50e820edd84c0d1b609c29349d4ae2681ed458914ea759aafcd4bf21"
-- 
2.34.1


