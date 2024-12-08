Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA07EE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 17:35:46 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.82559.1733679339401381908
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 09:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kNH5yy5f;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241208173535eab07640d0e802fe5c-9t0h3h@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241208173535eab07640d0e802fe5c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Dec 2024 18:35:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TqCXgbG0nq8qPst198orUkWj19MMAmQY6YEq9uCCtx0=;
 b=kNH5yy5fHXxspJHJlXz9moHhZDGGuSAY+x3OeoIHxBlFnWtpWepYDe1dzqbIGsybhJvpIg
 YjPcT9WUVCaoTsiTsVgRJJ6ro1QUjqRri+oy6Fsy1d6e6IecZwwlbqspN1re8HQ3RP2yRyhy
 9WhouaSC8k3PT3XCUltxjD+nw5urAaREWxzXsb6Q0GkL6mhna6qZaKjl3Cie8I0oncZ9dZcY
 JwoGOet6KFFW8tel2oXu091tTZ/bksZEpQdXhbwPYjCtrge7wxFkaAa1houu+Gc1KpxFPIZ5
 Sww+gQjPZPXl5ag3hDED0nRB1rRTutyTxrjsnKd7u0DdQ9C3X9w3s80g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH v2] qemu: set CVE-2024-6505 to fixed
Date: Sun,  8 Dec 2024 18:34:47 +0100
Message-Id: <20241208173447.9759-1-peter.marko@siemens.com>
In-Reply-To: <20241208171504.9330-1-peter.marko@siemens.com>
References: <20241208171504.9330-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 17:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208468

From: Peter Marko <peter.marko@siemens.com>

CVE patch was removed on last upgrade as fixing commit was backported to
stable 8.2.x branch.

NVD DB has this CVE as version-less (with "-").
So explicit status set is needed to mark it as fixed.

(From OE-Core rev: 64359ec3b60ae68d39c2e6444f903fd20e397cff)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 40ee267a42..4dc6c104c7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -78,6 +78,9 @@ CVE_STATUS[CVE-2023-6683] = "cpe-incorrect: Applies only against version 8.2.1 a
 
 CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
+# NVD DB has this CVE as version-less (with "-")
+CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.30.2


