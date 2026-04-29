Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE59CD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4493.1777491441821897956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KUPBqeqo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202604291937195e6b975f300002073a-zzyjmy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202604291937195e6b975f300002073a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lkOElQ+uNEjrmGQ6rHIQxBHVEebz4DcUdrr0VrBC5Wg=;
 b=KUPBqeqogQbN/AqXG5WHkaCZc0HcMLmmzspFjxz0CmW2i8mgvnf41/nCF87Y1AwyCTqeaa
 ZmM/ghVJMnzChDFLtQiNDh9TXR4WsRdfl5b+JYMMowhwy5Mq4acm5gaZz04JLXA6GB33uqrs
 wa1rGbChfRUOCkBsc4LiB4tRC5h0cWyh+5NFBABhg3WMEgUFyayKMeDyzgmYAv64I73B1LRR
 EpYuoZJyJ3ZtqCs/wYbKU/4AOaCpmHLOelOCekKtA/N4lY6n9pk34R/L1d3XeOjSLhcsnjVh
 t63kOajfQ0w+Api8rZQMkBIpWRdXlgunlSKQTmholVo1YyRaus+LRsPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/7] python3-lxml: upgrade 6.0.4 -> 6.1.0
Date: Wed, 29 Apr 2026 21:36:45 +0200
Message-ID: <20260429193647.3090502-5-peter.marko@siemens.com>
In-Reply-To: <20260429193647.3090502-1-peter.marko@siemens.com>
References: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236135

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-41066.

Release notes: [1]

[1] https://lxml.de/6.1/changes-6.1.0.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3-lxml_6.0.4.bb => python3-lxml_6.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.4.bb => python3-lxml_6.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.4.bb b/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.4.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.0.bb
index 1257534c0f..b7bbf5c3d6 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "4137516be2a90775f99d8ef80ec0283f8d78b5d8bd4630ff20163b72e7e9abf2"
+SRC_URI[sha256sum] = "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

