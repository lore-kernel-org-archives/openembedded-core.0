Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 755ED7FC05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c14so3775071wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8zMdNbW55/7SDY0/KtJz1edjT6bNtyuBpNAXWFcDiNo=;
	b=k8QNxqGhqig/wxeoBM6mCbGM4y5fEcXhf3tVuzFlpQ40HRFJXdjcTAkF0LIV1kroM9
	XnNMp+zCjhqVZXElp37HrzYMHoHLgoEyjW25SXJRheuTCTKH1/Qcrmodwfm5vqwDs/Pc
	wyzVphoMRxmR0bRVJyN8lD23xu4L9Er1ws/IKRjNSKkn7qWdSn/Leh7I9qb83Bp6/5cV
	80UmjCvuYAEr03FCYnO26OXFckr4q+febjBul+G97JU9YEHmvTo1adiEgoe7ZnHd2kid
	0dm3B0AVI22/UAR4U/47jQKifW3d8cbWlah8dm5omSx3VdcLpu1wqhzZzu+h4PBfOIfL
	Q7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8zMdNbW55/7SDY0/KtJz1edjT6bNtyuBpNAXWFcDiNo=;
	b=M20oEu+2yOQV2UYs8RMF8dOxKH4iT6xxfusrKsK78dk/Ml/v0QnWuCjTyRd+cn7qE5
	Sw+rSvutY9uTvdJymTRQfWcgoEvOnHKUJgSLbno3gBpFkwuoNth2hljW4uCBiBrSe+Mz
	kbgOchfvRS54a8K3zy70cDBT+yyX4NPdxkCSeDUGtsJkpz+5qOS2/Ru2Ir9RG8U32Vxi
	4+4+kywY2ShxLYCVSv2tpK9NbYXZERrjWvC/I0ZCWW6e+3JVFdgaK2tk5z9hYUqZyGrw
	9KSSyBfmR74/YmJAa3LrAQas5QAbbAB9V5zH6mQkJWoXQ0/J4yCX4X96tnPiQsf/Z3uB
	b/cw==
X-Gm-Message-State: APjAAAURJpLJNWQY96n/A6mjsOLHhFV9DRTVn8ViUyzWzzEfsxT39pIc
	OPpvT+kiI9GvcIcfCMoSuHArS7GM
X-Google-Smtp-Source: APXvYqxcK/XFCiVo7oTbMqwyIUx7NEsv5OED0zWsIuT+2s8IHwycjuhjsrY/N4mmiojiGpUZxHgvXA==
X-Received: by 2002:adf:9104:: with SMTP id j4mr7848307wrj.221.1576174507067; 
	Thu, 12 Dec 2019 10:15:07 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:31 +0100
Message-Id: <20191212181436.1322-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 25/30] man-db: update to 2.9.0
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:06 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-db/{man-db_2.8.7.bb => man-db_2.9.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.7.bb => man-db_2.9.0.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.8.7.bb
rename to meta/recipes-extended/man-db/man-db_2.9.0.bb
index 083b2374aa2..5b017e80234 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
-SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
+SRC_URI[md5sum] = "897576a19ecbef376a916485608cd790"
+SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6cd3e261"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.17.1


