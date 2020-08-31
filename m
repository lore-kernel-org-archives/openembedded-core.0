Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.57538.1598891675957084726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ipXXhfUk;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id j10so2931024qvk.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiXuKc69PaFjzYlyN3vTeVoH6LCHfzJnroe6MvZXYCo=;
        b=ipXXhfUkDH9OTLtArVQYZTs0TW9i8da+CcscmIspd/DZ5XdEy6Oz6HqjX4hn1gtLgx
         hCljVnS6oF97TDguyQ4jU0siZXVHGCuZmLftB+uiae0CoMk3DYCtl2F69ShjbvPJnzPw
         8Z0pXrnTJsK4suybn7qhxiZIY1Tmk0uYLz7qbf2yYRSfSEX7zHlJOYetbJqXYejwHLND
         IqQKIgd9xCYkUGkLGvDvH6ahjgqU09guP3GZGsEgsda8dCBafI9V5MEe14FdHGOT9LtT
         +U/5QpYsLsWB7VpUU/vTiYQNZ4T1Lt2Ac4K/BRPl9SPKv4Bxulw0dhdofFXqmWIA8qw8
         M9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiXuKc69PaFjzYlyN3vTeVoH6LCHfzJnroe6MvZXYCo=;
        b=t7o6oHI1ZQXRqw1ZGYfsLwz3/ofJWxQGXZNA9y0aszDsY8MFxI09gX/fIiokXvJ8t9
         YvIwPbjB1CiVdWsgTetgyZhHiyQO0d6sri+4cHiExDp7mAByhFq+nLd3f47zDKOTAUwx
         W3AGrAhrQa3vU5Ib8pCco8ulsSAAybev33MjQ2jdEexCsL+hoUWTt08Wtn4d8C53VcWp
         Aai/4btfBWNQTFlOeQkIC8JJ+jPV9D9QAaNyTwzLl1dBI3Zq4zeeOpjz5O+h/ddiWyxH
         /VXtGQRgNc/KpQW3I7tiXLQuBC1MZ6Y1jvK90rqAtCxmmecF2nkXOlauzP2uBGjZJCCA
         7/lg==
X-Gm-Message-State: AOAM530OBetvGh/mR0QQHXCbDC7CEhu6atlV5Ekk+3TKBaAMa+JeIZ/k
	jhmrxMfENIM9GYkXfHfPqksINmUvG1pHLw==
X-Google-Smtp-Source: ABdhPJzZalVnUykAQzpbYCRcWl0Oze7nBUMSbWbON4Kpa4HyXHBc1exuVjXpvTTvsZ2rayJbX1qjuw==
X-Received: by 2002:a05:6214:94c:: with SMTP id dn12mr1871278qvb.156.1598891675026;
        Mon, 31 Aug 2020 09:34:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 82sm10294472qko.106.2020.08.31.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:34:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules/devupstream: bump to latest 2.12 commits
Date: Mon, 31 Aug 2020 12:34:32 -0400
Message-Id: <20200831163432.45373-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating lttng-devupstream so we can build against kernel
5.9+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
index c2fc65e019..0e1a209ce8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
@@ -36,7 +36,7 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "11441f8f17f7825f529e2f6c54d3605771709260"
-PV_class-devupstream = "2.12.1+git${SRCPV}"
+SRCREV_class-devupstream = "57ccbfa6a8a79c7b84394c2097efaf7935607aa5"
+PV_class-devupstream = "2.12.2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1

