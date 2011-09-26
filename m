Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8KJs-00013Z-7Y
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:10:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 16:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56120623"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2011 16:05:14 -0700
Message-ID: <4E810529.2000708@linux.intel.com>
Date: Mon, 26 Sep 2011 16:05:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: RPM and libmagic
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
X-List-Received-Date: Mon, 26 Sep 2011 23:10:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Mark,

I recently found a problem with RPM and libmagic, specificly the rpmdeps 
command as it's used in package.bbclass. The issue being that it was not 
finding the correct magic.mgc file.  I notice that we wrap the other RPM 
commands, but not rpmdeps.

Additionally, as I have discovered the wrappers that we have in place 
currently does not define a MAGIC environment variable to correct the 
location.

I know rpm and friends are an important part of OE packaging, so I 
wanted to check with you first about the correct location to set this, 
if we should use the MAGIC or pass a --define '%_rpmfc_magic_path ...' 
on the command line.

Please advise, I know you are traveling, and I can implement the change 
once we figure out the correct approach.

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



