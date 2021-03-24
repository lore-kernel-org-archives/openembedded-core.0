Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.209.1616596787744615599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TMzpDpMP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id v3so14788219pgq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sWDUWhPUnuiE1L1X4ekpWh9pnBHNNX8nc2TdbyfKjfo=;
        b=TMzpDpMPdDeGCwkKE4X96J02W1MRyyfg4hH4Wc5CdB1J/Zrjp30BF9BCz21pmUjtXt
         fKypmayjRiw4BItoyp0gGcJUmMNSS/Ng2u9lKuLvLdv6sR3PQs8K8rJMN3IAgDWN4EPM
         Y3VyKhDrno/l9ppiyavrBVo9Zp+7fq8Ad88i0osNNdHnpJYHehvg+XW8aSg+3f+4yFR5
         S3XZ70XOt3TcD49zYN+qR+O35oLNyc/plxMfVat4vnp/fKInjda+HJ/LIWXPonVk6i4f
         0RYdeavShSk4xxtlzD4tEvr5DGXBCtednFObUcwLnKcvEpGFklzx1SBzXodgepIeoY+7
         T8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWDUWhPUnuiE1L1X4ekpWh9pnBHNNX8nc2TdbyfKjfo=;
        b=SYHV4BbWD9XwbPDNI72m/ypprDUh14lDwuhymx27VPN5TmGGCBlU+4AEB5ykhZvwxE
         skX+WrCfK3+sRubWAVQCPvu91wlGKztRS18i0Upz473nwBCam7uFJPQF8tIUD9gujFbQ
         qdMf4ukpc6WXmY2UfkhvhlPGCJj3YyxxGf7cJoIEQZ4IMPNglsLGbqs1s/WmNEIdUaDE
         kbUgQNle0l0iDtjzxWFOmTnU/zlHysF68IIFDg+nVUK1Cx4MSaxlwaR+RYU9MbNsy+1H
         ZYGtTbQgfaGQyrjympF91SJ4ZnmNW347xz1s/XMt5gTSzXDKG3IpzKENFUpRdP/5Yiii
         HGlw==
X-Gm-Message-State: AOAM530Bq7duq4QpsfYXFbtPdtIeojkrOwuPEURhs7HAgQ7qR1Zgzy3i
	0hrLVnWXFEYSj4kbmRHdpbmUkJaYgVxzCjoi
X-Google-Smtp-Source: ABdhPJzPAjAr8CkgghwHb5uICGy3CbucdSx2ya8mtBex+0u8ldue6aDYuwwWBjNo/Sxi0GHGSxQ82A==
X-Received: by 2002:a62:2585:0:b029:1fb:bd86:2008 with SMTP id l127-20020a6225850000b02901fbbd862008mr3188118pfl.77.1616596786754;
        Wed, 24 Mar 2021 07:39:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/21] bitbake-whatchanged: change ending quote to proper period
Date: Wed, 24 Mar 2021 04:39:00 -1000
Message-Id: <f63ae3256cb880564f1b786e4c381ffae5cb58e8.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Pretty sure that trailing quote should be a period; it
appears to work properly.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 579f9ada19bd174bff0002cd6a731d12a1868252)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/bitbake-whatchanged | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 3095dafa46..6f4b268119 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -217,7 +217,7 @@ print what will be done between the current and last builds, for example:
     # Edit the recipes
     $ bitbake-whatchanged core-image-sato
 
-The changes will be printed"
+The changes will be printed.
 
 Note:
     The amount of tasks is not accurate when the task is "do_build" since
-- 
2.25.1

