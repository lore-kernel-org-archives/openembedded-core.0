Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF55561510
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:06 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id s1so9107661pfh.10
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mX2zETm5OlrRRKNoddYNBqWs35AIXwo8ztjalubyfAM=;
	b=lgvxUukLeEjeRfmQ11HP6y9H2A5NeXGV1NSRnc5P/eoFco2z9AP9zM/vTzbdoD9AT8
	DpevY6U2MHp9pefU2giMNibboJyGSVhpFJAEv30OJZh/3fSjGwoHc+IO2VW4kVMqSA9u
	Zr0/JY5Id2VJIiq1XCUUVbzALM64co3bIXlWaLynyUbqI8FiXsu4306JxnPTqJ9RZhYm
	JjL7CVE+7c4Y+JeV4yAFcSTJ+2YrLB4zeXtxxrYkcApvVn/iUfDPx6CLF1jmClmbAzwd
	GR3PUIZ4wKl4i9u/xQzBKvzoHNlKGPKAgVQ+rM04zK1s8Jzjsx1CE7+kQ6X3XdN4MCrg
	NUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mX2zETm5OlrRRKNoddYNBqWs35AIXwo8ztjalubyfAM=;
	b=IK9DiSI9qGlzz9kd4fnPSpP3upK4AL5HBfB/7INhpUejNca+8CCTxtF9Ml47GiugCM
	mirK7zrIFpJFaYoFxtlDyibs3Bbtbvf6scoZFttT708Kh2e4DC8eczU0NLBlNoOwzx2r
	ohm7sMRtoqk3uck4zorQW1wsMedOEKh9s8BgcDjqQRKLci64z7OxTddOAn0FaTSFJPow
	iMv4FN9QZlVlt4yZZ+uQwjUrZQubs3MawNRKHJE7mCuMU6YNGFE/mokdjDxme0qznTo5
	HUyYut8oSFzKzanZIUWE1sHCC795OBDcjaeYORaKU6UimPpdo04rElbtPsUJtDJahpcS
	xjew==
X-Gm-Message-State: APjAAAWOIWE99pK+YcqXQL47wLCR6euh6WO+MApqRtX3xaLEQR0h70H8
	5JqGL8DWg3ej4YBzXrMRCIAV0OqR
X-Google-Smtp-Source: APXvYqzlxadBnvFCxNZaCPGKH/WGR/QIqNrRX1ryr/NPQkSibJGO7uDP3EMaZ8TD5aGosv9oxC1udA==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr18749439pgp.47.1581955267412; 
	Mon, 17 Feb 2020 08:01:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:48 -0800
Message-Id: <0d58f5a01c7d49765d66a7e2d73eef0adb868eac.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 10/14] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:06 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-tzdata : upgrade from 2019b to 2019c.

-tzcode-native : upgrade from 2019b to 2019c.

-tzdata.bb and tzcode-native.bb require timezone.inc.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit c5a382429d18642d35d40a4df6a58b971c724603)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ce16524ebb..f6bab1acb4 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019b"
+PV = "2019c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "91e0978d947496fd6aaf46d351f9c41d"
-SRC_URI[tzcode.sha256sum] = "2e479d409337da41408629ce6c3b4d8410b10ba6d4431d862e22d2b137d7756d"
-SRC_URI[tzdata.md5sum] = "b26b5d7d844cb96c73ed2fb6d588daaf"
-SRC_URI[tzdata.sha256sum] = "05d9092c90dcf9ec4f3ccfdea80c7dcea5e882b3b105c3422da172aaa9a50c64"
+SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
+SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
+SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
+SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
-- 
2.17.1


