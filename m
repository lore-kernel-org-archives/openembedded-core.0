Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qwt53-0003fl-Px
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:52:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2011 02:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,284,1312182000"; d="scan'208";a="45294455"
Received: from unknown (HELO helios.localnet) ([10.255.18.141])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 02:47:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 10:47:10 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201108261047.10782.paul.eggleton@linux.intel.com>
Subject: Core image recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 09:52:06 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

Seems we have a few overlapping images in OE-core, with not especially obvious 
naming. The following two seem very similar in scope (basic X11 image):

meta/recipes-core/images/core-image-core.bb
meta/recipes-extended/images/core-image-basic.bb

Maybe we could just have one of these and call it core-image-x11-base or 
similar?

Then, we have core-image-base, which whilst it doesn't remove package 
management files, does not have "package-management" in its features, so it's 
not a whole lot different to core-image-minimal AFAICT.

Comments?

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


