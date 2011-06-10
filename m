Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QV3HV-0004PT-Pr
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 17:05:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2011 08:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,347,1304319600"; d="scan'208";a="10848751"
Received: from unknown (HELO helios.localnet) ([10.255.13.133])
	by azsmga001.ch.intel.com with ESMTP; 10 Jun 2011 08:02:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 10 Jun 2011 16:02:26 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1307639649.git.mark.hatle@windriver.com>
	<f4bf925e5ef24493da42015e1be93d59b85f3a44.1307639649.git.mark.hatle@windriver.com>
In-Reply-To: <f4bf925e5ef24493da42015e1be93d59b85f3a44.1307639649.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Message-Id: <201106101602.27104.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo: Fix problem related to realpath
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
X-List-Received-Date: Fri, 10 Jun 2011 15:05:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 09 June 2011 18:15:45 Mark Hatle wrote:
> --- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> @@ -1,9 +1,10 @@
>  require pseudo.inc
>  
> -PR = "r0"
> +PR = "r1"

I may be mistaken, but it seems to me that every time we need to rebuild 
pseudo it results in a race when an older version of pseudo is present. We 
handle building pseudo on its own first if it's not present, however if it just 
needs updating we go ahead and rebuild it at the same time as building other 
packages, and if it just happens that pseudo is needed when it's being built 
-> bang. At least that's my assumption given that since the last batch of 
updates, my rebuild of perl-native failed at the same time as pseudo's 
do_compile with a large number of "ERROR: ld.so: object 'libpseudo.so' from 
LD_PRELOAD cannot be preloaded: ignored" messages.

Am I right in that there's currently no mechanism to work around this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


