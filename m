Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD6AC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:45:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4993.1645602324184202603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kZly8AZX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602322; i=@fujitsu.com;
	bh=9Sbhtw8iFWtFB8mue3bXOVuPvKsVvjRwNVyOV37ESZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kZly8AZXSt98z3nR16HKM+eNs7EcxYsdgH5dFowFvSsY1p2Hpm4ceLd29pTa2mEPH
	 KHh6FIFz+MmERsnENOJfmPoYRKHigGwfAiQhGaoPzZZSp3//lwGl3u+iS4LoSdm19v
	 tl1H2YQ8AUZNteeof6x5lxROOJ94jYoU+BZaVSCbD6svuX2ou+TeJXF35fu9Lb3vDL
	 ZiKp10JYfHyZ2qoqK+j1R2wEFS/TipVMpGpDOgQnuWWi0a9b44dLJOG8+JR0edzJM1
	 3BxpGKB3VxBVXJG7PMk0i558yGN4YazysR0B9/oiygtC06Lpg7Fc4mdo9YuEmVbLNS
	 NjudHnittP7gQ==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 C3/4D-13301-216E5126; Wed, 23 Feb 2022 07:45:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSVfwmWi
  SwZozGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aqEwuZCqZzV/yffIClgXEBVxcjF4eQwGNG
  ib+/lzB3MXICOeeZJDp+i0IkTjBKfDh3jxEkwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg4SFBVwl9rwoBQmzCKhKNLRPBuvkFXCSaPx5jwnElhBQkJjy8D3YKk4BZ4kt3YtZIdY6Se
  y/cwmqXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0hMWtWG9RMNYmr5zYxT2AUnIWkfRaS9gW
  MTKsY7ZKKMtMzSnITM3N0DQ0MdA0NTXXNzHSNjCz0Eqt0E/VSS3WTU/NKihKB0nqJ5cV6qcXF
  esWVuck5KXp5qSWbGIGBnFLs9GQH4+u+n3qHGCU5mJREeQuPiCYJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuDtewKUEyxKTU+tSMvMAUYVTFqCg0dJhFcEJM1bXJCYW5yZDpE6xagoJc77/R5QQg
  AkkVGaB9cGi+RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5Yx8CTeHJzCuBm/4KaDET0OI
  pWUIgi0sSEVJSDUwTTkU2HpV8+tzw4q6/M04bcT81LJ9py8O0UMtt1v86vZmp2y9w9m3eGl3N
  lMe7ytw6tsbJu/3dxJ3uvg8X7n3mwxm/tnq921zh4qXVzBpBC+NEjZb7WBxmvuNg2iNo/G1vT
  EimzJ/NQRrRkwwmFDSH9K+5UFITMXmR4tNvjlPz90exMe7qEv39/WNc2C2NO6+WyG9ViGfaEW
  abHZ79eOnM7pk58psYt/fFTBDyWGw3MybM40r26/nNcpHruiyqnEqlTKbyPzpv8GE9j620+Mm
  NE/idtaV6XE/L1Nvo+hUpJ723fzRzdQd/vdubQqtd3nHPPxl9Lpj0/aTQ1uA/yzQ6/69VUTco
  nFQQcNuaXYmlOCPRUIu5qDgRANxmqXlfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-545.messagelabs.com!1645602321!69630!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9337 invoked from network); 23 Feb 2022 07:45:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:45:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2C71610045E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 198E61000FD
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:45:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markupsafe: upgrade 2.0.1 -> 2.1.0
Date: Wed, 23 Feb 2022 15:44:57 +0800
Message-ID: <1645602297-28300-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602297-28300-1-git-send-email-wangmy@fujitsu.com>
References: <1645602297-28300-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 07:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162245

Changelog:
==========
Drop support for Python 3.6. :pr:'262'
Remove soft_unicode, which was previously deprecated. Use soft_str instead. :pr:'261'
Raise error on missing single placeholder during string interpolation. :issue:'225'
Disable speedups module for GraalPython. :issue:'277'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_2.0.1.bb => python3-markupsafe_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.0.1.bb => python3-markupsafe_2.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb
index 857472cc7b..953ea01cfe 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a"
+SRC_URI[sha256sum] = "80beaf63ddfbc64a0452b841d8036ca0611e049650e20afcb882f5d3c266d65f"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.25.1


