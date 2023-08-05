Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADDAEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 06:59:59 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.1847.1691218792932189548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 23:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id 5DAEE3D703
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Aug 2023 08:59:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.235]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qSBGQ-17bZYH0; Sat, 5 Aug 2023 08:59:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: add less to RRECOMMENDS
Date: Sat,  5 Aug 2023 08:59:29 +0200
Message-ID: <20230805065929.230212-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691218790-1281C931-CA7A7768/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f761673-6703-4430-8e3f-17b0565f8a7b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 06:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185547

journald uses less to display logs. less.busybox can do the
job, but it rips out support for color/highlighting.

So I would highly recommend to use the real 'less'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_253.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-co=
re/systemd/systemd_253.7.bb
index 1fd4556afd..3f70e12cd2 100644
--- a/meta/recipes-core/systemd/systemd_253.7.bb
+++ b/meta/recipes-core/systemd/systemd_253.7.bb
@@ -683,6 +683,7 @@ RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
                       udev-hwdb \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 kernel-module-sch-fq-codel \
+                      less \
                       os-release \
                       systemd-conf \
 "
--=20
2.41.0


