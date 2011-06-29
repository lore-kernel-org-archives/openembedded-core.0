Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qc1w8-0003O0-7K
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:04:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 14:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,445,1304319600"; d="scan'208";a="19843916"
Received: from doubt.jf.intel.com (HELO [10.7.199.165]) ([10.7.199.165])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 14:00:56 -0700
Message-ID: <4E0B9288.9010001@linux.intel.com>
Date: Wed, 29 Jun 2011 14:00:56 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Consistent MAC on Beagleboard xM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 21:04:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

We have an open bug for a consistent MAC on the Beagleboard xM on the
yocto project bugzilla. I want to track whatever solution you have or
plan to take. I didn't see a fix in linux-omap_2.6.39 at a quick scan
through the patches. There are two approaches suggested in Comment 3
of the bug:

http://bugzilla.yoctoproject.org/show_bug.cgi?id=1073

They are:
https://bugs.launchpad.net/ubuntu/+source/linux-linaro/+bug/687396
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026240.html

Do you already have plans to address this? If not, do you have any
opinion on the proposed solutions in the bug?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


