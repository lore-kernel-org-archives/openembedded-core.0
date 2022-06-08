Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46827C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7233.1654699208210141816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g2QFbMSh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso6791891pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u7NUnP8We+3eYdLOhAzgBKX5kAziLKKHvx4nWuc05nw=;
        b=g2QFbMShNLOjAgVI3iI06TSuUeHQpuBBNOKoD0pFams9wliJJh5rn4KLvMWc2eN8JZ
         obgczxR9lUXsoJqdueRu9XrNnfuK2nGjTu3c9lZbU6uxfLtjcIgNwi52TnS5Zks7dRdI
         tMAuM2pgsqLI5/iOTX5KLn6vM/99Zlym9S6fMPVnXHd3Hcrx8VN8YvJYdg6+SJ27zgCq
         4VBgOAgcNyYUCpXURc/we5snDPM2ocgZStlwtnRKVPL8++uHB4spVeAD1+9hA02QgJ4O
         cDcC8nUZGJ2a8g+auv7EJ0d3C5GsjIMbTETWWtiEgl9Mfv+dpuHu45wNDDEofVLmMdN2
         PvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u7NUnP8We+3eYdLOhAzgBKX5kAziLKKHvx4nWuc05nw=;
        b=71vzPmUir+TPCAjlVoEtdaAuS1GnqQEa0Qlt3RkJgdDR0kbmu8bTZsyJIkgj/XdAqi
         N3s36iKV9eVzaz3J+hqMFE67cQ/CiaYU4svKPa8LeE+6btHxsIM439hcNgpIVfTUus0n
         HLvE/k5K1gdiPqX+fX9dYV7naQ/D7clQTd6cdlXIFY+jqubMKAjmgcBjmrpx5+yW6DmR
         jQsGp9D9e4ef38ikVq7bM37nl/FHi0pbC1hDTZP+M/dC5jXE5kBytP4LnLCvGlAmchAu
         v1VJN12p9zZEUeL+IKQAe41JVcaX3o/GpXxHonIrJU0zZwxakTQMeiJIMYo07ua7q7I5
         ur4Q==
X-Gm-Message-State: AOAM533zEAuyYSxTaE89u3HC2iF/Eyb9OFABbfAOxoXQAB6BaPAj7XCw
	/yHZce4AFj4NGjkxTQETzaeNrUoIujTqoqzB
X-Google-Smtp-Source: 
 ABdhPJxIwZq2UII5VrG6iGF7WcTPRiFrwb6uTWoeFEN/OszJWIvVe4MA0RK8xeslrEfIUtLaeMxVWQ==
X-Received: by 2002:a17:903:2308:b0:167:7030:6847 with SMTP id
 d8-20020a170903230800b0016770306847mr18666829plh.122.1654699206998;
        Wed, 08 Jun 2022 07:40:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/22] cups: upgrade 2.4.1 -> 2.4.2
Date: Wed,  8 Jun 2022 04:39:18 -1000
Message-Id: 
 <af7048c4b7daabc237b1b8f2982d67cb1fd88b4c.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166716

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
- Fixed certificate strings comparison for Local authorization (CVE-2022-26691)
- The cupsFileOpen function no longer opens files for append in read-write
  mode (Issue #291)
- The cupsd daemon removed processing temporary queue (Issue #364)
- Fixed delay in IPP backend if GNUTLS is used and endpoint doesn't confirm
  closing the connection (Issue #365)
- Fixed conditional jump based on uninitialized value in cups/ppd.c (Issue #329)
- Fixed CSS related issues in CUPS Web UI (Issue #344)
- Fixed copyright in CUPS Web UI trailer template (Issue #346)
- mDNS hostname in device uri is not resolved when installaling a permanent
- IPP Everywhere queue (Issues #340, #343)
- The lpstat command now reports when the scheduler is not running
  (Issue #352)
- Updated the man pages concerning the -h option (Issue #357)
- Re-added LibreSSL/OpenSSL support (Issue #362)
- Updated the Solaris smf service file (Issue #368)
- Fixed a regression in lpoptions option support (Issue #370)
- The scheduler now regenerates the PPD cache information after changing the
  "cupsd.conf" file (Issue #371)
- Updated the scheduler to set "auth-info-required" to "username,password" if a
  backend reports it needs authentication info but doesn't set a method for
  authentication (Issue #373)
- Updated the configure script to look for the OpenSSL library the old way if
  pkg-config is not available (Issue #375)
- Fixed the prototype for the httpWriteResponse function (Issue #380)
- Brought back minimal AIX support (Issue #389)
  cupsGetResponse did not always set the last error.
- Fixed a number of old references to the Apple CUPS web page.
- Restored the default/generic printer icon file for the web interface.
- Removed old stylesheet classes that are no longer used by the web
  interface.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6f4131e73553f47709e19871c23a411275ab3857)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.1.bb b/meta/recipes-extended/cups/cups_2.4.2.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.1.bb
rename to meta/recipes-extended/cups/cups_2.4.2.bb
index 27c88f82c7..f5ca749bac 100644
--- a/meta/recipes-extended/cups/cups_2.4.1.bb
+++ b/meta/recipes-extended/cups/cups_2.4.2.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178"
+SRC_URI[sha256sum] = "f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9f2521066c9c6c908"
-- 
2.25.1


