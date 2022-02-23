Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BC6C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:08:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.7394.1645621735072933300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RA0SnxA0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645621733; i=@fujitsu.com;
	bh=/5YhAijMN/166HrNJ6PQCld2vvOEigbhGk/+4IODIQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RA0SnxA0wMYSJp2aWyqGBgkhL8OGnXommpZBT8eUhBZTeYZ8LLb6VXfWyYeJelhK/
	 srzoTUTb8oILL1e/HOrngiVzSYjrvLrLcPTZEBW+QomUveNzZJNIr1D5+Xw+dX2SoM
	 amOX9g24mijb4jqQCJYfzqCeeVwaSPEOVHsfGKO8gRKg4bVmviCXgDmTLOeYlfuJQ/
	 N5oHFd2Y8g/hqtytofffqBcLCQUZ2s1Ni/CdPho7RVAFKezGhUm2kdU3MucJqN/V7Q
	 wdUfp/KsfVQbHQWsX6aBfA5rBJjWX0waCmAq8xL9C3zn2IlyYNka3BDBJEra1V5WdH
	 8VuM69hoL3ZXA==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 8F/F9-25243-5E136126; Wed, 23 Feb 2022 13:08:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqPvEUCz
  J4NhFPYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePp7GOsBffYK3o+/GNqYHzH1sXIxSEk8JhR
  ouXVRRYI5zyTxNq7q5ghnBOMEk+P/GXsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAVuJ/w9Os4LYLAKqEnua17OA2LwCThJnV78CGyMhoCAx5eF7ZhCbU8BZYt3RHrC4EF
  DN1JXNUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZchaiQEKiRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0TSrKTM8oyU3MzNE1NDDQNTQ01TWzAFJ6iVW6iXqppbrJqXklRYlAWb3E8mK91OJi
  veLK3OScFL281JJNjMBQTil24d7BeKfvp94hRkkOJiVR3ms8YklCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHhjdIBygkWp6akVaZk5wLiCSUtw8CiJ8F5XBUrzFhck5hZnpkOkTjHqcly9cmUvsx
  BLXn5eqpQ4b6wBUJEASFFGaR7cCFiMX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsKMoU
  nM68EbtMroCOYgI6YkiUEckRJIkJKqoGpR2/RF8n+jJn3H9fMcdnjYCFe3a8g2/Tk7es3t1de
  /6u80ySa7+3dKNXpPOVenTxZ7d9/d9pabre7siiXTeCwremiO03BrJ+TDtwQrPBjvRz9ov+kT
  +DrOydlP3+rTlNz5V3YvLMpf9eze75qGxRnMV+c/2b1Sk7BBKE4jZ3iBz/Vr9CJilPa86jz5O
  nGFpMdvLcOmdzb3Tj9yamv2bk/WI0UPNe339MMWJfwbU5SyeLQnh+7b2V8LGmd+HlqzmMljtZ
  pxxuKBPRmfItREu+9sv9f1MNezT6RP1dbXU/YVPIprntqGnBlS6pbT/a1J7uO/jjPOutZT9D+
  r/pi3gV1rlXST9OzN/25vbinIv+vEktxRqKhFnNRcSIA+JXZ4mwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-528.messagelabs.com!1645621732!6608!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22325 invoked from network); 23 Feb 2022 13:08:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 13:08:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 26F0A1001A0
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 16C9D100193
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 13:08:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] patchelf: upgrade 0.14.3 -> 0.14.5
Date: Wed, 23 Feb 2022 21:08:07 +0800
Message-ID: <1645621688-29191-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645621688-29191-1-git-send-email-wangmy@fujitsu.com>
References: <1645621688-29191-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162261

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../patchelf/{patchelf_0.14.3.bb => patchelf_0.14.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.14.3.bb => patchelf_0.14.5.bb} (91%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
similarity index 91%
rename from meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
index 5d12ef2eb5..0fa2c00f1d 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-only"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
-SRCREV = "bf3f37ec29edcdb3e2a163edaf84aeece39f8c9d"
+SRCREV = "a35054504293f9ff64539850d1ed0bfd2f5399f2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


