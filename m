Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73866C47258
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15732.1704990469597251703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FccOjnMo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d54b86538aso27861405ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990469; x=1705595269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9d6HAjkHw0R8xfd0QdgRfBJe9Z7gpGg8oUlXpp1oMA=;
        b=FccOjnMoPfTt7PCfnh4fVq7RfGEPo1dt6uTcGlJSjvUaY31kF6fBeKjnSRDRbomexz
         pDgtBD7ky1Vq5zmdaPnM5l5yVdYBM2oUQRizIhmPIuz1V8iAq+25Kv55DK2MP+YT487A
         6gIRws8Sx/JKu+BVpzS5OoLwibFbtTAmYvko3NqhD+d6PwGKgO0Ld9l0JQzfWzzB5ay/
         TdtdLKySJssQOHALXrgfaRUzr6sxXE93gLJb1FmpNQOT9lgOrP0Q137lAs2Y33MFTWcs
         yUSJFBMtSKC/+eGYfH1D7cOWok6MzJTKoqv19YnHJF4L6F9aI5bcv1c1YVDRyuNm/Wec
         U3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990469; x=1705595269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9d6HAjkHw0R8xfd0QdgRfBJe9Z7gpGg8oUlXpp1oMA=;
        b=Ys7bsTl2JaPL5wjGIk+GLDhcA80fEhGztB3cMzlF0nKySOK5AXYB4mBm8/EkMT8nAE
         bkCMWY9ep6gli2bDdA9LdbU4BJqY0ROgVbWG+7Jy3N6J72vloTKRxHr8ZgLMx0FHg0XG
         Ohg+1rJpTy5Q4YyR8LfdDXMYdfblmDTrE88YQvsjhOFo56S5KiTa4B9+z4xJmU9vr6s6
         hCxyAFv0oa6L6nDMgWpuAj8Asx3ZM+GeN8vl0e4NlgHXHMrBhfdK4bh76QZWFFy9prIy
         bAtI71YlYhKp4mhsRZy5+r31e/qQWtl3O+jO7GUTqyx51HkpdHgnFhVagpwvD4KPYzWf
         vZ6w==
X-Gm-Message-State: AOJu0YzlSiSIq+SvMwtDiQxLvshkGTlbJDk3kyG+MMYIvSxY1YnKxinK
	XGQY6n1oOj6C2HwbBVxZuhF0uzvJGurrRxEhL30w1/emKj7U6A==
X-Google-Smtp-Source: AGHT+IG5OXSXlFHBUtI6KL4hXTX82P19VGHWmfxkww/AFFFL/pu9Ofm89NgKGKHbCI2Jl9eYKb4dXw==
X-Received: by 2002:a17:902:f814:b0:1d3:f9ac:c9d3 with SMTP id ix20-20020a170902f81400b001d3f9acc9d3mr1217995plb.76.1704990468766;
        Thu, 11 Jan 2024 08:27:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/12] avahi: update URL for new project location
Date: Thu, 11 Jan 2024 06:27:23 -1000
Message-Id: <b541fbeb99df15a1548f93ddbd654fb629ebc2ce.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193558

From: Ross Burton <ross.burton@arm.com>

Avahi has moved to a new parent organisation on GitHub, so update the
URLs to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02caef1567186f250e64ae3ef84fcff33d7323e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bfd945c7ae..1f18d4491d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -6,7 +6,7 @@ IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
 configuration from the link-local 169.254.0.0/16 range without the need for a central \
 server.'
 HOMEPAGE = "http://avahi.org"
-BUGTRACKER = "https://github.com/lathiat/avahi/issues"
+BUGTRACKER = "https://github.com/avahi/avahi/issues"
 SECTION = "network"
 
 # major part is under LGPL-2.1-or-later, but several .dtd, .xsl, initscripts and
@@ -37,8 +37,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38473.patch \
            "
 
-GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
-SRC_URI[md5sum] = "229c6aa30674fc43c202b22c5f8c2be7"
+GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
 SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
 
 CVE_STATUS[CVE-2021-26720] = "not-applicable-platform: Issue only affects Debian/SUSE"
-- 
2.34.1


