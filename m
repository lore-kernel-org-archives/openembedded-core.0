Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTaAg-0006Xi-P2
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 16:25:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2012 08:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,687,1344236400"; d="scan'208";a="240847281"
Received: from unknown (HELO helios.localnet) ([10.252.122.123])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2012 08:11:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 31 Oct 2012 15:11:51 +0000
Message-ID: <14856362.dnuymTkSFD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAAQYJAu+7f+HLBp5xTw8fQk7H5b91=pc5pbkvMB4wEXXhcCpEQ@mail.gmail.com>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
	<CAAQYJAvPAht4KDRwcYUyTjYteQu7wiXbbE4JT8H2+rR7tv=KNw@mail.gmail.com>
	<CAAQYJAu+7f+HLBp5xTw8fQk7H5b91=pc5pbkvMB4wEXXhcCpEQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Wed, 31 Oct 2012 15:25:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 October 2012 00:23:52 Andrea Adami wrote:
> On Sun, Oct 28, 2012 at 1:59 AM, Andrea Adami <andrea.adami@gmail.com> 
wrote:
> > On Sun, Oct 28, 2012 at 1:55 AM, Andrea Adami <andrea.adami@gmail.com> 
wrote:
> >> Since commit c76da87511d2668479745c2f18b8a9b8116c7489 (terminal: Add
> >> support for running custom terminals.) screen opens also in the master
> >> terminal, waiting for input.
> >> 
> >> Reverting the patch fixes the funny behavior.
> >> 
> >> This on Gentoo, using xterm.
> > 
> > Sorry, is gnome-terminal on this host.
> > 
> >> Regards
> >> 
> >> Andrea
> 
> Same happens using Ubuntu as build host: bitbake -c devshell foo
> launched in uXterm does spawn two gnome-terminals.
> This has also other bad effects on do_menuconfig task for linux-yocto.
> 
> I can confirm that reverting c76da87 fixes the things.

Confirmed here. I have filed a bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3371

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


