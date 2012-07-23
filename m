Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StFnz-0008JD-1p
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:23:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2012 03:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="170096076"
Received: from unknown (HELO helios.localnet) ([10.252.121.29])
	by orsmga001.jf.intel.com with ESMTP; 23 Jul 2012 03:12:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 23 Jul 2012 11:12:29 +0100
Message-ID: <3029261.gDFRhJt4pK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207230606590.20207@oneiric>
References: <alpine.DEB.2.02.1207221512360.968@oneiric>
	<1965034.biL4ROLyBP@helios>
	<alpine.DEB.2.02.1207230606590.20207@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: any current standard on avoiding use of both "_append" and "+="?
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
X-List-Received-Date: Mon, 23 Jul 2012 10:23:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 July 2012 06:07:58 Robert P. J. Day wrote:
>   is this valid?
> 
> meta/classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append =
> "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"
> 
> does one not need the leading space in this context?

We're not adding to something that is space-separated in this instance. In any 
case, if we are adding anything with this statement (i.e. if PACKAGE_INSTALL 
contains "zypper") then " + 51200" is being added which does contain a leading 
space.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


