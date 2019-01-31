Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22D7C6BA11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 23:05:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f7so5196199wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 15:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u6vU4UKxbgoA2EYtuXTQrRwXeqCxa4U5PxFtkMlwr7U=;
	b=SvGZrgRKau7Rbe6jBayVIOYfKMKuJaCuDWa6bs/Mbzx8Xj8i503Az3/b7fGV7EciYX
	aYBfrr3SHVfrtQos9JibdnVjPyhZktNJ4FCVR8wH1AESJLpmDMOhYc8bO2E/DiyM08Yb
	A1/knwZ2cM9ZZfsvFak0SVRXxTr23j4l2e1Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u6vU4UKxbgoA2EYtuXTQrRwXeqCxa4U5PxFtkMlwr7U=;
	b=rAG6BsTi4qINjYwhfGhyg4gMHXzMQ8ecAgffZ19r2uz/lrnxaQEC2fyJ49fZ1FMYnG
	Gu/slZr0zQftirOU7jmIL5bvM7tJxinWiu7mlTKWQr+rQVMXTCKVVCTcXLb7aSTM6+af
	6QihoNzQEh/o7AWG8iExQyxhRUXGkr3/MtQ/+7HR1WJ9i0DnqYXjWVRjKr3Wz/cgfeXF
	27Q0GrXIi0trvyyheciH2aC8U+zh1um86BtNVmv1FXkv1S6E5mMlZTx5wTh1boDKjclA
	notUS1ZG9ONwGBCP/Pc1PZTEuoNhUR3RfQMI4X1Tx3wSztLE2gnblDGkG/PgwoZrfAu3
	+s1Q==
X-Gm-Message-State: AJcUukf5Ufh4toE1GaIGCumlDwG9YT8JmkiKp0axM+teMOC+87KNZJbm
	D9oqNuvvug9kH7YWjlygGoS2nclsPyU=
X-Google-Smtp-Source: ALg8bN5SiV9kNpqbhS7BFP4c0X4NOu2JkAo3Itf7FHE785bYXDLOeOgqQWxlZptOiVragc1Br+Bl1Q==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr36489087wrv.25.1548975955385; 
	Thu, 31 Jan 2019 15:05:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p10sm4312634wrt.25.2019.01.31.15.05.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 15:05:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 23:05:52 +0000
Message-Id: <20190131230553.31750-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] core-image-sato-sdk-ptest: Increase qemu memory to 1GB
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
X-List-Received-Date: Thu, 31 Jan 2019 23:05:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 531571ee877..7e3152b4a11 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -9,3 +9,6 @@ IMAGE_FEATURES += "ptest-pkgs"
 # box) and explicitly add just 500MB.
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "524288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
-- 
2.19.1


