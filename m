Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8711C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 02:09:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.2429.1654049367139762903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 19:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VJjrDR2k;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654049367; x=1685585367;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oQa2MMJiDxlYbqfyjSPTX9Zhq2woWyuqWLuqVA9iv2w=;
  b=VJjrDR2kWmbmIuTYHzg2u/IbGckCYiKvs8+OMFX2uXCvl61uYbOcIA7p
   hK5DjbPELm7cl0D7v08uVrDYUPROTvChsbouYNwdg7uTBferLTOf/tHpn
   iv8A4I8xADc2SG32yqFo9K/tn27ZGItfYkiDgWFmmvOyoMhLq7E5FmJIg
   99iTsJKNfu3TLVsZrjTdgSIvkUtsb9Q9LFeLKimmmebggHHeEjZ2qK8jR
   24I5QxLa77FO7bzjw+lwjHA08Vg6QqDa/gPEHdqKaUkZy6CmbEStjpdu5
   j+hUKVTZMlbF4hNrfFYo+BH7TEbIcy3KF5fjFlOlNgYE3IDtrTr9rXN8A
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263081171"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600";
   d="scan'208";a="263081171"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 19:09:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600";
   d="scan'208";a="823540489"
Received: from rpuvenes-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.250.27])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 19:09:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/12] Pull request (cover letter only)
Date: Wed,  1 Jun 2022 10:09:19 +0800
Message-Id: <cover.1654049055.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 02:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166344

The branch has reached EOL and will not be actively maintained after
this merge.

Thanks,

Anuj

The following changes since commit e0d5d93a18d1682f3393fc10133f08009f008601:

  perf: sort-pmuevents: allow for additional type qualifiers and storage class (2022-05-10 21:44:32 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Bruce Ashfield (6):
  linux-yocto/5.10: features/security: Move x86_64 configs to separate
    file
  linux-yocto/5.10: update to v5.10.110
  linux-yocto/5.10: base: enable kernel crypto userspace API
  linux-yocto/5.10: update to v5.10.112
  linux-yocto: enable powerpc debug fragment
  linux-yocto/5.10: update to v5.10.113

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20220411 -> 20220509

Felix Moessbauer (1):
  wic/plugins/rootfs: Fix permissions when splitting rootfs folders
    across partitions

Khem Raj (1):
  linux-yocto: Enable powerpc-debug fragment for ppc64 LE

Ovidiu Panait (1):
  openssl: upgrade 1.1.1l -> 1.1.1n

Ranjitsinh Rathod (1):
  openssl: Minor security upgrade 1.1.1n to 1.1.1o

Richard Purdie (1):
  vim: Upgrade 8.2.4681 -> 8.2.4912

 .../{openssl_1.1.1l.bb => openssl_1.1.1o.bb}  |  3 ++-
 ...20220411.bb => linux-firmware_20220509.bb} |  4 +--
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 27 ++++++++++---------
 meta/recipes-support/vim/vim.inc              |  4 +--
 scripts/lib/wic/plugins/source/rootfs.py      |  5 +++-
 7 files changed, 32 insertions(+), 25 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1o.bb} (98%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

-- 
2.35.3


