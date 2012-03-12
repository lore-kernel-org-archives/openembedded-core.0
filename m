Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S79ZH-0005cD-S6
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 19:02:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2012 10:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117858176"
Received: from unknown (HELO helios.localnet) ([10.252.123.166])
	by azsmga001.ch.intel.com with ESMTP; 12 Mar 2012 10:53:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Mar 2012 17:53:11 +0000
Message-ID: <1532562.QfbElkX6OP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F56C49C.4000504@gmail.com>
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
	<50d2b32b6d5367e5822c396d28a78ea54cb4ea40.1331078069.git.paul.eggleton@linux.intel.com>
	<4F56C49C.4000504@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] formfactor: use full path to fbset
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
X-List-Received-Date: Mon, 12 Mar 2012 18:02:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 March 2012 18:14:52 Khem Raj wrote:
> On 03/06/2012 03:55 PM, Paul Eggleton wrote:
> > When using rootless X, /usr/sbin is not in PATH and thus running "fbset"
> > will fail; so specify /usr/sbin/fbset instead.
> 
> just curious why is /usr/sbin omitted from PATH ?

With the rootless X implementation we have, you're logged in as "xuser" 
instead of root. I guess our default is to not include /sbin and /usr/sbin in 
PATH for non-root users.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


