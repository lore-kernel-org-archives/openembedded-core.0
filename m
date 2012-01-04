Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RiRKn-0007Jr-SP
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 14:56:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2012 05:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108642003"
Received: from unknown (HELO helios.localnet) ([10.252.122.96])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2012 05:49:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 04 Jan 2012 13:49:25 +0000
Message-ID: <1794876.VcZe9uqeJk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1325679862.28005.44.camel@phil-desktop>
References: <1325612539.28005.16.camel@phil-desktop>
	<1325678787.3555.134.camel@ted>
	<1325679862.28005.44.camel@phil-desktop>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: weird exports in bitbake.conf
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
X-List-Received-Date: Wed, 04 Jan 2012 13:56:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 January 2012 12:24:21 Phil Blundell wrote:
> There's also a bunch of historical Opie stuff which is currently getting
> exported globally:
> 
> export QTDIR = "${STAGING_DIR_HOST}/qt2"
> export QPEDIR = "${STAGING_DIR_HOST}"
> export OPIEDIR = "${STAGING_DIR_HOST}"
> export palmtopdir = "${libdir}/opie"
> export palmqtdir = "${palmtopdir}"
> 
> Paul, do you know if these variables are still necessary, whether they
> all need to be exported, and/or whether they could go in some opie class
> rather than bitbake.conf?

These are still necessary for building Opie, but I think they really belong in 
palmtop.bbclass in meta-opie, certainly not in oe-core. Unfortunately I just 
checked and a bunch of recipes in meta-opie refer to these without inheriting 
palmtop and will therefore break if these are removed. I want to tidy these up 
but can you give me until next week to do that?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


