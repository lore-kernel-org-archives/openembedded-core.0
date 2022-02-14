Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25740C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:54:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.3256.1644882895782182042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=umcNvzVx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644882893; i=@fujitsu.com;
	bh=yXejQcy+4ApkGqOhFyDXa3cKMR8w6WkhF+i9kYd4Pp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=umcNvzVxc0TWVsOE7Spa6zqrX/dgisgzxEgRKi0b2odHXbuv/fuBUNaMaH1I3N6mh
	 F6kzIcN5V1a9YoqBcsaeP6qkurloraBXOf6laZNE8EjaNq4hHL5fFGrH9MayaokU2T
	 +c7W3rjxU8+dkX8dwRMsiJ/Hb0XUkt8l47a0A9dgBzhnjIK3cjiQk9y/W5+CgYxIgz
	 x28ku7ImRg82OObiTIqQsdHhVGKlaQscInQBcKYip9fh9XY2lrozQfCeKG1qhjFeu3
	 eBk5QtIKG4saeNLaDh8UdFmUmMiblx2qzoyqGMf5SP7Nacs8SAqTCvkZNbRIgopYWj
	 Q5PPQQPJwl14w==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 6C/CE-13236-CCBEA026;
 Mon, 14 Feb 2022 23:54:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MRonvmNVe
  Swcq3yhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bZo93sBVd5K3483snYwHiXu4uRi0NIYAaT
  xORpD9ggnBOMEu0TjwE5nBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgLnHr5
  T1WEJtFQFXixeKZjCA2r4CjxJ4fn1hAbAkBBYkpD98zg9icAk4SbybMAqsRAqr5damLDaJeUO
  LkzCcsEPMlJA6+eMEM0asoMftyM9ScColZs9qYJjDyz0LSMgtJywJGplWMVklFmekZJbmJmTm
  6hgYGuoaGprqmukampnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIEhmVLM
  +n8HY3ffT71DjJIcTEqivDF7uJKE+JLyUyozEosz4otKc1KLDzHKcHAoSfBKPQLKCRalpqdWp
  GXmAOMDJi3BwaMkwnvjAVCat7ggMbc4Mx0idYrRmGPT4St7mTk2rbmxl1mIJS8/L1VKnNf/Nl
  CpAEhpRmke3CBY3F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxr9gpoCk9mXgncvldApzA
  BnaLYCHZKSSJCSqqBadnbhQaX925XqubRe6fqwDXzrui0U6uYHHImi5+Jzte94vPoXs7u/jfW
  Dbbe2j+LJ8++/7z6RtfcZVdVdBvbF/BE/+WpNNHxdZ1VUXpkSqSMyxJL3/Lk+rTm+Q1s6/+o1
  m1aNOOsKzv3sgaTef8aV6rM+h5w7wDTjkN/5wQybdeLcNhWkadQVPtVSJEpeo/npsQV6rFPr/
  StWS/CMONDgJxcY4yprLOulftyw6RV/s8WXBZweibj82NFxMkIj7+TlMMPrnntuMhjwUO5Rae
  Wifxc+/r4rj8yF2bPZo8MWSPaxJiTsnhSx7nE8Ier2e7duD8tyECKRyCzV0/5n6zGvt8z2qfU
  uQes1M3K73hUqsRSnJFoqMVcVJwIAF7JLJhWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1644882892!46470!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10989 invoked from network); 14 Feb 2022 23:54:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 23:54:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21ENskoa015267
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:54:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 23:54:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] linux-firmware: upgrade 20211216 -> 20220209
Date: Tue, 15 Feb 2022 07:54:34 +0800
Message-ID: <1644882876-4535-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
References: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161736

License-Update:
Version of some driver files updated
Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{linux-firmware_20211216.bb => linux-firmware_20220209.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
index 5f1b696092..fe51892eb4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
+                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
+SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
 
 inherit allarch
 
-- 
2.25.1


