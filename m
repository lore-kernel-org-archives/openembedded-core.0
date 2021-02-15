Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.815.1613432833571788905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 15:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ez/jAE7y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id n4so8080462wrx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 15:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6cwKtJnI97uJc5NYr76ZVBWxzGK+9j8+3i6u3xhIDt4=;
        b=ez/jAE7yYGVmQ4CdSGrggtSU0abSICUKAD5Q3jHwKLziFNPD76CTWfRg+EuKntmYMJ
         ckeO3tCKiUNifPmqO6XakqIGDxpLxtIBwXl+Z6mCpzco3srYSVzfu5sLwO74TII74IKg
         F0T7zvq+t3tVywVja/aqd7w5gj5WQain1EPGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cwKtJnI97uJc5NYr76ZVBWxzGK+9j8+3i6u3xhIDt4=;
        b=o/oCbl9j2vspF37YZupFE8LghaulDa9v5vlP5yskAgSnH2/GdRIX76QpMtn3aMyGjg
         mzOi94XDffR8ilm0M+Fkl1R4Yg//yyCSmWu3ACVSygXSFUHRZlu9J2IakLZUIExPjFJ3
         3eLw49I72G4Rfci8v9xoCLyI3kaA8xZ2qwfyUj4x1D0GG50A2lFbHugEhQ8xiukd5GzX
         E74u0aQSZQaHVSJgdHN7750sbdktLSG5MOVmNqbNd3Dipm5+u9xzXsfdGqhsXlSd7RcF
         iIOgfdll61FnFt/kSRo48YApobhRWr/ouTCV6wFwki3YZrda6LW3EWMU1Tj/JRUZRHtz
         UudA==
X-Gm-Message-State: AOAM530G3YRKjxNVZH8QzYPNHx5uhbRQIHzzze1p37oqisiJmHW3WXbz
	Ssob7Gzimrho9Y5f3P9MhGJoArIDG65/WQ==
X-Google-Smtp-Source: ABdhPJz8MPegthRQkVkOREml+DIlvSW606DyQFMERxRb22JRTcjzE7Wf7W4TnkAEXsRHpiJ3Wh5Dew==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr20821150wrn.231.1613432832031;
        Mon, 15 Feb 2021 15:47:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id g18sm6925352wrw.40.2021.02.15.15.47.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 15:47:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] xmlto: Fix reproducibility
Date: Mon, 15 Feb 2021 23:47:11 +0000
Message-Id: <20210215234711.2007976-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210215234711.2007976-1-richard.purdie@linuxfoundation.org>
References: <20210215234711.2007976-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't hardcode the host's grep path into xmlto.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 7d27c43c830..5ed2709e311 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -29,7 +29,7 @@ RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
                   coreutils \
 "
-CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail"
+CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail ac_cv_path_GREP=grep"
 
 BBCLASSEXTEND = "native"
 
-- 
2.27.0

