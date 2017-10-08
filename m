Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 023256074F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Oct 2017 17:05:51 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b11so15305095pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Oct 2017 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rMFgZD+iiBXOLSjPEF6NeoRXxqF1rC3/7BHaPsxSg4g=;
	b=NNdrbfpZbjFQ/m+SX9sARpK2/KYd+2rLaTmYBWWqbkRvmGO4nJ52zuOy0bYuXQE96F
	W8lrt8FWYvFB/8i6Qo+Faj2McyRerEGhfVCPWuWf71tabb0+7UKvEh5qGgXyRHm8tbdz
	9DHJVOR+ZXF4kmZ5x5E0kSt9dGr2wDZgwVejlXQn3l+1AcAqpQyylKKIadw1K3kqkj6N
	CJ1vVzOWcMpEv0kvZs+DJmykqRim0TPAmL67CXx4FBEMRinYng7JdXhRsM4MksCCRIou
	xW2AjrXP0hddcvA8OTp6CL4CvpIKtW6dQc15S8hQJaQlgRH1zkBavYy9Aiw3W2VJfJMi
	RsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rMFgZD+iiBXOLSjPEF6NeoRXxqF1rC3/7BHaPsxSg4g=;
	b=qp4deSKxITpQLwD4OSiXTMwdTQD5Ajgsi8MmIfkd7CXIs4lQ4jz3Ysr781u+kdKTWT
	GRlHeYm+puN8INzy0rJMeOSJl4bRRw/fUyNsgtIBkhVcvsaBOSFC82FlCnnr4FviPRmA
	EQfdozh1wo1HXYIk0t7cQWxJKVc9PUJQ5ypwZeO8vbFrYoSoEXZ6JcSGU80UPkaQSAIH
	F8SeaRUInSz7cEcFwQADA0Z3TKiqe7S9WS3ezJKcUSJ7cFN/rLhmRj7NOHg4/hZVTYIL
	HzzLQkKzO9u8zOvixViutKfBHPutM3SGAvWKUMpY64GKmH4n+dnwOMF1HhljxpWlcgyX
	RIPA==
X-Gm-Message-State: AMCzsaW9oicNadTOLVEgQdxl66p9shKNr716Kf8tnU9EOLwus6ykC0w/
	YXol7EWSZri2vRuzl5PoDWduVw==
X-Google-Smtp-Source: AOwi7QCgPhWXx+663SoMINfXhXYnUcyNvQxb1nI7SDkMYpbbksGLOjKFd7wAcJOYyBmwL1uDE++krA==
X-Received: by 10.101.80.1 with SMTP id f1mr7175027pgo.80.1507482352847;
	Sun, 08 Oct 2017 10:05:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3e99])
	by smtp.gmail.com with ESMTPSA id
	n19sm11955898pfj.52.2017.10.08.10.05.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Oct 2017 10:05:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Oct 2017 10:05:44 -0700
Message-Id: <20171008170544.26938-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] gstreamer1.0-plugins-bad: Add dependency on libdrm when wayland is enabled
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
X-List-Received-Date: Sun, 08 Oct 2017 17:05:52 -0000

Fixes

WARNING: gstreamer1.0-plugins-bad-1.12.2-r0 do_package_qa: QA Issue: libgstwayland-1.0 rdepends on libdrm, but it isn't a build dependency, missing libdrm in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: gstreamer1.0-plugins-bad-1.12.2-r0 do_package_qa: QA Issue: gstreamer1.0-plugins-bad-waylandsink rdepends on libdrm, but it isn't a build dependency, missing libdrm in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 2e466fef37..7be15d9973 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -65,7 +65,7 @@ PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 lib
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
-PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
+PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-- 
2.14.2


