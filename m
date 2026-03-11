Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EBB103E2EB
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 22:42:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9069.1773268947918729499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 15:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OlqNChEo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260311224224120ecc78690002071c-bbzj_r@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260311224224120ecc78690002071c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Mar 2026 23:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5N4BBJpGNDYpGBsk/JDYQcV88RSZjxsCjtImVTXzgEo=;
 b=OlqNChEoO+bvpyp5n8JD7PlIx7mMGXeT4MiuJCBNuAYvL9OIUam3k4c+jCGNYvAry47d0e
 r9R0eATR3CJX05e9NHJzd9FdM1Ayt4GHODWpnfliH0mybqcoN4z7LzTCrRlyGpqd6j/BFCKs
 GAolvvmMfMoJWwrQ2p+IsVszcied1lgzJhqvy73r3LnSeiDOP+tiUKUglesnIZtStSchyu17
 Pm6Iy7NYyDFGnU9ZdWWwk5WqeJvtvJ968deGsQ8t+QTXvNCiLkKQfLx3wdoICy9Nupcy52/8
 Q5LKCBBRKNhDat6UN7oi+zWx+Ou85uUeXiW6FQ1IjVVY/ctku4FXeyWw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libarchive: upgrade 3.8.5 -> 3.8.6
Date: Wed, 11 Mar 2026 23:42:21 +0100
Message-Id: <20260311224221.3926155-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 22:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232914

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:
* libarchive: fix incompatibility with Nettle 4.x (#2858)
* libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
* bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
* 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
* 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
* RAR5 reader: fix infinite loop in rar5 decompression (#2877)
* RAR5 reader: fix potential memory leak (#2892)
* RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
* CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
* mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index 7b10823002..d579cdb65a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
+SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
 
 inherit autotools update-alternatives pkgconfig ptest
 

