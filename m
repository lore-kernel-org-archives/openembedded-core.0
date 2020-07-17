Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.12740.1594996682807050974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vxErHwJg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a14so5481826pfi.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QDddA/kM4nCbZPeR0T3Gf8zbJ6JUPF+Is41dN5fjfTU=;
        b=vxErHwJgnKNSAQHWHu3JdYDOWmMBoFn1evbANK/7QL8V7Vhb0ZspwM2j4XqFu+ZhMa
         F2tBI01l/p7tYTT19+vU29O7563sGDJOvnAXKOrVVOlncMjndcIFm0s4cUsnRn9Dw135
         QSPq6krH4SrhzIWSQR6pB+zl/aO0aH+2yc0E1t0htUJIuc7Me4cejjs5YNYN1goDU259
         /bZnLy5iibwTBcLNR1j4Oxjwo6AhEMX56LlkLOvanKE076Y5OUXWg9KkBabUAiTSTVEc
         D9aVq5gAKTCU/E4FsvSUPsOmlB1SQ0QtDeGe1DjOofb13WHy69opNhBu1oJ1gIdygelZ
         hJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QDddA/kM4nCbZPeR0T3Gf8zbJ6JUPF+Is41dN5fjfTU=;
        b=GphaKc3LJ5G0zwGycyIpdTxGDLm7CgeRTbvxgQAhCzU8Ebz9ceI7q8WLMLbJl4cMHp
         ZEpCq+kVQuDsSgdyAiwlrn7XSZyci+nk0Zgi2ZfxqZ404OeJOkt+EQfsf8qrdVDntEZq
         Prj7eN3fKez4Xd7XZfkwgGzsE/l2oSvOz7GjD7B8+xABEILlsn7mG/Jq2WUXlVfzYEGM
         Q/Yvi46VNMTR/VlcgG430MT2AzfgYrGIZXPgO3pluE8foywwv7KW8K4mJc9M7PmmIeyV
         lEvjE6ZmhkTfdmJnNw4hM+WajIHhmPeg7JYPlVHHykHbOskP64CfXeU7JZPYQ5I+XNwg
         YTVw==
X-Gm-Message-State: AOAM531MIeNt2b0a1WlxkvnZiBhTWpbX7cUL8+SaVwdmohulg7nl0FJk
	OK9AWyX4MZnzxnkRSVscRUgUxphK0Sc=
X-Google-Smtp-Source: ABdhPJzFF8uUW1GzybcuMxszy/FvXQVUJ13ZSTShB4jvEKgsLWa3sSybZsTcSEvvaqAVxJo4leHubw==
X-Received: by 2002:a65:52c2:: with SMTP id z2mr9181909pgp.419.1594996681736;
        Fri, 17 Jul 2020 07:38:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/20] linux-firmware: fix the wrong file path for ibt-misc
Date: Fri, 17 Jul 2020 04:37:07 -1000
Message-Id: <21cd2d89667a286352e70daf07129292b842aa81.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Yongxin Liu <yongxin.liu@windriver.com>

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7c1470ea6e337dc1d1e320d33267f06584e9752d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 392e03a10a..79acccddc7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -813,7 +813,7 @@ FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bs
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
-FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
+FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/intel/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
-- 
2.17.1

