Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3R8b-0003OI-6k
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 14:31:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2012 05:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206380363"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 05:19:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Mon, 20 Aug 2012 13:19:15 +0100
Message-ID: <2859322.LbdxQNuYuz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5032290C.1090403@nedap.com>
References: <50320C3E.8030009@nedap.com> <1450996.gKDeWNK0nL@helios>
	<5032290C.1090403@nedap.com>
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
X-List-Received-Date: Mon, 20 Aug 2012 12:31:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 14:09:48 Jaap de Jong wrote:
> What I'm trying to do is get an image that looks as much the same as the
> one I made under oe-classic.
> Perhaps my approach is not the way to go?
> I was using base-image.bb under oe-classic as the basis and added some
> packages to get to our needed set of applications.

There's nothing wrong with that - you can construct the image in whatever 
manner you wish. You may wish to take advantage of the new functionality 
provided by core-image.bbclass, but that is entirely optional.

> On 08/20/2012 12:34 PM, Paul Eggleton wrote:
> > Is "debug-tweaks" in IMAGE_FEATURES?
> 
> (To answer your question. No, it is not. More of that in my previous mail)

The way things work now, zap_root_password is automatically run when post-
processing the image, unless debug-tweaks is in IMAGE_FEATURES (typically, one 
would add this via EXTRA_IMAGE_FEATURES in local.conf). This is a replacement 
for DISTRO_TYPE = "debug" / "release" in OE-Classic. The assumption is that if 
you're actually producing a production image, you really don't want people to 
be able to log into it as root with no password.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


