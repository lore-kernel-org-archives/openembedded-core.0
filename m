Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrCsv-0005Fy-Mi
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:52:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jul 2012 11:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169499357"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 11:41:16 -0700
Message-ID: <5005B1CC.1020907@linux.intel.com>
Date: Tue, 17 Jul 2012 11:41:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342510138-21888-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1342510138-21888-1-git-send-email-sen.zhang@windriver.com>
Subject: Re: [PATCH 0/2] grub: two backported patch for bug 2777
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
X-List-Received-Date: Tue, 17 Jul 2012 18:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 12:28 AM, Jesse Zhang wrote:
> Hi,
>
> Here are two backported patch from upstream for grub.
>
> Fixed two errors:
>
>      # grub-mkconfig
>      /usr/sbin/grub-mkconfig: line 98: /usr/lib/grub/grub-mkconfig_lib: No such file or directory
>
>      # grub-mkconfig
>      /usr/sbin/grub-probe: error: cannot stat `/dev/root'.
>
> The first patch is not exactly the same as upstream, since the upstream commit
> contains a lot of trivial aesthetic edits.
>
Why can't it be the same, then we don't need to carry it?


> The second patch is taken from debian instead of directly from upstream, since
> the code base has changed.
>
> Jesse Zhang (2):
>    grub: fix grub-mkconfig_lib install dir
>    grub: fix error stating the root device
>
>   .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  203 +++++++++++++++-----
>   .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ++++++
>   meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
>   3 files changed, 217 insertions(+), 53 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
>

This patch set may need to be rebased based on the new automake 1.12.x 
updated.

Please double check.

Thanks	
	Sau!


