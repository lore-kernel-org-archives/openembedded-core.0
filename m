Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RRPcJ-0002vy-0k
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:40:35 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2011 06:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="92465956"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2011 06:34:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:34:06 +0000
Message-ID: <1423361.Uzi15gmuni@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
	<CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:40:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wrote:
> Is ordering of PACKAGES relevant? If so, please enlighten me why.

It is. The packaging code reads this in order and the first package to match a 
file is the package that the file will go into; thus if you want to add a 
package that will include files that would normally be in one of the default 
packages you need to prepend to PACKAGES so that your new package gets the 
files first.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


