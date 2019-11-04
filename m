Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71AB07F8B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 14:26:58 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e6so15474569wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 06:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=53+b28IIfSQ2jhU2GL68wQ10l87FtLXRotEOeRlNVCo=;
	b=o5GdORdTsDtcA6hg7Kpx5oUraIjcKROAMBBygMfudqQ+I+DiKNdSXguMEszc95tR/+
	wzYhtZ3AgzMmSvhDnQafumu1dX9nMNtKNYmfoImmHq26mZ6hsclEmYafE6vSzjZL2Xhn
	J7M3EPh5br6e9Ufua2I0ynqSlLnM8QyMEXiJDSXLFAZKJaQ+shPYwBvVrcl/SROVwV4V
	I5J8o9+SvDTBwdec7gHPl/rAd+SN0XSdJbjQccPrxE03hvrVSGGGcTnQxfR+SQnu8Oih
	pUw+Hkft8Jlmm1H46n1fzQ3e/8Kp5iUhWAbzhz0Zwp8I4IuLCwhsIEIWkTxmi1ZVYtuq
	/kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=53+b28IIfSQ2jhU2GL68wQ10l87FtLXRotEOeRlNVCo=;
	b=Pai3Q+jHUzCaOoe3FItIyMzf1Bvk6rlIZhTja2HtHBuBA6JEnYbC2Prnc7yLv09Lq8
	xFzMFrZKmwINJYkS5g3gx1cXCrhv98Rfv1yLHm8pRAXZ7FmSatsRDzLZzY5S0LfbSQ/1
	5v7HYUfN/lypqldI+IonnZdVOLa7VRv70AAs38eu9zy2I0cuIKcjrcXNoeaIRtEfvVBf
	1r1iNjumhGxubgwnwTqHLUtynuW3SrJO05ZAddAYzVLfXTbIBeriLEttjN2sZ2dXy8Sy
	JVg+BsSmqJxmjISs5Qa+JhxGfT7mYxqsWFLrWoUvwA506dDpK+hThfrasozoiLYtEFhD
	xwDw==
X-Gm-Message-State: APjAAAWT4uBuFWK4mWEeJCS8opjCq1g6xfUcFfCoesPdCwi/E9uRVU7M
	RgvXQBH8KKz4DqFGq8BIBDyrvXTXJ2A=
X-Google-Smtp-Source: APXvYqwXMdvoQ52/2fkxLElTHAaJIMNepI4dSavWtz0FdC5I+oA00AKAnpJkzI8gOG7crJZ/gshVgg==
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr16067940wro.355.1572877618945; 
	Mon, 04 Nov 2019 06:26:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d4sm26873251wrc.54.2019.11.04.06.26.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 06:26:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 14:26:52 +0000
Message-Id: <20191104142654.20440-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2 1/3] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Mon, 04 Nov 2019 14:26:58 -0000
Content-Transfer-Encoding: 8bit

This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 66af2f3d60e..2ed87a84374 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2019-17371 is actually a memory leak in gif2png 2.x
+CVE_CHECK_WHITELIST += "CVE-2019-17371"
-- 
2.20.1


