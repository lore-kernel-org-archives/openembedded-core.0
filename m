Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UYOtk-0005TZ-At
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 00:56:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2013 15:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,607,1363158000"; d="scan'208";a="331267690"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.170])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2013 15:38:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 15:38:16 -0700
Message-Id: <1367620698-25780-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/2] udev-extraconf for packagegroups
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
X-List-Received-Date: Fri, 03 May 2013 22:56:24 -0000
X-List-Received-Date: Fri, 03 May 2013 22:56:24 -0000

Given the update from Phil for removing udev-extraconf from
the RRECOMMENDS, this adds it back to the appropriate packagegroups

Sau!

Saul Wold (2):
  packagegroup-core-lsb: Add udev-extraconf for LSB compatibility
  packagegroup-core-x11-sato: Add udev-extraconf to maintain
    compatibility

 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb  | 1 +
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 1 +
 2 files changed, 2 insertions(+)

-- 
1.8.0.2



