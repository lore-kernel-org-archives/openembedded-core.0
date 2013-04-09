Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPZVv-00038V-3L
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:27:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315358565"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:09:31 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 17:09:42 +0300
Message-Id: <1365516584-5756-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2 v2]systemd: update-alternatives rework with update-alternatives.bbclass
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
X-List-Received-Date: Tue, 09 Apr 2013 14:27:28 -0000

Radu Moisan (2):
  systemd: use update-alternatives.bbclass
  systemd: set default.target to multi-user.target

 meta/recipes-core/systemd/systemd_199.bb |   40 +++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
1.7.9.5



