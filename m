Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E40C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 11:24:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.8756.1651231457960502857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZUjtCmUs;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651231458; x=1682767458;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0lKo5KbXzuKkMwgQRzUflRmIVPOt9JpDltRQWMSi7sY=;
  b=ZUjtCmUszfoxsga9X8uCljV4JnVGJX5XFkse8wi2ZSb0pGGugg9XCdXE
   OBYVewveHiyeiUUFWhYK8NuWgiuqut97ShBS0zlULvCZAyZpTGgSg6BUI
   bLI3gS1+2gmtFYJyp+wsXJb5rBgybu3hJzWZ2flPsz0FRKXaRCPZV/ARS
   fhcxfm5Bw4yeBZchznYwtn9k26fZR4XxkqBtiXSba2CH7M1e2YJiW/urT
   wQz1vnWYCtcHCS+EzYLUafbpz/HCkafCh0xRn5VoLKpDHR1i8v3APxV2y
   d0GqFpmp+NIi0Rm3pY+OJdcFySVKOtQ/IpdH1y+FwF0vJcbBZFffXdKN8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291785715"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="291785715"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:19:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="684639203"
Received: from fsuhimi-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.146.39])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:19:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/1] Pull request
Date: Fri, 29 Apr 2022 19:19:26 +0800
Message-Id: <cover.1651231002.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 11:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165004

A single change to fix issues with git before 3.4.4. 

Please review and merge. Tested on autobuilder and no problems seen:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3591

Thanks,

Anuj

The following changes since commit d411ea3114cde55ae68a2d437e854c5b17f78131:

  shadow-native: Simplify and fix syslog disable patch (2022-04-25 14:09:47 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Ross Burton (1):
  bitbake.conf: mark all directories as safe for git to read

 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.35.1


