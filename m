Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DEBCE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20088.1695474255343240145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E50C6C15;
	Sat, 23 Sep 2023 06:04:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C35FB3F59C;
	Sat, 23 Sep 2023 06:04:13 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 0/5 v2] oeqa/runtime/parselogs improvements
Date: Sat, 23 Sep 2023 14:04:06 +0100
Message-Id: <20230923130411.766482-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188145

From: Ross Burton <ross.burton@arm.com>

Mostly the same as before, but this time with a missing casefold() added.

Ross

Ross Burton (5):
  oeqa/runtime/parselogs: improve find call
  oeqa/runtime/parselogs: don't pass around members
  oeqa/runtime/parselogs: move some variables out of global scope
  oeqa/runtime/parselogs: select the correct machine-specific ignores
    early
  oeqa/runtime/parselogs: parse the logs with Python, not grep

 meta/lib/oeqa/runtime/cases/parselogs.py | 141 +++++++++++------------
 1 file changed, 67 insertions(+), 74 deletions(-)

--=20
2.34.1


