Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A14F606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:24:11 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so18361030pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=24q005UAwzg8GWlqEEWe6IiWpCBy9GND7+Ih4AsHDLY=;
	b=pEgNUI7LFRhz0xCkKDqGn1jdTGTjjkGBRX4VfNtYqSnLCQq6ygA7E4DezdZV9Iun2C
	M9GxMwuiWyGeT6aH39vp4GxZcKqR+njOKtdth3S7So35z6L2qDw4CyBongyBMn4GC+X1
	09lMnMY4gn4hL6Cnbq3vmQIToZlKcaGFYG/W+dXzwhqdLE5TjJxb/BrJ30EGGrNmQVew
	l4mkzrSbThXzNwyh0eDJ2JwD4bfUQNp+us9PladJyxu8QAY2i3xT2RoYMxfyeUFqQM27
	ccL0Z5ewnxPAtWXKgRUZhxv/id508OjjbMrRIvp+jxEu9kSzsI7mPKhOQKy0u3LamU1V
	lJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=24q005UAwzg8GWlqEEWe6IiWpCBy9GND7+Ih4AsHDLY=;
	b=PS5VRPt20woPPLGF9nwTAQ0V7PEGzJ9PvRHlzwtfhqOvHiVcPiHFkM/pelKTI70mHH
	7vsv+Yp45RVzE+zuKi1x7QLYEVQwNXUGpYT4zVAt0Iu1RdObXJcLS7ykYujk9izh7ATR
	582PkQM/clb3j4DPKQYkzd5JL6NbtLUL7qmSi74cRN4l7bgI9tbGFWRYD7twYbwncXR1
	KB2iQxcwYfFKhhP+QCnKzwmK/Cjd+eKHA6hm4yoypRToqM3JTI7aKjbD+Q2SQxnxhTva
	LA0B0yHBTjqNSiQVhH+pMx8gvWt14WH7bO16m9eqrTfCtxeOSu6rXwtwBExHcUUMpioV
	3njA==
X-Gm-Message-State: AOPr4FWOZG8qLnoQdylgBqP63tBcCgccKTrISKzH5ulWC6pjOGU8oHabr/mQPTSPrfKBPg==
X-Received: by 10.66.246.228 with SMTP id xz4mr53937058pac.139.1462217052452; 
	Mon, 02 May 2016 12:24:12 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm47630613pab.30.2016.05.02.12.24.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 12:24:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 12:24:03 -0700
Message-Id: <a3dea3033f614a11314d5a37ade2f2bbee9dc9bd.1462216694.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <082b1dc91bca7617570284bc7f46511ffc037ddd.1462216694.git.chris_larson@mentor.com>
References: <082b1dc91bca7617570284bc7f46511ffc037ddd.1462216694.git.chris_larson@mentor.com>
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][RFC PATCH 2/3] image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
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
X-List-Received-Date: Mon, 02 May 2016 19:24:12 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is a bit nicer to work with, and easier to override.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 53af7ca..eed0373 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -208,7 +208,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
-do_image_wic[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.8.0


