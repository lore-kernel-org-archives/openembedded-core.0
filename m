Return-Path: <pranav.tipnis@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 17FF576802
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 01:34:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 18:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,547,1464678000"; d="scan'208";a="1044523128"
Received: from pranav.fm.intel.com ([10.80.42.9])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2016 18:34:35 -0700
From: Pranav Tipnis <pranav.tipnis@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 18:28:40 -0700
Message-Id: <1471656521-52469-1-git-send-email-pranav.tipnis@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix corrupted path in startup.nsh for iso image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2016 01:34:33 -0000

Hi,

startup.nsh for iso image has corrupted text because of echo command.
This patch switches to printf similar to the one submitted by
Christopher Larson for non-iso image.

Regards,
Pranav

Pranav Tipnis (1):
  grub-efi.bbclass: Fix path in startup.nsh for iso image.

 meta/classes/grub-efi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


