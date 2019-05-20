Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7377E069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so12804285wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=LSRbeYIaTFn6/9sp4+lJCKz8ls0B+eKAyUAyeoNC35ZoiNePrAcpxn/sRlABY8e798
	4L2dbliw/rjO7ln5EtQULdxRizHNIWeSJazZdX7L2x7YDzcETqNYolleqGE9jm+9ssdO
	NZrczNpAvUaActcVXHwk82/hfstV4e9XI0tOKxpfxTPsCXuPRgSqyNNs2cGvgApBfLJv
	2/8Aw6uNHklkyjAt8XxKY0k24PfHbz4I6P3966eFgwZARILdrLGkEG+eOuGpJCApyAJL
	F4FEfTANxatCr71+W6M2V9dMoeo5yf6wCj8kZM8hnUAowjavI2GHey84sASvwDpWaorO
	Ewcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=F1z6VnGNil1rIttEYwho6eCSpxzckI9Xg0YsWOZuqFk23EOFC7xfEKyKNiuKwBUxYT
	P9m8ALQJNeFLuiu80Fay/ie/ijEL+CHOuIUvpe5WVmQQNwJDR5dSQ9obKav9hnHKj+QZ
	r0XuxFyC8LWoMNT6sNnTLLOu5W7du1aiUdF6MemM9O93DzcLl9ATxwqafU9kTL4q49sr
	EFJZxISL3CIjN3LPMR8oOTTkdGNu9rBK42Df624JhwnU8YbE5gEMSyoofcOMV+8HO1nN
	Zcw0JpVAVn9TM6AmaNcKXfnS+apyYA43L6rqtgVzD4PKUeJxEEyajjJrRpXypDINXgeW
	qyhA==
X-Gm-Message-State: APjAAAVualu2RufJsLawADRjvq+B1w8As8p9iHEQAHkzsRKF4ZNs7XyY
	pbs2qqm9B+F7dfxWhfDWcJc2EYtI
X-Google-Smtp-Source: APXvYqy7vrzavcz46uFGNL1uE/AaQ3hTZfyqz2TTZFWbL6Td4NJECisf6uXTBSAErqe6MLC9EpCnnw==
X-Received: by 2002:a1c:4083:: with SMTP id n125mr36534586wma.54.1558361514812;
	Mon, 20 May 2019 07:11:54 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:05 +0200
Message-Id: <20190520141125.10805-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/42] iproute2: upgrade 5.0.0 -> 5.1.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
index 8f33c7fe194..6854a130042 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
-SRC_URI[sha256sum] = "df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba"
+SRC_URI[md5sum] = "a2b8349abf4ae00e92155fda22de4d5e"
+SRC_URI[sha256sum] = "dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


