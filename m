Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.1250.1620436065881218475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 18:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RF6508OK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620436064; i=@fujitsu.com;
	bh=Dy+ePiNWeRGtoT/epjxyJB4RwHL1ODGghLGI7gev0YI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RF6508OKccN+9gbKHaLPMzQh5QtXXgZzLIqThXWR0XKATiwvi9OoDvlQlrhTkzOJX
	 UMWTTRWdVhzo+rhIKfzYqVF+G+1PQNwSV9XS1tcF+CV67ZXN3iC9y61uBuTRQYB1/I
	 F9fWDx4TZrxuq/vGgp6qblQszS3ewFWs+SiGPZGYBy+jhv7mRx/h/Hx1/c4EFviVBv
	 4SXPHTNL2mll6GKiO/KxyvHKz10XOdd+lEuSDHsnMWr0snScwNtQNaXGEZNPGdiYuL
	 nkiQih1D6iKu593M1e9BnvOVwCYHaKpSw/zj/O62CqkQM33vcS8o/C8wQnq2Tt0ftS
	 6rsQEEbnOaTOw==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 9A/D7-56778-064E5906; Sat, 08 May 2021 01:07:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVTf+ydQ
  Eg4PdJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bNQ6dYCu6yV9z83MXSwPierYuRi0NIYCaT
  xMbXt1khnGOMEl/ndzJ2MXJysAmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvHnYQW1jARGLCx
  x9MIDYLUPzA/v8sIDavgJNEz8rDYHEJAQWJKQ/fM4PYnALOEnfer2UDsYWAag7OusYGUS8ocX
  LmExaI+RISB1+8YIboVZSYfbmZBcKukHh9+BLzBEb+WUhaZiFpWcDItIrRIqkoMz2jJDcxM0f
  X0MBA19DQSNfQ0lTXyNBUL7FKN1EvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwHFMKDl/f
  wXjr9Qe9Q4ySHExKorxFOVMThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw7rwOlBMsSk1PrUjLz
  AHGBkxagoNHSYTX6xFQmre4IDG3ODMdInWKUVFKnPcpSEIAJJFRmgfXBovHS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeeVApvBk5pXATX8FtJgJaPHHtZNAFpckIqSkGpjqa3o9xL81/Jr
  HH5DG8N2spG9Tx82rceu3XDo/aVqa8T6VqXPLl52TTVjz+NKKxsX/fjUUfmsNqbWXWSDw5p7m
  v5TjRdfEl090ET+rvWCL/v5dv2WnRU1SKLppyuTfXiCZ3btPYenEH3P0frS8nsGdvvBilMq0D
  9ebw850dIgYNszYzPd3/t49V89Pu+F1TyPOb8p1EcGU47OPWm+L+/okRtDy2+K/vY8/xxTU3P
  r2NNbBmm+r/PP1qsn50WwnXihwPXrkeOy+mZNCztUErX98iY+XpdlbXwlKO3v6UsvOJoGgbc2
  H9OSdWFwspc/2hYYc59zwa8dNobNSz1sSVbieBoRe1NzyT57VOPDjQ5utSizFGYmGWsxFxYkA
  Tn30rEIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-267.messagelabs.com!1620436063!287119!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15922 invoked from network); 8 May 2021 01:07:43 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2021 01:07:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14814TNC018786
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 8 May 2021 02:04:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 May 2021 02:04:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.39 -> 0.40
Date: Sat, 8 May 2021 09:04:12 +0800
Message-ID: <1620435855-48558-2-git-send-email-wangmy@fujitsu.com>
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
 meta/recipes-core/ell/{ell_0.39.bb => ell_0.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.39.bb => ell_0.40.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.39.bb b/meta/recipes-core/ell/ell_0.40.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.39.bb
rename to meta/recipes-core/ell/ell_0.40.bb
index 68ec4cb4a4..d088676221 100644
--- a/meta/recipes-core/ell/ell_0.39.bb
+++ b/meta/recipes-core/ell/ell_0.40.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
+SRC_URI[sha256sum] = "b9bf5c14f2963591ea1372049c05646919a9ed46fcee5cd11ede1022c99ffbbd"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

