Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RVzFe-0001Te-1f
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 06:32:06 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Nov 2011 21:25:23 -0800
Received: by ggnq1 with SMTP id q1so3859447ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 21:25:22 -0800 (PST)
Received: by 10.236.180.101 with SMTP id i65mr9217857yhm.21.1322717122551;
	Wed, 30 Nov 2011 21:25:22 -0800 (PST)
Received: from [10.6.18.222] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id 32sm12204095anu.10.2011.11.30.21.25.19
	(version=SSLv3 cipher=OTHER); Wed, 30 Nov 2011 21:25:20 -0800 (PST)
Message-ID: <4ED70FBF.6020308@intel.com>
Date: Wed, 30 Nov 2011 21:25:19 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED6CC1E.5040504@windriver.com>
In-Reply-To: <4ED6CC1E.5040504@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 01 Dec 2011 05:32:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2011 04:36 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> FYI: I can't get git-send email to work over the hotel wifi, so
> I can't chain the patches to this email. If you want me to send
> the patches separately, let me know. But for now, this is the
> best I can do.
>
> This pull request represents a collection of changes that were
> part of yocto M1 work, and that set the stage for more updates
> that will follow in the not too distant future.
>
> I've bumped the 3.0 kernel to the 3.0.10 baseline (3.0.11 is
> out, but not in this merge request) and updated our -rt patches
> to the latest upstream -rt series.
>
> This also drops the 2.6.34 recipe and leaves it to be supported
> in previous releases. If there's somewhere else I should be
> putting it, let me know and I'll put it there.
>
> The kernel revision updates have been built and boot tested by
> Tom and myself. And we have't seen any problems.
>
> Also included in this are some changes to kernel tools that
> prepare to move the kernel tools into the kernel tree itself.
> They also move us to doing configuration auditing using the
> merge_config script that Darren and John Stultz have been
> working on.
>
> And finally there's a small tweak to install the kernel tools
> via Makefile in the package itself, something that I recall
> Richard mentioning to me over 2 years ago a meeting .. so I thought
> I'd finally get to it.
>
> Cheers,
>
> Brucedvhart@linux.intel.com
>
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Darren Hart <dvhart@linux.intel.com>
>
> The following changes since commit
> d7cd934376ae1edaf7055ec635eb3c85fdbf58b3:
>
> squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:44
> +0000)
>
> are available in the git repository at:
> git://git.pokylinux.org/poky-contrib zedd/kernel
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (7):
> kern-tools: add pre_config and merge_config.sh to the list of tools
> kernel-yocto: support allnoconfig base configuration
> linux-yocto: remove 2.6.34 recipes
> linux-yocto: v3.0.9 + enhancements
> linux-yocto: v3.0.10 + rt27
> linux-yocto: prefer in-tree tools to external ones
> kern-tools: use Makefile provided install rules
>
> meta/classes/kernel-yocto.bbclass | 24 +++++++++-
> .../kern-tools/kern-tools-native_git.bb | 15 ++----
> meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb | 38 ---------------
> meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | 8 ++--
> meta/recipes-kernel/linux/linux-yocto_2.6.34.bb | 49 --------------------
> meta/recipes-kernel/linux/linux-yocto_3.0.bb | 18 ++++----
> 6 files changed, 39 insertions(+), 113 deletions(-)
> delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
> delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
>

I had a problem with this change set, it gave me the following:

NOTE: Error expanding variable do_kernel_checkout               | ETA: 
00:00:07
ERROR: Unable to parse 
/intel/poky/distro/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb

during parsing.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



