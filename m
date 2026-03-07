Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB0FC9ED9
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 06:46:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4477.1772865955851148675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 22:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+hds0n1;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3599019ae92so3524962a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 22:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772865955; x=1773470755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBaStm6fTqtyXItzCKSCnhAVLXKkyIX5NVeqUkRglsY=;
        b=R+hds0n1vM4Ciu+n5UC1L98NUMn4nZBKb3DMKr6JA6lWD+VzmkROJwEYNcd+belaQv
         ZV7MmZv0y/tzqIOr+tlL1HWbtDV8vd9GqPH4niC3nfWDSLDnspGFOYfM66j5IT0yhN2/
         +Yw7EkOcl48PF4mNRdn9nq0B3pZAFXy/NWbIVJNlywifRrq1G26cipxV7xcLx+Km/ZIg
         vPFXdZCQ+p2gxexmPN12MLbBQyVxYlFUzEIOcu9fHpHrLIAGjydXdxZRWbFBYAagvT+y
         q4x7pyNaa48Eqf673nSrMZz9cwO9bIX63qKdgunxquGgzH3X5pjcxsjuo58DhVzRYkCy
         lFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772865955; x=1773470755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBaStm6fTqtyXItzCKSCnhAVLXKkyIX5NVeqUkRglsY=;
        b=kDGAVhTzpKEkf2C06IEPeRL+hjFluvLuevnDU1IoKhBbchC/QMa8GTs0v19uYnJ5q3
         inMNn/d7Xa4oa4CayCoY65Om+okbBP0CcyyAjzHyaK3uSoplSO+zklki2TgD6Va2qJap
         LWO7hDWQRlHLyrE0F9BqU6Z9iAWuJyrXUQdYLUjnqicrUpenp+3ozEosjmO3zACzsFNx
         a1CWgez0+kHQWCDRe6G3euIJXYDxgn8IeuVNjycEn1ho6PQI+8u0kLhBZIF7R5hG5bV9
         f+VvK9ypkUFwFbvu9gCXjQ4ltSf2HpzW6jxZ4zzf77CWu4Ob5ii2WwJlCXjGifdelg8r
         xNZw==
X-Gm-Message-State: AOJu0Yxc7jfQV5Ut0qt+pKPRvIy2ZC4WRYskavKaFtLz58RHOUKRelkk
	uKsPRLeLBpdfV0EaSjjIPcPuJn5a/tbDkGGpIXK1rDkKShR9J2eB5wy2ZJ3dggvS
X-Gm-Gg: ATEYQzwfzd3eehTw5+f3lipxZXE42De5fjP4vPpRWii7tOacLyjtUrTBn2J8fBrnW4H
	lXzWWgVuUEF94xUS1+IBFnHLLFiiHW+pLKswanqQHO0SRRToeSRIPnDe95zFPu0U1LWllqBzTwI
	wMxTJcX9pTgXCADuht6NMpW+swWRR5pCQX92RQemJMl8yA+8csfVd+U5MKtT4Sa50gTugWhMDQz
	eHPAF7zVbIpZjCOqcaf7iQwN6HS2L9/Gczo5eWrZuqU+euB3J8kPHivfLLZwuEQjWQCFEXw3ggL
	uXrURDam1Sq4/uwc6gANYZ7wJq/XDgSa3BgHLQ2jCI+sMXEyUZLsw/xp+OcQVTHztkvWp5+UnTa
	pEIxujTsKCXz9dBDtPIgsb4SmWPugM5SjGV7cA0ITmS0stXmbRLrNnVcGc3vse5TN3fsIHNCL57
	9yUjkmRfYrD8GKVuozdUnkb6LjlVZafTE6OQ==
X-Received: by 2002:a17:90b:4c52:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359be2ee864mr4179171a91.21.1772865955012;
        Fri, 06 Mar 2026 22:45:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d50ebdsm7053261a91.5.2026.03.06.22.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:45:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/3] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Sat,  7 Mar 2026 19:45:38 +1300
Message-ID: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 06:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232604

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f21bedf4fc..35f22d5a15 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

