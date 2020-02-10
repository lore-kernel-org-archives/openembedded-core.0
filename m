Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B61E60FA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:29:34 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j7so3352651plt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uSOgRVFxehselO2YD4tIOgZSA48nXroOgHotdD0AkhI=;
	b=FGA8TfyWIc2meE24UF4C8tOgOY0rKqevbkPIM0lFhMByQDHB3uNLdoDNpHfnzB/ZTs
	fZRKD4XQYOckD+roubWOZ8sSrgxicqNtN2ekOMTdLvwRGIrvrBvw6b3IiSEPyJLp9N8Q
	+9+XAQz0yNh/vk8wEoMG8LGAS13ZADbj/Hy48mxsGz1hoHnUX3DqWQLmIAOys+Vq6jLc
	eTsk8ydG0OuKMY3RKrDRejBuEWwCLgD6TQPLhPIU+wqKpRkund28V3skX15fyZoSeJs0
	BOM24/a/vy+viZ/CnoabvanrO4O3mzVk+ekFIQXdqhx8hobKC4poGqpmVh7NuJPyoin+
	VOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=uSOgRVFxehselO2YD4tIOgZSA48nXroOgHotdD0AkhI=;
	b=r/MXoWniae+d57OS+X/t+Z2xlzY1KVuBuAf7taKFY4OZLrNpyZHbE/xVE1YUw5Ueh/
	VoAlq3UY6CmD5KGRRw1765Q+fVJYXFDi4czw1rlYtGwS3xjEsygbGh35AcMl0Gqpxg/Z
	O6zzmQjwe0UvN1YUC15YJFzefLSxy5PhqKKyl3g/wYmVk7a3b+WKfDw1CJUjXC7d8pHl
	48MmKARi/XIBE0fN1H0T1FuzwRNIZjM551dgVW1dNAat43vBiK2dsFiLFoPfZn0Pt2Yw
	E6v0Noo9kV2H6L3d+s9n1V3jXYlr4z5AY/xLf/qFSJL6zVCoMGY49h6E5gqDzx6uTLUx
	BzkA==
X-Gm-Message-State: APjAAAW+Q3RpMBjPRN9WdnTt90+ENeYZRmVnnpolBxqarPLaRPzBkVnQ
	Nf2vuNhjTd6eplX0qJyxqNP8QiAROOg=
X-Google-Smtp-Source: APXvYqyyi6G0DBDRzt+09CE22lv136OpYfKfxsxQqrQIchtM49Gme4Q6tAl2MGc/jXsq3/+cPDwE1Q==
X-Received: by 2002:a17:90a:d985:: with SMTP id
	d5mr1276571pjv.73.1581370175028; 
	Mon, 10 Feb 2020 13:29:35 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	z19sm1316337pfn.49.2020.02.10.13.29.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 13:29:34 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 820D42A04D6; Mon, 10 Feb 2020 13:29:32 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2020 13:29:26 -0800
Message-Id: <20200210212926.24770-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] binutils: additional patch should be added with space.
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
X-List-Received-Date: Mon, 10 Feb 2020 21:29:34 -0000
Content-Transfer-Encoding: 8bit

If an append adds a patch or file with SRC_URI += , the spaceless
append causes the file listings to concatinate and cause failures
in the nativesdk-binutils parse/build.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/binutils/binutils_2.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.33.bb b/meta/recipes-devtools/binutils/binutils_2.33.bb
index ecdab96658..8bd2bf778c 100644
--- a/meta/recipes-devtools/binutils/binutils_2.33.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.33.bb
@@ -51,7 +51,7 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
-SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
+SRC_URI_append_class-nativesdk =  " file://nativesdk-relocation.patch "
 
 USE_ALTERNATIVES_FOR_class-nativesdk = ""
 FILES_${PN}_append_class-nativesdk = " ${bindir}"
-- 
2.20.1


