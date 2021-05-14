Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.3116.1620955742291619242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 18:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WGynlq3d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620955739; i=@fujitsu.com;
	bh=HGSF2bHnexur6kcLqjrWOMFstz6cj2pemA3ferVQsIw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WGynlq3dNCUblfFy0O0fk8Dmn7JTRzvAq37RvN2S30kmMSlCqiziQAOBsfyrQmLQ+
	 WVfLo/WZ8ltd/j1V+/NnkfYQv9YjjaOHD8OtQ5FBAxDYQjl5K/Wz8xFz2rOdUOKOwh
	 cmaOsABwgaGcoHiq1TIGjjf/50IbeNj4PDaj/09MR9je6bhjaplXo4sb82yp53cJpd
	 osueRsX0qDqQGkfypZWgSAbuLRYspBGm+Ig435J0AlTGZqTrP+HoitutieKzZmIqpu
	 f6RdJvpCf4aMOtzaT2+oqjMTiAZEDnyW3RF0BKh5PEIY1e5pW0VmQFlV6MJfRFxdda
	 eQSYBr9juyEhA==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 16/D3-27273-A52DD906; Fri, 14 May 2021 01:28:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVTfq0tw
  Eg7v/pSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxz+/azFbSxVRy/84K1gXETaxcjF4eQwCwm
  iZZZe5ghnOOMEsfOLWHvYuTkYBNQk5h+6wZQFQeHiICexNV/oiBhZgEViRe/e8BKhAU8JPa82
  MoMYrMIqEq8fvkNzOYVcJT4/XkbE4gtIaAgMeXhe6i4oMTJmU9YIOZISBx88YIZokZRYvblZh
  YIu0Li9eFLzBMYeWchaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQ2NdMyBLL7FKN0kvtVQ
  3OTWvpCgRKKmXWF6sV1yZm5yTopeXWrKJERheKYVsXDsYn77+oHeIUZKDSUmU96Tn7AQhvqT8
  lMqMxOKM+KLSnNTiQ4wyHBxKErzPLsxNEBIsSk1PrUjLzAGGOkxagoNHSYS36jxQmre4IDG3O
  DMdInWKUZfjyqoli5iFWPLy81KlxHnvgMwQACnKKM2DGwGLu0uMslLCvIwMDAxCPAWpRbmZJa
  jyrxjFORiVhHm3g0zhycwrgdv0CugIJqAjbkyfBXJESSJCSqqB6RSjwZ7zDp9YW89Om3K0a4Y
  Gh2feKccNVlvk2FwzD0552cpTrh7Pb+GbX3H5WLYG44HXbfPLJ6X77Prz53rYzKxzIdnrTJn/
  8t26Yru4ypk97l3FbpWPk13FBK+dVAstijohenHVSxH2Q/bJJTdnByYJT8zKOHvVbyrD8zUXC
  nUXs9673rZ4v6pbCIO+g8qra1NeMWz/xetz66b3VpMnnVI3Ow/UewSk9c/Q8jmvOkl2s/wr60
  jnCb9/ZoZunHzl2YTOQBtdM6usBMlul4zTMbFGIhPXyr462W4Q6bCozGuTx8b5f1VftDzuVXz
  JWmv133ZF17tvq++HNVcZF515ZZ/pYtHzvXHNAU5Hn3hnJZbijERDLeai4kQAI5hEezYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-248.messagelabs.com!1620955737!349956!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26695 invoked from network); 14 May 2021 01:28:58 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 01:28:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E1SpQB021143
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 02:28:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 02:28:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/4] vulkan-samples: update to latest revision
Date: Fri, 14 May 2021 09:28:37 +0800
Message-ID: <1620955720-4296-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 32502a1f7a..e89f75baac 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a2c02a074ba3f71ea89a53fb2e2d189c87cc4af8"
+SRCREV = "5646820bdd46365183adc2b326556c5bf7d8db76"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.25.1

