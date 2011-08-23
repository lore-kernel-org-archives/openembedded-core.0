Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvtrV-0003q3-DO
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 18:30:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 09:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41031338"
Received: from unknown (HELO helios.localnet) ([10.255.18.129])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 09:25:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 17:25:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4E537A0E.2040605@gmail.com>
In-Reply-To: <4E537A0E.2040605@gmail.com>
MIME-Version: 1.0
Message-Id: <201108231725.13418.paul.eggleton@linux.intel.com>
Subject: Re: Wiki seems dead. is openembedded wiki still active?
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
X-List-Received-Date: Tue, 23 Aug 2011 16:30:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 10:59:42 Klausfpga wrote:
> Am I using the correct url? (it's at least the url also mentioned in
> wikipedia)
> 
> Is the Wiki just temporarily down and I was just unlucky enough to try
> to connect at the wromg time?

Yes that's the correct link, although the website is temporarily down; the 
appropriate people have apparently been informed and hopefully can fix it soon.

However the website/wiki can still be accessed under 
http://wiki.openembedded.org.
 
> What I wanted to find out on the wiki:
> 
> - what branch / tag to checkout to have a consitant verison

I'm not quite sure what you're asking here. 

FYI OE is in the middle of a transition of sorts; we're moving to a more 
modular metadata structure based around a smaller common core (OE-Core). For 
more information please see this page:

  http://wiki.openembedded.org/index.php/OpenEmbedded-Core

For new development work we would strongly recommend OE-core as a base, 
allowing you greater flexibility as well as avoiding some legacy cruft.

> - what to use as starting point for a minimalist x86 system being able
> to run under qemu (x86)

"Minimalist" is somewhat subjective. OE-core alone provides a "qemux86" 
machine target, a distro-less basic configuration and a "core-image-minimal" 
image that provides a basic console-only system without package management.

> - How to add a gnu toolchain package to my minimalist target system

I think this is a case of adding "tools-sdk" to your IMAGE_FEATURES; someone 
else might be able to offer more help here.

> - what to use as starting point for a minimalist arm11 system being able
> to run under qemu (x86)

Same as above except use "qemuarm" as the machine.

> - what is the recommended way to run bitbake in a 64 bit environment
> (psyco is not working). Is pypy an option?

There's no specific recommended way; the psyco warning was just a warning and 
in any case if you're using a recent version of BitBake (as you need to for 
OE-core) then Psyco support has been removed and you won't get the warning.

> - what are the correct mailing lists for such questions

For OE-classic discussion as well as layers above OE-core, use the 
openembedded-devel mailing list. For OE-core use this list (openembedded-
core). I suspect the openembedded-core list will merge into openembedded-devel 
at some point in the near future.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


