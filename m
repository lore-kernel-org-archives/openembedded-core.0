Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3oiR-0005Zz-TW
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 15:41:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2012 06:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="183490985"
Received: from unknown (HELO helios.localnet) ([10.252.121.105])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2012 06:29:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 21 Aug 2012 14:29:48 +0100
Message-ID: <1631931.9ZRM3ET91W@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
References: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 13:41:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 August 2012 15:15:42 Giuseppe Condorelli wrote:
> Hi,
> 
> today I restarted to work on my own OE meta layer and, after having pulled
> last two months changes is OE-Core, I was able to
> build nothing.
> This is the error I met
> 
> [****]$ bitbake core-image-minimal
> Pseudo is not present but is required, building this first before the main
> build
> NOTE: Error expanding variable do_unpack                        | ETA:
> 00:00:04
> NOTE: Error during finalise of
> /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> ERROR: Unable to parse
> /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> ERROR: Command execution failed: Exited with 1
> 
> I tried with bitbake version 1.15.2 and 1.15.3, the latest two versions.
> What about the "Error expanding variable do_unpack?" I've read something in
> previous message on mailing list
> but with no understanding.

This is almost certainly because of the whitespace changes in python 
functions. If you use master of OE-Core, you must use BitBake 1.15.3+; if you 
use denzil, you need to use 1.15.2. I'm a bit confused as to how you could 
have still got this error with 1.15.2 though since that change was not in that 
version (unless you are using master of OE-Core with BitBake 1.15.2).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


