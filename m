Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmT05-0005IL-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:59:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2011 08:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="33379960"
Received: from unknown (HELO helios.localnet) ([10.255.17.244])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2011 08:55:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 16:55:17 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
	<4E317BC3.3000809@mentor.com>
	<F026FC6D-A5BD-4F72-B3D2-76463F21779F@kernel.crashing.org>
In-Reply-To: <F026FC6D-A5BD-4F72-B3D2-76463F21779F@kernel.crashing.org>
MIME-Version: 1.0
Message-Id: <201107281655.17755.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 28 Jul 2011 15:59:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 16:40:34 Kumar Gala wrote:
> On Jul 28, 2011, at 10:09 AM, Tom Rini wrote:
> > On 07/28/2011 06:10 AM, Kumar Gala wrote:
> >> If a SOCKS5 gateway is needed for a proxy access like git it might also
> >> require authentication to the proxy via a password and username.  Adding
> >> SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> >> of the authentication request to occur when something like a git fetch
> >> is going through the proxy.
> >> 
> >> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > 
> > We also need to make sure these variables do NOT make it into the sstate
> > signature, which I think means one more change somewhere else (but I
> > don't recall where off-hand).
> 
> Yeah, I didn't find anything obvious while grepping.

I think what you're looking for is BB_HASHBASE_WHITELIST; however IIRC it's 
only really necessary if another variable refers to SOCKS5_*, or it is used in 
some bit of python/shell script; otherwise it shouldn't appear in the variable 
dependencies and thus won't make it's way into the sstate signature.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


