Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC31A6B005
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 15:19:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q1so3358262pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0H0zKO/yc48WPKvpPI6gax9luYDYYGqrj7Nzjs8pLv0=;
	b=c5z9ALEElTBJkY1NYsUOfA/6GU2+oHA1Mpp9CzKr8hO2liMth17GoKCgnaTN2ggYtZ
	3Zgu4NEg/plVdTIciQ+KRMXmzkiy5fu6comZJNi1Td2Y3Ty47EKINXC9bqAbO/s2SCCL
	MDADBSI/Rb6g1pQkcRw+AWt+i1HBXmnRiATGOGLYGOTD9zvkDp73C3DjwR/VbaGqZwae
	Q9b49Sm4zFTMXs/TT3eoGaf8moEDFy7Vsc7Yy0mSoKHjsdXUr1kGzd2ZjWq2Z89wbldF
	+NQRNih9sLqrrKF89582DHQ8ELRqB+Jo0xwL6/VFuZ+hc6mRL7p3GNkpj/1Yeoh1zTUi
	RZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0H0zKO/yc48WPKvpPI6gax9luYDYYGqrj7Nzjs8pLv0=;
	b=e7H1WeWNwkXMHi5sPbqpcODPWPd/dAYAbhNrzBrXAvk5BtlpyFiuGEZO1Llcf0i7Wn
	zMVeqRQyx9dTIFbmiZ7uY1JOt0GKTK0T8bf2Ese8H9vcBgHotUc8O1qG6JeQJfvTkRqk
	uhn4mVeuRAIsj8lII1E4Kb9IUrj3FBIp1Bx4hzsMybJPxI9503LKkvv9vArnvnHoH6pb
	DFwiRiqc6yqutK7rE3Gb5tsynHu8xtWoBeRqHACW9KEYBO70oDVX2wcpR6VAl8OryVOS
	5dgTEbSCY0pNvyLczjnFB/ZbPRSX+6WYplXe72hNAVSUJI5d4jwvO3bgoZVl3pvjGwn6
	10tg==
X-Gm-Message-State: AJcUukdvu+lvb1y0pXPHzxGlBPY1hYI8oQsbbu59sOCg1SIE9wYYAEhE
	F2MFRftmqv5EyWuUhxif9LZs7qdHUak=
X-Google-Smtp-Source: ALg8bN68v/rhsEKaMpN6itlhaCTYWyfaAfqAMgAemwLzlobOZlj1hdhykMW9M77PhPSv639mhzA83w==
X-Received: by 2002:a63:f34b:: with SMTP id t11mr36023165pgj.341.1549034381855;
	Fri, 01 Feb 2019 07:19:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id
	i4sm14436147pfj.82.2019.02.01.07.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 07:19:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 07:19:29 -0800
Message-Id: <20190201151929.27893-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] mesa: Up the llvm release to 8.0
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
X-List-Received-Date: Fri, 01 Feb 2019 15:19:42 -0000
Content-Transfer-Encoding: 8bit

Needs to happen along with llvm upgrade always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e96a12c1b9..66ed649efe 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,7 +105,7 @@ GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-MESA_LLVM_RELEASE ?= "6.0"
+MESA_LLVM_RELEASE ?= "8.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-- 
2.20.1


