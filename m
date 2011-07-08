Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qf6dr-0005cn-Sg
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 10:42:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2011 01:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="25337669"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2011 01:38:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 09:38:37 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107071534.51372.paul.eggleton@linux.intel.com>
	<4E1693CC.8080403@gmail.com>
In-Reply-To: <4E1693CC.8080403@gmail.com>
MIME-Version: 1.0
Message-Id: <201107080938.37370.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 08:42:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 06:21:16 Khem Raj wrote:
> If oe-core never supported older kernel than 2.6.37 then setting it to
> 2.6.37 would be better IMO

It's not necessarily just about oe-core - it's about what layers get used on 
top, and some of those will be using kernels older than 2.6.37.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


