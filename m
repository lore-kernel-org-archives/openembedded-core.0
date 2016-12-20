Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 104F077374;
	Tue, 20 Dec 2016 20:23:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2016 12:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,380,1477983600"; d="scan'208";a="45312768"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.176.131])
	by fmsmga006.fm.intel.com with ESMTP; 20 Dec 2016 12:23:32 -0800
Message-ID: <1482265407.12532.55.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 12:23:27 -0800
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: Yocto Discussion <yocto@yoctoproject.org>
Subject: Deprecating hddimg/isoimg
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
X-List-Received-Date: Tue, 20 Dec 2016 20:23:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Folks,

For years we have wanted to get rid of the hddimg/iso type, we now have
the WIC tool integrated into OE-Core such that we can build properly
partitioned disk images.

Historically the hddimg was a single FAT filesystem that contained
boot-loader, the kernel and a rootfs.img file for booting Intel Arch
machines. This has a 4G limit due to the FAT limitations and we are
starting to see this limit hit more frequently.

Are there any other usages out there that we are not aware of?

Any reasons that this should not get deprecated at this time?

Sau!


