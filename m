Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45862.1795624782972733321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P4nKXudb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C762F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 382A83F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624782; bh=ia/WjHk/IJPOEZmtzTHDkKdZSPMmBmmYct4vGZSozJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P4nKXudb0ERHFemfULyShmwnr1fwQHcmi3JmRJPfYVVkyJg2Vw3E/Az+/CeqtXtQT
	 p5C+jxnZObunkI5A/koi73ajF+xmFKqD/hdkwMNiuySTPGaBmb/CyuJ9AMnx4DjTlT
	 sYryeBWs0h2Xe4K4ucDxlXmYnhmyuG/58IoUjniQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/18] python3-pygobject: ptests need pydoc
Date: Wed, 25 Nov 2026 16:39:27 +0000
Message-ID: <20261125163927.1835785-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251229
Content-Type: text/plain; charset="utf-8"

These were implicitly pulled in via misc before, but the actual dependenc=
y
is python3-pydoc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.58.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.58.1.bb
index 069a3137350..a26c7b182c6 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
@@ -52,7 +52,7 @@ FILES:${PN}-ptest +=3D "${libdir}/${BPN}/gi-tests"
 RDEPENDS:${PN}-ptest +=3D " \
     bash \
     python3-ctypes \
-    python3-misc \
+    python3-pydoc \
     python3-pickle \
     python3-unittest \
 "
--=20
2.43.0

