Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D1CA27595F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 12:15:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2015 05:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,601,1427785200"; d="scan'208";a="745528889"
Received: from lpalcu-linux.rb.intel.com ([10.237.104.62])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2015 05:15:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Ross Burton <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 15:15:17 +0300
Message-Id: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] scripts: Add cleanup-downloads-dir tool
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
X-List-Received-Date: Fri, 12 Jun 2015 12:15:24 -0000

Hi all,

A few days ago I noticed I had no space on disk and decided to make some
space. Since my downloads directory was never deleted since denzil, it
consumed 25GB of space which I needed. However, I wanted to delete only old
and unneeded tarbals/git repos and keep the ones that my current Yocto
version needed, so I wrote this tool.

After running it, my downloads size became 7GB.

I also tested on a brand new downloads directory, after doing a
core-image-minimal build, and it didn't find any obsolete files (which
is kind of normal). :)

I hope someone finds it helpful. Also, I encourage you to give it a
test. Don't worry, it will not delete anything unless you allow it and
you can review the list of files to be removed. If you see anything
suspicious, let me know.

laurentiu

Laurentiu Palcu (1):
  scripts: Add cleanup-downloads-dir tool

 scripts/cleanup-downloads-dir | 158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100755 scripts/cleanup-downloads-dir

-- 
1.9.1


