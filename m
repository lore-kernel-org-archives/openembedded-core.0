Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533C6C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:13:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9248.1646918014561728902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=0GKsnBx1;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A1E5583A61;
	Thu, 10 Mar 2022 14:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646918011;
	bh=MBORE2CKBigZmjnF/KbEZs3HZZe0myPsXi72bUZ98I4=;
	h=From:To:Cc:Subject:Date:From;
	b=0GKsnBx11CVZHAQSiY7+W9QwxSQfOuMEHvBbbeWLrjF0AgLjCcVn8Sam7aBq5p2bW
	 Rgqn8jMu5HzF67xCzrdCgDvSvyMXjpSO6En5a/DnxQXmrsUw8B1ovX2BA06S9S1Eiq
	 HcGl0UG84wu9/vT0AjhR5v0p9AfVN6Npg+e3vMLFj6siiX8dFB2nsgGWrpwN/stkmE
	 sZ68EJ9kOoVjRfh1D8Q9pBYekB9yy1/1eDQ8KwhtnPzndtMjt9jEysn2F1Udp9QgQf
	 xegwIR6JAfleOdeO7cHR7oy3JLGbLDUp3xQLY3sWLdxoyH8C+QJkHi4ICNyflXXRhF
	 xJ0sObycAxFlw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2 0/4] Patches and bugfixes for overlayfs
Date: Thu, 10 Mar 2022 14:13:25 +0100
Message-Id: <20220310131329.1906537-1-ch@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 13:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163017

Hi,

I bundled my patches to overlayfs and overlayfs-etc togehter in this
patchset and fixed the whitespace issues.

regards,
Claudius

--
Changes from v1:
  - fixed whitespace issues: converted tabs to 4 spaces.
  - changed git commit title of patch 4

Claudius Heine (4):
  overlayfs-etc: add condition to package-management feature conflict
  overlayfs: add systemd unit path prefix to FILES:${PN} array
  files: overlayfs-etc: wrap long lines of preinit file
  files: overlayfs-etc: add overlay mount options to preinit

 meta/classes/overlayfs-etc.bbclass     |  3 ++-
 meta/classes/overlayfs.bbclass         |  3 ++-
 meta/files/overlayfs-etc-preinit.sh.in | 12 ++++++++++--
 3 files changed, 14 insertions(+), 4 deletions(-)

--=20
2.35.1


