Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tj5Ny-0007o9-G7
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 10:47:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2012 01:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,273,1355126400"; d="scan'208";a="233337675"
Received: from unknown (HELO helios.localnet) ([10.252.122.249])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2012 01:32:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 13 Dec 2012 09:32:28 +0000
Message-ID: <1444001.YHLHxItvIU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1212122024470.1116@oneiric>
References: <alpine.DEB.2.02.1212122024470.1116@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: Finally remove support for deprecated "pnum=".
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
X-List-Received-Date: Thu, 13 Dec 2012 09:47:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 December 2012 20:25:50 Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   someone else is welcome to apply this if it seems appropriate.
> 
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index ed12802..31f76f6 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -33,9 +33,6 @@ def src_patches(d, all = False ):
>          patchparm = {'patchname': patchname}
>          if "striplevel" in parm:
>              striplevel = parm["striplevel"]
> -        elif "pnum" in parm:
> -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in
> '%s', please use 'striplevel'" % url) -            striplevel =
> parm["pnum"]
>          else:
>              striplevel = '1'
>          patchparm['striplevel'] = striplevel

I'm not sure I see a pressing need to remove this support, but I am puzzled as 
to why the "deprecated" message is commented out - that should definitely be 
fixed if nothing else.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


