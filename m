Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA75C88CB4
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 15:37:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63195.1686584272600518230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 08:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52FAF1FB;
	Mon, 12 Jun 2023 08:38:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2D223F5A1;
	Mon, 12 Jun 2023 08:37:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] gi-docgen: correct comment
Date: Mon, 12 Jun 2023 16:37:47 +0100
Message-Id: <20230612153748.937565-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 15:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182676

From: Ross Burton <ross.burton@arm.com>

The logic was changed in 874dc891 but the comment was not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gi-docgen.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/gi-docgen.bbclass b/meta/classes-recipe/=
gi-docgen.bbclass
index eb30c6011f8..b4d7b177610 100644
--- a/meta/classes-recipe/gi-docgen.bbclass
+++ b/meta/classes-recipe/gi-docgen.bbclass
@@ -8,8 +8,8 @@
 # seems to be a successor to gtk-doc:
 # https://gitlab.gnome.org/GNOME/gi-docgen
=20
-# This variable is set to True if api-documentation is in
-# DISTRO_FEATURES, and False otherwise.
+# This variable is set to True if api-documentation and
+# gobject-introspection-data are in DISTRO_FEATURES, False otherwise.
 GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docu=
mentation gobject-introspection-data', 'True', 'False', d)}"
=20
 # When building native recipes, disable gi-docgen, as it is not necessar=
y,
--=20
2.34.1


