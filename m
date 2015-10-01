Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 1945A77088
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:49:52 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AIBACYOQ1W/5tjdVteHAGDCgFTUB6tSYwDhCEBDYFsC4cwOBQBAQEBAQEBgQpBBYQwAYowAadBlVgBjwWGc4ophBUFhzaOQ4UWh36JBpJNHwEBQoFKAQuCLjwzAYNghhcBAQE
X-IPAS-Result: A2AIBACYOQ1W/5tjdVteHAGDCgFTUB6tSYwDhCEBDYFsC4cwOBQBAQEBAQEBgQpBBYQwAYowAadBlVgBjwWGc4ophBUFhzaOQ4UWh36JBpJNHwEBQoFKAQuCLjwzAYNghhcBAQE
X-IronPort-AV: E=Sophos;i="5.17,617,1437429600"; d="scan'208";a="28842998"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 01 Oct 2015 15:49:50 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZheF4-0007Uf-LD; Thu, 01 Oct 2015 15:49:50 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 15:49:48 +0200
Message-Id: <1443707390-26567-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] webkitgtk: Add some packageconfig options.
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
X-List-Received-Date: Thu, 01 Oct 2015 13:49:54 -0000

  * This adds some useful packageconfig options to the webkitgtk recipe.
  * It switches also the CMake switches to ON/OFF (cosmetic)

Carlos Alberto Lopez Perez (2):
  webkitgtk: Use ON/OFF for cmake switches.
  webkitgtk: Add some PACKAGECONFIG options.

 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
2.1.4


