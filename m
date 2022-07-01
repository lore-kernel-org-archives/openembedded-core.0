Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436CC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:28:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.36719.1656674935532830412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QzNS9ZEb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656674933; i=@fujitsu.com;
	bh=1uw9BO4q01tYpcj0Kl+LBb83tENde528bsOOcmCpW4I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QzNS9ZEb6yxGu5bqiTDCJat/CnhFzK73GycVcZzVHWCl3F8i4NxfdPdNCopEwbXcg
	 /oZADMHIe/ByPvxvaPXR8qZErm7YuPCACJ3R9qcj8sK/2uUpptFLUnpHQMr/6VnJfj
	 sE5my19i+0LdFLy/zVwm+bgcnMwAkI9V3UKZajh04mZ5aR8apTp5P1UG5WiavasyIp
	 4K62aADj9H1zgpdGm4BdYr6Rw6Pymwio+il/LQOzyzlRjAr71j44yn4DrxQwqqhDM9
	 13FEe148fZ7RSoJ9PhUIc2at2JMdw4wtVBBgrifq1fz6/naRDJePxJunKTR8tr4ZKY
	 XFoWdT5XXWf2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSbf01r4
  kg7OzxCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oy3V76zFazhrJj2/B9jA+Nxji5GLg4hgceM
  Eoeb7jNDONeYJC7caoJydjNKvGiYwdTFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICPhKTLtwFK2cBine2fWcGsXkFnCQ6rn8Dq5EQUJCY8vA9M8gYTgFniUfXuUHCQkAl+1
  dNY4UoF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0SapKDM9oyQ3MTNH19DAQNfQ0FTX0kzX0MRCL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCMU4oTpuxgPLzvl94hRkkOJiVR3qvX9iUJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuDNuwmUEyxKTU+tSMvMAcYUTFqCg0dJhLcfJM1bXJCYW5yZDpE6xajLMfNr2wFmIZ
  a8/LxUKXHev6eBigRAijJK8+BGwOL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3k3Xgab
  wZOaVwG16BXQEE9ARO6ftATmiJBEhJdXAlPm9cW679+XDc4rfs0zZuzl8rg3j2VcHmxhZp2c/
  2HmCWVXxQHRUgJapXr9g3b1Q5TveWzye/LuzTWRP3ZkqSZn3l7simz/+2mxxf4Hn84U8i7hzC
  5SjDLh3X795Jq2mZgtDdaLLpUXJtXypfg/rF/iUXVspfZzTvuRPyW9RpVMav//0mATZHCg6Wq
  ft3HmnT/rSvwfRfYcNC5LWT6g2EmHu3viurCNsbsFFtejdr76ez1rwZQ2nv/LZb7HLW9xzRXO
  s+u+cumgglvx/joHp23IWPQWXb4fe3to4cVG1+BwRni3T3vDf2br3b7BTeMxje85zgY1ncpti
  rbNZ3084sfHhMr24wtjIvSnCLhpPlViKMxINtZiLihMBwkQkvmoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-732.messagelabs.com!1656674932!19608!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24138 invoked from network); 1 Jul 2022 11:28:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:28:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B7D5C100078
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AB448100077
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:28:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/11] gstreamer1.0-libav: upgrade 1.20.2 -> 1.20.3
Date: Fri, 1 Jul 2022 19:28:30 +0800
Message-ID: <1656674913-20419-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
References: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:28:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167456

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
index 4ef9755c07..e8da49af99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
+SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.25.1


