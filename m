Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D220CF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:43:56 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.17951.1727545435777720173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=k0oC3TzK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202409281743538091d5248c3c81b7a3-9nxrt6@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202409281743538091d5248c3c81b7a3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 19:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6slffxLjfErprCvV81eoVJXl4z6Fkmmw8i1SC0Ye5fY=;
 b=k0oC3TzK0PDS1hy/jZocntBmVfrE/pMs8SPbzq1k642bJ93906vrFFq58mxC/m6g8Z6hPu
 LR835dOlxETXgqvWU3l7K8F3lpwHMh7fZr9+iZ7y7Q6Dq28SfYvsp+Kihlp1eR+4OVdvk1eB
 XkSVBhwjlEjmMBnmsW72FoWoEwZq4cZcEz1PeLpChOubYS9GB/OrdVksgAxKsdUnpPXIoQM7
 x/ZxqPScyB8+hcoHaGA+e4RzMvDWbyIBeOPuuFyY6VXEaVhV4o/C2/9ovux8Cvtrphl6vItd
 TO03SlUxzFzwKRXqVDfNj2PwEW0qziaCyXN4FoYy8OmZRxBYTc5fcFKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/3] openssh: Mark CVE-2023-51767 as wont-fix
Date: Sat, 28 Sep 2024 19:42:22 +0200
Message-Id: <20240928174223.3749001-2-peter.marko@siemens.com>
In-Reply-To: <20240928174223.3749001-1-peter.marko@siemens.com>
References: <20240928174223.3749001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 17:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205046

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 1b4bada6c003ef743df09283e45953e6d9ea4c5a)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3c507cf911..a8ba67e360 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -40,6 +40,7 @@ CVE_STATUS[CVE-2014-9278] = "not-applicable-platform: This CVE is specific to Op
 Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
+CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.30.2


