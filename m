Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SF8Fc-0000K9-DE
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:14:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Apr 2012 11:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84875015"
Received: from unknown (HELO helios.localnet) ([10.252.120.14])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Apr 2012 11:05:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 03 Apr 2012 19:05:23 +0100
Message-ID: <2362664.v47zrqRqfa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F7B38C7.6010909@mlbassoc.com>
References: <4F7B38C7.6010909@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Tue, 03 Apr 2012 18:14:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 April 2012 11:52:07 Gary Thomas wrote:
> Why are both opkg-native and rpm-native needed to build images?
> When I asked this previously, I was told that rpm was used because
> it has superior dependency tracking.  Fair enough (I guess), but
> then why is opkg required if I build an image using
>    PACKAGE_CLASSES = "package_rpm"

On the face of it it seems odd; however the reason you get both built no 
matter which you choose is we need some component of each one regardless of 
what packaging system is chosen:

* opkg is needed to provide update-alternatives-cworth
* rpm is needed to provide rpmdeps

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


