Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97178C88E4A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:40:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36805.1789123223936671411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Bmh5kh0/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC331477
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:40:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7CF73F7B4
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789123223; bh=mw5oO1uDUMGyMH1RJcATbnEJbOtsWTC9OhN/s6pNJMg=;
	h=From:To:Subject:Date:From;
	b=Bmh5kh0/Vs11YAHYASAh9nLjT4zrITIsZKURJn/x5u23xDTVWtKwJPFPijhjySA//
	 QpGGg5Frg6lP+IhsFRTE1APqyYRpCvE9qp/9qtTT5/r52sqgt6svrEyE4Fnr4ha5+s
	 3TlgNHDOc+cF1TVCkJXeuCJoA83tjuTlZnZybEOw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-idna: remove redundant RDEPENDS
Date: Fri, 11 Sep 2026 11:40:16 +0100
Message-ID: <20260911104018.1569984-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245629

The dependency on python3-unittest-automake-output is added by the
ptest-python-pytest class already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-idna_3.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-idna_3.19.bb b/meta/rec=
ipes-devtools/python/python3-idna_3.19.bb
index 6f197e808db..92bbda59d5a 100644
--- a/meta/recipes-devtools/python/python3-idna_3.19.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.19.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "5e0811a4383b21dc5838069f801c4fb62=
113b7447663d2530d2bd6e77b
 inherit pypi python_flit_core ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D "python3-codecs"
-RDEPENDS:${PN}-ptest +=3D "python3-unittest-automake-output python3-hypo=
thesis"
+RDEPENDS:${PN}-ptest +=3D "python3-hypothesis"
=20
 CVE_PRODUCT =3D "kjd:idna kjd:internationalized_domain_names_in_applicat=
ions"
=20
--=20
2.43.0


