Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5F1C4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:51 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.16776.1667744263968494548
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FTihNg17;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 6so172209pgm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC/+D+qHhrN+AoGY/OB7rxsEVvC21BRq1okGYCNCy2s=;
        b=FTihNg17AxxUmhPDu+Pwg84pPWmHBV3/UOWx2uBzsndI/Rb8jdYvHaAzvCp6/7fDN/
         MPFGO0f8IowYGkc12SeXXeJIFQQZfgQW3QdjsSyb+7tPB+K80ZzeVD5AHQbuYp08sa/g
         pnEp6kGLkgsTbsrUqsDGyP+H6TjYNr9V5tWDl+jJeuUbk8p9lxg9T63cn+surRJsoaa5
         4Og5qxqKTOnme7sca3UxCMUaxcR9EJi+384UOzjVCyFn1n+0ST+VHlqjLi1YNdcuUhTx
         RMJoHUnSfllqitnX3cvEpYKJkKd9pN5SplW62Ui9nc3oum96ceRl+H9kDbCgSvuFUxd1
         zoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC/+D+qHhrN+AoGY/OB7rxsEVvC21BRq1okGYCNCy2s=;
        b=Aw4XBQLcTABGNVlYwNNDV9EiHe94Tazd/RvDU7yPfrjUoA4jxTnb+BbStHp3y33Ryn
         03QRQE64lyRxOiWT4qt5rVkwXDZZgPxjM4uXhKbwyS3fP8BqfyZmQReCBiTXVpa70iyj
         qWD+vAVSlTsPqgM0YURomGyNN93MBglqgEpQ/RgD7YisTxyx6538YEYwVIHm94Dde1Cd
         DQZV4UQ3UeHHugJFQScZUKkX7JjcMlTfanInlkx7d2y+tojM5Gs3sINGlVJytQvLhbFj
         qehIUpY4QE7DhHt56Vlvt8xvfuwOx//wFVN2AHH8mMemcckd03baQja7C6yKLryRwT+0
         PDBw==
X-Gm-Message-State: ACrzQf2Ah7zf3NOFJtnUUadJg46HHpPMpLEhx6jF01ig1lsLhmB7Ex6S
	J6DS/vGHP101FwMsJKxrvKkTvU7XX4Gpoj7U
X-Google-Smtp-Source: AMsMyM45qNlPI+Iy4nH5Q73rjymxzlYTNdG9Ny+W+Nt4UZSPAumdouzQUq00fhaKpG445aOsuz1gew==
X-Received: by 2002:a05:6a00:1d95:b0:56c:8dbc:f83e with SMTP id z21-20020a056a001d9500b0056c8dbcf83emr646260pfw.41.1667744262857;
        Sun, 06 Nov 2022 06:17:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/34] libksba: upgrade 1.6.0 -> 1.6.2
Date: Sun,  6 Nov 2022 04:16:49 -1000
Message-Id: <8e453d64255ce6a01b193c3735bb0aefbaa6fb38.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172774

From: wangmy <wangmy@fujitsu.com>

New upstream release fixing CVE-2022-3515

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4bef6fc673de958dfbab80bcbc2e0159803b97ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.0.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.0.bb
rename to meta/recipes-support/libksba/libksba_1.6.2.bb
index f9e83681dd..f6ecb9aec4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b"
+SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1


