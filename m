Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkxiG-00012n-Ts
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:00:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2012 05:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,309,1355126400"; d="scan'208";a="266212985"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2012 05:45:21 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 31F8356038C; Tue, 18 Dec 2012 15:45:35 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: daniel@fooishbar.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 15:45:28 +0200
Message-Id: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Wayland/Weston initial patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 14:00:05 -0000


These three patches enable wayland and weston building on top of 
mesa-dri and X.

Weston runs normally with the X11 backend, and have KMS mode setting
on real hardware (kernel 3.0 on Intel 2nd Generation Core).

Please review these patches and let me know if you see improvements.

I'll resubmit together with kernel changes when I have a stable 
version for running directly on hardware.


