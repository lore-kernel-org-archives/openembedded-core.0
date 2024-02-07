Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781A0C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 16:52:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2594.1707324748367210709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 08:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7C8150C;
	Wed,  7 Feb 2024 08:53:10 -0800 (PST)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 959B83F762;
	Wed,  7 Feb 2024 08:52:27 -0800 (PST)
From: vikas.katariya@arm.com
To: openembedded-core@lists.openembedded.org
Cc: Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 1/1] bmap-tools: Add missing runtime dependency
Date: Wed,  7 Feb 2024 16:52:19 +0000
Message-Id: <20240207165219.825246-2-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207165219.825246-1-vikas.katariya@arm.com>
References: <20240207165219.825246-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 16:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195074

From: Vikas Katariya <vikas.katariya@arm.com>

Python3 module netrc is required by bmap-tools (v3.7), therefore add
`python3-misc` as runtime dependency.

Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/rec=
ipes-support/bmap-tools/bmap-tools_git.bb
index 9bbd7d51c8..ffb6ccfe99 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -24,7 +24,7 @@ PV =3D "${BASEVER}+git"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 # Need df from coreutils
-RDEPENDS:${PN} =3D "python3-core python3-compression python3-mmap python=
3-setuptools python3-fcntl python3-six coreutils"
+RDEPENDS:${PN} =3D "python3-core python3-compression python3-misc python=
3-mmap python3-setuptools python3-fcntl python3-six coreutils"
=20
 inherit setuptools3
=20
--=20
2.25.1


