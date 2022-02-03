Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C3BC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2837.1643917862424548413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g6oe5C1V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id z5so3108728plg.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aWfyVunrpC62K/4Hv6x663odpVJWC+8DBs7n6iMdZPE=;
        b=g6oe5C1V9IEb1aTIw41h+4/N778jXySxHUNxewp3q3c7lMCGMcfDyln2fMQin01ISg
         dSldAOgBVLGN6i4lo5pV7i3UQnF2TZ/ZV2knr51R3E/2dJwg8X4jx79DB2sdrs/wjDJ3
         g+QaUdr3+rr+MbyMYCSkfqLt8QXyMiSa6m37ZXpkP3nACQGsX0fNprBkVIyyxVAAhEGD
         loQJ6Fr8AjqtJQdHCJbFlGLWg9jycsOFH0NcioeQytdbSRqWPw/SC6CJI+mGIQARBtoZ
         GJWP5EJdEnh+ZYzgyfp9JaJ7UIAIB5FHi7Ak88NiwndqMo38erSXhdkAY5op4Sq8eN5f
         6Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWfyVunrpC62K/4Hv6x663odpVJWC+8DBs7n6iMdZPE=;
        b=kE6jQ2/nl8D+zNi4c6ljtkl2KhtORAiSV4s4LL+VJVNVvuDiKk0DHMIrbDoaisattL
         MFOv+IsGZXYQSV9a/XrZ6TpRqCJ/cdvwhLgbu71zaJOK4UU7cr3HsxYBnr+SYxkjvhdj
         w2u0t05LLJHSRQqSlkC0QL+y0eryReD8X0KZ/D8vMSA4CRBdodxCo0q0O4nLjYkN3m3G
         NBi1jt9kdfrUaWDoia+tmq7fiUOA6ulR6tcMLbR2+ahuqpe3x6FMJRaA3RuA9z+vD2cl
         5+ztOu1cdrlZlAJBMk4YUsvrj5/ssrJIDTZk9s0S/klLAEXDcFqg8Udy6cXG05t3TKOQ
         1ZGw==
X-Gm-Message-State: AOAM533F3+yCnC+Kden7E9ptsov99y/YdEXBStJ3zmvbJkaSdR9aGrpD
	6MwSVdnhUD5XYNRQOemgVCJFOfbAiekZGBpJ
X-Google-Smtp-Source: 
 ABdhPJxB0cI5q7/Vl802m931R7xghJg+lDnnAAeej22U6ENFDoblfvQloLg6hEyCHxIXiKNG+kKjcA==
X-Received: by 2002:a17:902:e5c7:: with SMTP id
 u7mr37724030plf.156.1643917861266;
        Thu, 03 Feb 2022 11:51:01 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.50.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/20] glibc: update to lastest 2.31 release HEAD
Date: Thu,  3 Feb 2022 09:50:25 -1000
Message-Id: 
 <8785405a214b5af5da0b5deae559539531b1c237.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161296

Includes the following fixes:

3ef8be9b89 CVE-2022-23218: Buffer overflow in sunrpc svcunix_create (bug 28768)
e5c8da9826 <shlib-compat.h>: Support compat_symbol_reference for _ISOMAC
412aaf1522 sunrpc: Test case for clnt_create "unix" buffer overflow (bug 22542)
c4c833d3dd CVE-2022-23219: Buffer overflow in sunrpc clnt_create for "unix" (bug 22542)
547b63bf6d socket: Add the __sockaddr_un_set function
b061e95277 Revert "Fix __minimal_malloc segfaults in __mmap due to stack-protector"
95e206b67f Fix __minimal_malloc segfaults in __mmap due to stack-protector
e26a2db141 gconv: Do not emit spurious NUL character in ISO-2022-JP-3 (bug 28524)
094618d401 x86_64: Remove unneeded static PIE check for undefined weak diagnostic

Also add CVE-2022-23218 and CVE-2022-23218 to ignore list since they are fixed
by the above changes.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.31.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index aac0d9b3bf..68efd09ece 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "4f0a61f75385c9a5879cbe7202042e88f692a3c8"
+SRCREV_glibc ?= "3ef8be9b89ef98300951741f381eb79126ac029f"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 4a545cb97d..0c37467fe4 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -3,6 +3,7 @@ require glibc-version.inc
 
 CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-2020-1751 CVE-2020-1752 \
                         CVE-2021-27645 CVE-2021-3326 CVE-2020-27618 CVE-2020-29562 CVE-2019-25013 \
+                        CVE-2022-23218 CVE-2022-23219 \
 "
 
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022
-- 
2.25.1


