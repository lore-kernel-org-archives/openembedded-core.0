Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF73DC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:11:53 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.3712.1639995111798813083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Bqq/cF1E;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639995111; x=1671531111;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c2RGCVgcJdfRKJSlFUq3YbILR4X1TiQ2/ON0acn2Tl8=;
  b=Bqq/cF1ELwcN7B2SpDxCJU+Y0kT9WPVsbCDiBIjkd2YHSRTqeacY4JB6
   gKBN+hjgm6gGZgCOLvU5Vxdy5uh6mR2xDIJWcd7CwpisuTzaB5xuAhBFS
   UUS724syxoaQSk7Xs2/LxBcPz6rU2UZWl5DEbZujcc5WpQ0XIxx8uqiln
   wIX4ay7M5eWfE8+q6SgY9dFKoK5m/fJB6MyeJ7yJCIO1EjycUm25Ufekm
   V+lBHhEuYtCGdPwDyv2YW/d43mvm4oyWbjsfsq1c5M9ciM+ytBJQway9i
   tnOGwqczaPFPm3iYciViV3uqSbzWDYzj5V+GMjOcVqL4BR0C6BkDPSqky
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="239945613"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600";
   d="scan'208";a="239945613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 02:11:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600";
   d="scan'208";a="663573872"
Received: from chunyigo-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.136.215])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 02:11:49 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/1] Pull request
Date: Mon, 20 Dec 2021 18:11:42 +0800
Message-Id: <cover.1639994009.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 10:11:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159857

This includes just a busybox upgrade to address some security issues.

Tested on autobuilder and no issues found.

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


