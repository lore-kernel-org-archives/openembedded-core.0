Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED3BC0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:43:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4582.1689587017738721879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WBfBZ1MA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bb119be881so27541395ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689587017; x=1692179017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OycKRB9gfTXwfJs81LXWmngA8cpl6spbnKR/23Q/Ty4=;
        b=WBfBZ1MANuwKVIp4wZYbRvFlDebFRP7UhBnLHsJxLQ8tMbfEBCd1JvNN2a/nLGSsJX
         kFAEQ5IremuCMI7xDqhnh2gmaU7JdbxaSqPJaEMs6q3QaSsAo4/q/Bvgi9R9wbmWegT4
         2H8hQfKSUQFJZLTVg4cerVKYVfadmea57z7glgDImXWEYvtD+ah+ctXQ6my3lbJRwlUB
         OqZFbIEZ7e0Zs4hP2WaordSaSyUz4jXlQXbxg/2nVEjXmd2Q/DEl/lV4Hey2wyo4USOS
         W3MLaP2VpT2mADCscuIqm22+P/4tg71f6kwnHHx8gfsL1I9HQYvkrcYMCZHROaGd0hCX
         eiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689587017; x=1692179017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OycKRB9gfTXwfJs81LXWmngA8cpl6spbnKR/23Q/Ty4=;
        b=gYtSNU4mdWiEq1uPY2DN1KU952s9XDvQfKJAaP4peQE+Hek2oCnFFBx6CE4LgbBENf
         z7MGi9PKb8ANmP/0cSzqcrhbOvg4GZ0cMmwW0QF3NoMPQWn/5iV7pVo1SBK/8r8q/rtP
         fYFnBtVgrPeKp/fCZVpddWO9Z57l8ZiUSxwsWGEd3WN+r9WfrUMD9/k1I4nsnVCKY2dm
         ih07mhUxL4vzsDwU+Cs+limhZq9cYsXyW3P6Xr68gobI4Yfd/Mt5EGq5bUqWK6ZGfYYB
         q2NBOVyy/NwX5rxduc/i5/4t2GmvQhua8SjJNuEOWXW7/YydPd/ZtDaxBCpLC7zSN7vD
         LFYQ==
X-Gm-Message-State: ABy/qLazTtz+x+uMLn2fAUVG4YV5g3h4OuxDk1nOQS+JUbVBzip9tI7z
	5J2zlQ4Dz/hcDWMsAkUk0pYC707PBfuN+WIS
X-Google-Smtp-Source: APBJJlFhVGGISdeNZApJhtQVhLJISSZdYA7hJmcNqrR/T0QYVpLnrr3T5/MmKbryA9lCSnuk/OdHFg==
X-Received: by 2002:a17:903:2445:b0:1b7:f24c:3b9a with SMTP id l5-20020a170903244500b001b7f24c3b9amr14326574pls.47.1689587016654;
        Mon, 17 Jul 2023 02:43:36 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:148a:d9eb:c4a2:7201])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm11916442plb.3.2023.07.17.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 02:43:36 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-typing-extensions: upgrade 4.7.0 -> 4.7.1
Date: Mon, 17 Jul 2023 02:43:31 -0700
Message-Id: <20230717094331.1109233-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184458

https://github.com/python/typing_extensions/blob/4.7.1/CHANGELOG.md#release-471-july-2-2023

Release 4.7.1 (July 2, 2023)
* Fix support for TypedDict, NamedTuple and is_protocol on PyPy-3.7 and
  PyPy-3.8. Patch by Alex Waygood. Note that PyPy-3.7 and PyPy-3.8 are
  unsupported by the PyPy project. The next feature release of
  typing-extensions will drop support for PyPy-3.7 and may also drop
  support for PyPy-3.8.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...g-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
index 887cece688..8ff77ba4fd 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "935ccf31549830cda708b42289d44b6f74084d616a00be651601a4f968e77c82"
+SRC_URI[sha256sum] = "b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


