Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0810BC4743E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.30307.1649039467988728370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=y2tZh+Xd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so1613517pjy.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ahMAEDuVkppQFkSE2nbGQVYa4pMa765sC8DOs+YHoFY=;
        b=y2tZh+Xdwdm/yb6Ymund9UzeIcUDp1fGm4ZJxkoN8I5SUQ6PtDCYWhfgzMzMRdlWbd
         k28D0nb1TrAoJrjJ6CGOxX8m0JNm/uA2xnBbkHcJD0tHD/ScLy2VqcukOKvoZG7KYnho
         BHql40ISsmZLhNDFFb2+2tc0zyTXNoETXUyoEJ8ylEgqOQ9BLy6q+5mgXT1XPMbLwM/M
         ubloDKOa+bpBW0DqVQhF1aBoAbBGChbfXKHr5XLPQwUq2RXEsUbFi6rHbaWjtUBiZdpN
         laobHFVmx1pWoU+R+qR017bCn+vKChsMmEn0oqhB72/cZWPlfk80fNWDEo7MSU0C2LDj
         M92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ahMAEDuVkppQFkSE2nbGQVYa4pMa765sC8DOs+YHoFY=;
        b=qG1YDYPEPH5sYGMyYiGFHncDFytvowBnCPG6qhc/TpF4thu69AQ9tDnubyBU3J4CGO
         wO8RCx7JVqG18m6G3R6qJimVDnNttXp+NYdTMiQmXoh3frkF2oArx5mnOY47AhTMymcA
         IdNRQSM4J9pF6P5G6efPMow6NXNf4LDskiOjC6ENKyPcBXgt0JDqenb+PJdoBNLQDfIT
         UxeS9riBXkeaeN2OT0RCHt3RKMX5SaTovsOhE3FWu+0O3jF5O8dw7CkvVM/deES2G12b
         +j6eulF1G471LUan42YhmaNSi9k0hoDUYQJFmALLT7kncjI/YRM+8iV1ZyYZ+e0GUjU2
         wL6A==
X-Gm-Message-State: AOAM531MWbTGryckApu6Z441zZLTG6aYn4+/DKXYjlSi16rYdnLrKLFJ
	QJJlA1iKYPqaGI7fIHMhzmN7r08vbmUPQ7lxzMc=
X-Google-Smtp-Source: 
 ABdhPJxsr6Kj8rnU+4KkFzAkb8/Gbewqwomsenz73ZH3MsBYaV4mXJAIy36deJuyQtfwjl33poDS4A==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr21433089pls.23.1649039467115;
        Sun, 03 Apr 2022 19:31:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] bind: update to 9.11.37
Date: Sun,  3 Apr 2022 16:30:25 -1000
Message-Id: 
 <aa71f25c2ca1d6ec0d237975d52d22f0e1ed4e33.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163976

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Security Fixes

The rules for acceptance of records into the cache have been tightened
to prevent the possibility of poisoning if forwarders send records
outside the configured bailiwick. (CVE-2021-25220)

License-Update: copyright years

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.36.bb => bind_9.11.37.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.36.bb => bind_9.11.37.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.36.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.11.36.bb
rename to meta/recipes-connectivity/bind/bind_9.11.37.bb
index 872baf6d2f..afc8cf0b3b 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.36.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b88e7ca5f21908e1b2720169f6807cf6"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89a97ebbf713f7125fe5c02223d3ae95"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681"
+SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


