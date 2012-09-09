Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TAf6W-0002Ux-TM
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 12:51:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2012 03:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,394,1344236400"; d="scan'208";a="219704219"
Received: from unknown (HELO helios.localnet) ([10.252.121.165])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2012 03:38:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Sun, 09 Sep 2012 11:38:34 +0100
Message-ID: <9694833.IKNPhYkqXp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347183484.4396.257.camel@x121e.pbcl.net>
References: <1347183484.4396.257.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk: Avoid leaving run-postinsts around for non-O_P_M images
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
X-List-Received-Date: Sun, 09 Sep 2012 10:51:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 09 September 2012 10:38:04 Phil Blundell wrote:
> If all postinsts have already been run during rootfs construction then
> there's no point in having run-postinsts in the installed system.
> Clean it up at the same time that update-rc.d and suchlike are being
> removed.

Good patch, but one minor nit-pick: since OE-Core doesn't use the 
ONLINE_PACKAGE_MANAGEMENT variable anymore (although I see Angstrom still 
preserves it) I would suggest not referring to O_P_M.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


