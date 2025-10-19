Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B36CCCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 16:44:57 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.42.1760892291307285689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 09:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=UhFnp9o5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20251019164447ab93e1893700020719-brj9vy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251019164447ab93e1893700020719
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Oct 2025 18:44:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vh47j7y9R/rkjuoHJfy3zDpdoG83huHmLdv/FdbkwH8=;
 b=UhFnp9o5T2unEGqmCEYePt/EalT1rSOtMHi4HCq2tq6gt+PPSgGZzFgE4TmAng8nw64wWV
 g3gw+dBDLAV+OgzKj2+F6LmAgQzNaGdHgb8lXgP92TA9VQIZ56N4FJ8XrRPORQ6EDgZ45jeR
 4XGaogjsooIVaO2k2wZ8o5a3uT2c3poe873RPYCpf+eXy1OJvCU2utABc5SmbXt0s4eHGZIF
 DvR21Gwf/o9hHWfxtgAkPbcjhClUn94TUbjCQf4l28sZTSy+5z0L7WTZnkmtBcSbXiI0LFx2
 3F1LlNzQIUmSuJIVJU9JL3A8etSTCr9ZXJWyIsQmJlWZZq6pdCw5DUmw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] oe-selftest: fitimage improvements
Date: Sun, 19 Oct 2025 18:44:10 +0200
Message-ID: <20251019164435.3794482-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 16:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225086

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Some general test improvements for fitimage related tests but also preparing
for future tests required for:
https://lists.openembedded.org/g/openembedded-core/topic/115767371

Adrian Freihofer (2):
  oe-selftest: fitimage: fix req_its_fields last field_index
  oe-selftest: fitimage: test FIT image with/without kernel node

 meta/lib/oeqa/selftest/cases/fitimage.py | 139 +++++++++++++++++------
 1 file changed, 103 insertions(+), 36 deletions(-)

-- 
2.51.0


