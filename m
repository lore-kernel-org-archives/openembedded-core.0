Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BAEC83F12
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 16:29:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.816.1693153766979448736
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 09:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UGdKjCNG;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68c0d262933so1255153b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693153766; x=1693758566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHi1diJjjmm4MPireG72QQ0EooCJEsx97DhdeBEtyBU=;
        b=UGdKjCNGXYk1zzJ8ZGPoHGCfo6fT/k80wLnJ+S9Pa8lxza7Ul/kTuLOSizk2sXriPE
         +RUm7ZExTDMoXKdoKCiK/8hnjw0cajjMjI4b83AHIoAVzKi9Nj+SEG8ldyztnD/8LJ63
         I3xg9hDSOyFpx7Sehw/Pu63xH6VhJQS1li5MJqJl6c35CTln6xOXXt/G+towWbfGewIT
         keVEVWami3qVvVrJ3kXbUNiIlYrD/F/P4NiTisNFFMdwPFGa8EY0g7utia0AN5SEUYG3
         zr1YEjX9pa4MH9wBuA7LFFz51hSp3x+NeeAoC2XbKcIU3qwhUq+3v0bljQXQRu5D8dbc
         DA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693153766; x=1693758566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHi1diJjjmm4MPireG72QQ0EooCJEsx97DhdeBEtyBU=;
        b=LV+4xD2dBP63y2W73RbHtZ4szjUEGgm7up8d+4CSXZM7MeYtkPgRISK913Ta/lAQLI
         HjglisC5QM6+SiRDD/T7I9w/5/+65aqTkRhHCj+/rEN8c4DwRpFZaDtTAhRwXKS+aSv4
         zc7Uuwz/SmcuWwFgx8IbqyMXtMRvTOKVN7LkXoLxTWA0GxJRNDmYaIL1WvFujI8A0kCQ
         9Pw0+zi+Cb8k6XfPrjDijybMMJmKPfg3ILRjnOixGd6EhrHb9Vky/1L72Y1gISN2Y/4M
         TRk9nmUTibnkIeOABaGt8CrsSNb3MK0Q3t54hnBD3X3Y21ziScrnttgOe4hAc6i6KQEc
         IzcQ==
X-Gm-Message-State: AOJu0YyubswZQgxxYxIFQxCUD3UxCZxieGglctzStTYUXn/p4WRJllqH
	NYTPGiggDIdaJnr+vh4qV8VeJFuZOgnEXQ==
X-Google-Smtp-Source: AGHT+IFRETCYZcgiJCdi5RN/e5fcickBrB0j0mt+3qzJ+JoqTY9LeT+nYdqw78ed/jqWMH3CBnRUGA==
X-Received: by 2002:a05:6a00:ccb:b0:68c:479:b41 with SMTP id b11-20020a056a000ccb00b0068c04790b41mr6865343pfv.15.1693153766006;
        Sun, 27 Aug 2023 09:29:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id x5-20020a62fb05000000b0068bff979c2csm5001787pfm.82.2023.08.27.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 09:29:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] inetutils: Apply devtool formatting suggestions
Date: Sun, 27 Aug 2023 09:29:23 -0700
Message-ID: <20230827162923.3074045-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230827162923.3074045-1-raj.khem@gmail.com>
References: <20230827162923.3074045-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 16:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186776

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/inetutils/inetutils_2.4.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 19fc3bfde68..85e9f642b30 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "1789d6b1b1a57dfe2a7ab7b533ee9f5dfd9cbf5b59bb1bb3c2612ed08d
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
-           file://rexec.xinetd.inetutils  \
+           file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
@@ -24,14 +24,13 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
            file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
-"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)} \
+           "
 
 inherit autotools gettext update-alternatives texinfo
 
 acpaths = "-I ./m4"
 
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
-
 PACKAGECONFIG ??= "ftp uucpd \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 ping6', '', d)} \
-- 
2.42.0


