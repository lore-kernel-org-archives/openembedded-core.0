Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB738E7106F
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:48:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17943.1695304117195926614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0822169C;
	Thu, 21 Sep 2023 06:49:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464D13F59C;
	Thu, 21 Sep 2023 06:48:34 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 0/8] oeqa/runtime/parselogs improvements
Date: Thu, 21 Sep 2023 14:48:25 +0100
Message-Id: <20230921134833.582827-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187998

From: Ross Burton <ross.burton@arm.com>

This is part one of my parselogs series, which clean up the code
and refactor slightly in preparation for a more exciting part two
which I shall send shortly.

Ross Burton (8):
  oeqa/runtime/parselogs: remove unused imports
  oeqa/runtime/parselogs: don't bother to show target hardware
    information
  oeqa/runtime/parselogs: remove obsolete LSB testing support
  oeqa/runtime/parselogs: inline single-caller functions
  oeqa/runtime/parselogs: improve find call
  oeqa/runtime/parselogs: don't pass around members
  oeqa/runtime/parselogs: move some variables out of global scope
  oeqa/runtime/parselogs: select the correct machine-specific ignores
    early

 meta/lib/oeqa/runtime/cases/parselogs.py | 109 +++++++----------------
 1 file changed, 33 insertions(+), 76 deletions(-)

--=20
2.34.1


