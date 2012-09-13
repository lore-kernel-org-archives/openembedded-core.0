Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCJIP-0000qK-V2
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 01:58:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2012 16:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,419,1344236400"; d="scan'208";a="192776818"
Received: from unknown (HELO helios.localnet) ([10.252.121.190])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2012 16:45:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 00:45:32 +0100
Message-ID: <1897044.003cSCLRiK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
References: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Rogerio Pimentel <rogerio.pimentel@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: Possible bug in bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 23:58:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 September 2012 15:41:15 Otavio Salvador wrote:
> Hello,
> 
> Rogerio and Daiane, here copied, found a bug in bitbake (we managed to
> reproduce it in denzil). The output in console when it happens can be
> seen at:
> 
> https://groups.google.com/d/msg/meta-fsl-arm/7W9bwxqslnk/htEiOcaJMH8J
> 
> The way to reproduce it is very easy:
> 
>  * bitbake gnutls -c cleansstate
>  * remove gnutls from download cache
>  * bitbake gnutls

Oh, hang on - now you mention gnutls, I think I know what it is. I suspect
if you apply either or both of these patches the issue will go away:

http://cgit.openembedded.org/openembedded-core/commit/?id=0de1827a9601143b090f751ea702fdb65a936b77
http://cgit.openembedded.org/bitbake/commit/?id=57055d337a2c9997a6e5d5bdabaec396e3e128e9

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


