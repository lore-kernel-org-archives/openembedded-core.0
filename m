Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08453EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:00:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1527.1692723645569218714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1926611FB;
	Tue, 22 Aug 2023 10:01:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 495A13F762;
	Tue, 22 Aug 2023 10:00:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] perf: add more PACKAGECONFIGs
Date: Tue, 22 Aug 2023 18:00:15 +0100
Message-Id: <20230822170018.315470-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822170018.315470-1-ross.burton@arm.com>
References: <20230822170018.315470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186514

From: Ross Burton <ross.burton@arm.com>

libpfm4 and babeltrace are enabled if they're found, so add
PACKAGECONFIGs so that our configuration is explicit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 68d59f69c7d..9eeb1003f3a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -30,6 +30,8 @@ PACKAGECONFIG[cap] =3D ",,libcap"
 PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
 # Arm CoreSight
 PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
+PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
+PACKAGECONFIG[babeltrace] =3D ",NO_LIBBABELTRACE=3D1,babeltrace"
=20
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc =3D "libunwind"
--=20
2.34.1


