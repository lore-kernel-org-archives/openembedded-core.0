Return-Path: <shashwatx.pandey@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B916378289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 06:19:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 22:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,393,1505804400"; 
   d="scan'208";a="7364015"
Received: from refkit.png.intel.com ([10.221.70.151])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2017 22:19:53 -0800
From: Shashwat Pandey <shashwatx.pandey@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 22:14:57 +0800
Message-Id: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Shashwat Pandey <shashwatx.pandey@intel.com>
Subject: [PATCH 0/1] Image_types: use ustar format in cpio command
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
X-List-Received-Date: Tue, 14 Nov 2017 06:19:53 -0000

Dear Maintainer(s),

Following patch fixes the ROOTFS size exceeding issue by using ustar format in cpio command under image_types.

The patch has been veified for the respective bug YOCTO #11674.

Please merge in master if this looks ok.

Thank you,
Shashwat Pandey

... ...
Cover letter on first submission:

Quoted from Bugzilla #11674, "The cpio utility was standardized in POSIX.1-1988, but it was omitted from POSIX.1-2001 because of its file size (and other) limitations. For example, the GNU version offers various output format options, such as "bin" (default, and obsolete) and "ustar", having a file size limitations of 2,147,483,647 bytes (2 GB) and 8,589,934,591 bytes (8 GB), respectively. Hence using ustar format.

Thanks,
Shashwat Pandey

Shashwat Pandey (1):
  Image_types: use ustar format in cpio command

 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


