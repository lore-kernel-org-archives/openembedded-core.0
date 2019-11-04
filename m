Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC0C7F87C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:42:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so16875927wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4AKs56ZWn7tIq/gmxs3aw3q15kALhYtinc2zcPBkX6o=;
	b=yqtQcMS/Sktx408R2pdil6UJbZnE+Xsy3JTtGMmE2XcSG+uL7tlVZQzBfTNaIOmZx9
	J+sfLDBszilH1Q2w9I3UmoUUc18O+6el15L3POqG/WvFBiDI766Kj4VsSFW0DBWJT1aP
	Dan2i0Bd6wRK6TUAB9v4oeABmuZd8c8c6qOlJ+gpMQNa0cfZX/thneQIaZEwLiVqEOhe
	j/kMUp8vm/p1G3xkd1aVNF63/kxzrVNmfuvZfkgRmtrmdLPVJnChhsyOpoBJvIovrnb+
	EI1dtqRCP7HBzVOxIz2+wS+usPe7gTwyd4pFF8uQpUmlGIngOcTLM3uxf9sPQZWfnC5u
	nI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4AKs56ZWn7tIq/gmxs3aw3q15kALhYtinc2zcPBkX6o=;
	b=gWqZvUEgFzokX/OMdFIoql5PkSH6TDBd+1G33bCZC0dRU/AhhtcMLJ4+tATcWESR88
	qgiW5QN/lZY5KcpxiG5+PwGIjwlNVo7jkS7ceFf6BXUrh0Ylf9wOZ5Kn/Vc7/9fGNpXQ
	4UK2I9I+XU0m6AYddHQu1O4fDqUxcVKENGUhlPY306noHJryM1lcBLNXUxYDLA9LWc/R
	3qpa7L4OQVUrcBcCwNEFjOtfQ37MpwXcZz4WTAjOWlZAF86mjG6Be7chwJAaZYX5xwJF
	zyQZuO1RfVSDNzYXDy5TDdlrxiYN/Ul7sTsF/iMcf0A7ba3q5P2LTdVkUm5SkomifYtQ
	Akww==
X-Gm-Message-State: APjAAAUorkYnOaMcmSNGRfXFW4yWtBuIEnI8VKuEkRYULCtWA6JDekc+
	2+6hMRxwRgJmjTm31WtDay7n05wtyFw=
X-Google-Smtp-Source: APXvYqzsKQHrBUECVcUvC6id1U2ZIugIiBo+AJVCz51I0ADPhb6Ov/DBjTz+/r+nawd8BMDQKl6RDg==
X-Received: by 2002:a05:6000:114e:: with SMTP id
	d14mr16667401wrx.47.1572871373913; 
	Mon, 04 Nov 2019 04:42:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a15sm17521387wrw.10.2019.11.04.04.42.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:42:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:42:51 +0000
Message-Id: <20191104124251.21923-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Mon, 04 Nov 2019 12:42:53 -0000
Content-Transfer-Encoding: 8bit

This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 66af2f3d60e..07970e14360 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2019-17371 is actually a memory leak in gif2png 2.x
+CVE_CHECK_WHITELIST = "CVE-2019-17371"
-- 
2.20.1


