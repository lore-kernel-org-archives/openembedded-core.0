Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C46AC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 07:37:07 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.6808.1644910625224906085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SrLKOlPK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644910622; i=@fujitsu.com;
	bh=LjQZBQqrkXuyJsI/EcYwel02ZFVtJU7K3mP6HP1MF9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SrLKOlPKFQ2fk6jeQfxdvvcSSr6jScGbUsXeJ4+cv4ZX0UBkWDTZ5r73QBF1k3iDf
	 e1A4vZNu/fER5CAx2zqX52g62tXFLN5Rk4yvVwyIoUSOmerHBp5r45F3YDbbOTRPFP
	 DBxUx5UIVifNnhPMU+Pwz57eq6CwRZ8h4kkmqXVvK8QJt+MHBsYcDAWX08hEa2hREt
	 W7zt3HF66uVrdtxZbPVjrKx1BEKNgW7Hwx8IxIAWFvK5JGqEUVW273hxn0jwFlRbOT
	 R2n7rM2RkyHgiT1ZBlNN2x2Jn6EUSXvj/mrDXh9Tp3B3UykO+BZtXjEQbL+Jkuhi8s
	 Tz0gfAXQ0LUZw==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id DC/9F-13236-E185B026;
 Tue, 15 Feb 2022 07:37:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqCsbwZ1
  kMHGzlcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH93Gr2ghbOikVrGtkbGBdxdDFycggJPGaU
  ePJOqYuRC8g+zyRx9O0uFgjnBKPEzuM9LCBVbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4CXx+mcDWDmLgKrEs+1rGUFsXgFHict3noLVSAgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbmZBcKukJg1q40JwlaTuHpuE/MERv5ZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9f
  QwEDX0NBU10zX0MxSL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCRTitlW
  7mBc2fdT7xCjJAeTkiivtz53khBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3mdhQDnBotT01Iq0z
  BxgfMCkJTh4lER45/sBpXmLCxJzizPTIVKnGBWlxHnNwoESAiCJjNI8uDZYTF5ilJUS5mVkYG
  AQ4ilILcrNLEGVf8UozsGoJMw7HWQKT2ZeCdz0V0CLmYAWKzZygSwuSURISTUwyTrE8b1Umbu
  87a6mo67g81/bnwfLbdC8H/+zeLlQw5Mt2ZmXrs8o0ki58fBYc47godX8JeWhXbN7Mxb2nxPm
  2dzN6MORUFL882bX3otskV07vuhId8bm87e+/On8fFkQzzz3xX1rBD9pJE66lHYzh+WF/JTur
  G17zdx23duj/niLht+KrsVX33+/WSgedIGLeZO9e5P6xpdzOCzKDrQfe6jBc+Nhac/lLfKH/1
  s9T2z+nrbPrNzr0aPAV37xjbc52/dds9KbukxIki9FRPkWo3LgmmjzgJ98waWz/66rK90YtMR
  SLrysp/O+3rFtJRUXRV1nztmneeW2ze6Vncfe852ea7CHiX1Gyy7lUyapSizFGYmGWsxFxYkA
  dCsTj0QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1644910621!72318!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25467 invoked from network); 15 Feb 2022 07:37:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Feb 2022 07:37:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7D37E1001A1
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 70CA1100197
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 07:36:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.20 -> 0.17.21
Date: Tue, 15 Feb 2022 15:36:46 +0800
Message-ID: <1644910606-5557-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 07:37:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161741

Changelog:
=========
- fix bug in calling '.compose()' method with 'pathlib.Path' instance.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.17.20.bb => python3-ruamel-yaml_0.17.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.20.bb => python3-ruamel-yaml_0.17.21.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb
index a6bee1bea1..7d65c4c2d8 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4b8a33c1efb2b443a93fcaafcfa4d2e445f8e8c29c528d9f5cdafb7cc9e4004c"
+SRC_URI[sha256sum] = "8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.25.1


