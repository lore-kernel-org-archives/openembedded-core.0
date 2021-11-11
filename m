Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07853C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:11 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.6205.1636603750075367597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5s+gwt0G;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id s136so4068019pgs.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HeRqM1D0Ew87uVMzB0Ax7q4qnazU1WMKkkL68/dG9Wc=;
        b=5s+gwt0G1sE9wA0uvsc+82Ew8gs83de/jqXY7+SIIfqfH4ypFDV079A5c3FXwMMGOI
         kRxrB/vIzqztFWYAX0YPer6VrAbFeGovmduyunHKSTsfW7Dz3JbLQHNTofvK/qzt2SGq
         uICQlq3is7roLPY3siuwd93KDexk60X8yWlZlDtebsdDKlW+qxGzPYc/GPC8FwPoISPY
         NsvI02CVG0DjqfPk31LkDJ26VVTRBdW6OXiXqJ+sXU4RTVMw4rryp/dmfhr0xY3oe5fk
         6i4CHGggqRt7BxkHIXVml9I+gHiq37kkd1+s6dlB8ITKBIYvyVGKouJjfFVZIFtfw5BP
         khJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HeRqM1D0Ew87uVMzB0Ax7q4qnazU1WMKkkL68/dG9Wc=;
        b=ZyN38Ziq+vo6+HIKh/I24l+jqpOsdLdqV0XGobxRnVjzvQ30pdcp3hk5L3/UNiXT7U
         N1KQ1pwlDQK0AC8AOVg6aQrGvW2LnmO+NS4GYoPHYyuCAMaL5B4ywhmDKmMFLQn1QGPX
         AT0gio5ovJpiE3apBzL0LriKjnuel2nbxUxZxyPhxDwtyRKSR/BizWsoAFoYjtlGKHFw
         cd2/2jKsfhmMD3wWUlSWDRl2e5KpWQDQwMkLKNLFp2b18O9Z/DvibbJ6CBcDTonMbFLJ
         BRMkizQIoMxxMiL3SS1gr3vn/b/2+q7XA549AOAJIeAgxUe92n1UC+Q/3DrWvICPP25p
         716w==
X-Gm-Message-State: AOAM530gozdMbw/Ix805gHC27GYD1gxGOA1tBjhda5tMrnSLMGt8USpF
	PifVrxpXqKLwQyeAw7PY//ZkYNLcpEJXVU/g8Ro=
X-Google-Smtp-Source: 
 ABdhPJxJT7+yK1+0j6LsCa2PH76AKNPnVYRC0ZSXnwlWjgFtZZHdD+oLi7ILKpZgPQq2DheW8YyopA==
X-Received: by 2002:a63:7c41:: with SMTP id l1mr2644832pgn.372.1636603749203;
        Wed, 10 Nov 2021 20:09:09 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] python3-magic: add missing DEPENDS
Date: Wed, 10 Nov 2021 18:08:29 -1000
Message-Id: 
 <dcd8294f826f6e061cdd01c6c3594789ed46732e.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158136

Since file-native is ASSUME_PROVIDED magic.mgc is not being staged.  As
a result diffoscope-native is failing with:

magic.MagicException: b'could not find any valid magic files!

Fix this by adding dependency on file-replacement-native

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.15.bb b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
index 09b24fb7f3..b73310c808 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.15.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
@@ -14,6 +14,8 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "e384c95a47218f66c6501cd6dd45ff59"
 SRC_URI[sha256sum] = "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"
 
+DEPENDS_append_class-native = " file-replacement-native"
+
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
                    ${PYTHON_PN}-io \
-- 
2.25.1


