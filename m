Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgxTT-0002aW-46
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:19:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 04:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,524,1304319600"; d="scan'208";a="25336757"
Received: from unknown (HELO helios.localnet) ([10.255.17.187])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 04:15:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:15:26 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201107131215.26777.paul.eggleton@linux.intel.com>
Subject: RFC: classes cleanup
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
X-List-Received-Date: Wed, 13 Jul 2011 11:19:27 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I was looking through classes/ the other day and I noticed a few that probably 
don't need to be in oe-core. The list I came up with:

* base_srpm.bbclass - unused, refers to missing rpm_core.bbclass
* ccdv.bbclass - unused, not sure what this is for?
* flow-lossage.bbclass - unused, looks obsolete (refers to gcc 3.4)
* mozilla.bbclass - should this be in an upper layer?
* openmoko*.bbclass - should be in an upper layer
* patcher.bbclass - obsolete?
* singlemachine.bbclass - obsolete?
* srec.bbclass - appears to be something LinuxMIPS related. Not sure it 
belongs in oe-core.
* tmake.bbclass - obsolete? even oe-dev doesn't use this AFAICT...
* xfce.bbclass - should this be in an upper layer?
* xlibs.bbclass - unused, obsolete?

Comments? Any others we ought to look at removing?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


