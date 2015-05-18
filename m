Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C577C65C7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:00 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so21354305wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N3eXbuBUyrUd5hVarT4GmjTZNHn8kigJYkUKSblAYuk=;
	b=JAwqUqiZADowrCIxRN2f2V4Xh4CcHOlstg53NSpa0G/dcYfddRtJG+JvU7sUuUmu9D
	o3cdHmxkI5kVkf5C0pf+qLPfQBZWRXNENlCWHd95mwEabXNM8a0MS9xuxm+3T8BVPLid
	91llmQ1vkg+M0sgtNoMGGfhhqJa4yWAqWqL2CtGyZq6KF1STGEu/p30njCsQI/m8LMqV
	2s7uO4jB2gaoykzVYGLAxSjRRVQdO5aPDt4S+xY0hgatBqnP8B4gHKbUaZPKEg7QVxEC
	CIKOjZLGhJiiNGXfKUIJvOVKPvXX0BqgEVpQMmOMyPJc/kS7uPS0LR0c31seovObetyx
	CxVA==
X-Gm-Message-State: ALoCoQmv9YjdZIuB6CWA4/mw8Z24h7+131Q8KvNyXGNSOQwggj01D34GQRq++nGAPo+xYT9LuEuA
X-Received: by 10.194.185.107 with SMTP id fb11mr46842076wjc.9.1431967801200; 
	Mon, 18 May 2015 09:50:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:24 +0100
Message-Id: <1431967531-25163-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 06/13] libxkbfile: upgrade to 1.0.9
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
X-List-Received-Date: Mon, 18 May 2015 16:50:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxkbfile_1.0.8.bb => libxkbfile_1.0.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.0.8.bb => libxkbfile_1.0.9.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
index 620b414..39a344c 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "19e6533ae64abba0773816a23f2b9507"
-SRC_URI[sha256sum] = "8aa94e19c537c43558f30906650cea6e15fa012591445d9f927658c3b32a8f3a"
+SRC_URI[md5sum] = "4a4cfeaf24dab1b991903455d6d7d404"
+SRC_URI[sha256sum] = "51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a"
-- 
2.1.4


