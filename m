Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43390.1793023112168731216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 06:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OErczG8J;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D60E2720
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:58:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C6363F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023111; bh=V/LhU5opy+KOMVV3UZhI7vgeTuqVQHI8S3cMmPNwfcQ=;
	h=From:To:Subject:Date:From;
	b=OErczG8J1iqdgcE57UIy1kZnloLWwDncj4JWP2XRKmc1g6RJXSoa/sImhugD4Mu0a
	 nsie48BYtKkbC3XphYOt0Puc7xMU55OqdchZWiosuNNToN6zUSvkTl30JG4EvhZAd3
	 53j1x1hzpKuQuF6dziBjzdppxZtE04mN4ZSMJJ/w=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: add comment about when a patch will be obsolete
Date: Mon, 26 Oct 2026 13:58:29 +0000
Message-ID: <20261026135829.1760798-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248684
Content-Type: text/plain; charset="utf-8"

At some point, the standard library module importlib.metadata will be
synced with the external importlib_metadata and this patch will fail to
apply.  Add a comment clarifying that after 10.1.0, it can simply be
dropped.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/0001-prefer-valid-entrypoints.patch         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entry=
points.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-ent=
rypoints.patch
index ae3698fac47..525a2ca7000 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.=
patch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.=
patch
@@ -6,6 +6,9 @@ Subject: [PATCH] prefer valid entrypoints
 When there are multiple distributions found and some of them are invalid=
, ensure that
 the entry_points() accessor puts valid dists first.
=20
+Note: this has been fixed differently upstream with importlib_metadata 5=
d253aec and
+can be dropped when importlib_metadata 10.1.0 is synced into python itse=
lf.
+
 Upstream-Status: Submitted [https://github.com/python/importlib_metadata=
/issues/534]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
--=20
2.43.0

