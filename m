Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F65FC43217
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NzczHOZM;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237873; x=1683773873;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oTZP2olZO0Gomobar/ieTbcVtZzo0uKcOGPDDqVTGpY=;
  b=NzczHOZMYY9wqby3mJ7vUbAfK1QCFvpjiQF7zZ7ob7EEFK7rh2KGwc1I
   v+mrt/lTySQnMY7piNbbMjBnsd5h0kvdHEudA5YMTB1OvzINA/pNz/ID9
   XepAbyKrivrq8VoePxma5qroGXuaGWIxVqGN+Wop7HfWK5M5QMbN/Wf59
   UK2BNnVtHY/s/LqkQpbOI/f7z7gtyMByBLoKga0BTADNkjX7V8qqP71C0
   Rss49C3Is8vzUa1OtEuY+1d4w8aYBbslZ+8Jh9YiXi/J2gIZIXC5f21JA
   mVnCBCXJ5p0CckM4Twn5qF4Pnxl/KmX2Sxgw3Gft9kptI9lwC/gd2N/MD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106036"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754773"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/17] base: Drop git intercept
Date: Wed, 11 May 2022 10:57:24 +0800
Message-Id: 
 <16686a05a6acc87725431b964ac6a0d1271d4716.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165477

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're going to use the environment approach for solving this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0982977dc052ad4e65608f6853f930121d08837a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/base.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 78cc8279dd..070341d1aa 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -339,7 +339,6 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
-PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
-- 
2.35.3


