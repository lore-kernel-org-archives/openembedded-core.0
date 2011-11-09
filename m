Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RO5bO-0005Z5-DM
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:41:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 02:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72663681"
Received: from unknown (HELO helios.localnet) ([10.252.121.103])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2011 02:35:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 10:35:36 +0000
Message-ID: <3224988.0pL446l53o@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
References: <4EB9DF31.7070904@intel.com>
	<19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: openssl 1.0?
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
X-List-Received-Date: Wed, 09 Nov 2011 10:41:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 09 November 2011 10:28:21 Koen Kooi wrote:
> The openssl in meta-oe is working fine, just keep in mind that the SOVERSION
> changed, so you need a PR bump for everything that links against openssl
> when switching.

Last I checked it still needed the fix we have in OE-core to work with SELinux 
enabled for the -native case. (I know, I know, send patches...)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


