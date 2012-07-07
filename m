Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SnXhk-0006kt-4U
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 18:17:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2012 09:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119845576"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jul 2012 09:06:47 -0700
Message-ID: <4FF85E97.9010202@linux.intel.com>
Date: Sat, 07 Jul 2012 09:06:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207071126550.20571@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207071126550.20571@oneiric>
Subject: Re: what's the easiest way to see the difference some local configuration makes?
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
X-List-Received-Date: Sat, 07 Jul 2012 16:17:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2012 08:43 AM, Robert P. J. Day wrote:
>
>    i recall that there's a current request to be able to list the
> packages and versions that relate *just* to the current target and
> machine, so i'm looking for any other way to do this so students can
> see the difference for themselves.
>
>    for example, i'm starting with a configuration of "qemuarm", and i
> can do a fetchall:
>
> $ bitbake -c fetchall core-image-minimal
>
> and let that run.  so far, so good -- i've now fetched everything
> required for this target.  if i repeat that command, obviously,
> nothing should change, and it doesn't.  (i don't even have to build
> the target, i'm just doing fetching for now.)
>
>    now let's say i add to my local.conf:
>
> IMAGE_INSTALL_append = " strace"
>
> i suspect there's an easier way to see this, but if i want to *prove*
> that the strace recipe would be part of the build, i can do:
>
> $ bitbake -c fetchall -n core-image-minimal     [dry run]
>
Have you tried bitbake -e which prints out all the variables and python 
functions, you can then grep for ^IMAGE_INSTALL or what ever you expect 
to affect by your change

Sau!

> to get:
>
> ... snip ...
> NOTE: Running task 302 of 309 (ID: 21, /home/rpjday/oe/oe-core/meta/recipes-devtools/strace/strace_4.7.bb, do_fetch)
> NOTE: Running task 309 of 309 (ID: 1, /home/rpjday/oe/oe-core/meta/recipes-core/images/core-image-minimal.bb, do_fetchall)
> NOTE: Tasks Summary: Attempted 309 tasks of which 307 didn't need to be rerun and all succeeded.
> $
>
>    so that's "proof" that i've officially added strace to my
> core-image-minimal.
>
>    i'm sure that's massive overkill -- is there a simpler way to
> demonstrate this?  i want to start simple by adding a single package,
> then move on to adding multiple packages, and features and so on, and
> let the student see the effect of each change.
>
>    what's the easiest way to do that?  thanks.
>
> rday
>



