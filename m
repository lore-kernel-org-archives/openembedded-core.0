Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXee2-00037a-34
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 22:28:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 13:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148096843"
Received: from rchatre-mobl2.amr.corp.intel.com (HELO [10.7.198.147])
	([10.7.198.147])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 13:18:13 -0700
Message-ID: <4FBE9783.1080107@linux.intel.com>
Date: Thu, 24 May 2012 13:18:11 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: [2011-1 PULL REQUEST] Fixes for the 2011-1 branch
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
X-List-Received-Date: Thu, 24 May 2012 20:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I've been working on closing bugs filed against Poky Edison/OE-Core 
2011-1 and would like to request a merge of the changes I have.

Rather than clutter the list with patches for such an old branch I'm 
just including links to the git repository and a summary of changes here.

Hope that's OK.

http://git.openembedded.org/openembedded-core-contrib/log/?h=josh/edison

Changes include:
* Back-ported several useradd and sstate patches to fix dependency 
ordering, etc. when building images from shared state
* A patch for syslinux to fix building on hosts with newer 3.x kernels
* Zlib patch to ensure the pc file is shipped in the -dev package
* Various license fixes
* Fix for ipk SDK builds

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


