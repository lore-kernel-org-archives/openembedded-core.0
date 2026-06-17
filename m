Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEDACD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 17:32:09 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.719.1781717528590156669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 10:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=pzCMH+zk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026061717320689cba13e290002072a-ggkadl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026061717320689cba13e290002072a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 17 Jun 2026 19:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=e7I7tTmI6UroU2orNKKHov6D6qpozvLKoCGMB1SGcqc=;
 b=pzCMH+zkQ0C70JG9VC3PIVWaVH1xBFSozuJJk/pIOyLM9zsipcw2WmMAgld8BQsRx+w55K
 KId3jvLpoPNdC7KoQiqOqQYsK/xH3gdSDU9b9aKSpwq9xuylxa/A11tPQ9YtZluF6uXFVbRs
 v+g7GRfNaSldEknIkomA9hGCcuQdxI7mOq99Pm3ErKWa7iYQzvVNBcEErRGeocJU9vrX0oHT
 TT7srPOWFnCZQoOiOTnS6ykhhBonzOzvYpolKo2aQGLGzJF74jdBwJw0tyZivmEWuoEHlj7c
 gaKR1JoRoQ3WBljImLCP+r+r909s8mlk1p0mwcYJsPTUQdVqGD0QoxCw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 4/4] recipetool: remove handling of libpcre
Date: Wed, 17 Jun 2026 19:31:29 +0200
Message-ID: <20260617173129.1013998-4-peter.marko@siemens.com>
In-Reply-To: <20260617173129.1013998-1-peter.marko@siemens.com>
References: <20260617173129.1013998-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239045

From: Peter Marko <peter.marko@siemens.com>

libpcre recipe was removed from oe-core.
No new project should use obsolete dependencies.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 scripts/lib/recipetool/create_buildsys.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 31f32ad995..7e2809f358 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -571,8 +571,6 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('ncurses')
             elif keyword == 'AX_PATH_BDB':
                 deps.append('db')
-            elif keyword == 'AX_PATH_LIB_PCRE':
-                deps.append('libpcre')
             elif keyword == 'AC_INIT':
                 if extravalues is not None:
                     res = ac_init_re.match(value)
@@ -640,7 +638,6 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AM_PATH_PYTHON',
                     'AX_WITH_CURSES',
                     'AX_PATH_BDB',
-                    'AX_PATH_LIB_PCRE',
                     'AC_INIT',
                     'AM_INIT_AUTOMAKE',
                     'define(',

