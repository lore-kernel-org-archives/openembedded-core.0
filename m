Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id F13DE72B9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:55:58 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id w62so14157220wes.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r86LOxpLYzLQd2VoZxTEF5IG4hwiyQeY7+qYt1iUofM=;
	b=lDHEQwJnUstPVKeXg7jbUAeGN3YLSpIwgkSyMbXkoysDZHcgzLocKkvMzLOOsoOr1b
	5nzSJsRSjG1sZqfjjdZFIhtVoqPL4KyTx5/3T1bIWdJCWLZ5Y8H+c/c3a5lQhO+ZrtmU
	N9lBhiU82gs/HyqaT63Woc61/IwVSFPmvWRMkuqmz/ftOlI38yrH5TMNWlRWVVMh1ZmE
	0uyTAbPyL7iFB0hBybnAh8gJx/wzujT/VbhAxnyOYigxvp0kveW+L4w3wugyx+e0dlZg
	VSQ3U6H0hIvr8w7CgluSW6SssSMSTN5NkQ3VCsk5uXauAFXFvw6zIbWI/o8InDdL+2O6
	Vj6g==
X-Gm-Message-State: ALoCoQmPcRMp5bavcPYTWoxLLE/CqUNMeWFcesjQG1xte3XGIGS9VJH+Mqtq0ZsJpyb08gSQwkc0
X-Received: by 10.181.8.98 with SMTP id dj2mr58751771wid.81.1421322958464;
	Thu, 15 Jan 2015 03:55:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:17 +0000
Message-Id: <1421322860-12652-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com, Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/8] perf: Disable perf-libunwind
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
X-List-Received-Date: Thu, 15 Jan 2015 11:55:59 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

It hasn't actually been being enabled anyway: 'Disabling post unwind,
no support found.'.  For now, turn it off because of [YOCTO #7129].

Fixes [YOCTO #7129].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf-features.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
index 2dbbb47..b8859ab 100644
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ b/meta/recipes-kernel/perf/perf-features.inc
@@ -1,4 +1,4 @@
-PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
 def perf_feature_enabled(feature, trueval, falseval, d):
     """
-- 
1.7.10.4


