Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33E15773C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:46:29 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id o18-v6so1664746pll.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8WqKvsjLDKkCvEBeUVbtDqmhA9YqPx2X5mcova0z8Kc=;
	b=Wd6anIen3O0f3V1EOwqRcvPB+ht7JGCG7gWl8CqyAjM2R9FEGuqYwIkwM/PAFpvbQ5
	+brzym1aVoN4hBKFBnEKQuixfMz1UwvSxvvJ1OCmCiDRIbLZKnL2N0mAzDA+EU4shOjj
	sHIloXGwUhRm2OTDEZBZ6m2JQJqMCwC6+gYvFJXqROAf5tc/tINd3wAS4QSPY+pYWkJX
	QYVOdWNGOIk9afJ5xsTw1pYILKmcvZNYCaGh6vwXtxZMO9a7mNdm9VLOUjmGO8TqI7vj
	MvARnuX/SzwPxxJOw/0Rcl3PTiBy9ibYbCzswa0OtQeH6NlI5qcqbS0YFSDn6DXW+pzc
	2J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8WqKvsjLDKkCvEBeUVbtDqmhA9YqPx2X5mcova0z8Kc=;
	b=nvK1jJ+x1S2lYgUEr4kIe6d0A6ixnvFt70MWtzIi3LwmIla3S9DLMULW1ZYWyFj10h
	MKsyztUjmp5akcjVjmnSdsTmBC223khHxCjzyO46/Mqu8V6ptQhbEgeh0yrsdet2r7HG
	1ysHFVHSqpNxCbiMTatHPy554cLQfRYqriO/Qgo6Q6rvqskUsmFQEnc+L/a0g+DoqW9j
	o2bS+w6Q8EN5IJGKtvH3qNRoNKh3t8BuDoN0kNIwyfEj32rfFuvfbfgAsSfJS/AWjQri
	GuJoWlv+PFCRatoYWUE9c7VVTWIJ5J8gY/LyewI6XX4ggduzN3NfE27spAwdTdzKO9C8
	z7vw==
X-Gm-Message-State: APt69E3VhU6C+U7dxr91uNTUktJLBHFU3WAdWdgGIEsWoBMoUPUsi1Lz
	xMcGDKx79cCMYFbLVU8fEUdcyA==
X-Google-Smtp-Source: ADUXVKJ38RHeIM1H50VU61mSI/wIX2KpTSe09DoDXB97po34wSlIZfjfFXvMfbfc/hr83PnOPbYUxQ==
X-Received: by 2002:a17:902:16a4:: with SMTP id
	h33-v6mr47579plh.73.1529617590090; 
	Thu, 21 Jun 2018 14:46:30 -0700 (PDT)
Received: from ip-172-31-26-116.ap-northeast-2.compute.internal
	(ec2-52-79-39-246.ap-northeast-2.compute.amazonaws.com.
	[52.79.39.246]) by smtp.gmail.com with ESMTPSA id
	e131-v6sm7317351pgc.6.2018.06.21.14.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:46:29 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 21:46:23 +0000
Message-Id: <1529617583-19815-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: upgrade 4.16.0 -> 4.17.0
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
X-List-Received-Date: Thu, 21 Jun 2018 21:46:29 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_4.16.0.bb => iproute2_4.17.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.16.0.bb => iproute2_4.17.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
index 4b0e893..12812b0 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "1f12a70d767ef77ffa2d1a0c4ce48f1a"
-SRC_URI[sha256sum] = "0c5c24020fd7349fe25728c5edee9fb6a1bc8a38f08e23be5c57a6301e55ee0a"
+SRC_URI[md5sum] = "6f3a87fe2d97c28214fc2faab2c257d6"
+SRC_URI[sha256sum] = "6fa991b092315887775b9e47dc6a89af7ae09dd3ad4ccff754d055c566b4be6e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


