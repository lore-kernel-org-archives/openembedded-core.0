Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNECI-0006ud-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:08:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 18:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; 
   d="scan'208";a="1264271"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2011 18:05:03 -0700
Message-ID: <4DD5BE3F.4010606@linux.intel.com>
Date: Thu, 19 May 2011 18:05:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305736112.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org
Subject: Re: [PATCH 0/2] linux-yocto: fix gcc 4.6.0 compilation failures
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
X-List-Received-Date: Fri, 20 May 2011 01:08:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 09:32 AM, Bruce Ashfield wrote:
> Repeating the patch contents here, since that's the
> whole story:
>
> Fixes bug: [YOCTO #1035]
> Fixes bug: [YOCTO #1036]
>
> Fixes gcc 4.6.0 compliation issues by importing the upstream change:
>
> Author: Michal Marek<mmarek@suse.cz>
> Date:   Mon May 2 12:13:01 2011 +0000
>
>      kbuild: Fix passing -Wno-* options to gcc 4.4+
>
>      Starting with 4.4, gcc will happily accept -Wno-<anything>  in the
>      cc-option test and complain later when compiling a file that has some
>      other warning. This rather unexpected behavior is intentional as per
>      http://gcc.gnu.org/PR28322, so work around it by testing for support of
>      the opposite option (without the no-). Introduce a new Makefile function
>      cc-disable-warning that does this and update two uses of cc-option in
>      the toplevel Makefile.
>
>      Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
>      Signed-off-by: Michal Marek<mmarek@suse.cz>
>      Tested-by: Stephen Rothwell<sfr@canb.auug.org.au>
>      Integrated-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>
> :100644 100644 0ef00bd... 1d8e7e9... M  Documentation/kbuild/makefiles.txt
> :100644 100644 7bd863e0.. 74bac80... M  Makefile
> :100644 100644 ed2773e... ba25c44... M  scripts/Kbuild.include
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: zedd/460
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/460
>
> Thanks,
>      Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>
>
> Bruce Ashfield (2):
>    linux-yocto: fix gcc 4.6.0 compilation failures
>    linux-yocto/meta-yocto: fix gcc 4.6.0 compilation failures
>
>   .../recipes-kernel/linux/linux-yocto_git.bbappend  |   10 +++++-----
>   meta/recipes-kernel/linux/linux-yocto_git.bb       |   12 ++++++------
>   2 files changed, 11 insertions(+), 11 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core and poky as appropriate!

In the future, can you split these into 2 pull requests one for oe-core 
and the other for poky, it will make tracking these changes easier and 
one won't get lost.

Thanks
	Sau!



