Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9CDCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10368.1780672518828932852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 08:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mHc5jUVk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65A6C3500
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA86E3F86F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780672518; bh=Ou4CI9TI9GXESrij/6RP/W8gxrM9D2kCk4OL+Vo+/y0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mHc5jUVk6fNmA7RGRVXb0Py+GemcXzzwYvg9KdAopYvho1bOb9+APlKQitYQAX2HS
	 T+VpjkuxnO9WU5KpXqswaRuLT6mSPTVdV+eyFW+W8HMuNkRU7AVX+40FE39RXu/zxV
	 vob4iU3ruVAVUGdYB0+/AS4BrFKpPGE+GQo8m4Mw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3: reference upstream ticket in a test skip
Date: Fri,  5 Jun 2026 16:15:11 +0100
Message-ID: <20260605151511.3522627-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605151511.3522627-1-ross.burton@arm.com>
References: <20260605151511.3522627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238176

I've filed a ticket upstream for the libedit-related test failure in
test_bang_completion_without_do_shell(), add a reference to the comment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipe=
s-devtools/python/python3_3.14.5.bb
index 6e237fb0308..f837505f7ab 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,6 +271,7 @@ SKIPPED_TESTS =3D " \
 # but not bang completion. test_bang_completion_without_do_shell() passe=
s if
 # building with readline, but we don't want to change the default, so sk=
ip the
 # test.
+# https://github.com/python/cpython/issues/150922
 SKIPPED_TESTS +=3D " \
     --ignore test_bang_completion_without_do_shell \
 "
--=20
2.43.0


