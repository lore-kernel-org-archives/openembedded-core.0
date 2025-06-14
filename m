Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28084C71135
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 15:41:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.12115.1749915706228589895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 08:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=e8KtNeOJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250614154140447a9c475fe9b121c9-its8mj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250614154140447a9c475fe9b121c9
        for <openembedded-core@lists.openembedded.org>;
        Sat, 14 Jun 2025 17:41:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wqRc9ARL5eEuVuSEYwxeew0NMZ/BgmUdO5XZTtU3yxc=;
 b=e8KtNeOJ/Qg3wKAJYLGOLKDy/4H+EchpDNj8OOclobzNPWvbiifnNNnvPMOgnaQB1nCSNy
 7/CoCtqV/7Gq83t44X85vHgvaJpMfZpPnGU0i3f7qbaKJMfxygSt0mr2plW5TyvGb+iV2jdd
 HjmQcpKpzct7rM/imEpNlbjinr/HdRV2MPI6DB4mfXfTjK4l6dWQxbq0zHs9tQsyj45EseyA
 gvEsM1r2TRI8+gnGc5R2R/QwauXeto5B47llMDz0ewAsk+jVHm/BaqjuE7vvuaZ4bdq/az+L
 7qCy4SX7Arwgnlb2Rs+F1IbGh39Vn6zMgCG16Q841+CQ6tPneMTv1QYw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] devtool: ide-sdk code remove twxs.cmake
Date: Sat, 14 Jun 2025 17:41:34 +0200
Message-ID: <20250614154134.1209075-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218636

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Do no longer recommend the twxs.cmake VSCode plugin. There is now a
language server built into the ms-vscode.cmake-tools plugin as well.

From Release notes 1.20.53
https://marketplace.visualstudio.com/items/ms-vscode.cmake-tools/changelog
Add notification suggesting users to uninstall twxs.cmake now that we
have built-in Language Services. Follow this advice.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index a62b93224ee..ee5bb57265b 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -161,7 +161,6 @@ class IdeVSCode(IdeBase):
         if modified_recipe.build_tool is not BuildTool.CMAKE:
             return
         recommendations += [
-            "twxs.cmake",
             "ms-vscode.cmake-tools",
             "ms-vscode.cpptools",
             "ms-vscode.cpptools-extension-pack",
-- 
2.49.0


