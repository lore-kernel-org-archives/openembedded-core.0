Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2012C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:20:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.128387.1726453199338117540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nxAGuAZL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-206aee40676so19472565ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453199; x=1727057999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/cwMuPE02Ot9VAR8mYjhZl7gszbOO928G/s/06rMUQ=;
        b=nxAGuAZLq7FbErfVdv8n3KMnPqTJhKt2HTOle7kLnd3Dgmz2Vh68F55LHXBdQHDdHu
         SIZzEPLzLmjjnIFzXPV1HInvL4bA3BHuajwdxv9pfuDq7MQpggG0x4JIOF/Y9L8vwNVV
         r2eMxy16kH/fjL71g+QkBeL5gNA0HAovtTWUA3ZQzMhb4bQpEf5xXZ2avoeVqqexPFBy
         15XL7BZZoetAEDLOVzSqG4t+8IoJfvzleZJy7k+sQgpgkDp5/+8cfks7houYIca7R3u3
         e4W0hZpmKodG30aj6kQrFckHMlKQJ7OTrFfMLuyIX4eF1297uyF7EFBZYSY+OqoSplaG
         eWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453199; x=1727057999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/cwMuPE02Ot9VAR8mYjhZl7gszbOO928G/s/06rMUQ=;
        b=c++VGqQS+88hD5F5BtEZDqFVGAYtOPGUpyDwWK6WfUy2H56o44o0K68uq/q567R4Vk
         trlpKkjC0DlbBBT1Mg9WaywJFAM+KvdgxizIMaxLQcsqbSV3uWkuP9H1VsaLP9zXHzFD
         i+lWeOn+t/xYiEE/2hlRrnGnmH6/7fPU9d6pSIW1NXt6+f8eMYTmV9d4nZZIQ4xHezpr
         D1CfphlCiCgHhFJRSPtf9z9Fs/WnL6DFjmr6nxrCJxTz8LqQzVs/fgRV41kFY+LeUKeo
         XNl/AuhWbF4bjtQvKYSltovNclF5T7u8t9RVT1CWCqdtroSJG1CW6T87UhKh8M9CHT/2
         07sw==
X-Gm-Message-State: AOJu0YxHGj+uxHl4PFQJf2MiI5v3Zu0QKTcjMChbjfhswMzigh5kG0Z4
	/D7+VVnvAWe6k42uyb9mEkjp2t1a9gAqKUudkiA8jD9YID7UxfraltmKQnN/VlR7nMk0jdve0cP
	W+z4=
X-Google-Smtp-Source: AGHT+IFOHRNwJP6kvRSSZU/SJssDJJeSIsxVO3GcXkEXXsC3Sn1rHDfUni+F76DXdT54tlwOzuUl3A==
X-Received: by 2002:a17:903:987:b0:206:ba20:dd40 with SMTP id d9443c01a7336-2078296a3e9mr151748205ad.27.1726453198624;
        Sun, 15 Sep 2024 19:19:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] gcr: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:34 -0700
Message-Id: <422bee7302ea26403e0ac048d3a0e72988be83b3.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204598

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the COPYING file included in the current source code
package match those of LGPL-2.0 license, which seems to have been the
case since 2011 commit
https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e1d5e81fa14

(From OE-Core rev: f3ae58b741e4e6e3a5196ff75fcc4da6ee89d0b9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gcr/gcr_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.2.1.bb b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
index 26dc1d1bc6..7ffcc1b7a0 100644
--- a/meta/recipes-gnome/gcr/gcr_4.2.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
-- 
2.34.1


