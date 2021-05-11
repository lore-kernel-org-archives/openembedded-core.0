Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.12288.1620737503748311197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SteHEnSQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id p14-20020a05600c358eb029015c01f207d7so1164013wmq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8q/32Q5qqusaSTwJtES6pXZd8DEsSskifD0OZBjyWw=;
        b=SteHEnSQjmMP1fg2CH+HzcHFaDNROn3K42voSZLuMK+l7UrovgPmUDmfrouVuWJ2uu
         ydQsAZtJkkfOd6D2VwA3UjXF7vBJTj0qtDpACwYqFbUtD2kfv5WyUzXfQrnGVP1vkYva
         eGvxq8QiVH5lgKHcxXaTp31OaX0Yc0hzxRaXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8q/32Q5qqusaSTwJtES6pXZd8DEsSskifD0OZBjyWw=;
        b=JN1lEcN7gbc/LLX/ZRG4EQcumSIfdMD6r+bKxyg0Hko+btSBwnUtgnoXBpLb0hwhcb
         yXo4Ns6foBjXA5r6nmwGxSRDznu09hDWJV/bnSRdXJxfFZn/b44IP7r7wmubFn5CuwyN
         ubETfF/VAsysWNYD0KnJUyjZN9iVYwbDrR6R7LB45drkGDmsTUfzfa3Ct5HrElbfxaXL
         RE9bflm/LZ0TzoonSqlCvtadFaVO11j3TPD3/UBAZDwjzjc5aTL5Uh8/3yRE7kugAG+H
         suRttrjyzmvJk4efSYBjL7SV8OIdvOOfZW1cxkqBw8QoEQNQItHoiQDP3TkrcJjAWmiE
         6wxA==
X-Gm-Message-State: AOAM533M/T6FbzjmxLNWfxkvD3C7+fpCP3iGC670wemzjfaJq3gtdzVU
	+qiZaNGfP/wD3CrJ7HxHHiF3zeZGxMNz2A==
X-Google-Smtp-Source: ABdhPJxmM7/tH1DfhN117HWw1Ig4hxfKXzRQZLJ/lRiD25FlvpuWyzDoP8w1wBinpSARzP7NkH2xdw==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr33132031wmb.45.1620737502309;
        Tue, 11 May 2021 05:51:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] cpio: Exclude CVE-2010-4226 from cve-check
Date: Tue, 11 May 2021 13:51:35 +0100
Message-Id: <20210511125138.2232637-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue applies to use of cpio in SUSE/OBS, doesn't apply to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cpio/cpio_2.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 94d86100c74..f4df826ed9c 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -16,6 +16,9 @@ SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8
 
 inherit autotools gettext texinfo
 
+# Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
+CVE_CHECK_WHITELIST += "CVE-2010-4226"
+
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 do_install () {
-- 
2.30.2

