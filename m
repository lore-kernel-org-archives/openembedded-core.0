Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PUx-0000f5-LO
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:46:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Aug 2012 03:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="136150558"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2012 03:34:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Mon, 20 Aug 2012 11:34:14 +0100
Message-ID: <1450996.gKDeWNK0nL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <50320C3E.8030009@nedap.com>
References: <50320C3E.8030009@nedap.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can't login??
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
X-List-Received-Date: Mon, 20 Aug 2012 10:46:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 12:06:54 Jaap de Jong wrote:
> Totaly stupid...
> Can't login as root.
> Have build an image with this:
> 
>     require recipes-core/images/core-image-minimal.bb
> 
>     # Use busybox as login manager
>     IMAGE_LOGIN_MANAGER = "busybox"
> 
>     # Include minimum init and init scripts
>     IMAGE_DEV_MANAGER = "udev"
>     IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
>     IMAGE_INITSCRIPTS = ""

Is "debug-tweaks" in IMAGE_FEATURES?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


