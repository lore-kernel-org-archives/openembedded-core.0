Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6156BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:40:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.8206.1647945608067413056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UE27T3vR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945606; i=@fujitsu.com;
	bh=6NuRLgUA8VUtaoIEgeh0dmNq3dGDeiAytyk6Gnqq934=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UE27T3vREptaTGXcO77fZBOeTJlG6jcXj86Eddd2kwoZxNuuZSnem5b+FvTw9bXNW
	 AF24UD//tzPmvSI4pOkLpe20ujhxQlrvyud+BUkzWddtIwcFELyLNNrDuWqzYdacfZ
	 Rp0HdWMQC1vOAmUD4sRBug6R8cAPjf6ZMtbShhbmFEWm0XISPQ+Xre5OQSdk3x7arD
	 MDwZjDh+neA9czasKyRFA1VZmbN+E+557sBdfJ/cowkTe5qv8ohNbpROwj5VLAPnPT
	 N/DHwG6Bn+8PLMdcC2RvO4B3Sq8MROb1LqywYX++mUFw6Y3hLAkYYEW32GMvb3NK3d
	 4amjzqb54xnFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbd1uWW
  SwY9PBhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8arLcvYC35yVPycPJ+pgXEpRxcjF4eQwGNG
  iSUbD7B1MXICOeeZJNb+VoVI7GGU+H+pnQUkwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAq4SvYtvg9ksAqoS+/duZwWxeQUcJW5Nnw4WlxBQkJjy8D0ziM0p4CQx/9wvJpCRQk
  A182coQJQLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0TirKTM8oyU3MzNE1NDDQNTQ01TU20jU0MtNLrNJN1Est1S1PLS7RNdJLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM4ZRihbodjNdW/tQ7xCjJwaQkyisODG4hvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErxHFwPlBItS01Mr0jJzgPEEk5bg4FES4c3oBkrzFhck5hZnpkOkTjEqSonz/l0GlB
  AASWSU5sG1wWL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gCQKTyZeSVw018BLWYCWqz
  PagayuCQRISXVwBTe4D1n0+1WpbcfP/HIBq30Y5JOZlz+12E7j27H3/Psvl45kvtUzKX8jZev
  L/px+LuV9u0VZwNXZF2ecJt3+cNqrxVXXl5XCvpmp+d+++/xf1dipv9pSO7veKzt+cEn49evL
  p88qbwaX3frm+1zYw/fXSIqvPPJzdywYxNuqLxYv2nS5Poq0YsbXvydJMbrObEwlG/D402Tpl
  iITby+vHyqbIlTnGq3q/6THbN+G7NorPt/fk/A5cdp02+dd57d8djzxln/Jr41vs6OFfYdJjp
  /FVIdQkIPKJUxpVnt7KqITXnxYmvblnCfdX8OquoErdlklZz9ZW3Epbo1M3fNqGQ/4Wp89qTE
  Dn/Ze38VODKUWIozEg21mIuKEwGSNNzWXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1647945605!256074!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17897 invoked from network); 22 Mar 2022 10:40:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:40:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 61DE5100445
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 31283100450
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:39:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markupsafe: upgrade 2.1.0 -> 2.1.1
Date: Tue, 22 Mar 2022 18:39:46 +0800
Message-ID: <1647945587-5282-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647945587-5282-1-git-send-email-wangmy@fujitsu.com>
References: <1647945587-5282-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163543

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_2.1.0.bb => python3-markupsafe_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.0.bb => python3-markupsafe_2.1.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb
index 953ea01cfe..0544dd1b83 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "80beaf63ddfbc64a0452b841d8036ca0611e049650e20afcb882f5d3c266d65f"
+SRC_URI[sha256sum] = "7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.25.1


