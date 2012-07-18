Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SrQgX-0006Lt-Nm
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:36:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2012 02:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123806209"
Received: from unknown (HELO helios.localnet) ([10.252.121.20])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2012 02:25:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, "Purdie,
	Richard" <richard.purdie@intel.com>
Date: Wed, 18 Jul 2012 10:25:21 +0100
Message-ID: <4121168.JiPW7RAvvb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <500602C8.6090805@linux.intel.com>
References: <5005DFF1.3050304@linux.intel.com>
	<500602C8.6090805@linux.intel.com>
MIME-Version: 1.0
Cc: "yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>
Subject: Re: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 09:36:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 July 2012 17:26:48 Saul Wold wrote:
> The "ls: cannot access" are coming from license.bbclass, seems to be a
> timing issue related to the last patch here, not sure what triggered it
> here (I am not seeing it on other builds!)
> 
> Paul's Change:
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgw%2Fstage&qt=
> grep&q=license

It seems to me the problem is that the pkgdata is in non-debian renamed format 
whereas license.bbclass by virtue of using the final list of installed packages 
is expecting to use the post-rename names (e.g. pkgdata/*/runtime contains 
zlib-dev whereas the installed package is called libz-dev). Given that this 
renaming happens much earlier in the process, I'm not sure how my change could 
have triggered this or why it would only be a problem sometimes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


