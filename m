Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54073C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:48:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.4041.1665391673127307926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=agf/oEyg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391671; i=@fujitsu.com;
	bh=ogo2Xli2thxQR+aw/Qy9Oov1HlbA0jsx4R2fFzvR6Y0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=agf/oEygVDKCblqr7xmqvvyRnLxf6Hrh9dmXMN5isKp/peRf4lGsrH8vdFB3seLn5
	 gqDmVY0VBx0FbouRObmOjduorKba2/u/Zg4MqWUlY8f7RWb+xnEK5oiF9aLuVjUeVe
	 KnkbVJTsVvVWBFRfYBvEkmh5tJ4Z4N8rEAOhuCNnrTg+oR+Brr0XwnHa0A0VGCvNko
	 LAw1uYMjGAqLRidJbYyeQrGm6393XypgnTZYsFq7TrXCCIcpyN7P3aebRZavEdFSvy
	 +z0Xt2bawvX9x1OTmoWqQw/YDryuqwyBdXzOSfy5FBiVWss6KLQyHx8yaVuwHNeDcR
	 VKwGgFsdgrUoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWdfsjnO
  yQf8jE4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPpUidLwRbeiofHV7I2ML7h7mLk4hASeMAo
  MevhbCYI5xKTRNO0zawQzh5GiY5/Pxi7GDk52ATUJKbfugGU4OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgJfF/32NWEJtFQFVi/91rYK28Ao4SN+7sBYtLCChITHn4nhkiLihxcuYTFog5mhKt23
  +zQ9jyEs1bZzND1CtKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPALCSjZiEZNQvJqAWMzKsYbZK
  KMtMzSnITM3N0DQ0MdA0NTXUtLYGUpV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZgIKcUJ5fvYNy+75feIUZJDiYlUV6DQ87JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4n
  9wAygkWpaanVqRl5gCjCiYtwcGjJML74CJQmre4IDG3ODMdInWK0Zhj5te2A8wc7du7DjALse
  Tl56VKifPW3QIqFQApzSjNgxsEi/ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR534NM4cn
  MK4Hb9wroFCagU05edQI5pSQRISXVwJTa1Vx9JO4u86nExSf7VhkIHtvE3TKZsSFddoHEp3s7
  Fr8TT801vtjaZZWfubDa3zvt8XVnie75qqI9zG3lM/nusQkZBLCfeRjgXSf7bsbOXx8fRDl9s
  KqrjvJ/ZhB9+OapCRZf5sfsuMKsEbz1rkzQfqd9rKu0I3Is3onsrd8y87u2eL05V7TgJ36G0k
  VtrVYH/yqFcFaw/eUsb3+r3pQVZLFxu+GTFWfbDk9fax552Fpb22jz+WsFT81k+CZG9NxcXxk
  fZagmPWt/8lSJX7t/ZyYoJvx/NOEYg5f3C7eryjPD/Z85/Ol4Iqxw7NONQ+GOyxd1pKtsbvZS
  Kbq/tuy89+kfX3mlld+zPGJfpcRSnJFoqMVcVJwIAMQOj8xxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1665391670!3408!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18498 invoked from network); 10 Oct 2022 08:47:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:47:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 47A23153
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3B6147B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:47:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] openssh: upgrade 9.0p1 -> 9.1p1
Date: Mon, 10 Oct 2022 16:47:31 +0800
Message-ID: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171565

License-Update: add Kungliga Tekniska H=C3=B6gskolan to copyright holders

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssh/{openssh_9.0p1.bb =3D> openssh_9.1p1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.0p1.bb =3D> openssh_9.1p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_9.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.1p1.bb
index b63ea2b137..85f97b1bbb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
@@ -6,7 +6,7 @@ and for executing commands on a remote machine."
 HOMEPAGE =3D "http://www.openssh.com/"
 SECTION =3D "console/network"
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D8baf365614c9bdd63705f298c9afbfb9"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D072979064e691d342002f43cd89c0394"
 
 DEPENDS =3D "zlib openssl virtual/crypt"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -25,7 +25,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] =3D "03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a"
+SRC_URI[sha256sum] =3D "19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE +=3D "CVE-2007-2768"
-- 
2.25.1


