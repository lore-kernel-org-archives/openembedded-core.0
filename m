Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78043C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:03:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.6287.1640012635795483973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bRZxP0Wf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012633; i=@fujitsu.com;
	bh=n08vXv4Bd6bxJ45SrkD7NmxyRkfN/x9K3RuADkgm8eQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bRZxP0Wf90wVIVHF/5V1tbyFZPvSvmPCXinK0/fW1xdxNC7HtTIe4fG4OXEGT/40a
	 0hAi3J1MxsKcgK2W59LqV5IEjU8H/Wz7/iui6urmHWv41szwQB8E8w2SKqqjtXK9Ad
	 mj7Od//SfAjPqNn7zNBKqjMjyoqE+euhGS3P/HDMsLTEuzltl3NyFOUP9iu30gl+94
	 P/cZTPaRc1yuvK+scPg1nxTZbfhAynm5QZug4T4asSg0xnGP2bZsFLFnTKLjSdX+/f
	 6gNqNgrEdBN6jJBL2c2HgEDui7YfOMcR267WzA0pZuHlaVPP2dedboglF8x/4xCKMg
	 VUVVXN5Euh6zw==
Received: from [100.115.32.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 97/7B-28974-95B90C16;
 Mon, 20 Dec 2021 15:03:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSTdy9oF
  Eg1etEhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aySzOZC7bwVvRuamZqYDzE3cXIxSEk8JhR
  4tnH68wQznkmiU8be1khnBOMEnN7W9m7GDk52ATUJKbfugGU4OAQEdCTuPpPFCTMLKAi8eJ3D
  1iJsIC7xKLFz1hAbBYBVYkpjz+xgti8Ao4SD6ZcYgaxJQQUJKY8fA9mcwo4STQcWwxmCwHVfP
  wwCapeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrGFrpGhkV5ilW6iXmqpbnlqcYkukFterJdaXKxXXJmb
  nJOil5dasokRGMYpxWpXdjDuWfVT7xCjJAeTkigvv++BRCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvD9nAOUEi1LTUyvSMnOAMQWTluDgURLhbQJJ8xYXJOYWZ6ZDpE4x6nJ8WbVkEbMQS15+Xq
  qUOG/cLKAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3HWQKT2ZeCdy
  mV0BHMAEdoRS+H+SIkkSElFQD05z6PYkWeqkTf2rF/Vh4ZNfbNhmeeZ8zRBjXNN6ZPXvzYTae
  /Gnr52yJd71rc7h2w0fzEuvM65P0ZecY1ad4ntxUwaMdeeHcAyb7zs3GJucddgotOZTB39WZp
  fVOw6WF21lNYJ//y+jgBvuvn658PDHF517qDsvN8jXze2q/58funhDMKDWTq50zXu3N2e5LOi
  cYpzw9qGicJfPWeOmhP/LyRksEo1WtFr4sWOToY6slv69Wy03t8Cm73btjZ7BGivms7Of6LNR
  9RecMm8CJud0vg00K1Z9OuvfcuUlE7cnp+05a0lmPM/zqXY9v1TLeonD+zjOP3rBFRzI3cknJ
  l2reTan8IbNkdqbxyR/rlViKMxINtZiLihMBFQiwn2oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1640012633!5839!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1238 invoked from network); 20 Dec 2021 15:03:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:03:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 06698100460
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E6178100459
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:03:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] linux-firmware: upgrade 20211027 -> 20211216
Date: Mon, 20 Dec 2021 23:03:37 +0800
Message-ID: <1640012619-3685-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
References: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159870

License-Update: version of license file updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{linux-firmware_20211027.bb => linux-firmware_20211216.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 97d42e98e2..65bfda1d9f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
+                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
+SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
 
 inherit allarch
 
-- 
2.25.1


