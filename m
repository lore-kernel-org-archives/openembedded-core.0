Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3z9H-0001HH-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 02:50:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2012 17:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,806,1336374000"; d="scan'208";a="183633491"
Received: from unknown (HELO helios.localnet) ([10.252.121.101])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2012 17:38:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>
Date: Wed, 22 Aug 2012 01:38:11 +0100
Message-ID: <7921445.r3rDbWunGC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <50341DD7.1000405@intel.com>
References: <5033B589.8080502@intel.com> <5033C94D.4080902@intel.com>
	<50341DD7.1000405@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemu gl changes are broken.
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
X-List-Received-Date: Wed, 22 Aug 2012 00:50:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 August 2012 16:46:31 Scott Garman wrote:
> On 08/21/2012 10:45 AM, Scott Garman wrote:
> > On 08/21/2012 09:21 AM, Scott Garman wrote:
> >> Hello,
> >> 
> >> I tried building some images overnight with the latest master, and could
> >> not get them to run this morning with qemu - I got an odd error that a
> >> VNC server was started instead?
> >> 
> >> Just on a hunch, I reverted the following commits:
> >> 
> >> qemu: Fix broken accidental path move
> >> qemu-git: Drop GL passthrough support
> >> qemu-0.15: Drop GL passthrough support
> >> 
> >> rebuilt qemu-native, and now qemu works correctly.
> >> 
> >> I have no idea why qemu is trying to fallback on a VNC server, as I did
> >> not have one running on my machine. I know we use VNC for our
> >> autobuilder sanity tests, but those haven't been integrated into the
> >> runqemu scripts as far as I can tell.
> > 
> > This may need further research, I seem to have it working on another
> > machine. I'll report back once I've learned more.
> 
> Ok, I can no longer reproduce this issue anymore, even on the original
> machine. Figures. :-/

Is this perhaps what happens when DISPLAY is not set? Just a guess...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


