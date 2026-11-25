Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45902.1795624777357364645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CdnQSR9d;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 131372F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98A283F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624777; bh=6bCnU+bdSP648/fzJMX9T84wv6fHO8IJBt1goqDO8uw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CdnQSR9dJX/FC/futtUByd+BDCv8K5sPizCZggXn8kuq2AJo2tAGuF2v3oH897/F8
	 3bRsDXcjG65uMzrGZR7DM7IsJ5zWnfg4+QXjzr6SDt87EzSUI7noSx7/KELMflVa9J
	 SbMo/N4cftP5TM/Wf/s1RT1XXOrSrsupnd5+Gr28=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/18] python3: package the codec binary modules into -codecs
Date: Wed, 25 Nov 2026 16:39:18 +0000
Message-ID: <20261125163927.1835785-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251220
Content-Type: text/plain; charset="utf-8"

This moves them out of -misc, into the same package as the other binary
codec modules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 9550cc61c14..8427b0fc101 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -141,6 +141,7 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_codecs_*.*.so=
",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecode=
c.*.so"
         ]
     },
--=20
2.43.0

