Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49E7878846
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:11:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b21so35160609wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3fbPk4lBsZU3LZHvXacLOmAskQZX9hwZfuTExxHXG14=;
	b=lORZpHA2IcqdBRnJZq1LnZ1nVvWEpRoypO8IesUquc8MUsQyebSdo2/3iPdE3V4fZJ
	vo4m/jVNLLJB7IAj7X8IclOdFYudM+RpQBgzBQX5s9YKLeyhxwC2DASLVEJnPTy3IYKd
	01Br86WJQNYd7UYIJFqwQbY1iI5irRIP4Ymb6rvSCDtT9OoI98AfpUx8gUZmH6BQuLe+
	Zsokl6yq5X+803qRTDOw65lKpYbZ51IyGZrWrScXKxHSQ4eXUp/Iz/EUFwVu/FlCaeMq
	41uLMte+LKOfi2/HmRHXa9rUZBsJhVCPdo2IRT1w1rbSMnwSH1JdRLSwNdvHlOFdNCAS
	M4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3fbPk4lBsZU3LZHvXacLOmAskQZX9hwZfuTExxHXG14=;
	b=k81zExZTcgA8oKKDi4xe7dDHx7s3ilODVaedE4Gp2e69VM1DmSXhGw3XcIA008qC/9
	Jjpe9lGocztaTjgD6LisY/Oosk2T2Lf60fcY9YoC2N+Cs2B3CxPwXnlaDk1msQvqFbAr
	znR0mNzC2auzgGPE00jl9Fluq26UL/TOOt/xcp4nWXd1aUERAOLZA7kvlnL+Apk7kaJt
	8uGAJUErCIPpjD1VmzvwF7MgLsG1dGTvukIzsl/W1ouAU9COuzWztOP4kzwvqUDTURrQ
	dVR2Sr2mctyzFyvB8KOIXrPweKXYIXqZLqSq/FmS0fqP0j+vm+m6svN43z7oO5cz/nS/
	zUWg==
X-Gm-Message-State: AKwxyteKeM/ZorwCBKwedbHCi9hJZJCLg2JnquGDU86ayVrGcPrONmo9
	Y8wBT6CsEUea3p47l1uq6wuUUGiB
X-Google-Smtp-Source: AH8x225cJR2Sl9GsaPNiq83KvctyU+elqvMtp6UWUZuLEhIUYtgnXk6AB2hmiCKzOXz2Pbj96Z144w==
X-Received: by 10.28.186.132 with SMTP id k126mr17629654wmf.159.1517245882918; 
	Mon, 29 Jan 2018 09:11:22 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm11515244wre.5.2018.01.29.09.11.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 09:11:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 17:11:10 +0000
Message-Id: <20180129171111.14502-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180129171111.14502-1-ross.burton@intel.com>
References: <20180129171111.14502-1-ross.burton@intel.com>
Subject: [PATCH 4/5] classes/utils: remove compatibility functions
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
X-List-Received-Date: Mon, 29 Jan 2018 17:11:23 -0000

These base_* functions were moved into meta/lib/oe back in 2010 and wrappers
left in utils.bbclass for compatibility.  It's been eight years, so I think it's
time to remove them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/utils.bbclass | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 32cae7e3125..4f016e3d002 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -1,44 +1,3 @@
-# For compatibility
-def base_path_join(a, *p):
-    return oe.path.join(a, *p)
-
-def base_path_relative(src, dest):
-    return oe.path.relative(src, dest)
-
-def base_path_out(path, d):
-    return oe.path.format_display(path, d)
-
-def base_read_file(filename):
-    return oe.utils.read_file(filename)
-
-def base_ifelse(condition, iftrue = True, iffalse = False):
-    return oe.utils.ifelse(condition, iftrue, iffalse)
-
-def base_conditional(variable, checkvalue, truevalue, falsevalue, d):
-    return oe.utils.conditional(variable, checkvalue, truevalue, falsevalue, d)
-
-def base_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    return oe.utils.less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
-
-def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    return oe.utils.version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
-
-def base_contains(variable, checkvalues, truevalue, falsevalue, d):
-    bb.note('base_contains is deprecated, please use bb.utils.contains instead.')
-    return bb.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
-
-def base_both_contain(variable1, variable2, checkvalue, d):
-    return oe.utils.both_contain(variable1, variable2, checkvalue, d)
-
-def base_prune_suffix(var, suffixes, d):
-    return oe.utils.prune_suffix(var, suffixes, d)
-
-def oe_filter(f, str, d):
-    return oe.utils.str_filter(f, str, d)
-
-def oe_filter_out(f, str, d):
-    return oe.utils.str_filter_out(f, str, d)
-
 def machine_paths(d):
     """List any existing machine specific filespath directories"""
     machine = d.getVar("MACHINE")
-- 
2.11.0


