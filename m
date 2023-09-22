Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1B9E6FE41
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
 by mx.groups.io with SMTP id smtpd.web11.23669.1695394077852246884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.47.167, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.138.246])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id ED6B425CEC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:47:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5BF7E1FEC3;
	Fri, 22 Sep 2023 14:47:55 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id h2gmCRupDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:47:55 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0012580c407-5802-4264-a8dd-f1f20756cf60,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 00/17] python3-spdx-tools implementation
Date: Fri, 22 Sep 2023 14:46:12 +0000
Message-Id: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12185333218500020489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehgeelhefhhefggeevveektdeigedufeevjeegudehieegieegueetteevvdetheenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188103

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

This patchset is to implement spdx-tools, a tool for validating 2.2 spdx =
files and later spdx 3.0.

Marta Rybczynska (3):
  python3-ply: add to nativesdk
  python3-isodate: add homepage
  python3-rdflib: add homepage

Samantha Jalabert (14):
  python3-isodate: Copy recipe from meta-python
  python3-booleanpy: Copy recipe from meta-python
  python3-beartype: add recipe
  python3-click: Copy recipe from meta-python
  ptest-packagelists.inc: add python test click
  python3-license-expression: Copy recipe from meta-python
  ptest-packagelists.inc: add python test license-expression
  python3-rdflib: Copy recipe from meta-python
  python3-uritools: add recipe
  python3-xmltodict: Copy recipe from meta-python
  ptest-packagelists.inc: add python test xmltodict
  python3-spdx-tools: add recipe
  qa: Add selftest for python3-spdx-tools
  maintainers.inc: add python3-spdx-tools and dependencies

 meta/conf/distro/include/maintainers.inc      |  9 ++++
 .../distro/include/ptest-packagelists.inc     |  3 ++
 meta/lib/oeqa/selftest/cases/spdx.py          | 54 +++++++++++++++++++
 .../python/python3-beartype_0.15.0.bb         | 11 ++++
 .../python/python3-booleanpy_4.0.bb           | 13 +++++
 .../python/python3-click/run-ptest            |  3 ++
 .../python/python3-click_8.1.7.bb             | 39 ++++++++++++++
 .../python/python3-isodate_0.6.1.bb           | 16 ++++++
 .../python3-license-expression/run-ptest      |  3 ++
 .../python3-license-expression_30.1.1.bb      | 36 +++++++++++++
 .../python/python3-ply_3.11.bb                |  2 +-
 .../python/python3-rdflib_7.0.0.bb            | 21 ++++++++
 .../python/python3-spdx-tools_0.8.1.bb        | 28 ++++++++++
 .../python/python3-uritools_4.0.2.bb          | 11 ++++
 .../python/python3-xmltodict/run-ptest        |  3 ++
 .../python/python3-xmltodict_0.13.0.bb        | 31 +++++++++++
 16 files changed, 282 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/spdx.py
 create mode 100644 meta/recipes-devtools/python/python3-beartype_0.15.0.=
bb
 create mode 100644 meta/recipes-devtools/python/python3-booleanpy_4.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-click/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-click_8.1.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-isodate_0.6.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-license-expressi=
on/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-license-expressi=
on_30.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-spdx-tools_0.8.1=
.bb
 create mode 100644 meta/recipes-devtools/python/python3-uritools_4.0.2.b=
b
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/run-pt=
est
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict_0.13.0=
.bb

--=20
2.34.1


