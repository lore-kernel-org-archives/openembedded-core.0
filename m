Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4741D7F594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j11so11597871wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/CRmKesvKC2A/utPY2wNPwmXz25mPAjtvR52o/4ygY8=;
	b=AFgX+WOwMuaiGivC2xietqwTZLlAZKw0s/e66bAWnOpPdI/O2EbskhUEmLyXmMbxdi
	ZmNqaFMUSBy6DFYu8AaeojFkHmECxviMzQ7PcnZmEGx5uhyamJtRXJH7VxqXAKZsTikJ
	mVVyr4z1oCWu8Ye2uW9HoY7OytCqhfMKxGaMvFZrZsM7gYkB7sy+aRi2gQogJTx+M0/p
	+L9A+85GK7uvs5rNaT4Axw/SH94QyhdGrVTOuYJa0S3T5JbQg4LdUp3hPQRmsyhlWaqe
	OtxQfrETZ3sN2HvBe1WP/xFUFntEPkIGVYHum+SYV67wNQ9j7eLZBmkuaGyaTFfImSSk
	VESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/CRmKesvKC2A/utPY2wNPwmXz25mPAjtvR52o/4ygY8=;
	b=TYHvRuOrxdjCa+UF+Wmb2sNwJ2pn+DsXtEFaYb3J7vTEHvZCooYaK1hgecJ9sWR3cZ
	mPx5aJYzibsO7Oq0RkHxSobxZzmwfIMJxNbf1chJYN/+vEldDVWECPBaUBvQ9hGUm3CL
	huBzZSxoPcIv2BAZ1mMKBRtjKhpWxMbVnhPOC2utRTgIS/6DQdgAk61JoQpYvimPvFB8
	W/2NKbGkjYAiUrwZAazLMV2y3DsyO8YQNS4SQ+hfcZ3e1Xps0cEdB48xDv/W9XBnp/X8
	9kSQABw30c9lu1tvScMOaoQ0dc9DJ2iPKuqPcW7TkaE4iU24TpFoMe5lo8f8eXd4Mvtb
	Njvg==
X-Gm-Message-State: APjAAAU+WIglia22489sghxvN66DrIabVwn3hoHN1lgWiQ5Fw55u+Q3o
	zs8VFu6hEB+S3MzziOvypCVh9nmn
X-Google-Smtp-Source: APXvYqy2ETn5zwsTRoRxrHKuPwBvRPpSkOU3/T6K6dqsf+UM7g0oGiPAXVWW4Slm1vbRNFn30V4a6w==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr12824783wrr.220.1570794482811;
	Fri, 11 Oct 2019 04:48:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:38 +0200
Message-Id: <20191011114754.91740-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/19] runqemu: unset another environment variable for 'egl-headless'
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:02 -0000

Some host distributions (opensuse for example) are using 'pkgconf',
which, unlike the original pkg-config, appends PKG_CONFIG_SYSROOT_DIR
to every directory from the .pc file.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 22671f19ec3..15cc56b93ec 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -462,6 +462,7 @@ class BaseConfig(object):
                     del os.environ['PKG_CONFIG_PATH']
                     del os.environ['PKG_CONFIG_DIR']
                     del os.environ['PKG_CONFIG_LIBDIR']
+                    del os.environ['PKG_CONFIG_SYSROOT_DIR']
                 except KeyError:
                     pass
                 try:
-- 
2.17.1


