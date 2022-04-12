Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6226C48BE5
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8917.1649758592825006989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZGscOE5d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id m14so2595121wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EckTCXyayPKJ4kclFHJDbMIqGO/fADKVPiKD+18Kziw=;
        b=ZGscOE5dcWEY7/l080y4ibCxhT1HG81SK2LIwXYxod0T5q1aqNmufgLuCrQcHRWV2f
         TGgk6dmlUXFVm6SOrX2mB4l0naSa5wM0PREXo2GG78fpK178tzlEb2rN3ZQ3jghnjxJc
         ZPZ33Qps5/ycgBTLBPwNRT8G3YQdhR1QfRd7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EckTCXyayPKJ4kclFHJDbMIqGO/fADKVPiKD+18Kziw=;
        b=Xw82URN3iz/KdbIRzrNLA2HGWBX+SxJ9gtoInnonhDWf9Mx18f6ad7xBAeLpOyUhr5
         hUn1yFiFnfItI+lsKZXvk/yQ75hC6l+DBgIpBN0nWnT/QoUMwfaf6J86mIeb6xvShMjy
         EQ6PlGncqJC0kFWDYFU/YgXACT9+aUP3Mf3YvhfFdD+8woFaFt4cyNaPFeli3RhuGvz0
         AaPzBbmkIKMe6/CIP4Q2ZLCWvJ92ocRcar5X+G2G3QFeAHc39GvjzaVsng8DB84OPmyw
         kle4VzpsuuapU/wseHfnWw/xShKlkyUHE+LXZgDYPuuAHXqdFIZuyYHp+jjyVApYEz5W
         CPhQ==
X-Gm-Message-State: AOAM531Sd1acTHHKFVnKAU9WL6i5IEvKVuV72+zSKdCRVsWkVbDOQkdq
	YZtp2DnjktLt72Wfj4FsJzNJBKR86QeYIg==
X-Google-Smtp-Source: 
 ABdhPJz/6oK5icNwcBzxBhZMqtFah5beAwk6NxEhs7zpfVkW5bhUbnsaXGqcYLcn2+G0KdZ1PsOuZA==
X-Received: by 2002:a05:6000:18c3:b0:206:1575:ec8f with SMTP id
 w3-20020a05600018c300b002061575ec8fmr27305130wrq.479.1649758590911;
        Tue, 12 Apr 2022 03:16:30 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b168:4a11:27d6:cd01])
        by smtp.gmail.com with ESMTPSA id
 bi7-20020a05600c3d8700b0038eb78569aasm1886532wmb.20.2022.04.12.03.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:16:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tiff: Add marker for CVE-2022-1056 being fixed
Date: Tue, 12 Apr 2022 11:16:28 +0100
Message-Id: <20220412101628.2122117-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220412101628.2122117-1-richard.purdie@linuxfoundation.org>
References: <20220412101628.2122117-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164261

As far as I can tell, the patches being applied also fix CVE-2022-1056 so
mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...02-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
index d31e9650d1b..812ffb232d9 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2022-0891
+CVE: CVE-2022-1056
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.32.0


