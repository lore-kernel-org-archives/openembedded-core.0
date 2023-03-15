Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56A3C7618A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:11:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5093.1678878712307775134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=n6M0olMX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878710; i=@fujitsu.com;
	bh=7A1ff7pClDJzs5Uq35nowt3PYrESg17V1RTaFpJdFsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=n6M0olMXriCyAy2gmywFFVvEBZ3IDZiXaLbAWIzOmRW4hpgmHOBleiplHZCrvppev
	 45e+7yvKVi0dhLmQR8ze3r5oQ+CPXuQkAT2ZagLEriDNhX6EnzjQxAubB/uHbz4kbb
	 LT6+Kir3ToaXMsM/SM8W9owMyeMZPSQvWwcSz+L83+XOqAP4LClnYE4UvJXwBdRCz3
	 JXx+TK4LAn1k9yw2SwRy5a9SeNBiertmmzn0Tvi+fpOQdSEVoWyiqCHR/CmwmtxNLb
	 Or/2gs57vSud9bhixSzY5kLYV/Lu3+FL3jFhTwQpvS5kyarsOfGTO0KVt6SFyviOdY
	 jiWSUvy+bEgIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8ORqPttuWC
  Kwbp/QhZ3fr5jt7g3fwGbA5PHuY0rGD06fl9nDGCKYs3MS8qvSGDNmPX+NEvBTIGKNQc+MjYw
  rubrYuTiEBLYwigx5/szZghnOZPE/q8HGbsYOYGcPYwSy95qg9hsAlISN+7/Z+ti5OAQEdCTu
  PpPFCTMLOAo0Tz/PhuILQxk9+1ZxwRiswioSryaeowVpJxXwEli89M6kLCEgILElIfvmUHCnA
  LOEh8XZEIscpJ4+WQ/K4jNKyAocXLmExaI6ZoSrdt/s0PY8hLNW2czQ4xRlJh9uZkFwq6QaJx
  +iAnCVpO4em4T8wRGoVlIRs1CMmoWklELGJlXMZoVpxaVpRbpGprqJRVlpmeU5CZm5uglVukm
  6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGfkqx4oQdjBf7/uodYpTkYFIS5f2zR
  iBFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgQv3xLBFCHBotT01Iq0zBxgHMKkJTh4lER4I+qB0r
  zFBYm5xZnpEKlTjIpS4ryCy4ASAiCJjNI8uDZY7F9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsG
  oJMx7CWQKT2ZeCdz0V0CLmYAW884TAFlckoiQkmpg2vZIpoXF5tv0qJu3Q9XO3399Unl52xqT
  3ew3HNj23FZ4edVA/Kc9s13jnx3dzzdoyUu1f2CyOpr5gff31TNplpJen305zD+3P1JrcTh3w
  GCGn9dqx9PyKisveWSVmRhHl0933350utFum7Plxpy3ptUfOOu9rOz4h7098U3v2u35PcLUo1
  n/riu6xKQWyDFRrazT5wlj571Au7UuX0/6drga3A+v93peY7ls60enyz9OPJq82NL/2cErgdv
  SZmSvabw70fyyRPrimB36jPeCC1vPyycmX0mO3FuzL1Dnp9/cmGkKZzy3TRWR2rlw+iLx/2f6
  TLifsd+UNC580bvqcEDxgUU9u1JmJKXMl5ALV2Ipzkg01GIuKk4EAKbxjBt4AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1678878710!148288!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6339 invoked from network); 15 Mar 2023 11:11:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:11:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F25571001A4;
	Wed, 15 Mar 2023 11:11:49 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E68631001A2;
	Wed, 15 Mar 2023 11:11:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:11:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.2.1 -> 7.2.2
Date: Wed, 15 Mar 2023 19:11:22 +0800
Message-ID: <1678878683-19486-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178543

From: Upgrade Helper <uh@not.set>

Bug Fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D
 #10533: Fixed pytest.approx() handling of dictionaries containing one or more values of 0.0.
 #10592: Fixed crash if --cache-show and --help are passed at the same time.
 #10597: Fixed bug where a fixture method named teardown would be called as part of nose teardown stage.
 #10626: Fixed crash if --fixtures and --help are passed at the same time.
 #10660: Fixed pytest.raises() to return a =E2=80=98ContextManager=E2=80=99 so that type-checkers could narrow pytest.raises(...) if ... else nullcontext() down to =E2=80=98ContextManager=E2=80=99 rather than =E2=80=98object=E2=80=99.

Improved Documentation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 #10690: Added CI and BUILD_NUMBER environment variables to the documentation.
 #10721: Fixed entry-points declaration in the documentation example using Hatch.
 #10753: Changed wording of the module level skip to be very explicit about not collecting tests and not executing the rest of the module.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.2.1.bb =3D> python3-pytest_7.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.1.bb =3D> python3-pytest_7.2.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb b/meta/recipes-devtools/python/python3-pytest_7.2.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_7.2.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.2.2.bb
index c7610d440c..4e2c86f641 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "The pytest framework makes it easy to write small tests, yet scal
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] =3D "d45e0952f3727241918b8fd0f376f5ff6b301cc0777c6f9a556935c92d8a7d42"
+SRC_URI[sha256sum] =3D "c99ab0c73aceb050f68929bc93af19ab6db0558791c6a0715723abe9d0ade9d4"
 
 DEPENDS +=3D "python3-setuptools-scm-native"
 
-- 
2.34.1


