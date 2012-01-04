Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiLOQ-0003KN-Br
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 08:36:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 23:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92153941"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 03 Jan 2012 23:28:51 -0800
Message-ID: <4F03FFB2.8040606@linux.intel.com>
Date: Tue, 03 Jan 2012 23:28:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Recent xserver-kdrive failure and util-macros update
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
X-List-Received-Date: Wed, 04 Jan 2012 07:36:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


We seem to have a relatively new failure in xserver-kdrive, which 
appeared in the last set of change.  I tried to run though a bisect but 
was not able to find the problem.

The problem seems to be related to configure.ac setting of 
XSERVER_CFLAGS='$(CWARNFLAGS)' and then using -Werror=address, which is 
what causes the failure.

This seems to be related to the util-macros update to 1.16, which adds 
more warnings to errors.  Since we are still using the older 
xserver-kdrive, there are warnings that are now errors with the update.

We could patch the current xserver-kdrive, revert the 1.16 update to 
util-macros or update xserver-kdrive (which is in the works, but I think 
had some issues).  This also seems to affect the libxp package on x86-64.

Thoughts, I know we don't like to revert, but we may have to in this 
case as we don't have the kdrive update yet and would need to further 
investigate the libxp failure.

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



