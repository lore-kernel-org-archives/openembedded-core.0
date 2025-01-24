Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F6C0218E
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.16099.1737735492952003103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=CswdgDLl;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EzPEQD6V+B00MJlSznmHMIzKVjuA2PUmczIUJcOGqUw=; b=CswdgDLlQ4iAwTbLRvJgH0KvY3
	5wxpFzCQpj/bx7PAIp6VcR2qcpX2Ud67KRkzVgJNAFWLaZOJJL3bk61uT1BhyygSNKpTNMC2FFZAA
	uC5i+9U1hS74QJcUJq6oo5q+g//oABZcmHBpVFn8UTkcfF5b1GgJOsx/jkygbdBwddrdPKCv8oAA8
	UZMN8L0KGN+jtR0UgNCLbLNFPh+LlpVa932Flb1uJUZWXi3NVNyB32YaKDW3iH+0Snt0Cgid2/LUe
	58+Ex5fy1K6DJ4P85BQb9uxPcPQlVf9hKEvz5G8W8GSwZfx9dfkH6QCHAr3duTOxKTHArCknpKy+1
	epFD6rfA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbMNm-009TSd-DY; Fri, 24 Jan 2025 16:18:10 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] libbsd: Drop licenses that were removed upstream
Date: Fri, 24 Jan 2025 17:17:48 +0100
Message-ID: <20250124161751.13839-2-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250124161751.13839-1-bage@debian.org>
References: <20250124161751.13839-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210237

The libbsd project has gotten rid of BSD-4-Clause licensed material.
Version 0.11.8 is the first not to contain any such material anymore.

License-Update: removed upstream

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-support/libbsd/libbsd_0.12.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 7d5e88f293..bd503cb031 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -15,20 +15,17 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: BSD-3-clause-author
 # License: BSD-3-clause-John-Birrell
 # License: BSD-3-clause-Regents
-# License: BSD-4-clause-Christopher-G-Demetriou
-# License: BSD-4-clause-Niels-Provos
 # License: BSD-5-clause-Peter-Wemm
 # License: Beerware
 # License: Expat
 # License: ISC
 # License: ISC-Original
 # License: public-domain
-# License: public-domain-Colin-Plumb
-LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"

