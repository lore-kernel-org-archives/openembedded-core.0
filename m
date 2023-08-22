Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ED0EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:01:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1535.1692723655058354016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87D511FB;
	Tue, 22 Aug 2023 10:01:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C42343F762;
	Tue, 22 Aug 2023 10:00:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] perf: disable perl support
Date: Tue, 22 Aug 2023 18:00:18 +0100
Message-Id: <20230822170018.315470-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822170018.315470-1-ross.burton@arm.com>
References: <20230822170018.315470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186517

From: Ross Burton <ross.burton@arm.com>

The perf support was broken and if enabled results in non-reproducible
binaries, so disable it for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index f89ab20ca41..e22a1bebb26 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -11,7 +11,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 PR =3D "r9"
=20
-PACKAGECONFIG ??=3D "perl python tui libunwind libtraceevent"
+PACKAGECONFIG ??=3D "python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
 PACKAGECONFIG[perl] =3D ",NO_LIBPERL=3D1,perl"
 PACKAGECONFIG[python] =3D ",NO_LIBPYTHON=3D1,python3 python3-setuptools-=
native"
--=20
2.34.1


