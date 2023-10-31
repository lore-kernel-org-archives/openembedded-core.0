Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E444C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from 15.mo583.mail-out.ovh.net (15.mo583.mail-out.ovh.net [178.33.107.29])
 by mx.groups.io with SMTP id smtpd.web10.9384.1698792481077858834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.33.107.29, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.1.239])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 5BF8B28664
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:47:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A5E601FD26;
	Tue, 31 Oct 2023 22:47:58 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id FUUJGR6EQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:47:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002a9a35531-6f63-4f2e-86cd-56fa54de85a4,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 00/12] SPDX3 Proof-of-Concept
Date: Tue, 31 Oct 2023 23:47:21 +0100
Message-ID: <20231031224733.367227-1-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9520328137492258269
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhephfffuddthfefleefheeijefgfffhleevtdelleefkedtkeeffffggedttefhteegnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189876

This patch-set adds a proof-of-concept implementation of the upcoming
SPDX3 standard to the SBOM generation of the Yocto Project/OpenEmbedded.

The current code delivers an equivalent of what is produced for SPDX2.2.
The standard has not been released yet, and there is some specification
work in progress still. Our questions and open points are available
in the README.SPDX3 file.

Louis Rannou (7):
  create-spdx-3.0: copy 2.2 class
  oe/spdx: extend spdx.py objects
  oe/sbom: change the write_doc to prepare for spdx3
  create-spdx-3.0: SPDX3 objects as classes
  oe/sbom: search into json
  create-spdx-3.0: draft: remove low value stuff
  oeqa/selftest/cases/spdx: change test for spdx3

Marta Rybczynska (1):
  README.SPDX3: add file

Samantha Jalabert (4):
  create-spdx-3.0: support for recipe spdx creation
  create-spdx-3.0: support for spdx image
  create-spdx-3.0: Use FQDN spdx ids
  create-spdx-3.0: support for License profile

Louis Rannou (7):
  create-spdx-3.0: copy 2.2 class
  oe/spdx: extend spdx.py objects
  oe/sbom: change the write_doc to prepare for spdx3
  create-spdx-3.0: SPDX3 objects as classes
  oe/sbom: search into json
  create-spdx-3.0: draft: remove low value stuff
  oeqa/selftest/cases/spdx: change test for spdx3

Marta Rybczynska (1):
  README.SPDX3: add file

Samantha Jalabert (4):
  create-spdx-3.0: support for recipe spdx creation
  create-spdx-3.0: support for spdx image
  create-spdx-3.0: Use FQDN spdx ids
  create-spdx-3.0: support for License profile

 README.SPDX3                         |   45 +
 meta/classes/create-spdx-2.2.bbclass |    1 -
 meta/classes/create-spdx-3.0.bbclass | 1223 ++++++++++++++++++++++++++
 meta/classes/create-spdx.bbclass     |    2 +-
 meta/lib/oe/sbom.py                  |   38 +-
 meta/lib/oe/spdx.py                  |   30 +-
 meta/lib/oe/spdx3.py                 |  384 ++++++++
 meta/lib/oeqa/selftest/cases/spdx.py |   16 +-
 8 files changed, 1723 insertions(+), 16 deletions(-)
 create mode 100644 README.SPDX3
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/lib/oe/spdx3.py

--=20
2.42.0


