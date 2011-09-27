Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8YXm-0007CZ-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 16:21:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2011 07:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="57059529"
Received: from unknown (HELO helios.localnet) ([10.252.120.163])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2011 07:16:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 15:16:15 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1317131040.git.edwin.zhai@intel.com>
	<20110927140224.GA10415@edwin-gen>
In-Reply-To: <20110927140224.GA10415@edwin-gen>
MIME-Version: 1.0
Message-Id: <201109271516.15542.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] remove gnome-vfs completely
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
X-List-Received-Date: Tue, 27 Sep 2011 14:21:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 27 September 2011 15:02:24 Zhai, Edwin wrote:
> BTW,
> I found many recipes in meta-demoapps are not maintained: no
> LIC_FILES_CHKSUM/SRCREV, no workable SRC_URI, and even no layer.conf under
> meta-demoapps.
> 
> We need more test for demoapps, and require each commit to take care of
> them, or else remove them completely...

My personal opinion as far as OE-core is concerned is that the whole of meta-
demoapps should be removed; perhaps the recipes within it can be provided in 
another layer (which we can then use within the Yocto project if desired) but 
they do not belong in OE-core IMHO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


