Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23F1C7618A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:09:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.5028.1678878585773433822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=GEhXiS7D;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878584; i=@fujitsu.com;
	bh=7A1ff7pClDJzs5Uq35nowt3PYrESg17V1RTaFpJdFsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=GEhXiS7DeS09npI03fxHKMk7VxjiSxp20sIp06/86Q8Xyvgp6R7/+TQ1wxCDHJaUY
	 AMnYm6RW0KRsA2+ljx204yQrSfifHnjDklY9B4cZN5PhXFeJrClr+b89lZsMYkpXkr
	 jeQ6xP6YV5tLnEf4e9gvBv9ZMz8RvdISlxw2jH2GZRe09vge8NWkE67D6iMI6semf8
	 fl7WE+JwNprVEShyscZYcn7PjsmTf1CQPz5/ynYL36YAmHnUeE9ujrOdqfp94P4uwc
	 XhoWItuG+VvtVywIwzHxrcHg/NmWyUEyHemxlHmWF81qoL/R+ShKfx0vlF6af8dh1x
	 M8qkba/lO1lMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORpFu+XDD
  F4HqrhsWdn+/YLe7NX8DmwORxbuMKRo+O39cZA5iiWDPzkvIrElgzZr0/zVIwU6BizYGPjA2M
  q/m6GLk4hAQ2Mko8uH+NEcJZwiSxcv9tZghnD6PEyfNbmLoYOTnYBKQkbtz/z9bFyMEhIqAnc
  fWfKEiYWcBRonn+fTYQWxjI7tuzDqycRUBVYu+3u2BxXgEnieNnjjOD2BICChJTHr4HszkFnC
  Ue/XoGVi8EVPNhxVwWiHpBiZMzn7BAzNeUaN3+mx3Clpdo3jobao6ixOzLzSwQdoVE4/RDTBC
  2msTVc5uYJzAKzUIyahaSUbOQjFrAyLyK0aw4tagstUjX0FIvqSgzPaMkNzEzRy+xSjdRL7VU
  tzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzACUopZj+9gnNX3V+8QoyQHk5Io7581AilCf
  En5KZUZicUZ8UWlOanFhxhlODiUJHj5lgimCAkWpaanVqRl5gCjESYtwcGjJMIbUQ+U5i0uSM
  wtzkyHSJ1iVJQS521fCpQQAElklObBtcESwCVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz
  LQKbwZOaVwE1/BbSYCWgx7zwBkMUliQgpqQamEKmOFZ4tl6qzDK8JuVeXTH9aMPuD7v4Z/K17
  77x0CNz3PnKdmLj4NN2f7PWXJ34RnjJL5KOr5GFtiyppxa920w7tVVST2ZgbxFF+wupbgrL99
  Dn/vy4x33fP67ViR8Mbtlld84of5Uvc4ax+deqoncLury2fOncJ3J+/Vs39zPdzllMzzIQzfy
  yeuKHJaFHxhH+fn7X4agfN/irNp/70ofVLpnTlGfms+++3PuHIuZ4Swxud+tlv1p/+koJEK+t
  HL39xi7Pey55gsudnONuVt/3mftvvTZXukWLee+eCssvvGx/bmIP6W83Tu1VlNgu7trz3l//L
  23Dpv10QT5xl8t/4gxXe34W7UxZ861yjxFKckWioxVxUnAgAxFVzlXsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1678878583!125210!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17712 invoked from network); 15 Mar 2023 11:09:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:09:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3C4BB1AE;
	Wed, 15 Mar 2023 11:09:43 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 30F671AD;
	Wed, 15 Mar 2023 11:09:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:09:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.2.1 -> 7.2.2
Date: Wed, 15 Mar 2023 19:09:04 +0800
Message-ID: <1678878545-19387-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
References: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178538

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


