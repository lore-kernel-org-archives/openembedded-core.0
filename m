Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.5741.1616717808226000834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 17:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12Q0GjMn001794
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 19:16:45 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Enable PR Service support in eSDK
Date: Thu, 25 Mar 2021 19:16:43 -0500
Message-Id: <20210326001644.55424-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

This is the first attempt at enabling the PR service in the eSDK.  It appears
to work for me, but I expect I'm missing corner cases.

Any feedback is appreciatd.

Mark Hatle (1):
  populate_sdk_ext: Add support for PR service

 meta/classes/populate_sdk_ext.bbclass | 25 +++++++++++++++++++++++++
 meta/files/ext-sdk-prepare.py         | 17 +++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.17.1

