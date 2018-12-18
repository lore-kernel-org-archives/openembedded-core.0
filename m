Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C76F27BF75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c126so2535072wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qd3qRKJ766i+04JA/t9gSGFDZTv1GY2F3ltA6G5aK3c=;
	b=f68USl0QbnIIRHS4IjiXca5KnNXhLXvAytHYmn4+yNL9itBLlpRqmUtSRrbQ0IEmIF
	QVOasBe/B6GObXVg2U90BVJoDP3ctnZLl2Ep6azzc0q47/qf8L9iitKSVZOh/Wbdh4/R
	7k4F4tBZGGLHWbTIWz8yu4CV7h+tEOPPIq/cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qd3qRKJ766i+04JA/t9gSGFDZTv1GY2F3ltA6G5aK3c=;
	b=VSw0krf0ZpCb93+70VmVb+KpvK7WbnbTHSQHjb2PFWaF+5YqTcRbWX+QuaGMn4TkJ4
	wWO4nxXvbC1xYdU8aY4am54fLfqv1Ou2oIq7MGPXvwAW8YSd7dKXycZDwHtKFu5ROUFU
	Y+LTzqkeIWWFuUr5CuTk4TQ1ZkWSejUMXylJnqLTr7+H0Mkp5eRzq34FmMJZ08cimcBl
	JH6d4kMcYj9XV5HyUeInP6Sn+OIeHLtCf+41tfVz2DBwkuxJS+lpqE5fzErYxXuNFs12
	oTOc0xCznJb3dgI/Ac6g3sIya65sqBI3Uv8AZ6+XAXDt3el3BRAaV67pYUE8Qxy/IWQn
	DOnA==
X-Gm-Message-State: AA+aEWbmHjn68L09/bI8u1w7X2ZELyk0wFWlpwlDbK8wB2zVE8ooup2l
	TbBCj/jQAxiW2E91aas60kUt4+0ikr3yVg==
X-Google-Smtp-Source: AFSGD/Wfz4X5z12cMahSzz+Qj7VaTjDx2JP/6r4lWmAVBVHPoX/eM8rEw1D5jIOHtQPBc6z+TQD7IQ==
X-Received: by 2002:a1c:1688:: with SMTP id 130mr2844064wmw.86.1545134621323; 
	Tue, 18 Dec 2018 04:03:41 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:34 +0000
Message-Id: <20181218120337.25019-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/6] upstream-tracking.inc: Remove the long deprecated file
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
X-List-Received-Date: Tue, 18 Dec 2018 12:03:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/distrodata.bbclass               |  1 -
 .../conf/distro/include/upstream_tracking.inc | 24 -------------------
 2 files changed, 25 deletions(-)
 delete mode 100644 meta/conf/distro/include/upstream_tracking.inc

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index c0d698febbd..7712c8e40d4 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,4 +1,3 @@
-include conf/distro/include/upstream_tracking.inc
 include conf/distro/include/distro_alias.inc
 
 addhandler distro_eventhandler
diff --git a/meta/conf/distro/include/upstream_tracking.inc b/meta/conf/distro/include/upstream_tracking.inc
deleted file mode 100644
index e2a5e6ce40d..00000000000
--- a/meta/conf/distro/include/upstream_tracking.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-# NOTE: THIS FILE IS DEPRECATED. Please add new entries to the recipes themselves.
-#
-# upstream_tracking.inc - This file contains data that tracks the
-# upstream project associated with a given recipe. This list is needed
-# for recipes that version information can not be automagically discovered.
-# As we automate this checking, this file will slowed be reduced.
-#
-# This data is used by the package reporting system (packages.yoctoproject.org)
-#
-# The format is as a bitbake variable override for each recipe
-#
-#       RECIPE_UPSTREAM_VERSION_pn-<recipe name> = "<version>"
-#       RECIPE_UPSTREAM_DATE_pn-<recipe name> = "Mmm dd, YYYY"
-#	 - This is the latest upstream version and date
-#       RECIPE_NO_UPDATE_REASON_pn-<recipe name> = "<free form text>"
-#        - Used to note why a recipe should not be upgraded to a newer versoin
-#       CHECK_DATE_pn-<recipe name> = "Mmm dd, YYYY"
-#        - This is the date that upstream was last manually checked over time
-#          this should be removed as we automate this checking
-#
-# These entries will slowly be removed as we can automatically determine
-# the information in this file.  So for existing recipes that we can get 
-# from the Recipe reporting system, the entries here can be removed.
-#
-- 
2.19.1


