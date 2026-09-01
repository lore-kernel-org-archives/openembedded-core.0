Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72205C624D6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:50:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.850.1788285024773906888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=J5p9tcH6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE201756
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:50:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9738F3F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788285024; bh=Y7lGXRAi4QS4p8+MqJBCPBDFmP7Q3efZfuw9aq6+dKI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J5p9tcH654/1+bNfZ8dDzaeOphTU9IcX3pzO9WxGVJKXFw257RH1a0TUNT9nF8TRA
	 5V2U8+BQvoIqUq6HUrO1q6s91lBO/s6YwXs7Gfw6C5k440rFt0GoI8aZM4LoquWxYP
	 EJq7mRrIOhFPfO2YWkwxIF0EuU5CWH7R1nmBtvBY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] librsvg: fix test suite with pango 1.58.1 onwards
Date: Tue,  1 Sep 2026 18:50:19 +0100
Message-ID: <20260901175020.2705859-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901175020.2705859-1-ross.burton@arm.com>
References: <20260901175020.2705859-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244847

Take an updated test file from upstream so that the librsvg test suite
passes with pango 1.58.1 onwards.

Once we uprade past librsvg 2.62.3, we should be able to drop this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../librsvg/librsvg/text-text-03-b-ref.png      | Bin 0 -> 28298 bytes
 meta/recipes-gnome/librsvg/librsvg_2.62.3.bb    |   6 ++++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/text-text-03-b-ref=
.png

diff --git a/meta/recipes-gnome/librsvg/librsvg/text-text-03-b-ref.png b/=
meta/recipes-gnome/librsvg/librsvg/text-text-03-b-ref.png
new file mode 100644
index 0000000000000000000000000000000000000000..130ec449b26a8f2209c082962=
3ceaa19519c44f3
GIT binary patch
literal 28298
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
X
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
X
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
`
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
a
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

literal 0
HcmV?d00001

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.62.3.bb
index b54371a1948..e88efda213a 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb
@@ -25,6 +25,7 @@ require ${BPN}-crates.inc
=20
 SRC_URI +=3D "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executab=
le.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-=
Comm.patch \
+            file://text-text-03-b-ref.png \
             file://run-ptest"
 SRC_URI[archive.sha256sum] =3D "7eb449b2722a768021356f66dfee3202c229b54e=
d4e6a70ce40c090e97ff16f2"
=20
@@ -88,6 +89,11 @@ do_install_ptest:append() {
 	# with a symlink that points to the current folder
 	ln -s . ${D}${PTEST_PATH}/rsvg
 	ln -s ptest ${D}${PTEST_PATH}/../rsvg
+
+	# Until a release after librsvg 2.63.3 is made, we need to update the t=
est data
+	# to match the behaviour of pango 1.58.1 onwards.
+	# https://gitlab.gnome.org/GNOME/librsvg/-/commit/55a08a24cbd93c042872d=
6b95f7bb59d3460a0f3
+	install -m644 ${UNPACKDIR}/text-text-03-b-ref.png ${D}${PTEST_PATH}/tes=
ts/fixtures/reftests/svg1.1/
 }
=20
 PACKAGES =3D+ "librsvg-gtk rsvg"
--=20
2.43.0


