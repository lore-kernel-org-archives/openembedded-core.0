Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626B8C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:31:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.37652.1670830260711335485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S7e8j946;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830258; i=@fujitsu.com;
	bh=G3kkeX/xBP8i0wT74EQliGzjC1M5U6kfpX9uFQg+Y3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S7e8j946Iuc32DtP5S2XpDeIrpDEEF9pyIOD5GaDIJs3/FuGsryam1saWIqO0hN43
	 6kdkSu6BDQuBNYBttk4X6iIVTa/jcLTIwhzrT3L2JzE8xU0hRuVO/GRlIJxF3jW1Zu
	 RCgg3kDnUER+RBn0/uCgcl6WUfQjMh+X/kOLLv1Pfgu3Z2QJtCmZtu7Fu+FJGtxi54
	 f4f+iKH8r18xvwOSQu1yXab0CxtJAcm/JpYB9+aohftc+waCTBwG5qTAybx3MdAOD7
	 p+HEXIflj/HjpMqPgfpKDaIUpYk1DCgryPicjesRkOk3E6s6+NLbSQydgQ2MnaPgN1
	 M/KsGr08ULt4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqLvmxrR
  kg/dX1S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owzJ2azFbzjrejZfYGtgXEuTxcjF4eQwGNG
  iWlHrrFCONeYJLZNn8gE4exhlNj36CJLFyMnB5uAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+
  N3DDhIWFrCW6G7lBTFZBFQlDt/wAqngFXCUOH/qICOILSGgIDHl4XtmkBJOASeJZ0ezQMJCQC
  VtD2YyQpQLSpyc+YQFYriExMEXL5ghWhUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0LU4tKkst0jXVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM2pRixrIdjN3L/ugdYpTkYFIS5a28Mi1ZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvhmtAOcGi1PTUirTMHGAEwaQlOHiURHjdQFp5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKi
  XOK30dqEgApCijNA9uBCyaLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rUBmcKTmVcCt+k
  V0BFMQEdEvZwKckRJIkJKqoFpDUeBgeVFoUyHib8t01rjehXvyO+/7yNZ8prF/f2/jJRWnVD5
  y3umufUtXbl4v+OLtkLNI2ueFfGs3vw6Sj+0+xzHf7bNilY7CiU5o9WXGgufnFUtcUzqdvDCN
  aohV7/+X3bwNs+SN6w9lz0XNbxreXf9EcPZ12aZPAmvHni5nXM8uPccz7/bLbJTN7SuMTf8zB
  obX1c/7RHbOaW1bFI2k2zDbdPuWgbu6dKy3L6pp6q6QKuk+MyRmMolflm7css5AzxvcFeeTwz
  4Lzc5b03yljB//R1J7P/idn78FuIgVTjrs9bv/hu3Pj1cy5+5f9HiiU6auQd/vnXL11FNL30v
  e2vi9IKLKxfaXyyrPuilxFKckWioxVxUnAgAQlpktWEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1670830252!292635!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7679 invoked from network); 12 Dec 2022 07:30:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:30:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3F0E010018D
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3326C100182
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:30:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpng: upgrade 1.6.38 -> 1.6.39
Date: Mon, 12 Dec 2022 15:29:54 +0800
Message-ID: <1670830196-2900-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
References: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174484

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
*  Changed the error handler of oversized chunks (i.e. larger than
   PNG_USER_CHUNK_MALLOC_MAX) from png_chunk_error to png_benign_error.
*  Fixed a buffer overflow error in contrib/tools/pngfix.
*  Fixed a memory leak (CVE-2019-6129) in contrib/tools/pngcp.
*  Disabled the ARM Neon optimizations by default in the CMake file,
   following the default behavior of the configure script.
*  Allowed configure.ac to work with the trunk version of autoconf.
*  Removed the support for "install" targets from the legacy makefiles;
   removed the obsolete makefile.cegcc.
*  Cleaned up the code and updated the internal documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb} (93%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
similarity index 93%
rename from meta/recipes-multimedia/libpng/libpng_1.6.38.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index dc627203ef..d9dcf379e9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be"
+SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.25.1


