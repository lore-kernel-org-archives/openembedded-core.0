Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sz2ba-0002Xs-3o
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 11:31:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2012 02:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,732,1336374000"; d="scan'208";a="177379048"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2012 02:19:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Wed, 08 Aug 2012 10:19:16 +0100
Message-ID: <2786047.OlgndmYjgV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1344374241.9756.302.camel@ted>
References: <007BD92917A2324FA403BCF9A464CF841FFA4167@ALA-MBA.corp.ad.wrs.com>
	<1344374241.9756.302.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: "Best" way to determine is building for target?
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
X-List-Received-Date: Wed, 08 Aug 2012 09:31:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 August 2012 22:17:21 Richard Purdie wrote:
> There is the new class-target override:
> 
> do_install_append_class-target {
>  ...
> }
> 
> 
> (along with class-native, class-cross and class-nativesdk)
> 
> These are due to replace the virtclass-xxxx variants but we've not
> gotten around to that yet. Its a relatively new addition to the system
> but should be a useful one and allow some cleanup.

It's worth noting that this is only supported in current master (will be in 
the next stable release). It was added in OE-Core revision 
cf332fd9bf685f6d42b11c1f0c37b934c7f5bcbe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


