Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 295F47C92A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o17so22977562wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=b/SnbOOgWr2R8VRCcfVkTKhMgZNmMqAMfs63zsv+3pk=;
	b=FmSpTvFEjpFInTlcRfM3ooA4vLvjJSyvNSmUgAkOTGtI67KT+uxtXZlXkmukXVVxN8
	3pTp/5PNQmMsM6bs3v5mFoTVMsR3HSu5rrj4xyH2joptBfQ+QK6mCKFDVGtwYC4PDujO
	RxusgnsKnISzBVfB9pkJoCgH+12EPKYRg5L7S++ew61G/+AKhsPvsBaL7a5ckyUIMaCc
	9DwZR7Z2risARqLygYvIrias/oKtnLZNh5uf98327t96BV1nZElECxsCvSc13ro7xNmA
	aD5DoO6vKhQAMEnZU76qgDdUtGkLdK6q3D18IQV9wiEII88SKvYXCZ+5HtDrMtE50cwl
	vlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b/SnbOOgWr2R8VRCcfVkTKhMgZNmMqAMfs63zsv+3pk=;
	b=ZBzIKNcbzUKQbXBmK31vUL1Ul8z9jUsqOewU0nXUd6TpF5+aVxTzCiX+Igcy8VW9Zc
	Pjpj4QwgocHQN9PP+J7SYe9XXrHJ+g6w/g22+acwb8suKKscDMMzs5KY92KPycXGZLFh
	KBNfQWsfB7R2tJrIjUWi/kuV+nPvurEPWp1aPQDpNFwzh7xJeFC+kgW8B4zQkdjj0cho
	iwjfaRJRqfpIELV49V0QREQu2IwEktv9u6p9Ux+6fgtk2ETAPsMdUnUcwfWS0F7IWyPy
	XL8+Zh8ZyeQHZvAEx8U8lEN5aIZomk80kS+l0YNp7MiW+LaYFdnkiWiNsS8QmjsD4/i2
	Al4g==
X-Gm-Message-State: AHQUAuZJVl3Vlw7ozBHOLZLlUygOA7tO2R5zHZBRxV00qO7bftIwRCYb
	2wOuFjkyWIrHibFwNv87xu9ER0mL
X-Google-Smtp-Source: AHgI3IYe3cRdFyZ6ALhieIIIizrxzlEHKN9DBW+jvjpt2m9dnbjYcuq3gU7KFjqKxsKRK255srNEjQ==
X-Received: by 2002:adf:9e0c:: with SMTP id u12mr21119254wre.216.1550598441778;
	Tue, 19 Feb 2019 09:47:21 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:53 +0100
Message-Id: <20190219174712.60694-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/20] libpipeline: update to 1.5.1
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libpipeline_1.5.0.bb => libpipeline_1.5.1.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.0.bb => libpipeline_1.5.1.bb} (72%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.0.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
similarity index 72%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.0.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
index 14cc9e519a8..a5802074b13 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.0.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
@@ -7,8 +7,9 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[md5sum] = "b7437a5020190cfa84f09c412db38902"
-SRC_URI[sha256sum] = "0d72e12e4f2afff67fd7b9df0a24d7ba42b5a7c9211ac5b3dcccc5cd8b286f2b"
+SRC_URI[md5sum] = "4c8fe6cd85422baafd6e060f896c61bc"
+SRC_URI[sha256sum] = "d633706b7d845f08b42bc66ddbe845d57e726bf89298e2cee29f09577e2f902f"
 
 inherit pkgconfig autotools
 
+acpaths = "-I ${S}/gl/m4 -I ${S}/m4"
-- 
2.17.1


