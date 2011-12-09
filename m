Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYxjm-0002yT-UB
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:31:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2011 02:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84652936"
Received: from unknown (HELO helios.localnet) ([10.252.122.20])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2011 02:24:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ulf@emagii.com
Date: Fri, 09 Dec 2011 10:24:37 +0000
Message-ID: <1426848.m8dnn0MDvm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EE1DE55.1040303@emagii.com>
References: <4EE1DE55.1040303@emagii.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Change in "openembedded-core/meta/files/common-licenses/LGPL-2.0" breaks opie-image
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
X-List-Received-Date: Fri, 09 Dec 2011 10:31:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 December 2011 11:09:25 Ulf Samuelsson wrote:
> NOTE: package libopie2-1.2.5-r16.0: task do_configure: Started
> ERROR: libopie2: md5 data is not matching for
> file:///home/ulf/projects/OE_2011-12-08/sources/openembedded-core/meta/files
> /common-licenses/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed ERROR:
> libopie2: The new md5 checksum is 9427b8ccf5cf3df47c29110424c9641a ERROR:
> libopie2: Check if the license information has changed in
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix

Argh. I guess this is one reason why pointing to those files in your recipes is 
not a good idea. FYI I basically bypassed LIC_FILES_CHKSUM in meta-opie 
because the opie-* recipes build parts of a single source tree and not all of 
those split parts contains a license file. For 1.2.6 I plan to make the 
splitting script add a license file where it is not present and once the 
recipes are updated this will never be a problem again.

For now I guess we will have to correct the checksums :/ I will try to do this 
soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


