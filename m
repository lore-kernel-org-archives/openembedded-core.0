Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 25F3B7F7C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 08:47:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z7so31945794wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AaADB5xCYNkVmZHt/UN/QjnYhj7hyRfePJLPK/XV+Rg=;
	b=OzfbExTvvYkSq2HoWwdO0AHuSOr1oskp3j85MDgFDi+nehWfh6hbOtpJumjLEDZZ1W
	9BWKzDLafw5xWNxJHUUDZeWroWFwSbdTmQ+un3cCMMNOxwrumi+48AWK/aCjvGUpw91N
	6SApPlg7Cn1Qu9EBfV4ZyBsheO4eUZBQflCOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AaADB5xCYNkVmZHt/UN/QjnYhj7hyRfePJLPK/XV+Rg=;
	b=VmEdXcexCEDAmY/oZjtrfiQCDx017ydo6JxNKaARcZwFCsIHcIMEqvQ86nndKVxZmf
	tGKhAE7zzx5riMr2WnXU3oICWIHN18eIDphiFITMa7GgdyJCRbkW399qIzgRLxruFzWO
	aySGgOMQ7cb0p8zD+HUV4XxX+Nac/oZiw/TAaOCmygSWghWXlmQwyJfrzSIRqLWiSIeb
	nlBek52uD3eGEN5Y29Ao0Dlo089s+aaMvywARdrYC+qI21lGkZkkZ0aJ1chf7xkPRv7B
	6QfoZUP0aQAf5ULm2wGKNXi/nisw2m6/jbq+ES+BwZ1IEowMSAuqmGWc3YzPNvDza/NA
	AIhQ==
X-Gm-Message-State: APjAAAV10xCrQQKApTsZtjbl8mAiSnG3qj+fi/6eIVDoAsjXwGcaatA6
	c5i/PbYYfdSQL4cckvzJxtok9EPi60Y=
X-Google-Smtp-Source: APXvYqyLccMrJpITdRFxY/L6r+KwERpEvQXb4q6CNz9yolBVO60M2+QtTEP0XOGbzejDY9A+uZ3LBA==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr14809617wrs.184.1577695661476;
	Mon, 30 Dec 2019 00:47:41 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm46235967wrn.33.2019.12.30.00.47.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 00:47:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 08:47:38 +0000
Message-Id: <20191230084739.19193-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] subversion: upgrade 1.12.2 -> 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Dec 2019 08:47:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.12.2.bb => subversion_1.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.12.2.bb => subversion_1.13.0.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.12.2.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.12.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 4ffa1c584e8..9c1281a63e4 100644
--- a/meta/recipes-devtools/subversion/subversion_1.12.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[md5sum] = "1ff249f848f834ded88536543e031975"
-SRC_URI[sha256sum] = "3bd0b5c8e4c5175263dc9a92fd9aef94ce917e80af034f26fe5c45fde7e0f771"
+SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
+SRC_URI[sha256sum] = "bc50ce2c3faa7b1ae9103c432017df98dfd989c4239f9f8270bb3a314ed9e5bd"
 
 inherit autotools pkgconfig gettext
 
-- 
2.20.1


