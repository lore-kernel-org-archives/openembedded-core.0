Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id EBA977FD59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x185so1294499pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j8z2stR6bv42tUVY3DFQTz/XcbNGBOGw5kcPqGRpTE4=;
	b=G67zfZPYCMRUpI/+awJ4Q2wQBxg7oC4WFUCwznmprF/b6MZk8vhCn75uUwdFohD03b
	cNC3KM1aj3WjVurz82Qi/VRvtZ/7oeePeJD4zTIQgF6RT1t2KDN6CIAfBTPgpE/RhsJN
	2Z+w6ZEnGJ85l5U5tW7bhWPxaKMVpYsoUr6QxrZ/AtnW8JpaxYa+InUlAiXNaL4kUaiR
	SIyNEoF5zOPqKFuuaX2BjKsjIlYg9WDe2lCl3swLBWZU2vxOU/ZG7rS7A47z+9Kghfmu
	WGK6mSGNzwhU5PfcWXxmPJnQMXbweOUJueFz1gZftEFhwH+fK8cc3l6CzKPlL52RV7TU
	jK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j8z2stR6bv42tUVY3DFQTz/XcbNGBOGw5kcPqGRpTE4=;
	b=PhBUf0aLrN+JFcNYwOd8Di0yXdp/49TPo7MkgrNMaVx+l7nhj/CRVHp/+y4TsH1V/n
	hQ9cHsbY5MseyimAClrUFVlfaGP1RDsOQAnMlBUKlrdmc/fW97fWmdsnRWHoQ/ht2f6G
	VAPEVb1E4Ot9ZlcMu+qNrXs/8v8SEAdW78lH7j0LEDP+a3eHO/rARLmJzV+5RkgZuJes
	bSrt5/Fm9dPhXAfvvw9JQjoPYT9Y0W/rwt4u6/QKJDMO2lQtx51EAE4+bzmEQb8uMQm6
	RthXBYLJY4KGt4EV1eqL6Y3PTpa+VbmlUShSvKsXMpak0TV7qp/9LNQHP9/QgeFEgupJ
	4dnA==
X-Gm-Message-State: APjAAAUigQg3aZBWUL7Oa/TsP20ZZC7+5P/sGC7DoedOfv6K35tf+3Or
	YH8H0IV3apgqy3PlH9Lg3vNvwOZ6GeU=
X-Google-Smtp-Source: APXvYqwve/k45FEwecZfcRtgVfLt4AGTChJpX3K4azFZvF41tGP0inzrkIfnlc8TjDlfdF8cfzWKeA==
X-Received: by 2002:a63:5d06:: with SMTP id r6mr4592203pgb.249.1579880890615; 
	Fri, 24 Jan 2020 07:48:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:06 -0800
Message-Id: <20200124154810.1760420-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124154810.1760420-1-raj.khem@gmail.com>
References: <20200124154810.1760420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] libplist: Use py3 in depends
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
index 4a8d9a1df0..36659e752d 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"
 
-DEPENDS = "libxml2 glib-2.0 swig python"
+DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native
 
-- 
2.25.0


