Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DA1C3ABC7
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.127887.1726453192652124726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XkI2WP3G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2053525bd90so22894265ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453192; x=1727057992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vsRQIlqGQjbYSPOFrLaK7z4cWVc+Ysl9Oo4A7di/f8=;
        b=XkI2WP3GkK5++uHCLq98gsfZUxGpuWfG6rWe94ggDsgEWkHz/IIrqKJnPu9GVij+UB
         fA9vRkYfG9UR6B2p+gmICKfI1JPU9GGkitTzxhIGnRb9ap2Y4ti0jH4cvQZlRDu3ISRl
         t3JiYS7aXBjyGg1rW/n0SA30CproPy+njqEnMyjfEZiwA4g9KJdnGWHFBHOh/Uraf7qx
         guqAOQB5A75NpLfa3Bgon5LQuQGMiHD9/dZ9t+tkHxHoEZoY21xPFvDnxtVeSK0amdye
         RV5fvpaeQNttfe9XEA/A2tJOxyu9vSSdvJSIEAF2lXqcp8/qYHjPZN/hTA1CZXykUrhv
         K+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453192; x=1727057992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vsRQIlqGQjbYSPOFrLaK7z4cWVc+Ysl9Oo4A7di/f8=;
        b=RPI/CuVeCppIZEj+r2qIP0cJAGyr6ogVne/ndzxbMGM8A7odynIai3L/dzZYEACaF1
         SvlLBnb6Uz8DYgig9/tWF6c3Q8XXrC3aVREctn0vxs+wKWLLA8nFdYdq/f3XDhSSlpr2
         an/mur1TxHCUymF2OctW7arEY0wlkRAfgwqAdugOkNk1BWGsToLBs5SlFsb0u3fakTQz
         GtLqUDi+VjOVJ8y6/JegJVcar7gFVIHjsLGxy9pZrUV1ejjg3CUNNrSae8mA7N582G/R
         1EiWQniCI3oQe/cFS3vJqnczr+B0MLJTC91hYzjdyBsGk0F9K7tDPP1NVS+mXp89azUx
         +7xw==
X-Gm-Message-State: AOJu0YyRcg1QYLJ3Pm+yOAPve7mFjaAAMPhrEJz85oqqeJkVKaQeIgSI
	pcapxGFb4l2JLethh69QsUSIexwW0+1B+YysXy7CZnLTcaff6RresOdIToNAVkxaq+DIa/qosh5
	0eIY=
X-Google-Smtp-Source: AGHT+IGBSwwzP0jxLl66F+8Z1Gwt5tPj9b7c9PJuIEcxp8dtwQRC6ugL2xby+eqOHPyHOatL3EgD3A==
X-Received: by 2002:a17:902:f641:b0:206:b399:2f2f with SMTP id d9443c01a7336-2078296a9e6mr160308855ad.47.1726453191894;
        Sun, 15 Sep 2024 19:19:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] dejagnu: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:30 -0700
Message-Id: <718f6cb5ecf33529efb126f9eda67041f42bd7bf.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204594

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the COPYING file included in the current source code
package match those of GPL-3.0-only license, which seems to have been
the case since 2008 commit
http://git.savannah.gnu.org/gitweb/?p=dejagnu.git;a=commitdiff;h=9bebe7b9bfb9b02e5e4d86ad74e8ce3eb32a36b9;hp=50fbdd118dba066e201c73a8b0155381cd65a32d
("* COPYING: Update to GPL version 3.")

(From OE-Core rev: 26b71cfb7815a096c5962629801cc3bc85147284)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index 895f6d3b36..c6002d5e45 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
 DESCRIPTION = "DejaGnu is a framework for testing other programs. Its purpose \
 is to provide a single front end for all tests."
 HOMEPAGE = "https://www.gnu.org/software/dejagnu/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
-- 
2.34.1


