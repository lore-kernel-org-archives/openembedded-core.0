Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.1285.1620435882219624615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 18:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hvBLJe7v;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620435880; i=@fujitsu.com;
	bh=9qmWIUmuF8zzyxDUJF/hFt3WfdBoybnjjLcnW3WUWx8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hvBLJe7vmC+MTr2kinyJbgt4oT15816C0IvnpN5/wQ4zYZB7dsuKQGRgkIoc+ciCU
	 x/mIhpQH9w2I6bMudwWUx76iiknheLF9F8i1zw6JAc/CXO4gE9ILb5qBCPs90rGGqX
	 o2Q8NPf+1yJsCw3cCugoMfo1xrS72rBc/UjrTyho/Oi0vJPRuPLQWQohLKDqKR34FJ
	 lbiGjVxH9HJKQTN604I+bIRpSHAyl3jftZPJXMWLybVRF3zs9/jdSE3D55q6bWGYSV
	 c1rTXmQuDp5CWLuXu6TojZskd2QeRhBvCorWLAoOt3dDdAgJkXDj4TBlC5s+9uEm6Y
	 GapWnoVLrdW2A==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 7E/11-01834-8A3E5906; Sat, 08 May 2021 01:04:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRorv88dQ
  Eg4MXzSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyWjywFBzgqXm6dw9jAeJW9i5GLQ0hgJpPE
  i+nHmbsYOYGcY4wSC89rg9hsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgILHh5
  mswmwUo/rV9IguIzSvgJLH29GImEFtCQEFiysP3YOM5BZwl7rxfywaxykni4KxrbBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJ14cvMU9g5J+FpGUWkpYFjEyrGC2SijLTM0pyEzNzdA0
  NDHQNDY10DS2NdI0MTPQSq3QT9VJLdctTi0t0DfUSy4v1iitzk3NS9PJSSzYxAkMxpeDAmR2M
  p15/0DvEKMnBpCTKW5QzNUGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/O60A5waLU9NSKtMwcY
  FzApCU4eJREeL0eAaV5iwsSc4sz0yFSpxgVpcR5n4IkBEASGaV5cG2wWLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZhXDmQKT2ZeCdz0V0CLmYAWf1w7CWRxSSJCSqqBafmSQIY/LQcPf9r
  24ZDms7eNk2KKdwkK6eznTqxammQXanGwM7HqSLyE1Hou1/v5MmxX3hSWmN87/Ei/aeX7h5KR
  6eYPF0R4Gb5aZ7f7cbrvqVqrQksW+cCSiXc2XVBuVp257YcET0qwpHt8+M7ym9nfT3DeEnOXs
  622fn2TwSRUoqx/i1iVUQSX/o67p76/ZuNp++hXeYN12Wc7GeYvao3XPn06o788haHtaqGSPy
  eby4rLhzK+5Vw6uWSx3/TLGyT93+6d5WRQXTkpwCKLX8Hqc+/EspVvN1avV5OYEzbZvHOC8AQ
  pmZwi++DAr/553tMvRi3uE+XzVjO8njHhcGuJEueC94pXD4Wl9msosRRnJBpqMRcVJwIAC8os
  AkADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-271.messagelabs.com!1620435879!53955!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8137 invoked from network); 8 May 2021 01:04:39 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2021 01:04:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14814aDa017460
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 8 May 2021 02:04:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 May 2021 02:04:34 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kexec-tools: upgrade 2.0.21 -> 2.0.22
Date: Sat, 8 May 2021 09:04:13 +0800
Message-ID: <1620435855-48558-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
References: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../kexec/{kexec-tools_2.0.21.bb => kexec-tools_2.0.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.21.bb => kexec-tools_2.0.22.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
index 069e8f4d05..dcc4402111 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
@@ -22,7 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch \
            "
 
-SRC_URI[sha256sum] = "b3d4cfd2ba10d68ce341ea3b8ca414d00a0b6183b95686172154f94bce834f94"
+SRC_URI[sha256sum] = "40623d4321be2865ef9ea2cd6ec998d31dcf93d0f74353cbd3aa06d8821e3e41"
 
 inherit autotools update-rc.d systemd
 
-- 
2.25.1

