Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B52CCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:50:26 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6733.1781639419824950864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=r+MWnlMm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026061619501739b61a6b2f00020785-ja71lw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026061619501739b61a6b2f00020785
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 21:50:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=e7I7tTmI6UroU2orNKKHov6D6qpozvLKoCGMB1SGcqc=;
 b=r+MWnlMmUo7NqfkHKUjifeRIkss9h3XabAtix4i2TUK6OYLSQ8oavf3bMr/xJQVbAlrB+T
 4FD0avMD0qieFA//D9tYID2lebeZTAF++8z8H+f3cER91ckArHFxqU3qT35f1ooHk8mS2bmz
 BznRxQoHSjRhfSM+1FnMdGx67Qge7ENW3Zubzcn3qXVOiQbyHd4sqj9qMd/QbKKxUoYnoMIB
 pF2RRnhICcEtKhnGiVjWeNPJZdNzO9Y4QzRK7QY1F93TqKYUmtZPKgOE2n6fxb4tcWKDsEr6
 57zn951qJJh1qeFTwFRgXfiYxefJa6HRx/Ur0msOHlYRTzIegyfvwTMQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/3] recipetool: remove handling of libpcre
Date: Tue, 16 Jun 2026 21:49:59 +0200
Message-ID: <20260616194959.3748347-3-peter.marko@siemens.com>
In-Reply-To: <20260616194959.3748347-1-peter.marko@siemens.com>
References: <20260616194959.3748347-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238960

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

