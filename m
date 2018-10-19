Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id F2F2D79BE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 01:31:59 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g2-v6so15013908pgu.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CVrvIem4/CAgNXgPShmewb2eOa87h9pjp//osxsSCww=;
	b=pE0Z1QYbvIJXzlj0fDKDhmg//LRXwUjCChZl3WsUY1Suw9V8MRaz2O2Ta6FsRTnRkr
	4ErmUnilCZrQxsE+I4a2MgVtHTMAY4FvJSeOt7Hx0eWBAryC2IVCu808HqsntnLqRzju
	Xeq2WRQ+RWb8U/Y8dzdn4yPy91RgGUVB0GnbNs0y/802+ffa9/rL1YBOpBVmEorPqvbD
	R9d46MSN9Kr7/Q/+9rVsHvD2h8KxRmaCZZlj1q36D93aRIbMBswRfQN6M0pIV/9fyA0H
	w8QyCUisMxEx1R8GcmlYo5/UC9wnncTUjkq24BHXS8BPyBkSxahwuTXoiYmv0MpQPHO5
	ro3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CVrvIem4/CAgNXgPShmewb2eOa87h9pjp//osxsSCww=;
	b=t8UZ4w1mX1g0zFffW8dzGI8VWVIoV8HAWS/niSzrMrB5Uy/iVuW30q0VIulY86I0y6
	jckxOOXx2+lbaQBzeCJH7H6xqmmLv5ov0tWgJvLZoHQWff+eT7peeU/xNoA9sSe9oU/5
	ftP4QgcfO1q90luN1JxyZJuh29zk1nkPD4lluK0fC2NKpNqvxCznkB0fApknAKRlHt2B
	qNjPvEVKfGgxcV2Vixid6Kx+ofPk976rOc4yN+yyiid1VXVeDzU5y0WqmdsOSXcFLnSz
	NyOiff3qWpczmWQlgXG9pKGSv0FzY8Et/pb4AjAQRvXuMBXTc6cGddn18/r+M64vBzh9
	fmhw==
X-Gm-Message-State: ABuFfogiq+s2udhcQfPK46T9TUBw8Degrs2jKG37Ug9C/QtC2fz/LmSr
	kTkw5sBCoDaazvtp3eSU2PIBNjOkW/c=
X-Google-Smtp-Source: ACcGV637GTivEGmcXF8L7fPtypFVbGa5BdmM4H7sbNwZgN/+qcie6PSn91zFWpcvyCTJFL0qSHYDMw==
X-Received: by 2002:a63:d30c:: with SMTP id
	b12-v6mr30727500pgg.61.1539912720508; 
	Thu, 18 Oct 2018 18:32:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	k70-v6sm26863026pfc.76.2018.10.18.18.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 18:32:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 18:31:48 -0700
Message-Id: <20181019013148.30745-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181019013148.30745-1-raj.khem@gmail.com>
References: <20181019013148.30745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tcmode-default: Drop pinning go to 1.9
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
X-List-Received-Date: Fri, 19 Oct 2018 01:32:00 -0000
Content-Transfer-Encoding: 8bit

This ensures that we default to latest go recipes
1.9 is not supported anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 15daf801f1..f8da651c5b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -29,6 +29,7 @@ GDBVERSION ?= "8.2%"
 GLIBCVERSION ?= "2.28%"
 LINUXLIBCVERSION ?= "4.18%"
 QEMUVERSION ?= "3.0%"
+GOVERSION ?= "1.11%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
@@ -69,7 +70,6 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
-GOVERSION ?= "1.9%"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-- 
2.19.1


