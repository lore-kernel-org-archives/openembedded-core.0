Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1347BD66
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 14:03:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r10so5532866wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aBbMTThCJ7ljUTEjvkJEdC6mFMaV4dNyOAXWae/2QrY=;
	b=MRGch/B0eh6kVv3RxNTTeTvvJUKv6WVUBUxE7P+SPf1Oqon5Q4mvRto4ZzaDY2tCsc
	kX1XurbieJtqARZ+z7Qc21s2O5hSdnJ3KN5Gh4R3JUrJVijaPXZ1wGolCyuLyAR6gEM5
	VroM7X6VMCne48atnbhldvNi9NyTyHTaV5COg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aBbMTThCJ7ljUTEjvkJEdC6mFMaV4dNyOAXWae/2QrY=;
	b=bi2BPgR3P4x9b0Zc3WctyItUp8d3Gz0gBR1oTCfL4n3E0aKE6lkp1Sr0iBLIlT+255
	Abb1GV+EPReLvauWY/3HqyqqKByftAyaZX6FlW8zfU7ncuzknmxECEgtK/b7WG3GuNzr
	kWvpwobE49sHGDuioWSYDqWxFz9U4bzR5svb3nQGJqsfPvzJQiPOfrV1t7l6b3XwWwSR
	wXY0bpZi/pToRVhanEkWx2qG2pPsteQA/gmv3OZPt2u00lxIG629JBl4UG3e9en6Pk2x
	gbN6eLaCcQ5Z4bAcUMTZ/NTTD1CbxDTNF81AXimszm7dXbCFXszFdrpmpUaQ2yJbjMhB
	Q2+Q==
X-Gm-Message-State: AA+aEWb08SKez/L1O4zYKsQ0yWsoKwnoVwN0XIeasCR1AGtbZUTADms+
	tqi0OwV7K4WavcHggyzvehgJ2a8Sq9+s8Q==
X-Google-Smtp-Source: AFSGD/XEvuQnKxCHHq7Rl64YEJwy2kd5h03BJsGtgNIF3S86aAasoRvETcMWsknXLnzGPpmE/mMNGQ==
X-Received: by 2002:a5d:64c7:: with SMTP id y7mr2702712wrv.207.1544796192781; 
	Fri, 14 Dec 2018 06:03:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d4sm3290424wmb.25.2018.12.14.06.03.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 06:03:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 14:03:10 +0000
Message-Id: <20181214140310.1834-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181214140310.1834-1-richard.purdie@linuxfoundation.org>
References: <20181214140310.1834-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] go-crosssdk: PN should use SDK_SYS, not TARGET_ARCH
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
X-List-Received-Date: Fri, 14 Dec 2018 14:03:12 -0000
Content-Transfer-Encoding: 8bit

The crosssdk dependencies are handled using the virtual/ namespace so
this name doesn't matter in the general sense. We want to be able to provide
recipe maintainer information through overrides though, so this standardises it
with the behaviour from gcc-crosssdk and ensures the maintainer overrides work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 4391b32424a..94f6fb8eb76 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,7 +1,7 @@
 inherit crosssdk
 
 DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
-PN = "go-crosssdk-${TARGET_ARCH}"
+PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
 export GOHOSTOS = "${BUILD_GOOS}"
-- 
2.19.1


