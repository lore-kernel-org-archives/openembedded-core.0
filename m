Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5907.1794175882602165511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 14:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=d6fwdFAf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261108221120e1c919760f000207fe-pps9_l@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261108221120e1c919760f000207fe
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 23:11:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zp7aWyWa89GL8ZUANsB2m8gw61U/9Opn0ANGn5lISIA=;
 b=d6fwdFAfa/BlCsk2ng3uKethcVlGbtNq+L5MLp8xy9/B8qSs6etPXTxF71w75+JpWAegHj
 Zl33zLNjdlmBdLAF7Lc+SvZyLVGFT1IqpMPM2/QNYSPe+s31ee1WMfPBqx7IPO7yLJEy6Wxy
 sUy/Dm0VqmxlinCCEbyoeEqjb6LvYKKrUubofexgIqFdlMRZS85Jsh0Pr0o1Bj/tBjllyOBJ
 VE4AMEP6jUFaaDbLHXY/0dM5hJDKncQ7X9aOpyf4kFLh5KFZVaoyaSFn4laTUwp0fHOiGeYK
 0aavBt33vBXGY8haSTlKB6V9PQHqqo/nqMk00N9UcjIeJoI1ImkK+XNA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] aspell: upgrade 0.60.8.2 -> 0.60.8.3
Date: Sun,  8 Nov 2026 23:10:39 +0100
Message-ID: <20261108221039.4041353-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249778
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix CVE-2026-75818, CVE-2026-75819, CVE-2026-75820 and CVE-2026-103658.
- Fix various other memory problems.
- Fix various typos in documentation.
- Remove unused MySpell example code.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 05baab915b146a19776cd292962e2cf4edfc6f20)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 5b4fab7c35..6ac547887b 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
