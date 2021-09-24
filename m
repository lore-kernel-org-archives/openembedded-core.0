Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.8852.1632493014501199598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NslS1KBq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id r7so6511582pjo.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D+MRLi/Cua5sx8dZA2fJTurhuLvtDrYSB/fZkXTXB8s=;
        b=NslS1KBqf9a6qViRl+vPLVGchde77LdqYmQNtv76ssMLdgsosNaYj70DAuh/iOHxxz
         I6oEmxF5187ydG6YbJbIRSHiRMikrQ2SPh/0JUqhPKylUk4Sutzn3W7cVgEQpOd3GVcQ
         9Jr+2dyhyh7r76jjzWDjlrJQrx+kOFN8s/e/rRmPPZl306tUmKDPAPJbokqBRbdRFRBN
         mSIW56WR5EwuZsZPaKGDBkxuBMJ72Ulr2iQ9Ok5DFnmb6RY3+87/NZxvVL1HDvb/Aefz
         3s/+uty86iJ0GZ1QgMhnrRf/GTdA5uMW27VS5fBF4IFBtGojmS1b98jMfX1DffBKSqEl
         0NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+MRLi/Cua5sx8dZA2fJTurhuLvtDrYSB/fZkXTXB8s=;
        b=dtlFo+GAuwCYAo+VQOIUXQkpvUxTy0yyaC7wz7JiM27b+hBnKWQz/GVHhMBm1SsUkb
         kGGkpDdIxJddeV5IarhOPMoqMFuTXTfeaX6NBMxGJ8qcHegCUN4l+5R6TkR6MXb1zCJR
         gGA0AvQfw5/6pMzgiOZT0LuP4FVcY9EUFd7RwKMy3hGOsXFQd8tuNYtwXMfJNkz7kHJj
         IgjMO4HX/RDlVr6BOZoagrk3f5iHB4BMiXaYCnxbgmfg3pk5GGNoh7yerSqiOZlzXn/O
         qOEiQGLcdeol2OkHBqgPobyh0Uwz5nKQlXwcFPOcxb7QDNTOvuidgs3lWqcNJ2+GYgIu
         Nraw==
X-Gm-Message-State: AOAM530e1jbHAknfMvnpEPXbMtOwNuC/5W/CTxzSx47lqAtAt6Yvm+Oe
	31QPJWtucoiyF2/ZYX8nHTh1h+QwEH3pQSBDTX0=
X-Google-Smtp-Source: ABdhPJzOjETvqL0C3zmAwCcpjSwHo3pRZKmAvcUpCSHNxw7+uReVqpy8k2BgtGMyGXM0CJt0MY+MdA==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id w16-20020a170902a710b029012b9b9fc461mr9145199plq.59.1632493013578;
        Fri, 24 Sep 2021 07:16:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/25] connman: add CVE_PRODUCT
Date: Fri, 24 Sep 2021 04:15:29 -1000
Message-Id: <63f775dabae56220c3b020233456006ef2161587.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream database uses both "connman" and "connection_manager" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 55e5bf97c7..c495ae29ad 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
+CVE_PRODUCT = "connman connection_manager"
+
 DEPENDS  = "dbus glib-2.0 ppp"
 
 INC_PR = "r20"
-- 
2.25.1

