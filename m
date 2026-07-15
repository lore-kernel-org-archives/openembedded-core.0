Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE37C44517
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12396.1784134072435462719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SaoVc55d;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a379b68f76so2001515eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134071; x=1784738871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YcguJPta/omuBiVVpDFi9Yub8DnXbvMRzffU2mkxfk=;
        b=SaoVc55dROxhhRMPuflnVreNOYrq4yVUrYtXDrdSL8YqIjH1fzIPc9x/0HkXMpgNNu
         slcpBCSDjXIBV3d27M2lvMaaNrTTVtXU6UoLhvWxxMbbCz0nJ07AYZotsIiZAl+ZKkMJ
         l6jXiYkL1FvxAwOiUQf288Zy5XoJxhOvkSoWBnbzP4XQtzTtCsij7QMrJpXl0kC1Mpea
         91+B3OgHzxdk2VGzjKlbl8WPdSVIHAO2uVJ6MPxGqGw/MqkYsxBFRAEzbqZCTpccYTOi
         Z6pJvzBWarXGxP020LEvyQNTt/pwDZDhzkpMDewUumloe0PxM5Knw9u6aOZG+/8G4L9L
         +75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134071; x=1784738871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YcguJPta/omuBiVVpDFi9Yub8DnXbvMRzffU2mkxfk=;
        b=dG2ccatwddfsFWlz00T7eqi932eV5Kr01vtJ5bEYqKVDjc9P2G8xdlj3OO2/7CnmvR
         teFVkpgJpxmRnt5EMKDAhg1H4VnQJbxwP7tw+t0nz3ac5kFKDclCu5CQOH6fMLD0wdZf
         uUV1MDPMvYpllkn1YTr/E9OAbPpRqd9alIBN1cUBxWDcIU8iAuDIpwxsCxapeUtbP8GV
         14NWVhCNIdd947tXor+WXYfBXWuMqIt8twryAVAPu+kwBG4VV4eE7B9G9UHHdunESfGy
         4u1K1DfNoPs41qVycmwTrsiEh7aFwr5Bmf5BMnfNVHXqWmtRPb0broRgiWvFxVSHGFkd
         1gEg==
X-Gm-Message-State: AOJu0Yy3Ue/+F3AVCVy6KpORi5PhhuY5NHqiKgWPBdW1PTCVzbirnEPE
	oEUBQmQSe/6Lv7Y/ZbyK8A9ovHg06mf67FwF95UlbGKtgEF+Z1US2Hfjz4efvQ==
X-Gm-Gg: AfdE7cnrWNhMxG2pkc/oo1OhszAnE45bVRIFp2b/o4NqVjYsqYJOWB4/O3Tcxe5Qngy
	T5/QXPUgituJfCDOlEb+nsumpDTAJymkxW/hUsB+yiGr58Qs8TgYtqJ7GK8hgzyp1wD1sEpva00
	PapgDSo+Qr2dNBgH6KM4gHeavuNUpQ4bVSN0I7xR7je7yGEGTEafqRG/WgqCuiAF+BY48tk5Vpy
	LuMZnsFuJXbn8GLOJv8v28KgvmbsWhtCfwoFUDBA5RGh6tEs2pbctDgwURpnefw18gysN8rL/a4
	QZpWrkhSJSVVBSacrq/bdl5H6AvBdF+9K6PkOCMKqmiMUA/plXVRbb/WwF7di8pXHQXQFb80HUC
	Jt4jzM9pIq5rKzw9lImmkTxFSWt3cFR3geozGCyIKfGYzpuAdP4e8flzDv/A3/807KyLn/Kr7vF
	nDbaBWjN6nB9z/XiM8Wtk=
X-Received: by 2002:a05:6820:213:b0:69d:f3a6:1f59 with SMTP id 006d021491bc7-6a3cb82bb14mr3693966eaf.27.1784134071582;
        Wed, 15 Jul 2026 09:47:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 13/25] libglvnd: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:09 -0600
Message-ID: <20260715164739.364323-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241006

GPL-3.0-with-autoconf-exception is a deprecated license identifier.
Replace it with "GPL-3.0-or-later WITH Autoconf-exception-macro".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index c76763f811..e2cdd81b46 100644
--- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "the GL Vendor-Neutral Dispatch library"
 DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
 OpenGL API calls between multiple vendors."
 HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
-LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LICENSE = "MIT AND BSD-1-Clause AND BSD-3-Clause AND GPL-3.0-or-later WITH Autoconf-exception-macro"
 LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
 
 SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
-- 
2.54.0


