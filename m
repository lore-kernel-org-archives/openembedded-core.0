Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D6CE678227
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 15:02:33 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id a1so6449696pfj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ScqMwtQH+X24PSICBHAtrjprjN3Gh8mnBWDFYuTd3fo=;
	b=BeI7GFvKGfS1euvBYULka+2it5iJL2eyVcwsQXKREx5WGxndGllWlIUKMSHpRK06OX
	d8PpYiT5nU9iXEAfzUHRXDU04rPdLLwljGwSButWPRAibbVPOmSZZEDKPzbyJDZ0ZqBW
	ZN9PPWYxgX2LFypyyS7ooNo8dycffrRctgQ4Yi6lTfmb5NP3lu8Ay3DPbaAjhbBOe6RT
	zMLbmqjP+0Ttc3nj4M4jPziHVCduO3/K87MH78D3Bs+4v5XytkYJIth4gcu67qxNKJVh
	PPk/+pIfeoPx86t+I/QyyLnUUQ4wiLaUPL8MOlaAxy9IhCvgK4psICx7SeFk/xpA5LWW
	2zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ScqMwtQH+X24PSICBHAtrjprjN3Gh8mnBWDFYuTd3fo=;
	b=keUPFfIGTL/qRkcZV4AQm61o9YK+JoIKkN+wd2m+5UosDsGbVkn79RzS29amci6OkW
	QB3XBVpa2hBbNXdMCb9v0xUaxKMRJf4jqJ5a/b/3Cl1E3pjGVWE5/bavDebzOrfLpItE
	OK4T0cx6i7k8a8cX+Xzmf/1hUIvUTkdRNq2s0X9s2dXejuJB4+7KQ4AqgTLM3gexJGj5
	YgR5bx/d9qHstuFRPYJbACtQbLDWEJzW7uuovAW2OKwX32hhbjQUT6xVzvmgrW9hCSWH
	Kj7mlbxF98teTUw+yqwvk924LZ/KFdpIA7pwNp072n57vTsI2Ph5EIFf5KQj84BeoQSB
	2SJQ==
X-Gm-Message-State: AMCzsaXVTZUe38IY2DXvUImOnv1Bmvojwe4tcjX0GMtTjZdDwhOBsxuR
	/fI5a8293DjwYB8swMeO34W7QQ==
X-Google-Smtp-Source: AOwi7QDCPcT65V3RiUN8ohaJAuvIAH2Em9P/dyB+IIPA//Gi2WXM7ewzrbxMxxaCWTr/7M0qyPN2yw==
X-Received: by 10.99.126.84 with SMTP id o20mr2290975pgn.220.1507302154656;
	Fri, 06 Oct 2017 08:02:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:2592:db33:fab5:1bd8])
	by smtp.gmail.com with ESMTPSA id
	i65sm3674467pfg.166.2017.10.06.08.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Oct 2017 08:02:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri,  6 Oct 2017 08:02:14 -0700
Message-Id: <cover.1507301999.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/16] Morty next pull request
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
X-List-Received-Date: Fri, 06 Oct 2017 15:02:34 -0000

Cover letter only

Please consider these changes for Morty.
Clean build on AB

The following changes since commit e2fcc721c2af8e2785a91eaceea1d81f503ea2ec:

  devtool.py: update testcase Ids in morty (2017-09-25 22:21:45 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib akuster/morty-next

Alexander Kanavin (1):
  v86d: take tarball from debian

Armin Kuster (7):
  linux-yocto/4.1: update to 4.1.43 plus bluetooth CVE-2017-1000251
  linux-yocto/4.4: update to 4.4.87 plus bluetooth: CVE-2017-1000251
  lunux-yocto/4.8: update to 4.8.25 plus bluetooth: CVE-2017-1000251
  linux-yotoc/4.1: update to 4.1.43 plus CVE-2017-1000251
  linux-yotoc/4.4: update to 4.4.87 plus CVE-2017-1000251
  linux-yotoc/4.8: update to 4.8.25 plus CVE-2017-1000251
  libpng: lsb version 1.2.56 url fix

Bruce Ashfield (1):
  linux-yocto/4.1: fix gcc7 compilation and v4.1.39

Leonardo Sandoval (2):
  selftest/cases/signing: ignore removal errors when cleaning temporary
    gpg directory
  sign_rpm.bbclass: force rpm serial signing

Maxin B. John (1):
  hostap-utils: use w1.fi for SRC_URI

Nicolas Dechesne (1):
  kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz

Ross Burton (3):
  bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
  diffstat: use HTTP mirror for SRC_URI
  libpng: use SourceForge mirror

 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 20 ++++++-------
 .../recipes-kernel/linux/linux-yocto_4.4.bbappend  | 20 ++++++-------
 .../recipes-kernel/linux/linux-yocto_4.8.bbappend  | 20 ++++++-------
 meta/classes/kernel.bbclass                        | 18 ++++++------
 meta/classes/sign_rpm.bbclass                      |  6 ++++
 meta/lib/oeqa/selftest/signing.py                  |  7 +++--
 meta/recipes-bsp/hostap/hostap-utils.inc           |  5 ++--
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  6 ++--
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
 meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++-------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++-------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 ++++++-------
 meta/recipes-lsb4/libpng/libpng12_1.2.56.bb        |  6 ++--
 meta/recipes-multimedia/libpng/libpng_1.6.24.bb    |  6 ++--
 22 files changed, 145 insertions(+), 102 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch

-- 
2.7.4


