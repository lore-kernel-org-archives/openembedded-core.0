Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3peT-0006ZF-Lf
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 16:41:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Aug 2012 07:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="207546250"
Received: from unknown (HELO helios.localnet) ([10.252.121.105])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2012 07:29:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 21 Aug 2012 15:29:47 +0100
Message-ID: <5230023.n3da1VyTML@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAOHjBZv+nCryVbn63BVY9J9tru0xeJ5N9teeH1b_+F8uMUtZaQ@mail.gmail.com>
References: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
	<1631931.9ZRM3ET91W@helios>
	<CAOHjBZv+nCryVbn63BVY9J9tru0xeJ5N9teeH1b_+F8uMUtZaQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: error expanding variable do_*
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
X-List-Received-Date: Tue, 21 Aug 2012 14:41:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 August 2012 15:52:17 Giuseppe Condorelli wrote:
> > > [****]$ bitbake core-image-minimal
> > > Pseudo is not present but is required, building this first before the
> > 
> > main
> > 
> > > build
> > > NOTE: Error expanding variable do_unpack                        | ETA:
> > > 00:00:04
> > > NOTE: Error during finalise of
> > > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > > ERROR: Unable to parse
> > > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > > ERROR: Command execution failed: Exited with 1
> > > 
> > > I tried with bitbake version 1.15.2 and 1.15.3, the latest two versions.
> > > What about the "Error expanding variable do_unpack?" I've read something
> > 
> > in
> > 
> > > previous message on mailing list
> > > but with no understanding.
> > 
> > This is almost certainly because of the whitespace changes in python
> > functions.
> 
> What type of whitespace changes you are talking about?

Please see:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025962.html

> > If you use master of OE-Core, you must use BitBake 1.15.3+; if you
> > use denzil, you need to use 1.15.2. I'm a bit confused as to how you could
> > have still got this error with 1.15.2 though since that change was not in
> > that version (unless you are using master of OE-Core with BitBake 1.15.2).
>  
> I've pulled last two months updates for master OE-Core branch and I tried
> with both bitbake 1.15.2 and 1.15.3 versions.

I just tried BitBake 1.15.3 with OE-Core latest master and I do not see that 
error. Are you using latest master of OE-Core or some specific revision? Can 
you provide me with any other information that would help me to reproduce the 
issue? If you check out OE-Core in a separate new directory and use BitBake 
1.15.3 do you still get the same issue?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


