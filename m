Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 55AD879FD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:13:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e11so9163744plt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g3ou8Eo8jlKeMMXtocGrNBDv3xZZ+Ap8k7nxYjNMZMQ=;
	b=ckM64BtnRbnbXW3sKRTT+y0vYCLuPK4jaT8m39FiQDoaayrzDMsPIDEXGF/aKM/M1E
	qUtqs/Y6j2OPi7MIAilXxqfdS3eyWqtb4aUh72dxXkh/9mAOyp9am67mDq8IdrBez50c
	mfqzhXqJDOR9kfLZsmwyrJVEP1IhsihN6yaFIMdTWHpR2hz+H+R4K1mmjcvEfKpyvRlH
	ARJX/n6BC3Wgtx61s8ZSCYk2exydThctaahg5xqtuXDjEOwnBP+aJIPbV3XU1CkbUT84
	zlpe9nMrEndVR86vcqhoRmTC2AXh6M1+XHfZJnsDQU6s0UkG3fGxquE82AhkoOf/YZMU
	SVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g3ou8Eo8jlKeMMXtocGrNBDv3xZZ+Ap8k7nxYjNMZMQ=;
	b=GkRCigpRduDONd/gnc8VqUTQgnybM9ARWjIz6yGS4WfIWe8hVs5w334oiQCoukKhy+
	ChUUc0G3iKCNXcIkilmz7i0SNFVIojJgTmXTJul8gFVBnv5YC0By3ZLN3p8GSdoCFCdn
	ApefijU1bVMp/T8+IJEL37QYDE2QOOVDiqHffqtmooFoccLGjvqUcZeDkeKQXM3sFIKR
	w0VjO9Kk/2dMiI9w9vpfjblqk8s8bHE8886uGSGy9SvdvoKRz9QOQnOKGOdI62IDU7dl
	/eHSxZCiHiW25yg2bH1Cfct4kVDe5Dcht83J/DbbXbyfLBuNCAMvQALDnZ7UXd46IwH/
	uL2w==
X-Gm-Message-State: AA+aEWZ/cULIiInGoXT05mr4wDgyVls4n+6wuSoDnYv+BvhyhpUEGX/R
	1gZ2borufnCxB/lvWX3kZdH9iKxugTM=
X-Google-Smtp-Source: AFSGD/UEgRYH49LyFZHYzI0/91x+JlyDPNXsA7xfr9AJUblahtwl4ucXem023km9yn0F6z58xVqpVw==
X-Received: by 2002:a17:902:7044:: with SMTP id
	h4mr20985856plt.35.1545243202119; 
	Wed, 19 Dec 2018 10:13:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	q75sm27536922pfa.38.2018.12.19.10.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:13:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:13:08 -0800
Message-Id: <20181219181309.8320-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219181309.8320-1-raj.khem@gmail.com>
References: <20181219181309.8320-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tcmode-default: Drop pinnings for gcc-initial based recipes
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
X-List-Received-Date: Wed, 19 Dec 2018 18:13:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 48224ca6b9..fe24bd9b32 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -3,14 +3,12 @@
 #
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?= "binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc-initial = "gcc-crosssdk-initial-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
-- 
2.20.1


