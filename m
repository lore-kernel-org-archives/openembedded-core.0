Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4w9-0004oD-LC
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:35:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 21:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168774013"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 21:23:56 -0700
Message-ID: <5008DD5C.9010708@linux.intel.com>
Date: Thu, 19 Jul 2012 21:23:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Jesse Zhang <sen.zhang@windriver.com>
References: <5005B1CC.1020907@linux.intel.com>
	<1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/2] grub: two backported patch for bug 2777
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
X-List-Received-Date: Fri, 20 Jul 2012 04:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 02:25 AM, Jesse Zhang wrote:
> Hi Saul,
>
> Just tested the patches against the latest code (head 5ed19a40f40).
>
> Nothing changed, except I need to rebase the PRs.
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

Merged into OE-Core

Thanks
	Sau!


