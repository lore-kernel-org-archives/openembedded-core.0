Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.22853.1625672766963469523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LUKLdWoe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672765; i=@fujitsu.com;
	bh=soywD9qwEopJUMHgFLnB9xrn62Vn5HojUlQ65/qL6sY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LUKLdWoeX20th5tL9ing8JIGR5loD4iUlK5rvMz433Ly59nQKtv6bUMoniByynmZc
	 awefQ5Rxw0sCA+ly4ER4yrTiz8j4ofpDOOWBAw+vqicfwOuahN4Xo5+wIWzHi+9rPN
	 Rnxa4HrM2GGZ65NXjzYx1Q+4EOz3L6zOj1i+jAc555zNyXvpc6PXbDb/zAY+bh3x7K
	 Q2xPy0aaJpumeDziMucPcbUbVLiF+iKn5Kji3DN9V7+5i/ZDzt2HaFKV+2GyYyb8os
	 p5v92/J0PFGbvavsNy9G64hv2lpCuMLbtfPOiAkz1kuRvqMYPb+emIAuTCx1/OvO01
	 ETEYOHPgHV8vA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id FA/58-07223-C3CC5E06; Wed, 07 Jul 2021 15:46:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRdfmzNM
  Eg2+nVCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oybr14yFdzjqni9diVzA+NLzi5GLg4hgZlM
  En9fnWbrYuQEco4zSvR+FACx2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwF1iS
  tt6FhCbBSje//o7M4jNK+AosWbObrC4hICCxJSH78HinAJOEo/7/zJDrHKUaPrxggWiXlDi5M
  wnLBDzJSQOvnjBDNGrKDH7cjPUnAqJ14cvMU9g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11DXWNjMz0Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgeGYUsj4aAfj
  6dcf9A4xSnIwKYnyzlzxNEGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/bKaCcYFFqempFWmYOM
  DZg0hIcPEoivLNB0rzFBYm5xZnpEKlTjIpS4rzhIAkBkERGaR5cGyweLzHKSgnzMjIwMAjxFK
  QW5WaWoMq/YhTnYFQS5k0BmcKTmVcCN/0V0GImoMUMh8EWlyQipKQamFJZf+Te97l7WKZg9aV
  jbQ8VyxbIss6N2Oe9um/h+cS8ggbOwPo4WelU8yfP5hd8uXNESuSz+dRtKTZVvdmqs85PfNNR
  LaOk8dVmUY+pyacDF+X7nqpamj/benHDzVijqRzGs7bUPGCUv8+cc7Ba7OM3p3XLjoq+E7oro
  niAL2RC16defbcVSq+nn33OeCs8c15STuqlgN3abk9ZzHtmPPVeXVhxcWqSyYofP7I8J7Be2O
  vVLPmdI0Atc7m51aVXRkebI3aefXjC7mWUPIPXdquzFk+mSBgtXTbV3zNs5Y/z26LOxF9N2lo
  lEvuxvkX0/qR1AgL/zsYFVdtppZwrrtsjf4TtuPaBmyrvjrYz8imxFGckGmoxFxUnAgBjYtA7
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-226.messagelabs.com!1625672763!7914!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15878 invoked from network); 7 Jul 2021 15:46:04 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:46:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fk3Bn004502
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:46:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:46:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/3] vulkan-tools: upgrade 1.2.176 -> 1.2.182
Date: Wed, 7 Jul 2021 23:45:48 +0800
Message-ID: <1625672748-3956-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625672748-3956-1-git-send-email-wangmy@fujitsu.com>
References: <1625672748-3956-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

build: Update to header 1.2.182
- Update known-good
- Add support for printing `int64_t` in `scripts/vulkaninfo_generator.py`
- Disable codegen for VK_HUAWEI_subpass_shading
  KhronosGroup/Vulkan-Docs#1564
- Generate source

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.2.176.0.bb => vulkan-tools_1.2.182.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.176.0.bb => vulkan-tools_1.2.182.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
index 10fa0fdb3a..d0a298ecfc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.176"
-SRCREV = "eb3d67bd17ee433e2b0a8e56a7249bd83908812e"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.182"
+SRCREV = "9d3305731c3be8de05c9f223a79959d448506a37"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

