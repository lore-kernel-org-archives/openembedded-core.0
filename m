Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1109FC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 09:16:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.30888.1640251003520248314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 01:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Pk8zvfx1;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640251003; x=1671787003;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gAdV6NmA4zIGW2EcmGszgLr88+7/zNz4vOCYrbhGF2c=;
  b=Pk8zvfx1lZLKVaXScoI3nFkmmqptPKV3x9jSpl86QIZYKTmWerD9S2pV
   BOjpYQm7G9D9tR9F7nydwoi1atifBlFNs94mXipJr0D93IV7G6Xak95WB
   2TSFJGmkPMJaK/1JWyI0u0BfYz6XkYdtBFjYqg6yndsST5vQxMAscobhN
   VQQqIUZrajM2Kr6xurlLAi1w46nvx32VnPSu7uWIHAEdAGVBvbIgYIH2l
   8A1MdaMNP1gx5g3hEJ4PRoQhswqLFd+NF00YW3CjKc4JDxMRW59XiYXsK
   h+gpxetADvHRAGeNGtqbqThXCzc7vKZrgbhdzGRb2ep2vX79LV4/7qdgc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="221468671"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600";
   d="scan'208";a="221468671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 01:16:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600";
   d="scan'208";a="522025004"
Received: from cktan-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.139.152])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 01:16:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/1] Pull request
Date: Thu, 23 Dec 2021 17:16:26 +0800
Message-Id: <cover.1640250920.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 09:16:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159971

Please merge this change.

Thanks,

Anuj

The following changes since commit f6791df317e66b2d3fa88d3a038d888d4512305a:

  libpcre/libpcre2: correct SRC_URI (2021-12-10 12:45:13 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Anuj Mittal (1):
  busybox: upgrade 1.33.1 -> 1.33.2

 .../{busybox-inittab_1.33.0.bb => busybox-inittab_1.33.2.bb}    | 0
 .../busybox/{busybox_1.33.1.bb => busybox_1.33.2.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.33.0.bb => busybox-inittab_1.33.2.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.33.1.bb => busybox_1.33.2.bb} (95%)

-- 
2.33.1


