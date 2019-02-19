Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF7207C9D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so2810887wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kGyuKnhCqe35/R71ISppAOwt6lulem63HJvxdsLpKgs=;
	b=r3u2vKalfLCoXpZbp/ssrec/pNi6g/1tpDsfYAgzYba3fNVoLKmAuQkI+7dQvv+7Eq
	peTaR5ijbedR/GSD0opiQNNjLVIJV8RMoNif0aycYV13zj1kIN4RKEI118QDoe5wbcuY
	c5V7OArgYehlmGPX7NH7yZ/LFew78id3dPQa+wZ322F/yLYmBT+HnJYRXBMs6JQK9pd6
	lIkiKQk1Imf6PfKrqCKUKvlYQCdKVpWhQv8p6ayGnRhv4ZJ962ViDH67Ec1FxRfO+hHF
	r6S649kEt1WSdf3qn0jEC0q5CLg83BBSbkgdSEDdiNqwtLb6dYrZKK8g0841JQmO6FRq
	5LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kGyuKnhCqe35/R71ISppAOwt6lulem63HJvxdsLpKgs=;
	b=ETnJjdZlpkdya7o0lT6tugPWeIseuBhhmQ8egp4OuWtnsk4H2tg/lNXx32wE8UhA0B
	2H9dUmKmkUYjy65HM517Mmy6PPlpM+JkKxHSVb13VtVN+10RuqpR/i8hBH2SWd3/ah2u
	wJhQWZ7W8iODRBYGywBvjhlUFJBptysCN/LibrTrRpJS7KIJN9uDLPfPDAG26zPeQ1NJ
	OpfO7SX5XN4rpNNvcuNT6vRgUmtHFD9T39w1zuRI5dlrER1fDVKqp7fwX3R0yiIA/okX
	Jd0Hebjbft5m3LBx05H9dGO5BlPvoPjgtOjJlTNIVyjrj2pyzCgkubpWQIztwGO/Zube
	CvOA==
X-Gm-Message-State: AHQUAuYV5X6+aAuEp4n/7Glkx5VNhGfkV01wEe5yojbHcYEaR25HF+6h
	OFPNn0W3d34WnzRTAHa/8lpGfA2y
X-Google-Smtp-Source: AHgI3Ibdq7RljD8i73vSJ75+2J/dnZbIRB70euaBN9Ix1RjtE9YuR3gIadqgaXBSFC90rPUX8zCBBg==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr3618941wme.54.1550598456241; 
	Tue, 19 Feb 2019 09:47:36 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:07 +0100
Message-Id: <20190219174712.60694-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/20] btrfs-tools: upgrade 4.19.1 -> 4.20.1
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{btrfs-tools_4.19.1.bb => btrfs-tools_4.20.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.19.1.bb => btrfs-tools_4.20.1.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
index 2f59a0c13ea..1b4f515cb62 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "167651ca29ec522cff0d81b52dc0cc4ae4e3f535"
+SRCREV = "6c33832b8c7bf2d7b64d6aed023c0bda43a03311"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
-- 
2.17.1


