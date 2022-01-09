Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAD3C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:39 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.23857.1641765879048738032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oewTbcXh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id p37so9092000pfh.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dteUi2cXMP/v2qus7MfYv2euCEmKSBO87S4LafT/qgQ=;
        b=oewTbcXhd26QEY2Qxe0+xSljVCbYq4KtwGUpD63FgdeMBdHNXaqiXhvqu/eEtj2bwW
         Aqz1U1AHs5C9VgdfOvs5zJ7E0fq0kMVtaP0qyj9g3TkdqW5dgThGrwpbiZvVpXmfHcSB
         5q6Tv7O6W0b0LLkbOiZmCXY4zK79LgPTw+pzibNmDYwSdyTfp48laUIJuDMULs+6rVlK
         Qf7fIAT2KNUrUCUsqjvh/MAwwulJuAFq4YZPTn71LmZIYpxHySyJrNo5OUUgZgtW8bVG
         yhbTkZDD1ePzT8dQmgGBeeVFwMVQjJ8UuNGVPdOhV6EP7qEt5jt3jouxYbFmoYlIFpzr
         t/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dteUi2cXMP/v2qus7MfYv2euCEmKSBO87S4LafT/qgQ=;
        b=iiXL0AsQjUfp3ahNrioWNoqyJWPBLvIy0HyoQCt+yNGdq5BPrHlfUF8A2wrVNj3xqp
         6jwJ6tZrwPfxB4WDQWWkfVPG1ICs7kybdo1Tu75xnLqVoaK5IA9YZRzn/rxvYRfaEQvo
         N84vHbcCdPnIVAMLb63K8J22/sRNwjiAWiajuIOgtHfX/Duaj1NsYJKk/0s5nw1002Sz
         ipjrIb7rxkwD6YfDKbXwxVyiWISHf65rw2LvqwlA+/uBuT99qlWmjmrqnDydfFmhv1WG
         n+Ycbjonk44I4P55/XP0Cd19R1DdCFP51f7r+ZsTB9wJ/L5JOSTNW1nbmzIeE5Zgroms
         takA==
X-Gm-Message-State: AOAM530k+J3WRItB/1aQ2VU+4eabVTGAvAIpzp4cgA4mr9HR/kdldqpy
	vfrx2T9E7ofAmdFEerXWvXpp6oq4OnqXG4r087I=
X-Google-Smtp-Source: 
 ABdhPJyAbZ/9NE6p23jjyt5PHBKJQCHMWn5NJlI9SuTkQYDcK6WrdX2OCvJXBWKo5CyzkO9rknT3og==
X-Received: by 2002:a63:a1a:: with SMTP id 26mr63857433pgk.212.1641765878194;
        Sun, 09 Jan 2022 14:04:38 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] libpcre2: update SRC_URI
Date: Sun,  9 Jan 2022 12:04:07 -1000
Message-Id: 
 <b24838b8173c6853cdcbff6512a12557e479df86.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160294

Version 10.34 tarball is no longer available at current URL,
use downloads.yoctoproject.org mirror instead

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libpcre/libpcre2_10.34.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index cbbb632f87..f2c36944d8 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -10,7 +10,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
-SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-- 
2.25.1


