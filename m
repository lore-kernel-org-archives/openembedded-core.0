Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UCplo-0003F7-Th
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 12:10:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Mar 2013 02:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="299213839"
Received: from unknown (HELO helios.localnet) ([10.255.12.96])
	by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2013 02:54:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 05 Mar 2013 10:54:25 +0000
Message-ID: <1552403.roegCEAHfx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: always use oe.lsb.distro_identifier method
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
X-List-Received-Date: Tue, 05 Mar 2013 11:11:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 01 March 2013 18:42:22 Martin Jansa wrote:
> * even when /etc/redhat-release or /etc/SuSE-release exists
> * don't read /etc/lsb-release manually, NATIVELSBSTRING is not
>   reading it too

Unfortunately this has been merged before I had a chance to reply. FYI I put 
the code in here to read the files directly on purpose, because most distros 
bundle up the lsb_release tool with all of the LSB dependencies, so if you 
want to set up a headless server without some of the LSB dependencies (which 
include X11) you won't have the lsb_release tool and NATIVELSBSTRING is 
"Unknown". Yes, I know we have this problem with NATIVELSBSTRING already.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


