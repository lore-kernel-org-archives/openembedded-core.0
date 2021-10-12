Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49065C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.8089.1634004546841889961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hcHAWHev;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id oa4so13852786pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C1tb49fSpxciuthtV2NXCky7PgT8XlEcEOJR90pmT9c=;
        b=hcHAWHevjnTSEG04t+oN0Y2jYI6B3rDWaG8dkfdNRk/IuZqaTR7t8cciOja2+eu/OK
         rpbSsbfQClb8MwNniX42rAwvcEX73ORC8Po4uJM/Pf5sLrl2gsEmvBGM20JaM10ecibN
         2Ya6ekIfzTHQTCQq59W3SYu9sRZYz1nNjSoyhKRi2JAiz1V9Dx/yjtuvSPut7U0suUPr
         QZnRywMh1IU59G6uEWdyUQjOUql5Z0kvxSJFpYxVTxi/hWCoLkRpAfv4jPnoGXiaHdVo
         6tWwQXtQK0eYmxrecb0M13KC3JRXfR0LubL43u4Kps738XncpcdhuVzbLM7psl6ctAPZ
         SE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1tb49fSpxciuthtV2NXCky7PgT8XlEcEOJR90pmT9c=;
        b=pnpxzuPeUnYSyh1bo0PTH1ys3DRa4DvYno8fm2tjkURUk4ocKORckRXkxMREaGb4k/
         gBgpicUilNMMmHtVb+P6slXMpnF3o0+sUiNxDO1MN6aGyhudvgKYG0/rqp/f5UhYQAzK
         V+TcqtfKBVvOTPzu+oo7u7p/jNikhv4RBXYRERhUbRKvywJpmIjJ8zzOqN11UvMhStaK
         ERkiHPAmA5f9qFPYsHWgq/EYO+eWNzc1qhsxsnhLrGDtEvAYAiosEIBowvAgQY0ptOT/
         MJSMRG3+GE5BFcbezGaXq1xWqoh7yv8Xy0XMGXTDycfwkyT2hWy85IDShKBz7CaDVSO/
         iFPw==
X-Gm-Message-State: AOAM533+8aHflVEm8eeFXmNu1QiGs0waIwmF+nR4qxeriu5LApW8aEtS
	lLH/8LFjk2vhkubjHEPMMmDX3xdRX5RT4w==
X-Google-Smtp-Source: 
 ABdhPJx0NBoLNSzuWZAdycyM0dd18ZxBAT2TlN0PvWPHKcIbA6KqTVwZJdmks6O1NxlR5aOqwTWiNQ==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id
 p19-20020a170902b093b029012c0843b55amr27735970plr.83.1634004546200;
        Mon, 11 Oct 2021 19:09:06 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 3/7] python3-more-itertools: upgrade 8.9.0 -> 8.10.0
Date: Tue, 12 Oct 2021 02:08:50 +0000
Message-Id: <20211012020854.2073998-3-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156854

8.10.0
  Changes to existing functions
    - The type stub for iter_except was improved (thanks to
      MarcinKonowalczyk)

  Other changes:
    - Type stubs now ship with the source release (thanks to
      saaketp)
    - The Sphinx docs were improved (thanks to MarcinKonowalczyk)

8.9.0
  New functions
    - interleave_evenly (thanks to mbugert)
    - repeat_each (thanks to FinalSh4re)
    - chunked_even (thanks to valtron)
    - map_if (thanks to sassbalint)
    - zip_broadcast (thanks to kalekundert)

  Changes to existing functions
    - The type stub for chunked was improved (thanks to
      PhilMacKay)
    - The type stubs for zip_equal and zip_offset were improved
      (thanks to maffoo)
    - Building Sphinx docs locally was improved (thanks to
      MarcinKonowalczyk)

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...more-itertools_8.9.0.bb => python3-more-itertools_8.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.9.0.bb => python3-more-itertools_8.10.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb
index 041c865ef60..93d3ad60f8c 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "8c746e0d09871661520da4f1241ba6b908dc903839733c8203b552cffaf173bd"
+SRC_URI[sha256sum] = "1debcabeb1df793814859d64a81ad7cb10504c24349368ccf214c664c474f41f"
 
 inherit pypi setuptools3 ptest
 
-- 
2.30.2


