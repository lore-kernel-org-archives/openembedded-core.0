Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGWJ-0002no-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:42:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 16:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141124901"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:32:17 -0700
Message-ID: <4FAAFE81.8010600@linux.intel.com>
Date: Wed, 09 May 2012 16:32:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335922726.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1335922726.git.peter.seebach@windriver.com>
Subject: Re: v4 or so [PATCH 0/3] sanity.bbclass and friends: toolchain sanity
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
X-List-Received-Date: Wed, 09 May 2012 23:42:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 06:45 PM, Peter Seebach wrote:
> And yes, I'm aware that "toolchain sanity checks" is sort of a
> self-defeating concept.
>
> Okay, cleanups:
> * Now checking MULTILIB_VARIANTS, not MULTILIBS.  Simpler and less indented.
> * Added a third commit to do the BBCLASSEXTEND checks since those seem like
>    a good idea, and it's less work to do it than to create a todo item.
> * Did you know that, despite a lot of this being Python, you can't use
>    triple-quote strings in documentation.conf?  I didn't, and apparently
>    that "fix" went in untested.  (Also the addition of duplicate but indented
>    copies of two later lines, which didn't parse.  Looks like I got a bit
>    careless with my cut and paste there.)
>
> The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
>    Saul Wold (1):
>          eglibc-package: remove /var
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/toolchains
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains
>
> Peter Seebach (3):
>    conf/machine: Clean up configuration values.
>    sanity.bbclass: Implement initial toolchain sanity checks
These 2 have been merged into OE-Core

>    sanity.bbclass: Check for bogus values in BBCLASSEXTEND
>
RP commented on this one.

Thanks
	Sau!


>   meta/classes/sanity.bbclass                      |   86 ++++++++++++++++++++++
>   meta/conf/documentation.conf                     |    9 ++
>   meta/conf/machine/include/README                 |    4 +
>   meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
>   meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
>   meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
>   meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
>   meta/conf/machine/include/tune-c3.inc            |    2 +-
>   8 files changed, 106 insertions(+), 6 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


