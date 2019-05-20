Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAA37DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e15so14808236wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4FQD9lmprEllL1iDkIXd0V6rcKjHcSjA5v5WJ2rmdCs=;
	b=k9oppXfQ1Ro8jIVofA+HW0fq945IMv1ndTpBGxDmh1TpBwQG1Pw37s43l+DmdeZOo8
	VpL4Ivhe1bFNiLhnMPbzr87U7W+GNxxIfhUhbhKAxrJ9YilAYvZ0RFZpwHgy3q0oRerW
	6ntF5MKQWVfFC/oLv5D30Cr41sXKmyX7j/D+lpCEQDsLUKypBrpDkxhNpCvK8voO55Xy
	ThnvvkVXyXLXIShAJzl8rLr+R3zUb+Zzi/POJwOljx0JWSfXnCxrq/ySXp5LhZN+p7o9
	IEelSWowOXbKid8EPYSaKCdfhOV/N+9sAhTRhhyJ5u4v7QvlRAZBFaHPI1uR6c5hzA6a
	HIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4FQD9lmprEllL1iDkIXd0V6rcKjHcSjA5v5WJ2rmdCs=;
	b=lQXJ6yDDH8X0C5DW1QYDHKWx6f748fg43yyvqGxuLFZAYF2H1HJu6MHONYBGooalOv
	s32WxxkHrMQ1DxkhRiQ3JD08gc2/E/fJ/qJomb4LJUh1jHplnl/F6ifMWkVTj7BwobBf
	3DE38wc3haZP5sBGDrwWjtXUo5JJA13SpsBecKs6MeqZ5eOSNBnziUJgj87M56DUUfcJ
	VPqQTifAA0mZIcngqaT0hNowZ/mVc4Pg91PuCuFeykfvTae/8YGPBTDMws/DbxK5ri+D
	auv/jWBSb6ML0nVllGLGlcZGf72DWOjMiqbgJQkOqNZiou6SlF3GcNk/P3kOb7JvjgCO
	27mQ==
X-Gm-Message-State: APjAAAW6sY3jdvaEENHO0FXwOqkzTPNnMws4S2mkcqSlWGJ6LyKgVcHz
	oPLeK5XddZmQimPIK5v3HTAvLbC2
X-Google-Smtp-Source: APXvYqz5N7CXHdc4EcPfjM/6jXCN8ZMTBE6Tv+wtPtCwRHOLaq5Bxy/wGXVcTklR0hl4CW0+qR64HQ==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr45428317wrn.120.1558361525765;
	Mon, 20 May 2019 07:12:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:17 +0200
Message-Id: <20190520141125.10805-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 34/42] acpica: upgrade 20190405 -> 20190509
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
X-List-Received-Date: Mon, 20 May 2019 14:12:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20190405.bb => acpica_20190509.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20190405.bb => acpica_20190509.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20190405.bb b/meta/recipes-extended/acpica/acpica_20190509.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20190405.bb
rename to meta/recipes-extended/acpica/acpica_20190509.bb
index 25ad7ce31c9..cf6db336a6f 100644
--- a/meta/recipes-extended/acpica/acpica_20190405.bb
+++ b/meta/recipes-extended/acpica/acpica_20190509.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
-SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
+SRC_URI[md5sum] = "dd1f8240f924b12b0a0de0c31ab26ab1"
+SRC_URI[sha256sum] = "860b5f94a0590b278592acf16a4556b05ff0309c08e8c48aa29827cfa02c8e9d"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
-- 
2.17.1


