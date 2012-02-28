Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2PQP-0005KF-PP
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 16:57:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2012 07:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130422854"
Received: from unknown (HELO helios.localnet) ([10.252.123.68])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2012 07:48:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:48:42 +0000
Message-ID: <1808929.8Oa6VYabAJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
MIME-Version: 1.0
Subject: Including the kernel in the image
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
X-List-Received-Date: Tue, 28 Feb 2012 15:57:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

For some boot configurations (e.g. kexecboot) having the kernel binary in the 
image is required. In OE Classic, task-boot used to always include the kernel 
binary in the image (via RRECOMMENDS, so it could be uninstalled). We don't 
currently have this in OE-Core and I was wondering what the new preferred way 
to have this done would be.

Obviously we could go and add it to various images or even to task-core-boot 
again but I'm not sure that's ideal. Wanting the kernel in the image is really 
machine-specific (or to be precise, boot method specific); so I'm wondering if 
adding it to MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS for all machines likely to 
need it is the right thing to do?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


