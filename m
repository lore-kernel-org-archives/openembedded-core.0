Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7E97E959
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:56:45 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g135so1926259wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FqXJHuCJ028JX09VgR7yS3YRfqJIhxW+VcmAkkn26IQ=;
	b=CyKkOUhK/OZKnylrIQpmev8Q53hRArKN1L3khdecGbiM1sZax7kirtwqesNTIFffzY
	7LWJedEvENkwXeGKYCDsqNlGjCzlzhSJcOlfU5NNDxB0WEC+YR0WdAjZFDaF5e7SSvMi
	0AcHcXsPB412urjp1MUvctekLb9t73BAaPqTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FqXJHuCJ028JX09VgR7yS3YRfqJIhxW+VcmAkkn26IQ=;
	b=YSehgXq4bu0LLtFwJlgsOqYquGpFFOXtm91mpaLs6hy8ysv3vuaiS8BgqR5aonTrhy
	umi6uZyv5MtjOvyq80dHnt5wg+o3mYs6I/EsWvBZ7G6X8Sm5/tV6+gSgi4TybDhNmky4
	qijHfxK1JvVRGIbZ3Mh9Cwc0DyNu2rOfYA9uu/aFbdkn95y0NUHaxaGCC3GC0J8nIRVv
	cJMnZPOFi5mtsRl9Q//SmxmBrfO5MYQflepiK6pPid/9aYG39nz6ftzBLPXGheLnPdi1
	lJck6fg26HnTaTwGCGB+TU8qKP5tEmpIWQfaqvLh5XxL0457jMZPEx29G+PBv5psLnu8
	koqw==
X-Gm-Message-State: APjAAAUBXGNTFLOZQqmsslgFKsQIflkhwP61NkFRTMeam67GVGYxF/f2
	d6tPQ9bL+cMPNjHLybjXXPeAbCdURVc=
X-Google-Smtp-Source: APXvYqybISQH6Pf9XJinHSrdVVCxo34DtbdQgdXRAN+DNwrdUvUtNEc8d6oEUk7foJdeEAo1T+IZ+w==
X-Received: by 2002:a05:600c:291:: with SMTP id
	17mr8376743wmk.32.1560952605854; 
	Wed, 19 Jun 2019 06:56:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k125sm2090642wmf.41.2019.06.19.06.56.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 06:56:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 14:56:41 +0100
Message-Id: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] libxcrypt: Switch to disable obsolete APIs
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
X-List-Received-Date: Wed, 19 Jun 2019 13:56:45 -0000
Content-Transfer-Encoding: 8bit

Since we have a fair amount of control of what we build in OE we can disable the obsolete
APIs which is what most distros are doing at this point.

This causes the library version to bump from 1 to 2.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
index 637c0e6ffbd..893f5e73791 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
@@ -29,4 +29,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
 CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
 
+API = "--disable-obsolete-api"
+EXTRA_OECONF += "${API}"
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.20.1


