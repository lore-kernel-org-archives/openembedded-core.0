Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1RuQmu-000418-Pa; Mon, 06 Feb 2012 16:47:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2012 07:39:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114643619"
Received: from unknown (HELO helios.localnet) ([10.252.122.246])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2012 07:39:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 06 Feb 2012 15:39:24 +0000
Message-ID: <1408084.uBj8QddilE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 15:47:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 04 February 2012 10:19:38 Khem Raj wrote:
> recipes-devtools/python/python-setuptools_0.6c11.bb
> 
> one in meta-oe has
> NATIVE_INSTALL_WORKS = "1"
> I dont know if this is needed anymore if not then this can be delete
> from meta-oe

NATIVE_INSTALL_WORKS is no longer needed for OE-Core, so this can go.
 
> recipes-extended/tzcode/tzcode-native_2011i.bb
> 
> We are good with one for oe-core I think Andrea is working on it.

I talked to Koen at FOSDEM and apparently he prefers having a symlink rather 
than a copy for the timezone file. I can't express an opinion one way or 
another but it sounds like this one aspect still needs to be resolved - should 
this be selectable?
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


