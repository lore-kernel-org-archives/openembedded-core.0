Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id F37317E468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 16:48:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q24so7114013plr.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yrIRuHMOJQXcmTpdBHlF9eqOUJ2Z3xtJNgnrYUZScJc=;
	b=JilOd1afNbJa9MeqgeVb+xXHdaGeVxIwVnVzwLsKRpPvY2b0kd6y825/zIxokycIEA
	6ZxFyNVG1yXtrEAE23YxpbvXMy5wQznbULwwkYjVnBB01kXMSgiC1rV/UZSv7HK9cYqO
	qr8TcnlzuzDhLH5vI0waO3Z5Md9g1SAvqGK7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yrIRuHMOJQXcmTpdBHlF9eqOUJ2Z3xtJNgnrYUZScJc=;
	b=IdTpDDUOQsH08QB39ySjtCi+vqKFhcRDZ7Q8TTEpWf0Z/eLWnmlkuN5/VPOqQXTAF2
	ax1QWZqGF6bx3OUwYuEh94WgJO4WHeagCmSGlAIeH6E64Ja4/EDw1FbWKd7MVPQWI6uV
	BHXzmzzJBZ8QMcq7CcNXs5JDPAesBxujrOAXHVdedeeXsGVioXTxREokgaG8ApESByBA
	SqkDYUcRVuW+8Dw6L8I5gputzvviWdJOQzRjGk+fgXK7xVvXK91UQoeIZoUq7loaNbtA
	zWJsHYAdYXGxZpGAcxQYQrPZV0af4qsB3DY2kspJBbzAeuxtHQp2oAN+MCQwJFz8SyTx
	TNNQ==
X-Gm-Message-State: APjAAAUkUnhiYmtTyMosM/fOJr7kf9cLp7f/WfMTA7o78dfTa13L+zs4
	iqZv30Y+ff+a1boj3BbBGwi9hzbyDL0=
X-Google-Smtp-Source: APXvYqxzI3xdOjIh6RTHsiZg3pMBir3ZArCcX6yy7bLSWCjJZyveblnmnSsq1GTEbwjo+tB/x8iVqA==
X-Received: by 2002:a17:902:b08b:: with SMTP id
	p11mr31096817plr.320.1570466884538; 
	Mon, 07 Oct 2019 09:48:04 -0700 (PDT)
Received: from localhost.yoctoproject.org ([2601:1c0:ce01:91e0::6f11])
	by smtp.gmail.com with ESMTPSA id
	f6sm16903875pfq.169.2019.10.07.09.48.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 09:48:03 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 09:47:57 -0700
Message-Id: <20191007164757.29687-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH v2] uninative: Update to 2.7 release
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
X-List-Received-Date: Mon, 07 Oct 2019 16:48:04 -0000
Content-Transfer-Encoding: 8bit

The 2.7 release updates glibc to version 2.30. Recently added to openSUSE
Tumbleweed and needed for Fedora Core 31.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index df24346855..ad75d3e2a3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.29"
+UNINATIVE_MAXGLIBCVERSION = "2.30"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
-UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
-UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
+UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
+UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
+UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
-- 
2.21.0


