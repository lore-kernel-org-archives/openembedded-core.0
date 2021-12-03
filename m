Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DAEC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13839.1638549825327887941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 08:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AF211435
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 356863F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] libx11: update patch status
Date: Fri,  3 Dec 2021 16:43:35 +0000
Message-Id: <20211203164340.2963235-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 16:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159119

This patch has now been merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libx11/Fix-hanging-issue-in-_XReply.patch       | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_=
XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in=
-_XReply.patch
index 2a723b7e43..660e6968bf 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.=
patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.=
patch
@@ -9,17 +9,8 @@ If one thread was blocking waiting for an event and anot=
her thread sent a
 reply to the X server, both threads got blocked until an event was
 received.
=20
-Upstream-Status: Submitted [https://patchwork.freedesktop.org/patch/1714=
58/]
-
-This patch needs to be removed once the corresponding patch has been mer=
ged upstream.
-
-https://patchwork.freedesktop.org/patch/171458/
-
-Signed-off-by: Tatu Frisk <tatu.frisk@ge.com>
-Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
-
-[Refreshed for 1.6.7 update]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Upstream-Status: Backport [93a050c3ad2d2264d3880db3791387b1a9bf2e9e]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 ---
  src/xcb_io.c | 19 +++++++------------
--=20
2.25.1


